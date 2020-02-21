class BankAccount

    attr_accessor :balance, :status
    attr_reader :name, :account_id

    @@all = []

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
        @@all << self
    end

    def display_balance
        "Your balance is $#{@balance}."
    end

    def withdraw(amount)
        @balance -= amount
    end

    def deposit(amount)
        @balance += amount
    end

    def valid?
        @status == "open" && @balance > 0
    end

    def close_account
        @status = "closed"
    end

    def self.all
        @@all
    end

end