class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.integer :attendee_id, index: true
      t.integer :attended_event_id, index: true
      
      t.timestamps
    end
  end
end
