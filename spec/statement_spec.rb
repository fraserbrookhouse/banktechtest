require 'statement'

describe '#Statement' do
  let(:first_transaction) { double :transaction, date: "25/06/2020", credit: 500, balance: 500}
  let(:second_transaction) { double :transaction, date: "13/08/2020", debit: 100, balance: 400}
  let(:transaction_history) { [first_transaction, second_transaction] }
  describe '#print' do
    it 'prints a correctly formatted statement for credit and devit transactions' do
      statement = <<~STATEMENT
        date || credit || debit || balance
        23/06/2020 || 50.00 || || 20.00
      STATEMENT
      expect { Statement.print(transaction_history) }.to output(statement).to_stdout
    end
  end
end