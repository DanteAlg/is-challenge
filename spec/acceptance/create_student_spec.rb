require 'rails_helper'

RSpec.feature 'Create student', type: :feature do
  context 'success' do
    it 'create new user' do
      visit '/students/new'

      within '#new_student' do
        fill_in Student.human_attribute_name(:name), with: 'Foo'
        fill_in Student.human_attribute_name(:register_number), with: '1234'

        click_button 'Criar Estudante'
      end
    end
  end

  context 'when error' do
    it 'empty name' do
      visit '/students/new'

      within '#new_student' do
        fill_in Student.human_attribute_name(:name), with: ''
        fill_in Student.human_attribute_name(:register_number), with: '1234'

        click_button 'Criar Estudante'
      end

      expect(page).to have_content 'não pode ficar em branco'
    end

    it 'empty register_number' do
      visit '/students/new'

      within '#new_student' do
        fill_in Student.human_attribute_name(:name), with: 'Foo'
        fill_in Student.human_attribute_name(:register_number), with: ''

        click_button 'Criar Estudante'
      end

      expect(page).to have_content 'não pode ficar em branco'
    end

    it 'same register' do
      create(:student, register_number: '1234')
      visit '/students/new'

      within '#new_student' do
        fill_in Student.human_attribute_name(:name), with: ''
        fill_in Student.human_attribute_name(:register_number), with: '1234'

        click_button 'Criar Estudante'
      end

      expect(page).to have_content 'já está em uso'
    end
  end
end
