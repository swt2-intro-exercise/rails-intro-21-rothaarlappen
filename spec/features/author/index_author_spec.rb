require 'rails_helper'

describe "visit author page", type: :feature do
  it "should show a list of all authors, a link to their detail pages and a link to add new authors" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit authors_path 
    expect(page).to have_link 'New', href: new_author_path
  end
end
