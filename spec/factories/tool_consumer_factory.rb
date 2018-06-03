require 'ffaker'

FactoryBot.define do

  factory :tool_consumer do
    name { FFaker::Education.school }
    key { FFaker::Education.school_name }
    secret { FFaker::Internet.password }
  end

end