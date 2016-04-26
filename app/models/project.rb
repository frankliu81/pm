class Project < ActiveRecord::Base
  belongs_to :user;

  has_many :tasks, dependent: :destroy
  has_many :discussions, dependent: :destroy

  has_many :memberships, dependent: :destroy
  has_many :member_users, through: :memberships, source: :user

  validates :title, presence: true, uniqueness: true
  validates :user_id, uniqueness: {scope: :project_id}

  def membership_for(user)
    memberships.find_by_user_id user if user
  end

end
