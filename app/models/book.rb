class Book < ActiveRecord::Base
  attr_accessible :isbn_number, :title
  validates_presence_of :title, :isbn_number
  validates_numericality_of :isbn_number
  validates_length_of :isbn_number, :is => 10
  validates_uniqueness_of :isbn_number
  has_many :reviews
  has_many :users, :through => :reviews
end
