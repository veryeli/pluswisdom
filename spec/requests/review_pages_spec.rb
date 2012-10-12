require 'spec_helper'

describe "Review pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  describe "review creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a review" do
        expect { click_button "Post" }.not_to change(Review, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { fill_in 'review_content', with: "Lorem ipsum"* 50}
      before { fill_in 'review_article_title', with: "Lorem ipsum"}
      it "should create a review" do
        expect { click_button "Post" }.to change(Review, :count).by(1)
      end
    end
  end

  describe "review destruction" do
    before { FactoryGirl.create(:review, user: user) }

    describe "as correct user" do
      before { visit root_path }

      it "should delete a review" do
        expect { click_link "delete" }.to change(Review, :count).by(-1)
      end
    end
  end
end
