class Admin::NavigationsController < Admin::ApplicationController
  expose(:navigation) { Navigation.new }

  def show

  end
end

