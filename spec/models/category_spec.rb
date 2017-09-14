require 'rails_helper'

RSpec.describe Category, type: :model do
  it {should validate_presence_of :name}
  it {should have_many :post_categories}
  it {should have_many :posts}
end
