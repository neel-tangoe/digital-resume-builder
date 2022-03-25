class Resume < ApplicationRecord
  belongs_to :user

  include ResumeAttachment

  has_many :skills, dependent: :destroy, :foreign_key => "resume_id"
  has_many :languages, dependent: :destroy, :foreign_key => "resume_id"
  has_many :projects, dependent: :destroy, :foreign_key => "resume_id"
  has_many :educations, dependent: :destroy, :foreign_key => "resume_id"
  has_many :awards, dependent: :destroy, :foreign_key => "resume_id"
  has_many :jobs, dependent: :destroy, :foreign_key => "resume_id"
  has_one :share_cv

  accepts_nested_attributes_for :skills, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :languages, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :projects, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :educations, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :jobs, reject_if: :all_blank, allow_destroy: true

  enum gender: ["MALE", "FEMALE", "OTHER"]

  validates :name, presence: true,
            length: {minimum: 3}

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :general_info, presence: true, length: {minimum: 10}
  validates :phone_number, presence: true
  validates :user_id, presence: true
  validates :country, presence: true
  validates :address, presence: true
  validates :general_info, presence: true

  def to_param
    [id, name.parameterize].join('-')
  end
end
