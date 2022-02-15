module ResumeAttachment
  extend ActiveSupport::Concern
  included do
  	has_one_attached :avtar
  end
end