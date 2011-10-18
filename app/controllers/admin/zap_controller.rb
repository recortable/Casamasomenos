class Admin::ZapController < Admin::ApplicationController
  expose(:zap_class) { "#{@@zap_name}".camelcase.constantize }
  expose(:zap) { send(@@zap_name) }
  expose(:zaps) { send(@@zap_name.pluralize) }

  def index
    respond_with zaps
  end

  def show
    respond_with zap
  end

  def edit
    respond_with zap
  end

  def update
    data = params[@@zap_name]
    #render text: data.inspect
    result = resource.update_attributes(data) ? 'updated' : 'update_error'
    flash[:notice] = t("#{@@zap_name}.flash.#{result}")
    respond_with zap, location: [:admin, zap]
  end


  protected
  def self.resource(resource_name)
    @@zap_name = resource_name.to_s
  end
end