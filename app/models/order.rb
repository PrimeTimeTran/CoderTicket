class Order < ApplicationRecord
  belongs_to :event
  has_many :tickets
  has_many :ticket_types

  accepts_nested_attributes_for :tickets

  validates_associated :tickets
end
