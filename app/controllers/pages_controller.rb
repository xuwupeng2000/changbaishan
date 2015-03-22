class PagesController < ApplicationController

  layout "welcome"

  def welcome
    @minimum_password_length = 8
  end

end 
