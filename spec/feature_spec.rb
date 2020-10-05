require "Timecop"
require "bank"

describe "print statement of previous transactions" do
  it "prints the date, amount credited or debit and leftover balance of previous transactions"
    Timecop.freeze(2020, 5, 20)
    Bank.deposit(10000)
    Timecop.freeze(2020, 7, 5)
    Bank.withdraw(50)
    Timecop.freeze(2020, 8, 10)
    Bank.deposit(200)
    Timecop.freeze(2020, 8, 25)
    Bank.withdraw(800)
    expect(Bank.statement).to eq("date || credit || debit || balance\n 20/05/2020 || 10000.00 || || 10000.00\n 05/07/2020 || || 50.00 || 9950.00\n 10/08/2020 || 200.00 || || 10150.00\n 25/08/2020 || || 800.00 || 9350.00")
end