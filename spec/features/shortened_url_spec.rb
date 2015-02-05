require "rails_helper"

describe "shortened urls", type: :feature do
  it "redirects to original url" do
    url = Url.create(given_url: "https://www.facebook.com/")

    visit urls_path
    find_link("jet.fuel").click

    expect(current_url).to eq(url.given_url)
  end
end
