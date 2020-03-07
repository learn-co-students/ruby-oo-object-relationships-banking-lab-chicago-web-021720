class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end


  def valid?
    if @receiver.valid? == true && @sender.valid? == true
      true
    else
      false
    end
  end

  def execute_transaction
    if valid? == false
      self.status = 'rejected'
      return "Transaction rejected. Please check your account balance."
      
    elsif @amount > @sender.balance && self.status == 'pending'
      self.status = 'rejected'
      return "Transaction rejected. Please check your account balance."
    elsif valid? == true && status == 'pending'
      @sender.balance -= self.amount
      @receiver.balance += self.amount 
    end
    self.status = 'complete'
  end

  def reverse_transfer
    if self.status == 'complete'
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    else
      return 'invalid'
    end
  end

end

