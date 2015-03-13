class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!

  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper

  def authorize_admin!
    redirect_to root_path unless current_user.has_role? :admin
  end
end

