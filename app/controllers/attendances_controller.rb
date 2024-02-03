# frozen_string_literal: true

class AttendancesController < ApplicationController
  before_action :set_attendance, only: %i[show]

  # GET /attendances
  def index
    attendance = Attendance.where(event_id: params[:event_id])
    render json: {
      message: 'fetched attendance sheet',
      data: serialize(attendance, AttendanceSerializer)
    }
  end

  # POST /attendances
  def create
    participant = Participant.find_by(email: attendance_params[:email])
    pry
    if participant.nil?
      render json: {
        message: 'Talai tori, register garyo rainaxas ni nigga'
      }
    else
      attendance = Attendance.create!(
        participant: participant,
        event_id: attendance_params[:event_id],
        date: DateTime.now
      )

      render json: {
        message: 'Successfully recorded the attendance of the event.',
        data: serialize(attendance, AttendanceSerializer)
      }

    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_attendance
    @attendance = Attendance.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def attendance_params
    params.permit(:email, :event_id)
  end
end
