class BankAccount

    attr_reader :name
    attr_accessor :balance, :status

    def initialize(name)
        @name = name
        @balance = 1000
        @status = 'open'
    end

    def deposit(amount)
        # QUESTION: Given that I have `attr_accessor :balance`, why doesn't this work>?
        #    balance += amount
        self.balance += amount
    end

    def display_balance
        "Your balance is $#{balance}."
    end

    def valid?
        balance > 0 && status == 'open'
    end

    def close_account
        # Why do we need `self.` here?
        self.status = 'closed'
    end
    
end
