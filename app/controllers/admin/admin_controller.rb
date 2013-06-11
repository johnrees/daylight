class Admin::AdminController < ApplicationController
  layout 'admin'

  before_filter :authenticate# if Rails.env.production?

private

  def authenticate
    authenticate_or_request_with_http_basic('Secret') do |username, password|
      username == ENV['HTTP_USER'] && password == ENV['HTTP_PASSWORD']
    end
  end

end
