class CommentsController < ApplicationController
  respond_to :html
  expose(:resource) { Article.find params[:article_id] }
  expose(:comments) { resource.comments }
  expose(:comment)
  expose(:replied) { Comment.find params[:parent_id] }
  expose(:reply) { Comment.new(:parent => replied) }

  # only to reply!!
  def new
  end


  def create
    if params[:comment][:parent_id].present?
      params[:comment][:author_id] = current_user.id
      resp = Comment.new(params[:comment])
      flash[:notice] = t('comments.notice.replied') if resp.save
      respond_with resp, :location => resp.root.resource
    else
      params[:comment][:author_id] = resource.author_id
      comment = resource.comments.build(params[:comment])
      flash[:notice] = t('comments.notice.create') if comment.save
      respond_with comment, :location => resource
    end
  end

  def destroy
    authorize! :destroy, comment
    flash[:notice] = 'Comentario borrado' if comment.destroy
    respond_with comment, :location => resource
  end
end
