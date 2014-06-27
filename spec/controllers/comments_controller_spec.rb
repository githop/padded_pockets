require 'rails_helper'

feature "Comments Controller" do
  before(:each) do
    @poli = Politician.create(name: "Myname", id: 1)
    @comment = Comment.create(content: "here is all of my content")
    @user = User.create(username: "scott", email: "email@email.com", password: "password")
    @user2 = User.create(username: "keen", email: "keenan@email.com", password: "password")

    @user.comments << @comment
    @poli.comments << @comment
    @poli.comments << Comment.create(content: "here is a second comment, you can't delete me", user_id: @user2.id)

    visit new_session_path
    fill_in "Email", with: "email@email.com"
    fill_in "Password", with: "password"
    click_on "Sign in"
  end

  it "should have an upvote img for the comments" do
    visit politician_path(@poli)

    expect(page).to have_xpath("//img[@alt='up_vote' and @src = '/assets/up_vote.jpeg']")
  end

  it "should have a downvote img for the comments" do
    visit politician_path(@poli)

    expect(page).to have_xpath("//img[@alt='down_vote' and @src = '/assets/down_vote.jpeg']")
  end

  it "should allow a user to delete his/her own comment" do
    visit politician_path(@poli)

    expect{
      click_link "Delete Comment"
    }.to change(Comment, :count).by(-1)


  end

  it "should not allow a user to delete a comment that isn't hers/his" do
    visit politician_path(@poli)

    expect(page).to have_css("a[data-method='delete']", count: 1)
  end

end
