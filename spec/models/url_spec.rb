require "rails_helper"

RSpec.describe Url, type: :model do
  it "can produce a shortened url" do
    url = Url.create!(given_url: "www.example.com/something/somewhere/somehow")

    expect(url.slug).to eq(url.id.to_s(36))
  end

  it "can increment hits by one" do
    url = Url.create!(given_url: "www.example.com")

    url.increment_hits

    expect(url.hits).to eq 1
  end
end
