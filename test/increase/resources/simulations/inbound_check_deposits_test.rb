# frozen_string_literal: true

require_relative "../../test_helper"

class Increase::Test::Resources::Simulations::InboundCheckDepositsTest < Increase::Test::ResourceTest
  def test_create_required_params
    response =
      @increase.simulations.inbound_check_deposits.create(
        account_number_id: "account_number_v18nkfqm6afpsrvy82b2",
        amount: 1000,
        check_number: "1234567890"
      )

    assert_pattern do
      response => Increase::Models::InboundCheckDeposit
    end

    assert_pattern do
      response => {
        id: String,
        accepted_at: Time | nil,
        account_id: String,
        account_number_id: String | nil,
        adjustments: ^(Increase::Internal::Type::ArrayOf[Increase::Models::InboundCheckDeposit::Adjustment]),
        amount: Integer,
        back_image_file_id: String | nil,
        bank_of_first_deposit_routing_number: String | nil,
        check_number: String | nil,
        check_transfer_id: String | nil,
        created_at: Time,
        currency: Increase::Models::InboundCheckDeposit::Currency,
        declined_at: Time | nil,
        declined_transaction_id: String | nil,
        deposit_return: Increase::Models::InboundCheckDeposit::DepositReturn | nil,
        front_image_file_id: String | nil,
        payee_name_analysis: Increase::Models::InboundCheckDeposit::PayeeNameAnalysis,
        status: Increase::Models::InboundCheckDeposit::Status,
        transaction_id: String | nil,
        type: Increase::Models::InboundCheckDeposit::Type
      }
    end
  end
end
