# frozen_string_literal: true

require_relative 'statement'

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
    Statement.print_statement(@transaction_history)
  end

  private

  def store_transaction(money, type)
    time = Time.now
    time = time.strftime('%d/%m/%Y')
    transaction = { date: time, "#{type}": money, balance: @balance }
    @transaction_history.push(transaction)
  end
end
