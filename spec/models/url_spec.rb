require 'rails_helper'

RSpec.describe Url, :type => :model do
  it "can produce a shortened url" do
    url = Url.create!(given_url: "www.example.com/somewhere/somewhere/somewhere")

    expect(url.slug).to eq(url.id.to_s(36))
  end
end
