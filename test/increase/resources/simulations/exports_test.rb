# frozen_string_literal: true

require_relative "../../test_helper"

class Increase::Test::Resources::Simulations::ExportsTest < Increase::Test::ResourceTest
  def test_create_required_params
    response = @increase.simulations.exports.create(category: :form_1099_int)

    assert_pattern do
      response => Increase::Export
    end

    assert_pattern do
      response => {
        id: String,
        account_statement_bai2: Increase::Export::AccountStatementBai2 | nil,
        account_statement_ofx: Increase::Export::AccountStatementOfx | nil,
        account_verification_letter: Increase::Export::AccountVerificationLetter | nil,
        balance_csv: Increase::Export::BalanceCsv | nil,
        bookkeeping_account_balance_csv: Increase::Export::BookkeepingAccountBalanceCsv | nil,
        category: Increase::Export::Category,
        created_at: Time,
        dashboard_table_csv: Increase::Export::DashboardTableCsv | nil,
        entity_csv: Increase::Export::EntityCsv | nil,
        form_1099_int: Increase::Export::Form1099Int | nil,
        form_1099_misc: Increase::Export::Form1099Misc | nil,
        funding_instructions: Increase::Export::FundingInstructions | nil,
        idempotency_key: String | nil,
        result: Increase::Export::Result | nil,
        status: Increase::Export::Status,
        transaction_csv: Increase::Export::TransactionCsv | nil,
        type: Increase::Export::Type,
        vendor_csv: Increase::Export::VendorCsv | nil
      }
    end
  end
end
