# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ActionController::Cookies
  include DeviseTokenAuth::Concerns::SetUserByToken

  DATA_TYPE = {
    collection: 'collection',
    object: 'object'
  }.with_indifferent_access.freeze

  def serialize(data, serializer, type = DATA_TYPE[:collection])
    if type.to_s.eql? DATA_TYPE[:object]
      return ActiveModelSerializers::SerializableResource.new(data, serializer: serializer)
    end

    ActiveModelSerializers::SerializableResource.new(data, each_serializer: serializer)
  end

  def true?(data)
    data.to_s.eql? 'true'
  end
end
