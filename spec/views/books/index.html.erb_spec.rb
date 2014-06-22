require 'rails_helper'

RSpec.describe "books/index", :type => :view do
  before(:each) do
    assign(:books, [
      Book.create!(
        :library => nil,
        :age_limit => 1,
        :status => 2,
        :author => "Author",
        :name => "Name",
        :count => 3,
        :remain => 4,
        :isbn => "Isbn"
      ),
      Book.create!(
        :library => nil,
        :age_limit => 1,
        :status => 2,
        :author => "Author",
        :name => "Name",
        :count => 3,
        :remain => 4,
        :isbn => "Isbn"
      )
    ])
  end

  it "renders a list of books" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Isbn".to_s, :count => 2
  end
end
