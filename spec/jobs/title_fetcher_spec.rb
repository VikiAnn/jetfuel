require "rails_helper"

describe TitleFetcher do
  it "can fetch a title from an external site" do
    url = Url.create!(given_url: "https://www.facebook.com/")
    TitleFetcher.perform(url)

    expect(url.reload.title).to eq("Welcome to Facebook - Log In, Sign Up or Learn More")
  end
end
