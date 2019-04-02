require './lib/atm.rb'



describe Atm do
    let(:account) { instance_double('Account', pin_code: '1234', exp_date: '12/19', account_status: :active) }
    pin_code = '1234'
    
    before do
        allow(account).to receive(:balance).and_return(1000)
        allow(account).to receive(:balance=)
    end
    
    it 'has 1000$ on initialize' do
        expect(subject.funds).to eq 1000
    end

    it 'funds are reduced at withdraw' do
        subject.withdraw(50, '1234', account)
        expect(subject.funds).to eq 950
    end

    it 'allows withdraw if account has enough balance.' do
        if account_status != :disabled then
        expected_output = { status: true, message: 'success', date: Date.today, amount: 45 }
        expect(subject.withdraw(45, pin_code, account)).to eq expected_output
        end
    end


    it 'rejects withdraw if account has insufficient funds' do
        expected_output = { status: false, message: 'insufficient funds', date: Date.today }
        expect(subject.withdraw(105, pin_code, account)).to eq expected_output
    end

    it 'reject withdraw if ATM has insufficient funds' do
        subject.funds = 50
        expected_output = { status: false, message: 'insufficient funds in ATM', date: Date.today }
        expect(subject.withdraw(100, pin_code, account)).to eq expected_output
    end

    it 'reject withdraw if pin is wrong' do
        expected_output = { status: false, message: 'wrong pin', date: Date.today }
        expect(subject.withdraw(50, 9999, account)).to eq expected_output
    end

    it 'reject withdraw if card is expired' do
        allow(account).to receive(:exp_date).and_return('12/15')
        expected_output = { status: false, message: 'card expired', date: Date.today }
        expect(subject.withdraw(6, pin_code, account)).to eq expected_output
    end

    it 'reject withdraw if account is disabled' do
        allow(account).to receive(:account_status).and_return(:disabled)
        expected_output = { status: false, message: 'account disabled', date: Date.today }
        expect(subject.withdraw(6, pin_code, account)).to eq expected_output
    end

end


