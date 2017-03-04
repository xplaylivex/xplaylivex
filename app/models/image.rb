class Image < ActiveRecord::Base
	paginates_per 50
	has_one :game
	has_one :video
end
