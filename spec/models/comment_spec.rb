require 'rails_helper'

describe Comment, type: :model do
  it {should belong_to :creator}
  it {should belong_to :post}
end