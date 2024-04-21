class ErrorsController < ApplicationController
  def unauthorized
    render 'errors/unauthorized'
  end
end
