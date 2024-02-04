# frozen_string_literal: true

# == Schema Information
#
# Table name: participants
#
#  id         :bigint           not null, primary key
#  collage    :string           not null
#  email      :string           not null
#  faculty    :string           not null
#  name       :string           not null
#  phone_no   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :bigint           not null
#
# Indexes
#
#  index_participants_on_email_and_event_id  (email,event_id) UNIQUE
#  index_participants_on_event_id            (event_id)
#
# Foreign Keys
#
#  fk_rails_...  (event_id => events.id)
#
class Participant < ApplicationRecord
  belongs_to :event
  has_many :attendancesz

  validates :name, :email, :collage, :faculty, :phone_no, :event_id, presence: true
end
