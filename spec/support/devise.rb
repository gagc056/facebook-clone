# frozen_string_literal: true

Rspec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
end
