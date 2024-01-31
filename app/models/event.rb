# frozen_string_literal: true

# == Schema Information
#
# Table name: events
#
#  id              :bigint           not null, primary key
#  coordinator     :string
#  description     :text
#  end_date        :date
#  start_date      :date             not null
#  sub_coordinator :string
#  title           :string
#  venue           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
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
