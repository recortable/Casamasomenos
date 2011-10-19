class Admin::Translations < Admin::ZapController
  resource :translation
  expose(:translations) { parent.translations }
  expose(:translation)


end

