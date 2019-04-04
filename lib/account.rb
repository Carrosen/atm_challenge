require 'date'

require './lib/person.rb'

class Account
    
    STANDARD_VALIDITY_YRS = 5
    
    attr_accessor :pin_code, :exp_date, :account_status, :owner, :balance, :cash, :person

    def initialize(attrs = {})
        @pin_code = rand(1000..9999)
        @exp_date = set_expire_date
        @account_status = :active
        set_owner(attrs[:owner])
        @person = :nil

    end

    def pin_code
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
        
    end



    private

        def set_owner(obj)
            obj == nil ? missing_owner : @owner = obj
        end

        def missing_owner
            raise "An Account owner is required"
        end


end
