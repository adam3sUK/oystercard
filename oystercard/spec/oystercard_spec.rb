require 'oystercard'

describe Oystercard do
  it "has a balance on creation" do
    expect(subject).to respond_to(:balance)
  end
end