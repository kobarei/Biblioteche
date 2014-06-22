require "rails_helper"

describe Rental do
  before do
    FactoryGirl.create :child_user_1
    FactoryGirl.create :child_book_1
    FactoryGirl.create :adult_book_1
  end

  describe "pass_age_limit? method test" do

    context "年齢制限パスする" do
      let(:rental) { FactoryGirl.build :child_child_rental }
      it { expect(rental.send(:pass_age_limit?)).to equal(true) }
    end

    context "年齢制限パスしない" do
      let(:rental) { FactoryGirl.build :child_adult_rental }
      it { expect(rental.send(:pass_age_limit?)).to equal(false) }
    end

  end
end
