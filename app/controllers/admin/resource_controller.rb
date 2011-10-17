class Admin::ResourceController < Admin::ApplicationController
  expose(:resource_class) { "#{@@resource_name}".camelcase.constantize }
  expose(:resource) { send("#{@@resource_name}") }
  expose(:collection) { send("#{@@resource_name}s") }

  def index

  end

  def show

  end


  protected
  def self.resource(resource_name)
    @@resource_name = resource_name
  end
end