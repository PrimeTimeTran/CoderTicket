require 'rails_helper'

RSpec.describe "events", type: :routing do
  it "routes /upcoming to events#index" do
    expect(get: "/upcoming").to route_to(controller: "events", action: "index")
  end

RSpec.describe Event, type: :model do
  describe "#upcoming" do
    it "return [] when there are no events"

    it "return [] when there are only past events"

    it "return [b] when there are a past event 'a' and a future event 'b'"
    end
  end
end
