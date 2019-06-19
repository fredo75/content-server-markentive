class PagesController < ApplicationController
  skip_before_action :verify_authenticity_token, :authenticate_user!, only: [:home]

  def home
  end
end
