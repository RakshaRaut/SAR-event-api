# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :participants
  has_many :attendances
  
  validates :title,
            :start_date,
            :coordinator,
            :sub_coordinator,
            :description,
            :venue, presence: true
end
