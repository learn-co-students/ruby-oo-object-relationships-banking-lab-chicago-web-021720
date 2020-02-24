require_relative 'bank_account.rb'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  attr_reader

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end 

  def valid?
    if @sender.valid? && @receiver.valid?
      true
    end 


  end 

  def execute_transaction

    if (@sender.balance < @amount) || !self.valid?
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif self.status == "pending" 
        @receiver.balance += @amount
        @sender.balance -= @amount
        self.status = "complete"     
    end


  end 

  def reverse_transfer
    if self.status == "complete"
    @receiver.balance -= @amount
    @sender.balance += @amount
    @status = "reversed"
    end 


  end 




end



#  #valid?
#    can check that both accounts are valid (FAILED - 15)
#    calls on the sender and receiver's #valid? methods (FAILED - 16)
#  #execute_transaction
#    can execute a successful transaction between two accounts (FAILED - 17)
#    each transfer can only happen once (FAILED - 18)
#    rejects a transfer if the sender does not have enough funds (does not have a valid account) (FAILED - 19)
#  #reverse_transfer
#    can reverse a transfer between two accounts (FAILED - 20)
#    it can only reverse executed transfers (FAILED - 21)

