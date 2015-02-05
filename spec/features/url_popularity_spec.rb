require "rails_helper"

describe "hit counter" do
  it "increments by one each time the shortened link is visited" do
    url = Url.create!(given_url: "https://www.facebook.com/")

    visit "/#{url.slug}"
    visit root_path

    expect(page).to have_content("Hits: 1")
    expect(url.reload.hits).to eq 1
  end

  it "sorts urls by popularity" do
    url1 = Url.create!(given_url: "www.first.example.com", hits: 4)
    url2 = Url.create!(given_url: "www.second.example.com/1", hits: 9)
    url3 = Url.create!(given_url: "www.third.example.com/2", hits: 1)

    visit root_path

    within("ul:first") do
      expect(page).to have_content(url2.given_url)
      expect(page).not_to have_content(url1.given_url)
      expect(page).not_to have_content(url3.given_url)
    end

    within("ul:last") do
      expect(page).to have_content(url3.given_url)
      expect(page).not_to have_content(url1.given_url)
      expect(page).not_to have_content(url2.given_url)
    end
  end
end
