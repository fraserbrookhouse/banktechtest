require 'bank'

describe "#Bank" do
  describe "#deposit" do
    it "takes a number and adds it to balance" do
      bank = Bank.new
      bank.deposit(50)
      expect(bank.balance).to eq(50)
    end
  end
end