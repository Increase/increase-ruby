# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::PhysicalCheckBatchesTest < Increase::Test::ResourceTest
  def test_create_required_params
    response =
      @increase.physical_check_batches.create(
        mailing_address: {
          city: "New York",
          line1: "33 Liberty Street",
          name: "Ian Crease",
          postal_code: "10045",
          state: "NY"
        },
        return_address: {
          city: "New York",
          line1: "33 Liberty Street",
          name: "National Phonograph Company",
          postal_code: "10045",
          state: "NY"
        }
      )

    assert_pattern do
      response => Increase::PhysicalCheckBatch
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        idempotency_key: String | nil,
        mailing_address: Increase::PhysicalCheckBatch::MailingAddress,
        return_address: Increase::PhysicalCheckBatch::ReturnAddress,
        shipping_method: Increase::PhysicalCheckBatch::ShippingMethod,
        status: Increase::PhysicalCheckBatch::Status,
        type: Increase::PhysicalCheckBatch::Type
      }
    end
  end

  def test_cancel
    response = @increase.physical_check_batches.cancel("physical_check_batch_yzdwjhdbw0in6191whce")

    assert_pattern do
      response => Increase::PhysicalCheckBatch
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        idempotency_key: String | nil,
        mailing_address: Increase::PhysicalCheckBatch::MailingAddress,
        return_address: Increase::PhysicalCheckBatch::ReturnAddress,
        shipping_method: Increase::PhysicalCheckBatch::ShippingMethod,
        status: Increase::PhysicalCheckBatch::Status,
        type: Increase::PhysicalCheckBatch::Type
      }
    end
  end

  def test_complete
    response = @increase.physical_check_batches.complete("physical_check_batch_yzdwjhdbw0in6191whce")

    assert_pattern do
      response => Increase::PhysicalCheckBatch
    end

    assert_pattern do
      response => {
        id: String,
        created_at: Time,
        idempotency_key: String | nil,
        mailing_address: Increase::PhysicalCheckBatch::MailingAddress,
        return_address: Increase::PhysicalCheckBatch::ReturnAddress,
        shipping_method: Increase::PhysicalCheckBatch::ShippingMethod,
        status: Increase::PhysicalCheckBatch::Status,
        type: Increase::PhysicalCheckBatch::Type
      }
    end
  end
end
