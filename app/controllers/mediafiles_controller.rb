class MediafilesController < ApplicationController
  respond_to :html

  expose(:mediafiles) { Mediafile.all }
  expose(:parent) { Article.find(params[:p]) if params[:p].present? }
  expose(:mediafile)

  def index
  end

  def new
    mediafile.resource = parent if parent.present?
  end

  def show
  end

  def create
    authorize! :create, mediafile
    mediafile.user = current_user
    flash[:notice] = t('mediafiles.notice.create') if mediafile.save
    respond_with mediafile
  end

  def destroy
    authorize! :destoy, mediafile
    flash[:notice] = t('mediafiles.notice.destroy') if mediafile.destroy
    location = mediafile.resource_id? ?  [mediafile.resource] : mediafiles_path
    respond_with mediafile, :location => location
  end

end
