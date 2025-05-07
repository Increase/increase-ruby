# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::CardPaymentsTest < Increase::Test::ResourceTest
  def test_retrieve
    response = @increase.card_payments.retrieve("card_payment_id")

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

  def test_list
    response = @increase.card_payments.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::CardPayment
    end

    assert_pattern do
      row => {
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
