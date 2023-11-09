module Redsys
  class NotificationsController < ApplicationController
    skip_before_filter :verify_authenticity_token

    #
    # Tratamiento para la notificación online
    # - Ds_Response == "0000" => Transacción correcta
    #
    def notification
      json_params = JSON.parse(Base64.urlsafe_decode64(params[:Ds_MerchantParameters]))
      #TODO: Can't make this call work nor in ruby 1.8.7 neither in ruby 2.3.0, so I create an instance of the TPV class just for checking the signature

      # We need recover from notification response our "gateway_value". This "gateway_value" is same that we util when initialize our request on controller.
      # Example: gateway_value = PaymentRequest.find_by(tpv_order_id: json_params["Ds_Order"].to_i).gateway
      # PaymentRequest is our model where we save all information from order request.
      @tpv = Redsys::Tpv.new(json_params["Ds_Amount"], json_params["Ds_Order"], json_params["Ds_ConsumerLanguage"],'','','','','', gateway_value)
      if @tpv.response_signature(params[:Ds_MerchantParameters]) == params[:Ds_Signature] && json_params["Ds_Response"].present?
        # Enter only if the signature from the gateway is correct
        if (json_params["Ds_Response"].to_i >= 0 && json_params["Ds_Response"].to_i <= 99)
          # The transaction result is ok. Register the payment here
          # Update your PaymentRequest
          # Can create logs success
          # Can send notifications
          status = :ok
        else
          # The transaction failed although the signature was right because there was no Ds_Response, handle the exception however you want
          # Update your PaymentRequest
          # Can create logs error
          # Can send notifications
          status = :bad_request
        end
      else
        # The transaction failed due to an error in the signature, handle the exception however you want
        status = :bad_request
      end
      render :nothing => true, :layout => false, :status => status
    end
  end
end
