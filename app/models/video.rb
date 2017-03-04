class Video < ActiveRecord::Base
	belongs_to :video_category
	belongs_to :image

	def image_link
		image = self.image
		image && image.filename ? ActionController::Base.helpers.asset_path(image.filename) : ActionController::Base.helpers.asset_path("placeholders/videogame-placeholder.png")
	end
end
