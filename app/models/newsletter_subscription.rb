class NewsletterSubscription < ActiveRecord::Base
	validates :email, presence: true, format: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+{2,}\z/i, uniqueness: true
end
