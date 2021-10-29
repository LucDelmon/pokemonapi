require 'spec_helper'

require File.expand_path('../../config/environment', __FILE__)

require 'rspec/rails'
require 'shoulda/matchers'

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.configure do |config|

  config.include Rails.application.routes.url_helpers
end
