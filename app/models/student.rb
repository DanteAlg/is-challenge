class Student < ActiveRecord::Base
  extend EnumerateIt

  validates_presence_of :name, :register_number, :status
  validates_uniqueness_of :register_number

  has_enumeration_for :status, with: ActivityStatus,
                      create_helpers: { prefix: true }
end
