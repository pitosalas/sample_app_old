require 'spec_helper'
require 'application_helper'

describe "Static pages" do
  include ApplicationHelper

  subject { page }
  shared_examples_for "all static pages" do
    it { should have_selector('h1', :text => heading) }
    it { should have_selector('title', :text => full_title(page_title) ) }
  end

  describe "Home page" do

    before { visit root_path }
    let (:heading) { 'Sample App'}
    let (:page_title) { '' }

    it { should_not have_selector('title', text: 'home') }
  end

  describe "Help page" do
    before { visit help_path }
    let (:heading) { 'Help'}
    let (:page_title) { 'Help' }

    it_should_behave_like "all static pages"
  end

  describe "About page" do
    before { visit about_path }
    let (:heading) { 'About'}
    let (:page_title) { 'About' }
    it_should_behave_like "all static pages"
  end

  describe "Contact page" do
    before { visit contact_path }
    let (:heading) { 'Contact'}
    let (:page_title) { 'Contact' }
    it_should_behave_like "all static pages"
  end

  describe "Static Pages" do
    it "should have the right links in the footer" do
      visit root_path
      click_link "About"
      page.should have_selector 'title', text: full_title('About Us')
      click_link "Contact"
      page.should have_selector 'title', text: full_title('Contact Us')
    end
  end

end
