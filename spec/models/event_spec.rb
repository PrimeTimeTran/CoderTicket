require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "#upcoming" do
    it "return [] when there are no events" do
      expect(Event.upcoming).to eq []
    end

    it "return [] when there are only past events" do
      Event.create!(starts_at: 2.days.ago, ends_at: 1.day.ago, extended_html_description: "a past event",
                venue: Venue.new, category: Category.new)
      expect(Event.upcoming).to eq []
    end
  end

end
