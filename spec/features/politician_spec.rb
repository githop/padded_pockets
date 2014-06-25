require 'rails_helper'

feature 'User browsing politician profile' do
  let(:poli) {Politician.create(name: "Myname", id: 1)}


  it "sees politician name" do
    visit politician_path(poli)

    expect(page).to have_content(poli.name)
  end

  it "should have comments printed out" do
    comment = Comment.create(content: "here is all of my content")
    poli.comments << comment
    visit politician_path(poli)

    expect(page).to have_content(comment.content)
  end

end
