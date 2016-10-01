require 'rails_helper'

RSpec.feature 'Create course', type: :feature do
  context 'success' do
    it 'create new course' do
      visit '/courses/new'

      within '#new_course' do
        fill_in Course.human_attribute_name(:name), with: 'New Course'
        fill_in Course.human_attribute_name(:description), with: '1234'

        click_button 'Criar Curso'
      end

      expect(page).to have_content 'New Course'
    end
  end

  context 'fail' do
    it 'empty name' do
      visit '/courses/new'

      within '#new_course' do
        fill_in Course.human_attribute_name(:name), with: ''
        fill_in Course.human_attribute_name(:description), with: '1234'

        click_button 'Criar Curso'
      end

      expect(page).to have_content 'não pode ficar em branco'
    end

    it 'empty description' do
      visit '/courses/new'

      within '#new_course' do
        fill_in Course.human_attribute_name(:name), with: 'Foo'
        fill_in Course.human_attribute_name(:description), with: ''

        click_button 'Criar Curso'
      end

      expect(page).to have_content 'não pode ficar em branco'
    end
  end
end
