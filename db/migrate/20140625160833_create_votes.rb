class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.binary :selection
      t.belongs_to :comment
      t.belongs_to :user

      t.timestamps
    end
  end
end
