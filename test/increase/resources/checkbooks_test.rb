# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::CheckbooksTest < Increase::Test::ResourceTest
  def test_create_required_params
    response =
      @increase.checkbooks.create(
        account_number_id: "account_number_v18nkfqm6afpsrvy82b2",
        mailing_address: {
          city: "New York",
          line1: "33 Liberty Street",
          name: "Ian Crease",
          postal_code: "10045",
          state: "NY"
        },
        payer: [
          {contents: "National Phonograph Company"},
          {contents: "33 Liberty Street"},
          {contents: "New York, NY 10045"}
        ]
      )

    assert_pattern do
      response => Increase::Checkbook
    end

    assert_pattern do
      response => {
        id: String,
        account_number_id: String,
        created_at: Time,
        idempotency_key: String | nil,
        mailing_address: Increase::Checkbook::MailingAddress,
        payer: ^(Increase::Internal::Type::ArrayOf[Increase::Checkbook::Payer]),
        return_address: Increase::Checkbook::ReturnAddress,
        status: Increase::Checkbook::Status,
        style: Increase::Checkbook::Style,
        tracking_updates: ^(Increase::Internal::Type::ArrayOf[Increase::Checkbook::TrackingUpdate]),
        type: Increase::Checkbook::Type
      }
    end
  end

  def test_retrieve
    response = @increase.checkbooks.retrieve("checkbook_7iudxhxum6vlkcjxmi8y")

    assert_pattern do
      response => Increase::Checkbook
    end

    assert_pattern do
      response => {
        id: String,
        account_number_id: String,
        created_at: Time,
        idempotency_key: String | nil,
        mailing_address: Increase::Checkbook::MailingAddress,
        payer: ^(Increase::Internal::Type::ArrayOf[Increase::Checkbook::Payer]),
        return_address: Increase::Checkbook::ReturnAddress,
        status: Increase::Checkbook::Status,
        style: Increase::Checkbook::Style,
        tracking_updates: ^(Increase::Internal::Type::ArrayOf[Increase::Checkbook::TrackingUpdate]),
        type: Increase::Checkbook::Type
      }
    end
  end

  def test_list
    response = @increase.checkbooks.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::Checkbook
    end

    assert_pattern do
      row => {
        id: String,
        account_number_id: String,
        created_at: Time,
        idempotency_key: String | nil,
        mailing_address: Increase::Checkbook::MailingAddress,
        payer: ^(Increase::Internal::Type::ArrayOf[Increase::Checkbook::Payer]),
        return_address: Increase::Checkbook::ReturnAddress,
        status: Increase::Checkbook::Status,
        style: Increase::Checkbook::Style,
        tracking_updates: ^(Increase::Internal::Type::ArrayOf[Increase::Checkbook::TrackingUpdate]),
        type: Increase::Checkbook::Type
      }
    end
  end

  def test_stop
    response = @increase.checkbooks.stop("checkbook_7iudxhxum6vlkcjxmi8y")

    assert_pattern do
      response => Increase::Checkbook
    end

    assert_pattern do
      response => {
        id: String,
        account_number_id: String,
        created_at: Time,
        idempotency_key: String | nil,
        mailing_address: Increase::Checkbook::MailingAddress,
        payer: ^(Increase::Internal::Type::ArrayOf[Increase::Checkbook::Payer]),
        return_address: Increase::Checkbook::ReturnAddress,
        status: Increase::Checkbook::Status,
        style: Increase::Checkbook::Style,
        tracking_updates: ^(Increase::Internal::Type::ArrayOf[Increase::Checkbook::TrackingUpdate]),
        type: Increase::Checkbook::Type
      }
    end
  end
end
