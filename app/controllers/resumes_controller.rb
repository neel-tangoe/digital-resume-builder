class ResumesController < ApplicationController

  def index
    @nav_header_menus = [
                          {:href => root_path, :label => "Home", :arrowBack => true}
                        ]
    @resumes = current_user.resumes
  end

  def show
    @nav_header_menus = [
                          {:href => choose_your_template_resume_path, :label => "My Resumes", :arrowBack => true}
                        ]
    
    @resume = current_user.resumes.find(params[:id])
    @template_type = params[:type]
  end

  def download
    @resume_type = params[:resume_type]
    @resume = current_user.resumes.find(params[:id])
    respond_to do |format|
      format.pdf do
        render :pdf => "#{@resume.name}",
               :layout => "pdf",
               :template => "pdf/download_templates",
               :margin => { :top => 10, :bottom => 10, :left => 10, :right => 10},
               :viewport_size => '1280x1024',
               disposition: 'attachment'
      end
    end
  end

  def new
    common_desktop_nav_header
    @resume_type = params[:type]
    if current_user.present?
      @step = 1
      @resume = current_user.resumes.new
      @resume.skills.build unless @resume.skills.present?
    else
      redirect_to root_path, notice: "Please login first"
    end
  end

  def edit
    @step = params[:step]
    @resume = current_user.resumes.find(params[:id])
  end

  def create
    @step = params[:step]
    @resume = current_user.resumes.new(resume_params)

    if @resume.save!
      redirect_to edit_resume_path(@resume, step: 2 )
    else
      render 'new'
    end
  end

  def update
    @resume = current_user.resumes.find(params[:id])

    if @resume.update(resume_params)
      step = params[:proceed_next] ? params[:step].to_i+1 : params[:step].to_i
      url = params[:proceed_next] ? edit_resume_path(@resume, step:  step) : resume_path(@resume)
      redirect_to url 
    else
      render 'edit'
    end
  end

  def delete_attachment
    @image = ActiveStorage::Attachment.find(params[:id])
    @image.purge
    redirect_to request.referer
  end

  def destroy
    @resume = current_user.resumes.find(params[:id])
    @resume.destroy
    redirect_to resumes_path
  end

  

  def choose_your_template
    common_desktop_nav_header
    @resume = current_user.resumes.find(params[:id])
  end

  def choose_template_to_be_downloaded
    common_desktop_nav_header
    @resume = current_user.resumes.find(params[:id])
  end

  def share
    resume = current_user.resumes.find(params[:id])
    @share_cv = resume.share_cv ? resume.share_cv : ShareCv.new
    
    @share_cv.theme = "simple" if @share_cv && @share_cv.theme.nil?
    if Rails.env.production?
      bitly = Bitly.new("sreeharikmarar", "R_4f00b6fbbd62eaa6c81a48b9b0d7dab4")
      b = bitly.shorten("http://#{request.host_with_port}/profile/"+current_user.id.to_s)
      @url =  b.short_url
    else
      @url =  "http://#{request.host_with_port}/profile/"+current_user.id.to_s
    end
      
    respond_to do |format|
      format.html { }
      format.js { }
    end
  end

  def choose_templates
    @nav_header_menus = [
                          {:href => root_path, :label => "Home", :arrowBack => true},
                        ]
  end

  private
  def resume_params
    params.require(:resume).permit(:name, :avtar, :general_info, :phone_number, :interests, :user_id, :address, :country, :birthdate, :gender, :website, :email,
                                   skills_attributes: [:id, :section, :title, :percent, :_destroy],
                                   languages_attributes: [:id, :name, :_destroy],
                                   projects_attributes:[:id, :date_from, :date_to, :client, :description, :technologies, :role, :level, :team_size, :_destroy],
                                   educations_attributes:[:id, :date_from, :date_to, :level, :description, :place, :course, :_destroy],
                                   jobs_attributes: [:id, :date_from, :date_to, :firm, :description, :position, :place, :_destroy])
  end
end
