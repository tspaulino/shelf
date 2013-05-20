require 'spec_helper'

describe Review do
  it { should belong_to(:user) }
  it { should belong_to(:book) }
  it { should validate_numericality_of(:rate) }
  it { should ensure_inclusion_of(:rate).in_range(1..5) }
end
