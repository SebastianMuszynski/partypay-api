class RootController < ApplicationController
  def index
    paths = [
      '/login',
      '/signup',
      '/topup'
    ]
    routes = paths.collect { |path| get_domain + path }
    render_json(routes)
  end

  private
  def get_domain
    request.protocol + request.host_with_port
  end
end
