class RootController < ApplicationController
  def index
    render_json({ "users": "#{main_url}/users" })
  end

  private
  def main_url
    "http://localhost:9000"
  end
end
