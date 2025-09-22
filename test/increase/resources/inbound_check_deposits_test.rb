# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::InboundCheckDepositsTest < Increase::Test::ResourceTest
  def test_retrieve
    response = @increase.inbound_check_deposits.retrieve("inbound_check_deposit_zoshvqybq0cjjm31mra")

    assert_pattern do
      response => Increase::InboundCheckDeposit
    end

    assert_pattern do
      response => {
        id: String,
        accepted_at: Time | nil,
        account_id: String,
        account_number_id: String | nil,
        adjustments: ^(Increase::Internal::Type::ArrayOf[Increase::InboundCheckDeposit::Adjustment]),
        amount: Integer,
        back_image_file_id: String | nil,
        bank_of_first_deposit_routing_number: String | nil,
        check_number: String | nil,
        check_transfer_id: String | nil,
        created_at: Time,
        currency: Increase::InboundCheckDeposit::Currency,
        declined_at: Time | nil,
        declined_transaction_id: String | nil,
        deposit_return: Increase::InboundCheckDeposit::DepositReturn | nil,
        front_image_file_id: String | nil,
        payee_name_analysis: Increase::InboundCheckDeposit::PayeeNameAnalysis,
        status: Increase::InboundCheckDeposit::Status,
        transaction_id: String | nil,
        type: Increase::InboundCheckDeposit::Type
      }
    end
  end

  def test_list
    response = @increase.inbound_check_deposits.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::InboundCheckDeposit
    end

    assert_pattern do
      row => {
        id: String,
        accepted_at: Time | nil,
        account_id: String,
        account_number_id: String | nil,
        adjustments: ^(Increase::Internal::Type::ArrayOf[Increase::InboundCheckDeposit::Adjustment]),
        amount: Integer,
        back_image_file_id: String | nil,
        bank_of_first_deposit_routing_number: String | nil,
        check_number: String | nil,
        check_transfer_id: String | nil,
        created_at: Time,
        currency: Increase::InboundCheckDeposit::Currency,
        declined_at: Time | nil,
        declined_transaction_id: String | nil,
        deposit_return: Increase::InboundCheckDeposit::DepositReturn | nil,
        front_image_file_id: String | nil,
        payee_name_analysis: Increase::InboundCheckDeposit::PayeeNameAnalysis,
        status: Increase::InboundCheckDeposit::Status,
        transaction_id: String | nil,
        type: Increase::InboundCheckDeposit::Type
      }
    end
  end

  def test_decline
    response = @increase.inbound_check_deposits.decline("inbound_check_deposit_zoshvqybq0cjjm31mra")

    assert_pattern do
      response => Increase::InboundCheckDeposit
    end

    assert_pattern do
      response => {
        id: String,
        accepted_at: Time | nil,
        account_id: String,
        account_number_id: String | nil,
        adjustments: ^(Increase::Internal::Type::ArrayOf[Increase::InboundCheckDeposit::Adjustment]),
        amount: Integer,
        back_image_file_id: String | nil,
        bank_of_first_deposit_routing_number: String | nil,
        check_number: String | nil,
        check_transfer_id: String | nil,
        created_at: Time,
        currency: Increase::InboundCheckDeposit::Currency,
        declined_at: Time | nil,
        declined_transaction_id: String | nil,
        deposit_return: Increase::InboundCheckDeposit::DepositReturn | nil,
        front_image_file_id: String | nil,
        payee_name_analysis: Increase::InboundCheckDeposit::PayeeNameAnalysis,
        status: Increase::InboundCheckDeposit::Status,
        transaction_id: String | nil,
        type: Increase::InboundCheckDeposit::Type
      }
    end
  end

  def test_return__required_params
    response =
      @increase.inbound_check_deposits.return_(
        "inbound_check_deposit_zoshvqybq0cjjm31mra",
        reason: :altered_or_fictitious
      )

    assert_pattern do
      response => Increase::InboundCheckDeposit
    end

    assert_pattern do
      response => {
        id: String,
        accepted_at: Time | nil,
        account_id: String,
        account_number_id: String | nil,
        adjustments: ^(Increase::Internal::Type::ArrayOf[Increase::InboundCheckDeposit::Adjustment]),
        amount: Integer,
        back_image_file_id: String | nil,
        bank_of_first_deposit_routing_number: String | nil,
        check_number: String | nil,
        check_transfer_id: String | nil,
        created_at: Time,
        currency: Increase::InboundCheckDeposit::Currency,
        declined_at: Time | nil,
        declined_transaction_id: String | nil,
        deposit_return: Increase::InboundCheckDeposit::DepositReturn | nil,
        front_image_file_id: String | nil,
        payee_name_analysis: Increase::InboundCheckDeposit::PayeeNameAnalysis,
        status: Increase::InboundCheckDeposit::Status,
        transaction_id: String | nil,
        type: Increase::InboundCheckDeposit::Type
      }
    end
  end
end
