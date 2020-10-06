require 'bank'

describe "#Bank" do
  describe "#deposit" do
    it "takes a number and adds it to balance" do
      bank = Bank.new
      bank.deposit(50)
      expect(bank.balance).to eq(50)
    end

    it "stores the date, amount deposited or withdrawn and balance from a transaction" do
      bank = Bank.new
      Timecop.freeze(2020, 4, 20)
      bank.deposit(100)
      expect(bank.transaction_history[0][:date]).to eq("20/04/2020")
      expect(bank.transaction_history[0][:credit]).to eq(100)
      expect(bank.transaction_history[0][:balance]).to eq(100)
    end
  end
  describe "#withdraw" do
    it "takes a number and subtracts it from the balance" do
      bank = Bank.new
      bank.deposit(100)
      bank.withdraw(20)
      expect(bank.balance).to eq(80)
    end

    it "stores the date, amount deposited or withdrawn and balance from a transaction" do
      bank = Bank.new
      Timecop.freeze(2020, 6, 23)
      bank.deposit(100)
      bank.withdraw(20)
      expect(bank.transaction_history[1][:date]).to eq("23/06/2020")
      expect(bank.transaction_history[1][:debit]).to eq(20)
      expect(bank.transaction_history[1][:balance]).to eq(80)
    end
  end

  describe "#print_statement" do
    it "prints a statement of past transactions" do
      bank = Bank.new
      test_transaction = {date: "23/06/2020", "credit": 50, balance: 20}
      bank.transaction_history.push(test_transaction)
      statement = <<~STATEMENT
        date || credit || debit || balance
        23/06/2020 || 50.00 || || 20.00
        STATEMENT
      expect { bank.print_statement }.to output(statement).to_stdout
    end
  end
end