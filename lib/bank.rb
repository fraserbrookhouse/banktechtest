class Bank

  attr_reader :balance
  
  def initialize
    @balance = 0
    @transaction_history = {}
  end

  def deposit(money)
    @balance += money
  end
  
  def withdraw(money)
    @balance -= money
  end

  
end