# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::CardValidationsTest < Increase::Test::ResourceTest
  def test_create_required_params
    response =
      @increase.card_validations.create(
        account_id: "account_in71c4amph0vgo2qllky",
        card_token_id: "outbound_card_token_zlt0ml6youq3q7vcdlg0",
        merchant_category_code: "1234",
        merchant_city_name: "New York",
        merchant_name: "Acme Corp",
        merchant_postal_code: "10045",
        merchant_state: "NY"
      )

    assert_pattern do
      response => Increase::CardValidation
    end

    assert_pattern do
      response => {
        id: String,
        acceptance: Increase::CardValidation::Acceptance | nil,
        account_id: String,
        card_token_id: String,
        cardholder_first_name: String | nil,
        cardholder_last_name: String | nil,
        cardholder_middle_name: String | nil,
        cardholder_postal_code: String | nil,
        cardholder_street_address: String | nil,
        created_at: Time,
        created_by: Increase::CardValidation::CreatedBy | nil,
        decline: Increase::CardValidation::Decline | nil,
        idempotency_key: String | nil,
        merchant_category_code: String,
        merchant_city_name: String,
        merchant_name: String,
        merchant_postal_code: String,
        merchant_state: String,
        status: Increase::CardValidation::Status,
        submission: Increase::CardValidation::Submission | nil,
        type: Increase::CardValidation::Type
      }
    end
  end

  def test_retrieve
    response = @increase.card_validations.retrieve("outbound_card_validation_qqlzagpc6v1x2gcdhe24")

    assert_pattern do
      response => Increase::CardValidation
    end

    assert_pattern do
      response => {
        id: String,
        acceptance: Increase::CardValidation::Acceptance | nil,
        account_id: String,
        card_token_id: String,
        cardholder_first_name: String | nil,
        cardholder_last_name: String | nil,
        cardholder_middle_name: String | nil,
        cardholder_postal_code: String | nil,
        cardholder_street_address: String | nil,
        created_at: Time,
        created_by: Increase::CardValidation::CreatedBy | nil,
        decline: Increase::CardValidation::Decline | nil,
        idempotency_key: String | nil,
        merchant_category_code: String,
        merchant_city_name: String,
        merchant_name: String,
        merchant_postal_code: String,
        merchant_state: String,
        status: Increase::CardValidation::Status,
        submission: Increase::CardValidation::Submission | nil,
        type: Increase::CardValidation::Type
      }
    end
  end

  def test_list
    response = @increase.card_validations.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::CardValidation
    end

    assert_pattern do
      row => {
        id: String,
        acceptance: Increase::CardValidation::Acceptance | nil,
        account_id: String,
        card_token_id: String,
        cardholder_first_name: String | nil,
        cardholder_last_name: String | nil,
        cardholder_middle_name: String | nil,
        cardholder_postal_code: String | nil,
        cardholder_street_address: String | nil,
        created_at: Time,
        created_by: Increase::CardValidation::CreatedBy | nil,
        decline: Increase::CardValidation::Decline | nil,
        idempotency_key: String | nil,
        merchant_category_code: String,
        merchant_city_name: String,
        merchant_name: String,
        merchant_postal_code: String,
        merchant_state: String,
        status: Increase::CardValidation::Status,
        submission: Increase::CardValidation::Submission | nil,
        type: Increase::CardValidation::Type
      }
    end
  end
end
