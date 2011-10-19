module Admin::ZapsHelper
  def editable_attributes(model_class)
    model_class.attribute_names - %w(id created_at updated_at)
  end
end