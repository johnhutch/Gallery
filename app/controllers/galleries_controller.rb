class GalleriesController < InheritedResources::Base
  before_filter :authenticate_user!, :except => [:show, :index]
    
  protected
    def begin_of_association_chain
      current_user
    end
end
