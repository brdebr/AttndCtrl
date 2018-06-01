require "rails_helper"
require 'ffaker'


RSpec.feature "Admin authentication", :type => :feature do

  before(:each) do
    @pass = FFaker::Internet.password
    @admin = create :admin, password:@pass, password_confirmation:@pass
    p 'Email : ' + @admin.email
    p 'Password : ' + @admin.password
  end

  scenario "#Guest visits the homepage" do

    visit "/"
    expect(page).to have_text"This is the public page"

  end

  scenario "#Guest visit dashboard by url" do

    visit "/dashboard"
    expect(page).to have_text"Error"

  end

  scenario "#Guest visit dashboard by link" do

    visit "/"
    expect(page).to have_no_link 'Dashboard'

  end

  scenario "#Guest visit lti launch" do

    visit "/launch"
    expect(page).to have_text"Authentication"

  end

  scenario "#Admin log in" do

    visit "/"
    expect(page).to have_text"This is the public page"

    within '.form-inline' do
      click_link 'Log in'
    end


    expect(page).to have_text"Email"

    fill_in 'Email', with:@admin.email
    fill_in 'Password', with:@admin.password

    within '#new_admin' do
      click_on 'Log in'
    end

    within '.form-inline' do
      expect(page).to have_text @admin.email
    end

    end

end