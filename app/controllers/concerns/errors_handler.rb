# frozen_string_literal: true

module ErrorsHandler
  extend ActiveSupport::Concern
  included do # rubocop:disable Metrics/BlockLength
    rescue_from StandardError do |e|
      render json: { errors: e.as_json }, status: 500
    end

    rescue_from Api::UnprocessableEntityException do |ex|
      render json: { errors: ex.validation_errors.first }, status: :unprocessable_entity
    end

    rescue_from Api::UnauthorizedError do |ex|
      render json: { errors: ex.unauthorized_errors }, status: :unauthorized
    end

    rescue_from ActiveRecord::RecordNotFound do |ex|
      render json: { errors:
                    { title: I18n.t('api.errors.record_not_found'),
                      status: 404,
                      detail: I18n.t('api.errors.messages.record_not_exists'),
                      model_name: ex.model } }, status: 404
    end

    rescue_from Api::AllAttemptsUsed do |ex|
      render json: { errors: ex.attempts_errors }, status: 405
    end

    rescue_from Api::TimeNotPassed do |ex|
      render json: { errors: ex.time_not_passed_error }, status: 425
    end

    rescue_from Api::AccessForbiddenError do |ex|
      render json: { errors: ex.access_error }, status: 403
    end

    rescue_from Api::Conflict do |ex|
      render json: { errors: ex.conflict_errors }, status: 409
    end

    rescue_from Api::PaymentError do |ex|
      render json: { errors: ex.payment_error }, status: 402
    end

    rescue_from Api::ConsultationNeededError do |ex|
      render json: { errors: ex.consultation_needed_error }, status: 403
    end
  end
end
