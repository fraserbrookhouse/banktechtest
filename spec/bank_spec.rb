require 'bank'

describe "#Bank" do
  describe "#deposit" do
    it "takes a number and adds it to balance" do
      bank = Bank.new
      bank.deposit(50)
      expect(bank.balance).to eq(50)
    end
  end
  describe "#withdraw" do
    it "takes a number and subtracts it from the balance" do
      bank = Bank.new
      bank.deposit(100)
      bank.withdraw(20)
      expect(bank.balance).to eq(80)
    end
  end
end