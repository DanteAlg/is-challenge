require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  describe '#new' do
    before { get :new }
    it { expect(assigns(:student)).to be_an_instance_of(Student) }
  end

  describe '#create' do
    subject(:create_student) { post :create, student: student_params }

    context 'when success' do
      let(:student_params) { attributes_for(:student) }

      it { expect{ create_student }.to change(Student, :count).by(1) }

      it 'student created' do
        create_student
        expect(assigns(:student).persisted?).to be_truthy
      end
    end

    context 'when error' do
      let(:student_params) { attributes_for(:student, name: '') }

      it { expect{ create_student }.to change(Student, :count).by(0) }

      it 'student not created' do
        create_student
        expect(assigns(:student).persisted?).to be_falsey
      end

      it 'return student errors' do
        create_student
        expect(assigns(:student).errors.messages)
          .to eq({:name=>['não pode ficar em branco']})
      end
    end
  end
end
