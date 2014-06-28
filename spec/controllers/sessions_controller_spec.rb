require 'rails_helper'

feature "Sign in" do
  before do
   @user =  User.create(username: "timbo", email: "tom@example.com", password: "password")
  end

  context "with valid credentials" do
    scenario "signs me in" do
      visit '/sessions/new'
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      click_on "Sign in"
      expect(page).to have_content("Padded Pockets")
    end
  end

  context "with invalid credentials" do
    scenario "does not sign me in" do
      visit '/sessions/new'
      fill_in "Email", with: "tom@example"
      fill_in "Password", with: "1111"
      click_on "Sign in"
      expect(page).to have_text("Sign in failed")
    end
  end

end

feature "Sign out" do
  before do
    @user =  User.create(username: "timbo", email: "tom@example.com", password: "password")
  end

  context "clears user's session" do
    scenario "session data is nil" do
      visit user_path(@user)
      click_link "Sign out"
      expect(page).to have_no_content(@user.username)
    end
  end

end
