# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::AccountStatementsTest < Increase::Test::ResourceTest
  def test_retrieve
    response = @increase.account_statements.retrieve("account_statement_lkc03a4skm2k7f38vj15")

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

  def test_list
    response = @increase.account_statements.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::AccountStatement
    end

    assert_pattern do
      row => {
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
