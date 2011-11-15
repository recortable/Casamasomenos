class Public::CommentsController < ApplicationController
  respond_to :html
  expose(:parent) { Article.find params[:article_id] }
  expose(:comments) { parent.comments }
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
      params[:comment][:author_id] = parent.author_id
      comment = parent.comments.build(params[:comment])
      flash[:notice] = t('comments.notice.create') if comment.save
#      AdminMailer.comment_email(comment).deliver
      respond_with comment, :location => comment.resource
    end
  end

  def destroy
    authorize! :destroy, comment
    flash[:notice] = 'Comentario borrado' if comment.destroy
    respond_with comment, :location => resource
  end
end
