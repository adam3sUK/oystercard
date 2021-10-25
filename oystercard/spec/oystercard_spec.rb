require 'oystercard'

describe Oystercard do

  it "has a balance on creation" do
    expect(subject).to respond_to(:balance)
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