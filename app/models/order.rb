class Order < ApplicationRecord
  belongs_to :event
  has_many :tickets
  has_many :ticket_types
end
