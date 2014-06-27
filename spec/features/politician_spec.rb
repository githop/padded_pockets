require 'rails_helper'

feature 'User browsing politician profile' do
  before(:each) do
    @poli = Politician.create(name: "Myname", id: 1)
    @comment =Comment.create(content: "here is all of my content")
    @user = User.create(username: "scott", email: "email@email.com", password: "password")

    @user.comments << @comment
    @poli.comments << @comment
  end

  it "sees politician name" do
    visit politician_path(@poli)

    expect(page).to have_content(@poli.name)
  end

  it "should have comments printed out" do
    visit politician_path(@poli)

    expect(page).to have_content(@comment.content)
  end

  it "should print out the Commenter's username" do
    visit politician_path(@poli)

    expect(page).to have_content(@user.username)
  end

  context "create comment form" do


    it "should create a comment" do
      visit new_session_path

      fill_in "user_email", with: "email@email.com"
      fill_in "user_password", with: "password"
      click_button "Sign in"

      visit politician_path(@poli)

      fill_in "comment_content", with: "here is our comment"
      click_button "Submit"

      expect(page).to have_content("here is our comment")

    end

  end
end
