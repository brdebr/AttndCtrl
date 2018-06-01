require "rails_helper"

RSpec.feature "Admin authentication", :type => :feature do

  before(:all) do
    @admin = create(:admin)
  end

  scenario "#Guest visits the homepage" do

    visit "/"
    expect(page).to have_text("This is the public page")

  end

  scenario "#Guest visit dashboard" do

    visit "/dashboard"
    expect(page).to have_text("Error")

  end

  scenario "#admin log in" do

    visit "/"
    expect(page).to have_text("This is the public page")

    within('.form-inline') do
      click_link('Log in')
    end


    expect(page).to have_text("Email")

    fill_in 'Email', with:@admin.email
    fill_in 'Password', with:@admin.password

    within '#new_admin' do
      click_on('Log in')
    end

    within '.form-inline' do
      expect(page).to have_text(@admin.email)
    end

  end

end