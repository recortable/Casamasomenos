class Admin::ApplicationController < ApplicationController
  before_filter :require_admin
  respond_to :html, :json
  layout 'admin'
end
