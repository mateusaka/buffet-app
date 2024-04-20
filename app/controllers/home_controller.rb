class HomeController < ApplicationController
  def index
    if buffet_owner_signed_in?
      if !current_buffet_owner.buffet
        redirect_to new_buffet_path
      else
        @buffet = current_buffet_owner.buffet
      end
    end
  end
end
