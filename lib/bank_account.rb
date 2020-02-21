class BankAccount
    attr_accessor :balance, :status
    attr_reader :name

    #INPUT: person's name
    #OUTPUT: creates bank account with account holder's name, balance of 1000, and status of open
    #SIDE EFFECTS: 
    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
    end

    #INPUT: deposit amount
    #OUTPUT: account balance increased by deposit amount
    def deposit(amount)
        self.balance += amount
    end

    #OUTPUT: string displaying balance amount
    def display_balance
        "Your balance is $#{self.balance}."
    end

    #OUTPUT: returns true if status is open and balance is greater than zero
    def valid?
        if self.status == "open" && self.balance > 0
            return true
        else
            return false
        end
    end

    #OUTPUT: updates account status to closed
    def close_account
        self.status = "closed"
    end
end
