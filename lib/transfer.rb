class Transfer

  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    # Validate the transaction
    if sender.balance < amount || !valid? || self.status != 'pending'
      self.status = 'rejected'
      return "Transaction rejected. Please check your account balance."
    end

    # Transfer the funds
    sender.deposit(amount * -1)
    receiver.deposit(amount)

    # Set the transfer status to 'complete'
    self.status = 'complete'
  end

  def reverse_transfer
    # Can only reverse executed transfers
    if self.status != 'complete'
      return "Can only reverse completed transfers"
    end

    # Transfer the funds
    receiver.deposit(amount * -1)
    sender.deposit(amount)

    # Set the transfer status to 'reversed'
    self.status = 'reversed'
  end

end
