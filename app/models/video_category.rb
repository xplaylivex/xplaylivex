class VideoCategory < ActiveRecord::Base
	has_many :videos

	TYPE_CONCEPT	= 1
	TYPE_LP				= 2
	TYPE_OTHER		= 3
end
