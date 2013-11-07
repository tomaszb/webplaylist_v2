class SongsController < ApplicationController
	include SongsHelper

	def new

	end

	def create
		@playlist = Playlist.find_by_id(params[:pl_id])
		songid = getID(params[:url])
		@song = Song.new(url:params[:url], youtubeid: songid)

		@playlistation = Playlistation.new(song:@song,playlist:@playlist)
		
		if @song.save and @playlistation.save
			render :partial => 'song', :object => @song
		end

		respond_to do |format|
			format.html {redirect_to :back}
    		format.js
    	end
	end

	private
		def playlist_params
			params.require(:playlist).permit(:id)
		end

		def song_params
			params.require(:songs).permit(:url)
		end

end
