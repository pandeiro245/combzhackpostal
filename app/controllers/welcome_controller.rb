class WelcomeController < ApplicationController
  def index
    @type = params[:year] || nil
  end
end

