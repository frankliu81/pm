class User < ActiveRecord::Base
  has_secure_password

  has_many :ideas, dependent: :nullify
  has_many :comments, dependent: :nullify

  has_many :likes, dependent: :destroy
  has_many :liked_ideas, through: :likes, source: :idea

  has_many :memberships, dependent: :destroy
  has_many :joined_projects, through: :memberships, source: :project

  validates :first_name, presence: true
  validates :last_name, presence: true
  #VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  #validates :email, uniqueness: VALID_EMAIL_REGEX, presence: true

  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, uniqueness: true, presence: true, format: VALID_EMAIL_REGEX


  def full_name
    "#{first_name} #{last_name}"
  end


end
