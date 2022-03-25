class ShareCvController < ApplicationController

  
  
  def publish_cv

    share_cv  = current_user.share_cv ? current_user.share_cv : ShareCv.new
    
    share_cv.url =  params[:share_cv][:url]
    share_cv.user_id =  current_user.id
    share_cv.theme = params[:share_cv][:theme]
    share_cv.publish = params[:share_cv][:publish]
    share_cv.save
    respond_to do |format|
      format.html {}
      format.js { }
    end
    
  end
  
end


