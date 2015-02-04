require "rails_helper"

describe "url list", type: :feature do
  it "lists urls" do
    url1 = Url.create(given_url: "www.first.example.com")
    url2 = Url.create(given_url: "www.second.example.com")

    visit urls_path

    expect(page).to have_content(url1.given_url)
    expect(page).to have_content(url2.given_url)
  end

  it "has both original and shortened urls" do
    url = Url.create!(given_url: "www.example.com")

    visit urls_path

    expect(page).to have_content(url.given_url)
    expect(page).to have_content("Slug: #{url.slug}")
  end
end
