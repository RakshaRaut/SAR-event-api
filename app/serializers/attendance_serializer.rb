# frozen_string_literal: true

# == Schema Information
#
# Table name: attendances
#
#  id             :bigint           not null, primary key
#  date           :date
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  event_id       :bigint           not null
#  participant_id :bigint           not null
#
# Indexes
#
#  index_attendances_on_event_id                              (event_id)
#  index_attendances_on_event_id_and_participant_id_and_date  (event_id,participant_id,date) UNIQUE
#  index_attendances_on_participant_id                        (participant_id)
#
# Foreign Keys
#
#  fk_rails_...  (event_id => events.id)
#  fk_rails_...  (participant_id => participants.id)
#
class AttendanceSerializer < ActiveModel::Serializer
  attributes :id, :participant

  def participant
    ParticipantSerializer.new(object&.participant)
  end
end
