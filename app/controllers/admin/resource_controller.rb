class Admin::ResourceController < Admin::ApplicationController
  expose(:resource_class) { "#{@@resource_name}".camelcase.constantize }
  expose(:resource) { send(@@resource_name) }
  expose(:collection) { send(@@resource_name.pluralize) }

  def index
    respond_with collection
  end

  def show
    respond_with resource
  end

  def edit
    respond_with resource
  end

  def update
    data = params[@@resource_name]
    #render text: data.inspect
    result = resource.update_attributes(data) ? 'updated' : 'update_error'
    flash[:notice] = t("#{@@resource_name}.flash.#{result}")
    respond_with resource, location: [:admin, resource]
  end


  protected
  def self.resource(resource_name)
    @@resource_name = resource_name.to_s
  end
end