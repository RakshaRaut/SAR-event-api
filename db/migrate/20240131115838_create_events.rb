# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.date :start_date, null: false
      t.date :end_date
      t.string :coordinator
      t.string :sub_coordinator
      t.text :description
      t.string :venue

      t.timestamps
    end
  end
end
