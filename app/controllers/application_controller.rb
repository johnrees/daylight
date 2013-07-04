class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  before_filter :set_instance_vars

private

  def set_instance_vars

    %w(work light_work).each do |action|
      instance_variable_set "@#{action}_tags", Tag.where('category = ?', action).order('ordinal ASC')
    end

  end


end
