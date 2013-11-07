module SongsHelper
	def getID(youtube_url)
		regex = /^(?:http:\/\/)?(?:www\.)?\w*\.\w*\/(?:watch\?v=)?((?:p\/)?[\w\-]+)/
   		youtube_url.match(regex)[1]
	end
end