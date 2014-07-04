require "rails_helper"

describe Publication do
  before do
    @adult_book = FactoryGirl.create :adult_book_1
  end

  describe "Test Search method" do
    let(:pubs) { Publication.search "Somaria" }
    it { expect(pubs[:books].first).to eql(@adult_book) }
  end

end
