class Admin::MediafilesController < Admin::ZapController
  resource :mediafile
  expose(:article) { params[:article_id].present? ? Article.find(params[:article_id]) : nil }
  expose(:parent) { article ? article : Site }
  expose(:mediafiles) { parent.mediafiles }
  expose(:mediafile)
end

