class ResumesController < ApplicationController

  def index
    @resumes = current_user.resumes
  end

  def show
    @resume = current_user.resumes.find(params[:id])
    @template_type = params[:type]
  end

  def download
    @resume_type = params[:resume_type]
    @resume = current_user.resumes.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "#{@resume.name}",
               :layout => "pdf",
               :template => "pdf/resume_template",
               :margin => { :top => 10, :bottom => 10, :left => 10, :right => 10},
               :viewport_size => '1280x1024',
               disposition: 'attachment'
      end
    end
  end

  def new
    @step = 1
    @resume = current_user.resumes.new
    respond_to do |format|
      format.html { render :template => "resumes/_form" }
    end
  end

  def edit
    @step = params[:step]
    @resume = current_user.resumes.find(params[:id])
  end

  def create
    @step = params[:step]
    @resume = current_user.resumes.new(resume_params)

    if @resume.save
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

  private
  def resume_params
    params.require(:resume).permit(:name, :avtar, :general_info, :phone_number, :interests, :user_id, :address, :country, :birthdate, :gender, :website, :email,
                                   skills_attributes: [:id, :section, :title, :percent, :_destroy],
                                   languages_attributes: [:id, :name, :_destroy],
                                   projects_attributes:[:id, :date_from, :date_to, :client, :description, :technologies, :role, :level, :team_size, :_destroy],
                                   educations_attributes:[:id, :date_from, :date_to, :level, :description, :place, :course, :_destroy],
                                   jobs_attributes:[:id, :date_from, :date_to, :firm, :description, :position, :place, :_destroy])
  end
end
