require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe '#indexx' do
    before { get :index }
    it { expect(assigns(:courses)).to eq(Course.all) }
    it { expect(assigns(:students)).to eq(Student.all) }
  end
end
