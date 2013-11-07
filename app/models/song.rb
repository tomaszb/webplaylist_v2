class Song < ActiveRecord::Base
	has_many :playlistations, dependent: :destroy
	has_many :playlists, :through => :playlistations

	validates :url, presence: { message: 'Please provide a url'}

	accepts_nested_attributes_for :playlists, :playlistations
end
