# frozen_string_literal: true

require_relative "../../test_helper"

class Increase::Test::Resources::Simulations::AccountStatementsTest < Increase::Test::ResourceTest
  def test_create_required_params
    response = @increase.simulations.account_statements.create(account_id: "account_in71c4amph0vgo2qllky")

    assert_pattern do
      response => Increase::AccountStatement
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        created_at: Time,
        ending_balance: Integer,
        file_id: String,
        starting_balance: Integer,
        statement_period_end: Time,
        statement_period_start: Time,
        type: Increase::AccountStatement::Type
      }
    end
  end
end
