# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Home', type: :system do
  let(:animal) { create(:animal) }

  before(:each) do
    allow_any_instance_of(Bovisync).to receive(:report).and_return({
                                                                     "#{animal.bovisync_id}": {
                                                                       SoldDate: nil,
                                                                       BDATE: '2017-01-18',
                                                                       LOCAT: 'Royal Dairy',
                                                                       SireShortNam: 'PABLO',
                                                                       AllFarmsLife: 'Royal Dairy',
                                                                       Owner: 'Royal Dairy',
                                                                       AGDAY: 743
                                                                     }
                                                                   })
  end

  describe '#index' do
    it 'displays marketing information' do
      visit('/')
      expect(page).to have_text('How it works')
      expect(page).to have_text('About')
      expect(page).to have_text('Contact')
      expect(page).to have_text('Become Certified')
      expect(page).to have_text('Trust Through Transparency')
      expect(page).to have_text('Connecting you to better farms')
    end

    it 'redirects to show page on form submit' do
      # fill in and submit lookup code form
      visit('/')
      fill_in('id', with: animal.eartag)
      click_on('Trace Product')
      expect(page).not_to have_button('Trace Product')
    end
  end

  describe '#show' do
    it 'displays information about the cow' do
      visit("/#{animal.eartag}")
      # Add Tests for Cow Information
      expect(page).to have_text('4321')
    end

    describe '404' do
      ##
      # This is a super yucky hack. Normally you would use RSpec's expect#to_raise syntax but that wasn't
      # catching the error in the system specs. So, the fix is to not let Capybara raise the exception and
      # instead let the error be rendered to the page and we can verify it is the error we expected
      #
      before(:each) do
        Capybara.raise_server_errors = false
      end

      it 'returns a 404 if animal not found' do
        visit('/')
        fill_in('id', with: '00000')
        click_on('Trace Product')
        expect(page).to have_text('ActiveRecord::RecordNotFound')
      end
    end
  end
end
