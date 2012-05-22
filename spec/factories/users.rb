require 'faker'

FactoryGirl.define do 
	factory :user do |f|
		f.name { Faker::Name.name }
		f.email { Faker::Internet.email }
		f.password { "OK"}
		f.password_confirmation { "OK" }
	end
end