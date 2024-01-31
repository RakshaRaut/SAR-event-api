# frozen_string_literal: true

class Event < ApplicationRecord
  validates :title,
            :start_date,
            :coordinator,
            :sub_coordinator,
            :description,
            :venue, presence: true
end
