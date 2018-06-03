require "rails_helper"
require 'ffaker'

RSpec.describe "Tool consumers management" do

  before(:each) do
    @pass = FFaker::Internet.password

    @admin = create :admin, password:@pass, password_confirmation:@pass
    p 'Admin - Email : ' + @admin.email
    p 'Admin - Password : ' + @admin.password

    @tool_consumer_b = build :tool_consumer
    p 'Tool Consumer - Name : ' + @tool_consumer_b.name
    p 'Tool Consumer - Key : ' + @tool_consumer_b.key
    p 'Tool Consumer - Secret : ' + @tool_consumer_b.secret

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

  it '.create Tool Consumer' do

    # ---------------vv------------vv---------------

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

    # -------- TODO refactor ^^ this ^^ , duplicated

    click_on 'Tool consumers'

    expect(page).to have_text"Name"
    expect(page).to have_text"Key"
    expect(page).to have_text"Secret"
    expect(page).to have_text"Actions"

    click_link 'New Tool Consumer'

    # save_and_open_page
    fill_in 'Name', with:@tool_consumer_b.name
    fill_in 'Key', with:@tool_consumer_b.key
    fill_in 'Secret', with:@tool_consumer_b.secret

    click_on 'Create Tool consumer'

    expect(page).to have_text"successfully"

    expect(page).to have_text @tool_consumer_b.name
    expect(page).to have_text @tool_consumer_b.key
    expect(page).to have_text @tool_consumer_b.secret

    click_link 'Back'

    expect(page).to have_text @tool_consumer_b.name

  end

end