class Playback < ActiveRecord::Base
	validates :name, uniqueness: true
end
