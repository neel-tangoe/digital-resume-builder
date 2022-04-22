class ApplicationController < ActionController::Base
	skip_before_action :verify_authenticity_token

	def common_desktop_nav_header
    @nav_header_menus = [
                          {:href => root_path, :label => "Home", :arrowBack => true}
                        ]
  end
end
