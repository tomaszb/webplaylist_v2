class StaticPagesController < ApplicationController
  def welcome
  	if current_user
  		redirect_to playlists_path
  	end
  end
end