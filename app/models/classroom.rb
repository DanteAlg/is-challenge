class Classroom < ActiveRecord::Base
  belongs_to :student
  belongs_to :course
  before_create :set_entry_at

  validates_presence_of :student, :course

  private

  def set_entry_at
    self.entry_at = Time.zone.now
  end
end
