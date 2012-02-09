class PostsController < InheritedResources::Base
  load_and_authorize_resource
    
  protected
    def begin_of_association_chain
      current_user
    end

end
