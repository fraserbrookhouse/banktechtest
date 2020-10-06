# frozen_string_literal: true

require 'statement'

describe '#Statement' do
  describe '#print_statement' do
    transaction_history = [
      { date: '25/06/2020', credit: 500, balance: 500 },
      { date: '13/08/2020', debit: 100, balance: 400 }
    ]
    it 'prints a correctly formatted statement for credit and devit transactions' do
      statement = <<~STATEMENT
        date || credit || debit || balance
        25/06/2020 || 500.00 || || 500.00
        13/08/2020 || || 100.00 || 400.00
      STATEMENT
      expect { Statement.print_statement(transaction_history) }.to output(statement).to_stdout
    end
  end
end
