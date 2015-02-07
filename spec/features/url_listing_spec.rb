require "rails_helper"

describe "url listing page", inline: true do
  it "lists urls along with all relevant info" do
    url = Url.create!(given_url: "www.first.example.com", hits: 4, title: "Example")

    visit root_path

    expect(page).to have_content("Hits: #{url.hits}")
    expect(page).to have_content(url.pretty_created_at)
    expect(page).to have_content("Title: #{url.title}")
  end

  it "gets a title and saves it when a url is added" do
    visit root_path

    find_link("Add url").click
    fill_in("Given url", with: "https://www.facebook.com/")
    find_button("Shorten!").click

    expect(page).to have_content("Title: Welcome to Facebook")
  end
end
