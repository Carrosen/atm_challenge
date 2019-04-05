require 'date'

require './lib/person.rb'
require './lib/atm.rb'



class Account
    
    STANDARD_VALIDITY_YRS = 5
    
    attr_accessor :pin_code, :exp_date, :account_status, :owner, :balance, :cash, :person

    def initialize(attrs = {})
        @pin_code = 9999
        @exp_date = set_expire_date
        @account_status = :active
        set_owner(attrs[:owner])
        @balance = 0
    end

    def pin_code
        @pin_code  
    end

    def pin_code_length
        number = @pin_code
        number_length = Math.log10(number).to_i + 1
        return number_length
    end

    def set_expire_date
        Date.today.next_year(STANDARD_VALIDITY_YRS).strftime('%m/%y')
    end

    def deactivate
        @account_status = :deactivated
    end

    def balance
        @balance
    end



    private

        def set_owner(obj)
            obj == nil ? missing_owner : @owner = obj
        end

        def missing_owner
            raise "An Account owner is required"
        end


end
