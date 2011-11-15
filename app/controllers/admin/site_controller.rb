class Admin::SiteController < Admin::ApplicationController
  expose(:navigation) { Site.new }

  def show

  end
end

