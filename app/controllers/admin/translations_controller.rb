class Admin::TranslationsController < Admin::ZapController
  resource :translation
  expose(:translations) { parent.translations }
  expose(:translation)


  def create
    create! { [:admin, article] }
  end

  def update
    update! { [:admin, article] }
  end
end

