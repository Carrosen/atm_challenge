class Atm
    attr_accessor :funds

    def initialize
        @funds = 1000
    end

<<<<<<< HEAD
    def withdraw(amount)
      @funds -= amount
    end

    def withdraw(amount, account)
      case
      when amount > account.balance
        return
       
      else
        @funds -= amount
        account.balance = account.balance - amount
        { status: true, message: 'success', date: Date.today, amount: amount }
  end
=======
    def withdraw(amount, account)
        case
        when amount > account.balance
          return
         
        else
          require 'date'
          @funds -= amount
          account.balance = account.balance - amount
          { status: true, message: 'success', date: Date.today, amount: amount }
        end
    end
>>>>>>> 7835c64e591b90da9ed2d2246bd36a16bdfab416
end