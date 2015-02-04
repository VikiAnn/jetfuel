require "rails_helper"

describe "url shortening", type: :feature do
  context "url listing" do
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
      expect(page).to have_content("Shortened link: jet.fuel/#{url.slug}")
    end
  end

  context "url form" do
    it "can add a url" do
      visit root_path
      find_link("Add url").click
      long_url = "www.pathetically_long_urls_r_us.com"

      fill_in("Given url", with: long_url)
      find_button("Shorten!").click

      expect(current_path).to eq(root_path)
      expect(page).to have_content(long_url)
    end
  end
end
