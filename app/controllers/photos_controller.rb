class PhotosController < ApplicationController
  
  before_filter :require_user
  before_filter :find_gallery
  before_filter :find_or_build_photo
  
  def create
    respond_to do |format|
      unless @photo.save
        flash[:error] = 'Photo could not be uploaded'
      end
      format.js do
        render :text => render_to_string(:partial => 'photos/photo', :locals => {:photo => @photo})
      end
    end
  end

  def destroy
    respond_to do |format|
      unless @photo.destroy
        flash[:error] = 'Photo could not be deleted'
      end
      format.js
    end
  end

  private
    
    def find_gallery
      @gallery = current_user.galleries.find(params[:gallery_id])
      raise ActiveRecord::RecordNotFound unless @gallery
    end
    
    def find_or_build_photo
      @photo = params[:id] ? @gallery.photos.find(params[:id]) : @gallery.photos.build(params[:photo])
    end

end


