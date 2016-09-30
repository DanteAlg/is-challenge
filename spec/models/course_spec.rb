require 'rails_helper'

RSpec.describe Course, type: :model do
  it { is_expected.to have_many(:classrooms) }
  it { is_expected.to have_many(:students) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:status) }
  end

  describe 'enumerate status' do
    let(:active_course) { build(:course, status: ActivityStatus::ACTIVE) }
    let(:inactive_course) { build(:course, status: ActivityStatus::INACTIVE) }

    it { expect(active_course.status_active?).to be_truthy }
    it { expect(inactive_course.status_inactive?).to be_truthy }
  end
end
