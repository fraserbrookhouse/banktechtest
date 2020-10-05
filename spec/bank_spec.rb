describe "Bank" do
  describe "#deposit" do
    it "takes a number and adds it to balance" do
      Bank.deposit(50)
      expect(Bank.balance).to eq(50)
    end
  end
end