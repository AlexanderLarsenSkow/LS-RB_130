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
end