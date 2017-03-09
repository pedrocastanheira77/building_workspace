require 'rails_helper'

feature 'Assessments' do
  context 'no Assessments have been added' do
    scenario 'should display a prompt to add a Assessments' do
      visit '/assessments'
      expect(page).to have_content 'No assessments yet'
      expect(page).to have_link 'Add new assessment'
    end
  end

  context 'assessments have been added' do
    before do
      Assessment.create(name: '10 Year Maintenance Assessment')
    end

    scenario 'display assessement' do
      visit '/assessments'
      expect(page).to have_content('10 Year Maintenance Assessment')
      expect(page).not_to have_content('No assessments yet')
    end
  end

  context 'creating assessments' do
    scenario 'prompts user to fill out a form, then displays the new assessment' do
      visit assessments_path # assessments_path = '/assessments'
      click_link 'Add new assessment'
      fill_in 'Name', with: '10 Year Maintenance Assessment'
      click_button 'Create Assessment'
      expect(page).to have_content '10 Year Maintenance Assessment'
      expect(current_path).to eq '/assessments'
    end
  end

  context 'viewing assessments' do
    let!(:audit){ Assessment.create(name:'audit') }

    scenario 'lets a user view a assessment' do
     visit assessments_path
     click_link 'audit'
     expect(page).to have_content 'audit'
     expect(current_path).to eq "/assessments/#{audit.id}"
    end
  end

  context 'editing assessments' do
    before { Assessment.create name: 'audit', description: 'M&E and Arquitecture', id: 1 }

    scenario 'let a user edit a assessment' do
      visit '/assessments'
      click_link 'Edit'
      fill_in 'Name', with: 'Kentucky Fried Chicken'
      fill_in 'Description', with: 'M&E and Arquitecture'
      click_button 'Update Assessment'
      click_link 'Kentucky Fried Chicken'
      expect(page).to have_content 'Kentucky Fried Chicken'
      expect(page).to have_content 'M&E and Arquitecture'
      expect(current_path).to eq '/assessments/1'
    end
  end

end
