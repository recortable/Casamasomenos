class Admin::TranslationsController < Admin::ZapController
  resource :translation
  expose(:translations) { parent.translations }
  expose(:translation)


  def new

  end
end

