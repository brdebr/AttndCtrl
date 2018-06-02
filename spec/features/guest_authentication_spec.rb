require 'rails_helper'
require 'ffaker'

RSpec.describe 'Guest signs up' do

  before(:each) do
    @pass = FFaker::Internet.password
    @guest = build :admin, password:@pass, password_confirmation:@pass
    p 'Guest Email : ' + @guest.email
    p 'Guest Password : ' + @guest.password
  end

  it '.visits the homepage' do

    visit "/"
    expect(page).to have_text"This is the public page"

  end

  it ".visits dashboard by url and fails" do

    visit "/dashboard"
    expect(page).to have_text"Error"

  end

  it ".visits lti launch and fails" do

    visit "/launch"
    expect(page).to have_text"Authentication error"

  end

  it '.becomes admin' do

    visit "/"

    within '.form-inline' do
      click_link 'Log in'
    end

    click_link 'Sign up'

    fill_in 'Email', with:@guest.email
    fill_in 'Password', with:@guest.password
    fill_in 'Password confirmation', with:@guest.password

    click_button 'Sign up'

    expect(page).to have_text @guest.email
    expect(page).to have_text 'Welcome'
    expect(page).to  have_text 'Dashboard'

    # Use for debugging
    # save_and_open_page

  end

end