require 'rails_helper'

RSpec.describe "magazines/index", :type => :view do
  before(:each) do
    assign(:magazines, [
      Magazine.create!(
        :library => nil,
        :age_limit => 1,
        :status => 2,
        :author => "Author",
        :name => "Name",
        :count => 3,
        :remain => 4,
        :issn => "Issn",
        :interval => 5
      ),
      Magazine.create!(
        :library => nil,
        :age_limit => 1,
        :status => 2,
        :author => "Author",
        :name => "Name",
        :count => 3,
        :remain => 4,
        :issn => "Issn",
        :interval => 5
      )
    ])
  end

  it "renders a list of magazines" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Issn".to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
  end
end
