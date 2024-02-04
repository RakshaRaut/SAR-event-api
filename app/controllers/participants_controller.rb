# frozen_string_literal: true

class ParticipantsController < ApplicationController
  before_action :set_participant, only: %i[show update destroy]
  before_action :authenticate_user!, only: %i[index show]

  # GET /participants
  def index
    participants = Participant.where(event_id: params[:event_id])

    render json: {
      message: 'Participant list fetched',
      data: serialize(participants, ParticipantSerializer)
    }
  end

  # GET /participants/1
  def show
    render json: {
      message: 'Participant fetched successfully',
      data: serialize(@participant, ParticipantSerializer)
    }
  end

  # POST /participants
  def create
    participant = Participant.create!(participant_params)

    render json: {
      message: 'New Participant created successfully',
      data: serialize(participant, ParticipantSerializer)
    }
  end

  # PATCH/PUT /participants/1
  def update
    if @participant.update!(participant_params)
      render json: {
        message: 'Updated the participant successfully',
        data: serialize(@participant, ParticipantSerializer)
      }
    else
      render json: @participant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /participants/1
  def destroy
    if @participant.destroy
      render json: {
        message: 'Delete garis'
      }
    else
      render json: @participant.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_participant
    @participant = Participant.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def participant_params
    params.permit(:name, :email, :collage, :faculty, :phone_no, :event_id)
  end
end
