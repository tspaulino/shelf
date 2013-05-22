class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :book
  attr_accessible :rate, :book_attributes, :book_id, :user_id
  accepts_nested_attributes_for :book

  validates_numericality_of :rate
  validates_inclusion_of :rate, :in => 1..5

  validates_uniqueness_of :book_id, :scope => :user_id
end
