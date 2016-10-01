require 'rails_helper'

RSpec.describe Classroom, type: :model do
  it { is_expected.to belong_to(:student) }
  it { is_expected.to belong_to(:course) }

  describe 'set entry_at' do
    let(:classroom) { build(:classroom) }

    it { expect{ classroom.save }.to change{ classroom.entry_at }}
  end
end
