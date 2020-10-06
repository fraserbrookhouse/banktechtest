# frozen_string_literal: true

class Bank
  attr_reader :balance, :transaction_history

  def initialize
    @balance = 0
    @transaction_history = []
  end

  def deposit(money)
    @balance += money
    store_transaction(money, 'credit')
  end

  def withdraw(money)
    @balance -= money
    store_transaction(money, 'debit')
  end

  def print_statement
    statement = "date || credit || debit || balance\n"
    @transaction_history.each do |transaction|
      if transaction.key?(:credit)
        string = "#{transaction[:date]} || #{format('%.2f', transaction[:credit])} || || #{format('%.2f', transaction[:balance])}"
      else
        string = "#{transaction[:date]} || || #{format('%.2f', transaction[:debit])} || #{format('%.2f', transaction[:balance])}"
      end
      statement += string
      statement += "\n"
    end
    print statement
  end

  private

  def store_transaction(money, type)
    time = Time.now
    time = time.strftime('%d/%m/%Y')
    transaction = { date: time, "#{type}": money, balance: @balance }
    @transaction_history.push(transaction)
  end
end
