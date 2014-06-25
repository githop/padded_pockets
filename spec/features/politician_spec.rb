require 'rails_helper'

feature 'User browsing politician profile' do
  let(:poli) {Politician.create(name: "Myname")}

  it "sees politician name" do
    visit politician_path(poli)

    expect(page).to have_content(poli.name)
  end

end
