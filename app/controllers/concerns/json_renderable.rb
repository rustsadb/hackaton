# frozen_string_literal: true

module JsonRenderable
  extend ActiveSupport::Concern

  def render_json(entity, serializer: :serializer, status: 200, options: {})
    entity_serializer = send serializer

    render json: entity_serializer.new(entity, options).serializable_hash, status: status
  end

  def render_ok
    render json: {}, status: :ok
  end
end
