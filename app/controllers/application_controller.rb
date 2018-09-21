class ApplicationController < ActionController::API
  include Knock::Authenticable

  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid

  def render_record_invalid(exception)
    render(json: { errors: exception.record.errors },
           status: :bad_request)
  end

  def render_not_found(exception)
    render(json: { errors: exception.record.errors },
           status: :bad_request)
  end

  def render_general_error(status:, message:)
    render(json: { errors: [message] },
           status: status)
  end
end
