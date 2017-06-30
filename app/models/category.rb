class Category < ActiveRecord::Base
  validates_inclusion_of :name, in: ['Entertainment', 'Learning', 'Family', 'Tech', 'Everything Else', 'Sporting']
  validates_uniqueness_of :name
end
