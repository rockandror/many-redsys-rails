# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'many-redsys-rails/version'

Gem::Specification.new do |spec|
  spec.name          = "many-redsys-rails"
  spec.version       = ManyRedsysRails::Rails::VERSION
  spec.authors       = ["guzmanweb", "Asier Azaceta", "taitus", "Senen", "pmaojo"]
  spec.email         = ["carlos@guzmanweb.com", "asier.azaceta@techabout.es", "sebastia.roig@gmail.com", "senenrodero@gmail.com", "info@pulpomarketing.com"]
  spec.summary       = %q{A Ruby gem for communicating with the payment platform of Redsys}
  spec.homepage      = "https://github.com/rockandror/many-redsys-rails"
  spec.license       = "MIT"
  spec.description = <<-EOF
  many-redsys-rails is a gem for integrating multiple the Redsys Virtual Payments Gateway/Terminal (TPV).
  Mainly used by Spanish banks.
  EOF

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rails", ">= 4.0.2"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
