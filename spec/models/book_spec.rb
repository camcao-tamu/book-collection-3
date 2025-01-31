require 'rails_helper'

RSpec.describe Book, type: :model do
  context "validations" do
    it "is valid with a title, author, price, and published date" do
      book = Book.new(title: "Test Book", author: "Test Author", price: 9.99, published_date: "2025-01-01")
      expect(book).to be_valid
    end

    it "is invalid without a title" do
      book = Book.new(title: nil, author: "Test Author", price: 9.99, published_date: "2025-01-01")
      expect(book).not_to be_valid
      expect(book.errors[:title]).to include("can't be blank")
    end

    it "is invalid without an author" do
      book = Book.new(title: "Test Book", author: nil, price: 9.99, published_date: "2025-01-01")
      expect(book).not_to be_valid
      expect(book.errors[:author]).to include("can't be blank")
    end

    it "is invalid without a price" do
      book = Book.new(title: "Test Book", author: "Test Author", price: nil, published_date: "2025-01-01")
      expect(book).not_to be_valid
      expect(book.errors[:price]).to include("can't be blank")
    end

    it "is invalid without a published date" do
      book = Book.new(title: "Test Book", author: "Test Author", price: 9.99, published_date: nil)
      expect(book).not_to be_valid
      expect(book.errors[:published_date]).to include("can't be blank")
    end
  end
end