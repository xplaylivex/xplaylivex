class Game < ActiveRecord::Base
	paginates_per 50
	belongs_to :image

	CURRENT = 1
	FINISHED = 2
	ABORTED = 3

	def image
		image = super
		image && image.filename ? 'games/' + image.filename : "placeholders/videogame-placeholder.png"
  end
end
