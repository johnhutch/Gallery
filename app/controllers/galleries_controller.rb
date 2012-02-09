class GalleriesController < InheritedResources::Base
  load_and_authorize_resource
  
  def create
    create!(:notice => "Gallery created! Now upload some photos.") { edit_gallery_path(@gallery) }
  end
    
  protected
    def begin_of_association_chain
      current_user
    end
end
