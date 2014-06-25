require 'spec_helper'

feature "Sign in" do
  before do
    User.create(email: "tom@example.com", password: "password")
  end

  context "with valid credentials" do
    scenario "signs me in " do
      visit '/sessions/new'
      fill_in 'Email', with: "tom@example.com"
      fill_in 'Password', with: "password"
      click_on "Sign in"
      expect(page).to have_text("Balls")
    end
  end

  context "with invalid credentials" do
    scenario "does not sign me in" do
      visit '/sessions/new'
      fill_in "Email", with: "tom@example"
      fill_in "Password", with: "1111"
      click_on "Sign in"
      expect(page).to have_text("Password")
    end
  end

end
