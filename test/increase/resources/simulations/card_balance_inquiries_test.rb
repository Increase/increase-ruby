# frozen_string_literal: true

require_relative "../../test_helper"

class Increase::Test::Resources::Simulations::CardBalanceInquiriesTest < Increase::Test::ResourceTest
  def test_create
    response = @increase.simulations.card_balance_inquiries.create

    assert_pattern do
      response => Increase::CardPayment
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        card_id: String,
        created_at: Time,
        digital_wallet_token_id: String | nil,
        elements: ^(Increase::Internal::Type::ArrayOf[Increase::CardPayment::Element]),
        physical_card_id: String | nil,
        state: Increase::CardPayment::State,
        type: Increase::CardPayment::Type
      }
    end
  end
end
