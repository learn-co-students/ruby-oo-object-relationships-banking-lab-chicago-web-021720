class Transfer
  # your code here
  attr_accessor :status, :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    # had some trouble writing this if statement, does the order matter in chaining && statements?
    if self.status == "pending" && self.valid? && self.sender.balance >= self.amount
      puts "sender balance: #{self.sender.balance}, transaction amount: #{self.amount}"
    self.receiver.deposit(self.amount)
    self.sender.deposit(-1 * self.amount)
    self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.deposit(self.amount)
      self.receiver.deposit(-1 * self.amount)
      self.status = "reversed"
    else
      "transfer could not be reversed"
    end
  end

end
