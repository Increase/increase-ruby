# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::IntrafiBalancesTest < Increase::Test::ResourceTest
  def test_intrafi_balance
    response = @increase.intrafi_balances.intrafi_balance("account_id")

    assert_pattern do
      response => Increase::IntrafiBalance
    end

    assert_pattern do
      response => {
        id: String,
        balances: ^(Increase::Internal::Type::ArrayOf[Increase::IntrafiBalance::Balance]),
        currency: Increase::IntrafiBalance::Currency,
        effective_date: Date,
        total_balance: Integer,
        type: Increase::IntrafiBalance::Type
      }
    end
  end
end
