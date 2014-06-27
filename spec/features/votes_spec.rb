require "rails_helper"

feature "Votes" do 
	before(:each) do
    @poli = Politician.create(name: "Myname", id: 1)
    @comment =Comment.create(content: "here is all of my content")
    @user = User.create(username: "scott", email: "email@email.com", password: "password")

    @user.comments << @comment
    @poli.comments << @comment
  end

	context "Up Voting" do 

		it "should create an upvote in the vote table" do 
			visit politician_path(@poli)

			expect {
				page.first(:xpath, '//img["value=1"]').click

				}.to change(Vote, :count).by(1)
		end
	end

end