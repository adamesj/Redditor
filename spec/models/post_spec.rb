require 'rails_helper'

describe Post, type: :model do
  it {should belong_to :creator}
  it {should have_many :comments}
  it {should have_many :post_categories}
  it {should have_many :categories}
end