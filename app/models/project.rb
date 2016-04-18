class Project < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  has_many :tasks, dependent: :destroy
end
