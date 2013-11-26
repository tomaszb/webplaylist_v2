class PlaylistsController < ApplicationController
	def index
		@playlist = Playlist.first
		@songs = @playlist.songs.paginate(page: params[:page])
		@playlists = Playlist.all
	end

	def new

	end

	def create
		@playlist = Playlist.new(params[:playlist])

		@playlist.save
	end

	def show
		@playlist = Playlist.find(params[:id])
		@songs = @playlist.songs.paginate(page: params[:page])
		@playlists = Playlist.all
		puts @playlist.songs
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
			params.require(:playlist).permit(:title)
		end
end
