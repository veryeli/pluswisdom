require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Sad Loris'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text=>'Sad Loris')
    end

    it "should have the right title" do
      visit '/static_pages/home'
      page.should have_selector('title',
        :text => 'Home is where it is at' )
    end
  end

  describe "Help page" do
    it "should have the content 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1', :text=>'Help')
    end
    it "should have the right title" do
      visit '/static_pages/help'
      page.should have_selector('title',
        :text => 'Help is where it is at' )
    end
  end

  describe "About page" do
    it "Should have the content 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('h1', :text=>"About Us")
    end

    it "should have the right title" do
      visit '/static_pages/about'
      page.should have_selector('title',
        :text => 'About is where it is at' )
    end
  end
end
