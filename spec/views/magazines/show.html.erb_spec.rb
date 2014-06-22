require 'rails_helper'

RSpec.describe "magazines/show", :type => :view do
  before(:each) do
    @magazine = assign(:magazine, Magazine.create!(
      :library => nil,
      :age_limit => 1,
      :status => 2,
      :author => "Author",
      :name => "Name",
      :count => 3,
      :remain => 4,
      :issn => "Issn",
      :interval => 5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/Issn/)
    expect(rendered).to match(/5/)
  end
end