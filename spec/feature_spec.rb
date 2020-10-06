require "Timecop"
require 'bank'


describe "print statement of previous transactions" do
  it "prints the date, amount credited or debit and leftover balance of previous transactions" do
    bank = Bank.new
    Timecop.freeze(2020, 5, 20)
    bank.deposit(10000)
    Timecop.freeze(2020, 7, 5)
    bank.withdraw(50)
    Timecop.freeze(2020, 8, 10)
    bank.deposit(200)
    Timecop.freeze(2020, 8, 25)
    bank.withdraw(800)
    statement = <<~STATEMENT
        date || credit || debit || balance
        20/05/2020 || 10000.00 || || 10000.00
        05/07/2020 || || 50.00 || 9950.00
        10/08/2020 || 200.00 || || 10150.00
        25/08/2020 || || 800.00 || 9350.00
        STATEMENT
    expect { bank.print_statement }.to output(statement).to_stdout
  end
end