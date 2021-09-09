class PagesController < ApplicationController
  skip_before_action :authenticate_user!
  
  def home
  end

  def services
  end

  def about_us
  end
end
