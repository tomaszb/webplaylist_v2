class SongsController < ApplicationController
	include SongsHelper

	def new

	end

	def create
		@playlist = Playlist.all.find_by_id(params[:pl_id])
		puts "hereyougo #{params[:pl_id]}"
		puts params[:url]
		songid = getID(params[:url])
		@song = Song.new(url:params[:url], youtubeid: songid)
		puts @song
		@song.save
		@playlistation = Playlistation.new(song_id:@song.id,playlist_id:@playlist.id)
		if @playlistation.save
			respond_to do |format|
				format.html {redirect_to :back}
    			format.js
    		end
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
