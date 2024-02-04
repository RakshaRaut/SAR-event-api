# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :set_event, only: %i[show update destroy]
  before_action :authenticate_user!, only: %i[create update destroy]

  # GET /events
  def index
    events = Event.all

    render json: {
      message: 'All events fetched',
      data: serialize(events, EventSerializer)
    }
  end

  # GET /events/1
  def show
    render json: {
      message: 'Event fetched successfully',
      data: serialize(@event, EventSerializer)
    }
  end

  # POST /events
  def create
    event = Event.create!(event_params)

    render json: {
      message: 'New Event created successfully',
      data: serialize(event, EventSerializer)
    }
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      render json: {
        message: 'Updated the event successfully',
        data: serialize(@event, EventSerializer)
      }
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    if @event.destroy
      render json: {
        message: 'You are thanos'
      }
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.permit(
      :title,
      :start_date,
      :coordinator,
      :sub_coordinator,
      :description,
      :venue,
      :end_date,
      :cover_image
    )
  end
end
