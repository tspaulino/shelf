class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
  attr_accessible :rate

  validates_numericality_of :rate
  validates_inclusion_of :rate, :in => 1..5
end
