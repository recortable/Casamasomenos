class Admin::MediafilesController < Admin::ZapController
  resource :mediafile
  expose(:mediafiles) { parent.mediafiles }
  expose(:mediafile)
end

