class AddCreatorToEvents < ActiveRecord::Migration[5.1]
  def change
    #add_reference :events, :creator, foreign_key: true
    add_column :events, :creator_id, :integer, index: true
  end
end
