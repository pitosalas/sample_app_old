require 'spec_helper'
require 'application_helper'

describe "User Pages" do
  	include ApplicationHelper

	describe "signup page" do
		before { visit signup_path }
		subject { page }
		it { should have_selector('h1', text: 'Sign up') }
		it { should have_selector('title', text: full_title('Sign up')) }
	end
end
