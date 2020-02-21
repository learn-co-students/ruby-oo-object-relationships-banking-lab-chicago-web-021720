class Transfer

    attr_accessor :status, :sender, :receiver, :bankaccount
    attr_reader :amount

    @@all = []


    def initialize(sender, receiver, amount)
      @status = "pending"
      @sender = sender
      @receiver = receiver
      @amount = amount
      @@all << self
    end

    def check_account(account)
      BankAccount.all.include?(account)
    end

    def valid?
      @sender.valid? && @receiver.valid? && @sender.balance >= @amount && @status == "pending"
    end
    
    def execute_transaction
      if self.valid?
        @sender.withdraw(@amount)
        @receiver.deposit(@amount)
        @status = "complete"
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end

    def reverse_transfer
      if @status == "complete"
        @sender, @receiver = @receiver, @sender
        @status = "pending"
        self.execute_transaction
        @status = "reversed"
      end
    end

end