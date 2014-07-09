require "rails_helper"

describe Borrowing do
  before do
    FactoryGirl.create :child_user_1
    FactoryGirl.create :adult_user_1
    FactoryGirl.create :adult_book_1
    FactoryGirl.create :child_book_1_1
    11.times { |idx| FactoryGirl.create "child_book_#{idx + 1}" }
  end

  describe "pass_age_limit? validate test" do

    context "年齢制限パスする" do
      let(:borrowing) { FactoryGirl.build :child_child_borrowing_1 }
      it { expect(borrowing).to be_valid }
      it { expect(borrowing.send(:pass_age_limit?)).to eq(true) }
    end

    context "年齢制限パスしない" do
      let(:borrowing) { FactoryGirl.build :child_adult_borrowing_1 }
      it { expect(borrowing).not_to be_valid }
      it { expect(borrowing.send(:pass_age_limit?)).to eq(false) }
    end

  end

  describe "proper_library? validate test" do

    context "ユーザーと本の図書館が一致する" do
      let(:borrowing) { FactoryGirl.build :child_child_borrowing_1 }
      it { expect(borrowing).to be_valid }
      it { expect(borrowing.send(:proper_library?)).to eq(true) }
    end

    context "ユーザーと本の図書館が一致しない" do
      let(:borrowing) { FactoryGirl.build :child_child_borrowing_1_2 }
      it { expect(borrowing).not_to be_valid }
      it { expect(borrowing.send(:proper_library?)).to eq(false) }
    end

  end

  describe "no_need_reservation? validate test" do

    context "予約せずに借りられる" do
      let(:borrowing) { FactoryGirl.build :child_child_borrowing_1 }
      it { expect(borrowing).to be_valid }
      it { expect(borrowing.send(:no_need_reservation?)).to eq(true) }
    end

    context "借りるには予約が必要" do
      before do
        FactoryGirl.create :adult_child_borrowing_1
      end
      let(:borrowing) { FactoryGirl.build :child_child_borrowing_1 }
      it { expect(borrowing).not_to be_valid }
      it { expect(borrowing.send(:no_need_reservation?)).to eq(false) }
    end

  end

  describe "no_publication_borrowing? validate test" do

    context "まだその蔵書をレンタルしていない" do
      let(:borrowing) { FactoryGirl.build :child_child_borrowing_1_1 }
      it { expect(borrowing).to be_valid }
      it { expect(borrowing.send(:no_publication_borrowing?)).to eq(true) }
    end

    context "すでにその蔵書をレンタルしている" do
      before do
        FactoryGirl.create :child_child_borrowing_1
      end
      let(:borrowing) { FactoryGirl.build :child_child_borrowing_1_1 }
      it { expect(borrowing).not_to be_valid }
      it { expect(borrowing.send(:no_publication_borrowing?)).to eq(false) }
    end

  end

  describe "no_max_reached? validate test" do

    context "まだレンタルできる最大数に達していない" do
      let(:borrowing) { FactoryGirl.build :child_child_borrowing_1 }
      it { expect(borrowing).to be_valid }
      it { expect(borrowing.send(:no_max_reached?)).to eq(true) }
    end

    context "もうレンタルできる最大数に達している" do
      before do
        10.times { |idx| FactoryGirl.create "child_child_borrowing_#{idx + 1}" }
      end
      let(:borrowing) { FactoryGirl.build :child_child_borrowing_11 }
      it { expect(borrowing).not_to be_valid }
      it { expect(borrowing.send(:no_max_reached?)).to eq(false) }
    end

  end

end
