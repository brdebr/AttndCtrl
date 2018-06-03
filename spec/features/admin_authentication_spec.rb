require "rails_helper"
require 'ffaker'

RSpec.describe "Admin authentication" do

  before(:each) do
    @pass = FFaker::Internet.password
    @admin = create :admin, password:@pass, password_confirmation:@pass
    p 'Admin Email : ' + @admin.email
    p 'Admin Password : ' + @admin.password
  end

  it ".log in" do

    visit "/"

    within '.form-inline' do
      click_link 'Log in'
    end

    expect(page).to have_text"Email"

    fill_in 'Email', with:@admin.email
    fill_in 'Password', with:@admin.password

    within '#new_admin' do
      click_on 'Log in'
    end

    expect(page).to have_text @admin.email

  end

end