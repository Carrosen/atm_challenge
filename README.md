# ATM challenge

This was the first challenge which was a one week project - provided by [Craft Academy Bootcamp](https://craftacademy.se/)

## The challenge
We were asked to write a simple implementation of an ATM using Ruby that can be run in the Interactive Ruby Shell (IRB)

---

## Objectives
* An ATM machine can hold up to $1000
* Withdrawal can be cleared only if:
    * The ATM holds enough funds
    * The amount is divisible by 5
    * The person attempting the withdrawal provides a valid ATM card
    * Valid pin and expire date
    * Card status must be active (Not report stolen or lost)
    * The person attempting the withdrawal has sufficient funds on his account
* There are only $5, $10 and $20 bills in the ATM. Withdrawals for amounts not divisible by 5 must be rejected.
* Upon a successful withdrawal the system should return a receipt with information about the date, amount and     bills that was dispatched. (The receipt should be presented in the form of a Hash.

## Built with
* Ruby

## Tested with
* RSpec
* Pry

## User stories

```
As a User
In order to make an withdraw
The ATM needs to have funds
```

```
As a User               
In order to know if my withdrawal was successful or unsuccessful
I want to receive a message with my withdrawal details
```

```
As an ATM operator          
In order for the right person to make a withdrawal            
I want each person to have an separate account
```

```
As a ATM operator           
In order ensure that an Acccount holder can only withdraw funds that he has balance for           
I want to allow a withdrawal only if there are sufficient funds in the account
```

```
As a ATM operator
In order for our costumers to withdraw funds
I need make sure that we only allow withdrawals if there are funds available
```

```
As a Costumer
In order to keep my funds secure
I want a secure Pin code & an expiry date on my card that allows only me to access my funds
```

```
As a ATM operator             
In order to allow access active customers         
I want to allow withdrawals from only active accounts
```

```
As an Bank Customer    
In order to withdraw funds in even amounts  
I want to receive funds in 5, 10 & 20$ bills
```

```
As a Customer
In order to manage my funds
I need to have a personal account
```

```
As a ATM operator      
In order to keep track of our costumers     
We want to assign each account to a separate person
```

```
As a Person
In order to be able to use banking services to manage my funds,
I would like to be able to create a bank account
```

```
As a Person with a Bank Account
In order to be able to put my funds in the account,
I would like to be able to make a deposit
```

```
As a Person without a Bank Account,
In order to prevent me from using the wrong bank account,
I should NOT be able to to make a deposit.
```
