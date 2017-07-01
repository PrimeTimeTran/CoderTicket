class Event < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  belongs_to :venue
  belongs_to :category
  belongs_to :user
  has_many :ticket_types

  validate :ends_at_after_starts_at, :future_date
  validates_presence_of :extended_html_description, :venue, :category, :starts_at, :ends_at
  validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}

  def self.upcoming
    Event.where("starts_at > ?", Time.now)
  end

  def ends_at_after_starts_at
    if starts_at > ends_at
      errors.add(:ending_date, "can't be before starting date.")
    end
  end

  def future_date
    if starts_at < Time.now
      errors.add(:starting_date, "must be in the future.")
    end
  end

  def self.search(search)
    Event.where("name ILIKE ?", "%#{search}%")
  end

  def mark_as_published!
    self.published_at = Time.now
    self.save!
  end

  def unpublish
    self.published_at = nil
    self.save
  end
end
