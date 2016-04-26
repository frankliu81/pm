class Task < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: :project_id}
  belongs_to :project
  belongs_to :user;

end
