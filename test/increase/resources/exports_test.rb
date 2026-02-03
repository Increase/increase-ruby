# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::ExportsTest < Increase::Test::ResourceTest
  def test_create_required_params
    response = @increase.exports.create(category: :transaction_csv)

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
        file_download_url: String | nil,
        file_id: String | nil,
        form_1099_int: Increase::Export::Form1099Int | nil,
        form_1099_misc: Increase::Export::Form1099Misc | nil,
        funding_instructions: Increase::Export::FundingInstructions | nil,
        idempotency_key: String | nil,
        status: Increase::Export::Status,
        transaction_csv: Increase::Export::TransactionCsv | nil,
        type: Increase::Export::Type,
        vendor_csv: Increase::Export::VendorCsv | nil
      }
    end
  end

  def test_retrieve
    response = @increase.exports.retrieve("export_8s4m48qz3bclzje0zwh9")

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
        file_download_url: String | nil,
        file_id: String | nil,
        form_1099_int: Increase::Export::Form1099Int | nil,
        form_1099_misc: Increase::Export::Form1099Misc | nil,
        funding_instructions: Increase::Export::FundingInstructions | nil,
        idempotency_key: String | nil,
        status: Increase::Export::Status,
        transaction_csv: Increase::Export::TransactionCsv | nil,
        type: Increase::Export::Type,
        vendor_csv: Increase::Export::VendorCsv | nil
      }
    end
  end

  def test_list
    response = @increase.exports.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::Export
    end

    assert_pattern do
      row => {
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
        file_download_url: String | nil,
        file_id: String | nil,
        form_1099_int: Increase::Export::Form1099Int | nil,
        form_1099_misc: Increase::Export::Form1099Misc | nil,
        funding_instructions: Increase::Export::FundingInstructions | nil,
        idempotency_key: String | nil,
        status: Increase::Export::Status,
        transaction_csv: Increase::Export::TransactionCsv | nil,
        type: Increase::Export::Type,
        vendor_csv: Increase::Export::VendorCsv | nil
      }
    end
  end
end
