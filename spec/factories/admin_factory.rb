require 'ffaker'

FactoryBot.define do

  factory :admin do
    email  { FFaker::Internet.free_email }
    password "asdzxc"
    password_confirmation "asdzxc"
  end


end