require "rails_helper"

describe Lending do
  before do
    FactoryGirl.create :child_user_1
    FactoryGirl.create :adult_user_1
    FactoryGirl.create :child_book_1
    FactoryGirl.create :child_book_2
    FactoryGirl.create :adult_book_1
  end

  describe "pass_age_limit? validate test" do

    context "年齢制限パスする" do
      let(:lending) { FactoryGirl.build :child_child_lending_1 }
      it { expect(lending).to be_valid }
      it { expect(lending.send(:pass_age_limit?)).to equal(true) }
    end

    context "年齢制限パスしない" do
      let(:lending) { FactoryGirl.build :child_adult_lending_1 }
      it { expect(lending).not_to be_valid }
      it { expect(lending.send(:pass_age_limit?)).to equal(false) }
    end

  end

  describe "proper_library? validate test" do

    context "ユーザーと本の図書館が一致する" do
      let(:lending) { FactoryGirl.build :child_child_lending_1 }
      it { expect(lending).to be_valid }
      it { expect(lending.send(:proper_library?)).to equal(true) }
    end

    context "ユーザーと本の図書館が一致しない" do
      let(:lending) { FactoryGirl.build :child_child_lending_3 }
      it { expect(lending).not_to be_valid }
      it { expect(lending.send(:proper_library?)).to equal(false) }
    end

  end

  describe "no_need_reservation? validate test" do

    context "予約せずに借りられる" do
      let(:lending) { FactoryGirl.build :child_child_lending_1 }
      it { expect(lending).to be_valid }
      it { expect(lending.send(:no_need_reservation?)).to equal(true) }
    end

    context "借りるには予約が必要" do
      before do
        FactoryGirl.create :adult_child_lending_1
      end
      let(:lending) { FactoryGirl.build :child_child_lending_1 }
      it { expect(lending).not_to be_valid }
      it { expect(lending.send(:no_need_reservation?)).to equal(false) }
    end

  end

  describe "no_publication_lending? validate test" do

    context "まだその蔵書をレンタルしていない" do
      let(:lending) { FactoryGirl.build :child_child_lending_2 }
      it { expect(lending).to be_valid }
      it { expect(lending.send(:no_publication_lending?)).to equal(true) }
    end

    context "すでにその蔵書をレンタルしている" do
      before do
        FactoryGirl.create :child_child_lending_1
      end
      let(:lending) { FactoryGirl.build :child_child_lending_2 }
      it { expect(lending).not_to be_valid }
      it { expect(lending.send(:no_publication_lending?)).to equal(false) }
    end

  end

end
