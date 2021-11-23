require 'rails_helper'

describe "New author page", type: :feature do
  it "should exist at 'new_author_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit new_author_path
  end
  it "should have text inputs for an author's first name, last name, and homepage" do
    visit new_author_path
    # these are the standard names given to inputs by the Rails form builder
    expect(page).to have_field('author[first_name]')
    expect(page).to have_field('author[last_name]')
    expect(page).to have_field('author[homepage]')
  end
  it "should save the author in database after filling in inputs and submitting" do 
    visit new_author_path
    page.fill_in 'author[last_name]', with: 'Dijkstra'
    page.fill_in 'author[first_name]', with: 'KeineAhnung'
    page.fill_in 'author[homepage]', with: 'WTF.com'
    find('input[type="submit"]').click
  end 
  it "shouldn't be valid to create an author without lastname" do 
    @author = Author.new 
    expect(@author).to_not be_valid
    @author.last_name = 'Test'
    expect(@author).to be_valid
  end 
  it "should show validation error on author creation" do 
    visit new_author_path
    page.fill_in 'author[first_name]', with: 'KeineAhnung'
    page.fill_in 'author[homepage]', with: 'WTF.com'
    find('input[type="submit"]').click
    expect(page).to have_text('error prohibited this author from being saved:')
  end 

end
