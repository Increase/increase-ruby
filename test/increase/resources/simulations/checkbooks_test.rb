# frozen_string_literal: true

require_relative "../../test_helper"

class Increase::Test::Resources::Simulations::CheckbooksTest < Increase::Test::ResourceTest
  def test_mail
    response = @increase.simulations.checkbooks.mail("checkbook_7iudxhxum6vlkcjxmi8y")

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
