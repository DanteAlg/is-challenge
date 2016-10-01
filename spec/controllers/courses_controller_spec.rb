require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  describe '#new' do
    before { get :new }
    it { expect(assigns(:course)).to be_an_instance_of(Course) }
  end

  describe '#create' do
    subject(:create_course) { post :create, course: course_params }

    context 'when success' do
      let(:course_params) { attributes_for(:course) }

      it { expect{ create_course }.to change(Course, :count).by(1) }

      it 'course created' do
        create_course
        expect(assigns(:course).persisted?).to be_truthy
      end
    end

    context 'when error' do
      let(:course_params) { attributes_for(:course, name: '') }

      it { expect{ create_course }.to change(Course, :count).by(0) }

      it 'course not created' do
        create_course
        expect(assigns(:course).persisted?).to be_falsey
      end

      it 'return course errors' do
        create_course
        expect(assigns(:course).errors.messages)
          .to eq({:name=>['não pode ficar em branco']})
      end
    end
  end

  describe '#add_student' do
    let!(:student) { create(:student) }
    let(:course) { create(:course) }

    subject(:add_student) { put :add_student, id: course.id, classroom: { student_id: student.id }}

    it { expect{ add_student }.to change(Classroom, :count).by(1) }
  end
end
