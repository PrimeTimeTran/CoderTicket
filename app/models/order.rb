class Order < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :tickets

  accepts_nested_attributes_for :tickets, reject_if: proc {|attributes| attributes[:quantity].to_i == 0 }

  validates_associated :tickets
end
