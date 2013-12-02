class PlaylistsController < ApplicationController
	def index
		if current_user
			@playlists = current_user.playlists
			@playlist = @playlists.first
			@songs = @playlist.songs
		else
			redirect_to root_url
		end
	end

	def new

	end

	def create
		@playlist = Playlist.new(title:params[:title], user_id:params[:user_id])
		if @playlist.save
			respond_to do |format|
				format.html {redirect_to :back}
    			format.js
    		end
		end
	end

	def show
		@playlist = current_user.playlists.find(params[:id])
		@songs = @playlist.songs
		respond_to do |format|
		  format.html
	      format.js
   		end
	end

	def update
		@playlist = Playlist.find(params[:id])
	end

	private
		def post_params
			params.require(:playlist).permit(:title, :user_id)
		end
end
