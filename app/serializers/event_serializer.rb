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
class EventSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :start_date,
             :coordinator,
             :sub_coordinator,
             :description,
             :venue,
             :end_date,
             :image_url

  def image_url
    object.image_url
  end
end
