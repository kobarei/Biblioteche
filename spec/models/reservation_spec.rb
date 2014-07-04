require "rails_helper"

describe Lending do
  before do
    FactoryGirl.create :child_user_1
    FactoryGirl.create :adult_user_1
    FactoryGirl.create :child_book_1
    FactoryGirl.create :child_book_1_1
    FactoryGirl.create :adult_book_1
  end

  describe "pass_age_limit? validate test" do

    context "年齢制限パスする" do
      let(:reservation) { FactoryGirl.build :child_child_reservation_1 }
      it { expect(reservation).to be_valid }
      it { expect(reservation.send(:pass_age_limit?)).to eq(true) }
    end

    context "年齢制限パスしない" do
      let(:reservation) { FactoryGirl.build :child_adult_reservation_1 }
      it { expect(reservation).not_to be_valid }
      it { expect(reservation.send(:pass_age_limit?)).to eq(false) }
    end

  end

  describe "proper_library? validate test" do

    context "ユーザーと本の図書館が一致する" do
      let(:reservation) { FactoryGirl.build :child_child_reservation_1 }
      it { expect(reservation).to be_valid }
      it { expect(reservation.send(:proper_library?)).to eq(true) }
    end

    context "ユーザーと本の図書館が一致しない" do
      let(:reservation) { FactoryGirl.build :child_child_reservation_3 }
      it { expect(reservation).not_to be_valid }
      it { expect(reservation.send(:proper_library?)).to eq(false) }
    end

  end

  describe "no_publication_reservation? validate test" do

    context "まだ予約していない" do
      let(:reservation) { FactoryGirl.build :child_child_reservation_1 }
      it { expect(reservation).to be_valid }
      it { expect(reservation.send(:no_publication_reservation?)).to eq(true) }
    end

    context "予約している" do
      before do
        FactoryGirl.create :child_child_reservation_1
      end
      let(:reservation) { FactoryGirl.build :child_child_reservation_1 }
      it { expect(reservation).not_to be_valid }
      it { expect(reservation.send(:no_publication_reservation?)).to eq(false) }
    end

  end

  describe "no_publication_lending? validate test" do

    context "まだその蔵書をレンタルしていない" do
      let(:reservation) { FactoryGirl.build :child_child_reservation_2 }
      it { expect(reservation).to be_valid }
      it { expect(reservation.send(:no_publication_lending?)).to eq(true) }
    end

    context "すでにその蔵書をレンタルしている" do
      before do
        FactoryGirl.create :child_child_lending_1
      end
      let(:reservation) { FactoryGirl.build :child_child_reservation_2 }
      it { expect(reservation).not_to be_valid }
      it { expect(reservation.send(:no_publication_lending?)).to eq(false) }
    end

  end

end
