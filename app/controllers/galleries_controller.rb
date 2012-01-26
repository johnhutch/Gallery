class GalleriesController < InheritedResources::Base
  before_filter :authenticate_user!, :except => [:show, :index]
  
  def create
    create!(:notice => "Gallery created! Now upload some photos.") { edit_gallery_path(@gallery) }
  end
    
  protected
    def begin_of_association_chain
      current_user
    end
end
