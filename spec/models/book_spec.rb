require 'spec_helper'

describe Book do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:isbn_number) }
  it { should validate_numericality_of(:isbn_number) }
  it { should ensure_length_of(:isbn_number).is_equal_to(10) }
  it { should validate_uniqueness_of(:isbn_number) }
  it { should have_many(:reviews) }
  it { should have_many(:users).through(:reviews) }
end
