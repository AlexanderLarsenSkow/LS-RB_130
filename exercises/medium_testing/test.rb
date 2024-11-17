require 'minitest/autorun'

require_relative 'transaction'
require_relative 'cash_register'

class TestCashRegister < Minitest::Test
  def test_accept_money
    transaction = Transaction.new(50)
    transaction.prompt_for_payment

    register = CashRegister.new(500)
    register.accept_money(transaction)

    assert_equal(550, register.total_money)
  end

  def test_change
    register = CashRegister.new(1000)

    my_wallet = 200
    transaction = Transaction.new(100)
    transaction.amount_paid = 120
    my_wallet -= transaction.amount_paid

    my_wallet += register.change(transaction)

    assert_equal(100, my_wallet)
    assert_equal(20, register.change(transaction))
  end
  
  
end