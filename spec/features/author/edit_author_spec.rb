require 'rails_helper'

describe "edit author page", type: :feature do
  it "should be poosible to access author's edit page" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit authors_path 
    expect(page).to have_link 'New', href: new_author_path
  end
end
