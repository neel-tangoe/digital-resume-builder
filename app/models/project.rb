class Project < ApplicationRecord
	belongs_to :resume

	enum role: ["DEVELOPER", "DESIGNER", "TESTER", "TEAM LEADER"]
	
end
