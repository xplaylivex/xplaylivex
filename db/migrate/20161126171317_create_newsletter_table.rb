class CreateNewsletterTable < ActiveRecord::Migration
  def change
    create_table :newsletter_subscriptions do |t|
      t.string :email,              null: false, default: ""

      t.timestamps
    end
  end
end
