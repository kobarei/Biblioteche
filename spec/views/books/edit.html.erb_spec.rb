require 'rails_helper'

RSpec.describe "books/edit", :type => :view do
  before(:each) do
    @book = assign(:book, Book.create!(
      :library => nil,
      :age_limit => 1,
      :status => 1,
      :author => "MyString",
      :name => "MyString",
      :count => 1,
      :remain => 1,
      :isbn => "MyString"
    ))
  end

  it "renders the edit book form" do
    render

    assert_select "form[action=?][method=?]", book_path(@book), "post" do

      assert_select "input#book_library_id[name=?]", "book[library_id]"

      assert_select "input#book_age_limit[name=?]", "book[age_limit]"

      assert_select "input#book_status[name=?]", "book[status]"

      assert_select "input#book_author[name=?]", "book[author]"

      assert_select "input#book_name[name=?]", "book[name]"

      assert_select "input#book_count[name=?]", "book[count]"

      assert_select "input#book_remain[name=?]", "book[remain]"

      assert_select "input#book_isbn[name=?]", "book[isbn]"
    end
  end
end
