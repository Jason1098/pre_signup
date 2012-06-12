# Load the rails application
require File.expand_path('../application', __FILE__)

# EcigSignup::Application.configure do
# 	config.before_initialize do
#   	dev = File.join(Rails.root, 'config', 'development.yml')
#   	YAML.load(File.open(dev)).each do |key, value|
#     	ENV[key.to_s] = value
#   	end if File.exists?(dev)
# 	end
# end


# Initialize the rails application
EcigSignup::Application.initialize!
