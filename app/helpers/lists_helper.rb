module ListsHelper
  def background_image(list)
    if list.photo.attached?
      cl_image_path(list.photo.key)
    else
      asset_path('cine.jpeg')
    end
  end
end
