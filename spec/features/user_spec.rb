require "rails_helper"

feature "User" do

  context "Vistis the signin page" do
    it "has a sign up form" do
      visit new_user_path

      expect(page).to have_content "Username"
      expect(page).to have_content "Email"
      expect(page).to have_content "Password"
      expect(page).to have_button "Create User"
     end
  end

  context "creates user account" do

    it "user account is created" do
      visit new_user_path
      expect {
        fill_in "Username", with: "timbo"
        fill_in "Email", with: "test@example.com"
        fill_in "Password", with: "password"
        click_button "Create User"
      }.to change(User, :count).by(1)

      expect(page).to have_content "Balls"
    end

    it "fails to create a user account" do
        visit new_user_path
        fill_in "user_username", with: "timbo"
        fill_in "user_email", with: "test@example.com"
        click_button "Create User"
        expect(page).to have_content "there was an issue creating your account."
    end
  end

  context "edits their account" do
    it "updates their data" do
      visit edit_user_path

    end

  end


end

