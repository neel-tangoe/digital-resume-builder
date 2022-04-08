class HomeController < ApplicationController
  def index
    redirect_to choose_templates_resumes_path
  end

  
end
