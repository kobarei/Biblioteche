require "rails_helper"

describe Lending do
  before do
    FactoryGirl.create :child_user_1
    FactoryGirl.create :child_book_1
    FactoryGirl.create :adult_book_1
  end

  describe "pass_age_limit? method test" do

    context "年齢制限パスする" do
      let(:lending) { FactoryGirl.build :child_child_lending }
      it { expect(lending.send(:pass_age_limit?)).to equal(true) }
    end

    context "年齢制限パスしない" do
      let(:lending) { FactoryGirl.build :child_adult_lending }
      it { expect(lending.send(:pass_age_limit?)).to equal(false) }
    end

  end
end
