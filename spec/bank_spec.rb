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
  describe "#store_transaction" do
    it "stores the date, amount deposited or withdrawn and balance from a transaction" do
      bank = Bank.new
      Timecop.freeze(2020, 4, 20)
      bank.stub(:balance) { 100 }
      bank.store_transaction(50)
      bank.stub(:balance) { 100 }
      bank.store_transaction(-70)
      expect(bank.transaction_history[1]["date"]).to eq("20/04/2020")
      expect(bank.transaction_history[1]["credit"]).to eq(50)
      expect(bank.transaction_history[1]["balance"]).to eq(100)
    end
  end
end