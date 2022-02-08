class Resume < ApplicationRecord
  belongs_to :user


  has_many :skills, dependent: :destroy
  has_many :languages, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :educations, dependent: :destroy
  has_many :awards, dependent: :destroy

  accepts_nested_attributes_for :skills, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :languages, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :projects, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :educations, reject_if: :all_blank, allow_destroy: true


  validates :name, presence: true,
            length: {minimum: 3}
  validates :general_info, presence: true,
            length: {minimum: 10}

  validates :interests,
            length: {minimum: 3}

  enum gender: ["MALE", "FEMALE"]
  
  validates :user_id, presence: true

  def to_param
    [id, name.parameterize].join('-')
  end
end
