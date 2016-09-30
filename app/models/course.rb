class Course < ActiveRecord::Base
  extend EnumerateIt
  has_many :classrooms
  has_many :students, through: :classrooms

  validates_presence_of :name, :description, :status

  has_enumeration_for :status, with: ActivityStatus,
                      create_helpers: { prefix: true }
end
