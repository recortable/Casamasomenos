class Admin::MediafilesController < Admin::ZapController
  resource :mediafile
  expose(:mediafiles) { parent.mediafiles }
  expose(:mediafile)

  def show

  end

  def new
    mediafile.resource = article
  end

  def edit

  end

  def create
    mediafile.user = current_user
    create! [:admin, mediafile.resource]
  end

  def update
    update! [:admin, article]
  end

end

