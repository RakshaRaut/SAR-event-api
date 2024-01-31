# frozen_string_literal: true

# frozen_literal_string: true

class CreateAttendances < ActiveRecord::Migration[7.0]
  def change
    create_table :attendances do |t|
      t.references :event, null: false, foreign_key: true
      t.references :participant, null: false, foreign_key: true
      t.date :date
      t.timestamps
    end
    add_index :attendances, %i[event_id participant_id date], unique: true
  end
end
