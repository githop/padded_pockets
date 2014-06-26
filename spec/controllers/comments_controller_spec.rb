require 'rails_helper'

feature "Comments Controller" do
  before(:each) do
    @poli = Politician.create(name: "Myname", id: 1)
    @comment = Comment.create(content: "here is all of my content")
    @user = User.create(username: "scott", email: "email@email.com", password: "password")

    @user.comments << @comment
    @poli.comments << @comment
  end

  it "should have an upvote img for the comments" do
    visit politician_path(@poli)

    expect(page).to have_xpath("//img[@alt='up_vote' and @src = '/assets/up_vote.jpeg']")
  end

  it "should have a downvote img for the comments" do
    visit politician_path(@poli)

    expect(page).to have_xpath("//img[@alt='down_vote' and @src = '/assets/down_vote.jpeg']")
  end

end
