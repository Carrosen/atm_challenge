require './lib/account.rb'
require './lib/atm.rb'

require 'pry'


class Person
  attr_accessor :name, :cash, :account, :create_account, :balance, :deposit_funds, :pin_code, :pin, :atm, :actual_pin

  def initialize(attrs = {})
    @name = set_name(attrs[:name])
    @cash = 0
    @account = nil
    @atm = Atm.new
   
  end

  def create_account
    @account = Account.new(owner: self)
  end

  def enter_pin(actual_pin)
    @actual_pin = actual_pin
  end

  def deposit(amount)
    @account == nil ? missing_account : deposit_funds(amount)
  end

  def withdraw(amount)
  args = {amount: amount, pin: @actual_pin, account: @account, atm: @atm}
  @account == nil ? missing_account : withdraw_funds(args)
  end


  private

  def deposit_funds(amount)
    @cash -= amount
    @account.balance += amount
  end

  def withdraw_funds(args)
    args[:atm] == nil ? missing_atm : atm = args[:atm]
    account = @account
    amount = args[:amount]
    pin = args[:pin]
    response = atm.withdraw(amount, pin, account)
    response[:status] == true ? increase_cash(response) : response
  
  end

  def increase_cash(response)
    @cash += response[:amount]
  end

  def set_name(name)
    name == nil ? missing_name : name
  end

  def missing_name
    raise ArgumentError, 'A name is required'
  end

  def missing_account
    raise RuntimeError, 'No account present'
  end

  def missing_atm
    raise RuntimeError, 'An ATM is required'
  end


end
