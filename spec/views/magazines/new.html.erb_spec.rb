require 'rails_helper'

RSpec.describe "magazines/new", :type => :view do
  before(:each) do
    assign(:magazine, Magazine.new(
      :library => nil,
      :age_limit => 1,
      :status => 1,
      :author => "MyString",
      :name => "MyString",
      :count => 1,
      :stock => 1,
      :issn => "MyString",
      :interval => 1
    ))
  end

  it "renders new magazine form" do
    render

    assert_select "form[action=?][method=?]", magazines_path, "post" do

      assert_select "input#magazine_library_id[name=?]", "magazine[library_id]"

      assert_select "input#magazine_age_limit[name=?]", "magazine[age_limit]"

      assert_select "input#magazine_status[name=?]", "magazine[status]"

      assert_select "input#magazine_author[name=?]", "magazine[author]"

      assert_select "input#magazine_name[name=?]", "magazine[name]"

      assert_select "input#magazine_count[name=?]", "magazine[count]"

      assert_select "input#magazine_stock[name=?]", "magazine[stock]"

      assert_select "input#magazine_issn[name=?]", "magazine[issn]"

      assert_select "input#magazine_interval[name=?]", "magazine[interval]"
    end
  end
end
