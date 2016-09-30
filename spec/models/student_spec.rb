require 'rails_helper'

RSpec.describe Student, type: :model do
  it { is_expected.to have_many(:classrooms) }
  it { is_expected.to have_many(:courses) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:register_number) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_uniqueness_of(:register_number) }
  end

  describe 'enumerate status' do
    let(:active_student) { build(:student, status: ActivityStatus::ACTIVE) }
    let(:inactive_student) { build(:student, status: ActivityStatus::INACTIVE) }

    it { expect(active_student.status_active?).to be_truthy }
    it { expect(inactive_student.status_inactive?).to be_truthy }
  end
end
