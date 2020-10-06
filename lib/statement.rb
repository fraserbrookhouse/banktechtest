

class Statement

  def self.print_statement(transactions)
    statement = "date || credit || debit || balance\n"
    transactions.each do |transaction|
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
end
