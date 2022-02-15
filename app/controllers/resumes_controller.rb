class ResumesController < ApplicationController

  def index
    @resumes = current_user.resumes
  end

  def show
    @template_type = params[:type]
    @resume = current_user.resumes.find(params[:id])
  end

  def download
    @resume = current_user.resumes.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render :pdf => 'demo',
               :layout => "pdf",
               :template => "pdf/resume_template",
               :margin => { :top => 10, :bottom => 10, :left => 10, :right => 10},
               :viewport_size => '1280x1024',
               disposition: 'attachment'
      end
    end
  end

  def new
    @resume = current_user.resumes.new
    respond_to do |format|
      format.html { render :template => "resumes/_form" }
    end
  end

  def edit
    @resume = current_user.resumes.find(params[:id])
  end

  def create
    @resume = current_user.resumes.new(resume_params)

    if @resume.save
      redirect_to resume_path(@resume)
    else
      render 'new'
      end
  end

  def update
    @resume = current_user.resumes.find(params[:id])

    if @resume.update(resume_params)
      redirect_to resume_path(@resume)
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
                                   educations_attributes:[:id, :date_from, :date_to, :level, :description, :place, :_destroy],
                                   jobs_attributes:[:id, :date_from, :date_to, :firm, :position, :place, :_destroy])
  end
end
