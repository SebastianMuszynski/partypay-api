class ApplicationController < ActionController::API
   after_action :access_control_headers

  def render_json(body, status_code = :ok)
    render json: body, status: status_code
  end

  def render_error(message, status_code = :unprocessable_entity)
    render_json(message, status_code)
  end

  def set_access_control_headers
     headers['Access-Control-Allow-Origin']   = "*"
     headers['Access-Control-Request-Method'] = %w{GET POST OPTIONS}.join(",")
   end

end
