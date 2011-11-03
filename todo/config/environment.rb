# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Todo::Application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default_content_type = "text/html"
