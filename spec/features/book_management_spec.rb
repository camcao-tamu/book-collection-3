require 'rails_helper'

RSpec.describe "Book management", type: :feature do
  it "adds a book successfully with a flash notice" do
    visit new_book_path
    fill_in "Title", with: "Test Book"
    fill_in "book_author", with: "Test Author"
    fill_in "book_price", with: "9.99"
    fill_in "book_published_date", with: "2025-01-01"
    click_button "Create Book"

    expect(page).to have_content("Book was successfully created.")
    expect(page).to have_content("Test Book")
    expect(page).to have_content("Test Author")
    expect(page).to have_content("9.99")
    expect(page).to have_content("2025-01-01")
    
  end

  it "shows an error when trying to add a book without a title" do
    visit new_book_path
    fill_in "Title", with: ""
    fill_in "book_author", with: "Test Author"
    fill_in "book_price", with: "9.99"
    fill_in "book_published_date", with: "2025-01-01"
    click_button "Create Book"
  
    expect(page).to have_content("Title can't be blank")
  end

  it "shows an error when trying to add a book without an author" do
    visit new_book_path
    fill_in "Title", with: "Test Book"
    fill_in "book_author", with: ""
    fill_in "book_price", with: "9.99"
    fill_in "book_published_date", with: "2025-01-01"
    click_button "Create Book"
  
    expect(page).to have_content("Author can't be blank")
  end
  
  it "shows an error when trying to add a book without a price" do
    visit new_book_path
    fill_in "Title", with: "Test Book"
    fill_in "book_author", with: "Test Author"
    fill_in "book_price", with: ""
    fill_in "book_published_date", with: "2025-01-01"
    click_button "Create Book"
  
    expect(page).to have_content("Price can't be blank")
  end
  
  it "shows an error when trying to add a book without a published date" do
    visit new_book_path
    fill_in "Title", with: "Test Book"
    fill_in "book_author", with: "Test Author"
    fill_in "book_price", with: "9.99"
    fill_in "book_published_date", with: ""
    click_button "Create Book"
  
    expect(page).to have_content("Published date can't be blank")
  end
  
  
  
end
