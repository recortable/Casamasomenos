# encoding: utf-8

module MediafilesHelper

  def render_mediafile(mediafile)
    if mediafile.file?
      image_tag(mediafile.file.url, :alt => mediafile.title)
    else
      content_tag(:p, 'Visualización no disponible')
    end
  end

end
