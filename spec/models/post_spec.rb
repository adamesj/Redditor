require 'rails_helper'

describe Post, type: :model do
  it {should belong_to :creator}
  it {should have_many :comments}
  it {should have_many :post_categories}
  it {should have_many :categories}

  it "should have a title with a minimum of 5 characters" do
    post = Post.new(title: "test article", description: "some description", url: "url.com")
    post.title = "a" * 3
    post.valid?
    expect(post.errors[:title]).to include("is too short (minimum is 5 characters)")
  end

  it "is invalid without a unique url" do
    Post.create(title: "some title", url: "website.com")
    post = Post.new(title: "another title", url: "website.com")
    post.valid?
    expect(post.errors[:url]).to include("has already been taken")
  end
end