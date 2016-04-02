class WelcomeController < ApplicationController
  def index
    redirect_to songs_path if user_signed_in?
  end
end
