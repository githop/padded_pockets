class CreatePoliticians < ActiveRecord::Migration
  def change
    create_table :politicians do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.string :gender
      t.string :state
      t.string :bioguide_id
      t.string :opensecrets_id
      t.string :party
      t.string :image
      t.string :title
      t.string :url
      t.string :address
      t.string :phone
      t.string :contact_form
      t.string :twitter
      t.string :facebook
      t.string :facebook_id

      t.timestamps
    end
  end
end

