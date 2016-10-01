require 'rails_helper'

RSpec.feature 'Add student in course', type: :feature do
  context 'have course' do
    let!(:student) { create(:student) }
    let!(:course) { create(:course) }

    it 'add student in course' do
      visit '/'

      find('#classroom_student_id').find(:xpath, 'option[1]').select_option
      click_on 'Adicionar aluno'

      expect(page).to have_selector 'td', text: student.name
    end
  end
end
