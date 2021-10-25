require 'oystercard'

describe Oystercard do

  it "has a balance on creation" do
    expect(subject).to respond_to(:balance)
  end

  describe "#top_up" do
    it "raises error if amount topped up is greater than max limit" do
      subject.top_up(Oystercard::LIMIT)
      expect { subject.top_up(1) }.to raise_error ("Cannot add this amount, limit: £#{Oystercard::LIMIT}")
    end

    it "balance increases by amount in top-up method" do
      check_top_up(20,20)
      check_top_up(20,40)
    end
  
    def check_top_up(num, expect)
      subject.top_up(num)
      expect(subject.balance).to eq expect
    end
  end

  describe "#deduct" do
    it "reduces the balance by amount given" do
      subject.top_up(Oystercard::LIMIT)
      expect{ subject.deduct(30) }.to change{ subject.balance }.by -30
    end
  end

  describe "#touch_in" do
    it "sets journey to true" do
      expect{ subject.touch_in }.to change{ subject.journey }.from(false).to(true)
    end
  end

  describe "#touch_out" do
    it "sets journey to false" do
      subject.touch_in
      expect{ subject.touch_out }.to change{ subject.journey }.from(true).to(false)
    end
  end

end