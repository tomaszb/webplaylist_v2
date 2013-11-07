class Playlist < ActiveRecord::Base
	has_many :playlistations, dependent: :destroy
	has_many :songs, :through => :playlistations

	validates :title, presence: { message: 'Please provide a name' }

	accepts_nested_attributes_for :songs, :playlistations
end
