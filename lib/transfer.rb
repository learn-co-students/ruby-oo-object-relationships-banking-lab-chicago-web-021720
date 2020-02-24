require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    self.sender = sender
    self.receiver = receiver
    self.status = "pending"
    self.amount = amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if (self.status == "pending") && (self.sender.balance > self.amount) && self.sender.valid? && self.receiver.valid? 
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    else 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
  end
end
