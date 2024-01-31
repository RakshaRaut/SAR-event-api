# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :participants
  has_many :attendances

  has_one_attached :cover_image

  validates :cover_image, presence: true

  validates :title,
            :start_date,
            :coordinator,
            :sub_coordinator,
            :description,
            :venue, presence: true

  def image_url
    image.attached? && url_for(image)
  end
end
