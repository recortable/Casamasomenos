class Admin::MediafilesController < Admin::ResourceController
  resource :mediafile
  expose(:article) { params[:article_id].present? ? Article.find(params[:article_id]) : nil }
  expose(:parent) { article ? article : Site }
  expose(:mediafiles) { parent.mediafiles }
  expose(:mediafile)
end

