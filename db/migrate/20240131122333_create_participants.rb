# frozen_string_literal: true

class CreateParticipants < ActiveRecord::Migration[7.0]
  def change
    create_table :participants do |t|
      t.string :name, null: false
      t.string :collage, null: false
      t.string :faculty, null: false
      t.string :email, null: false
      t.string :phone_no, null: false
      t.references :event, null: false, foreign_key: true
      t.timestamps
    end
    add_index :participants, %i[email event_id], unique: true
  end
end
