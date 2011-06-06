class PagesController < ApplicationController
  layout 'pages'

  def index
    age = 60 * 60 # 60 minutes
    response.headers['Cache-Control'] = "public, max-age=#{age}"
  end
end
