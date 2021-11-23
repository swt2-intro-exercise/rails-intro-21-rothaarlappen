require 'rails_helper'

describe "visit author page", type: :feature do
  it "should show text at 'visit_author' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    # FactoryBot.create :author
    visit author_path('alan')
    expect(page).to have_text('Alan Turing')
  end
end
