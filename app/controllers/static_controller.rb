class StaticController < ApplicationController
  skip_before_action :require_login

  def not_found
  end

  def error
  end
end
