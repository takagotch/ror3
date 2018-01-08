account1.deposit(100)
account2.withdraw(100)

#
Account taransaction do
	account1.deposit(100)
	account2.withdraw(100)
end

create_table :accounts, force: true do |t|
  t.string :number
  t.decimal :balance, percision: 10, scale: 2, default: 0
end

class Account < ActiveREcord::Base
validate :price_must_be_at_least_a_cent

def withdraw(amount)
adjust_balance_and_save(-amount)
end

def deposit(amount)
adjust_balance_and_save(amount)
end

private

def adjust_balance_and_save(amount)
	self.balance += amount
	save!
end

def price_must_be_at_least_a_cent
	errors.add(:balance, "0 < x") if balance < 0.01
end
end


peter = Account.create(balance: 100, number: "12345")
paul  = Account.create(balance: 200, number: "54321")

Account.transaction do
paul.deposit(10)
peter.withdraw(10)
end

#
peter = Account.create(balance: 100, number: "12345")
paul  = Account.create(balance: 200, number: "54321")

Account.transaction do
	paul.deposit(350)
	peter.withdraw(350)
end

begin
	Account.transaction do
		paul.deposit(350)
		peter.withdraw(350)
	end
rescue
	puts = "cancel"
end

