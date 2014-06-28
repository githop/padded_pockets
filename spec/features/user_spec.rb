require "rails_helper"

feature "A User" do

  context "visits the sign up page" do
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

      expect(page).to have_content "Padded Pockets"
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

     before do
        @user = User.create(username: "Bob-Tester", email: "btest@example.com", password: "password", bio: "Sample Bio", party: "independent")
      end

    it "visits their profile page" do
      visit user_path(@user)

      expect(page).to have_content "Bob-Tester"
    end

    it 'visits their edit page and edits their account' do
      visit edit_user_path(@user)
      fill_in "Username", with: "Smeagol"
      fill_in "Email", with: "smeagol@onering.net"
      fill_in "Bio", with: "Live in the misty mountains"
      fill_in "Party", with: "Ring Lovers"
      click_button "Update User"

      expect(page).to have_content "Smeagol"
      expect(page).to have_content "smeagol@onering.net"
      expect(page).to have_content "Live in the misty mountains"
      expect(page).to have_content "Ring Lovers"
    end

    it 'fails to edit their profile page' do
      visit edit_user_path(@user)
      fill_in "Username", with: ""
      click_button "Update User"

      expect(page).to have_content "Something went wrong updating your profile Something went wrong updating your profile"
    end
  end

  context "deletes their account" do

    before do
      @user = User.create(username: "Bob-Tester", email: "btest@example.com", password: "password", bio: "Sample Bio", party: "independent")
    end

    it "hits the delete account link" do
      visit user_path(@user)
      expect {
        click_link "Delete user"
      }.to change(User, :count).by(-1)

    end
  end

end

