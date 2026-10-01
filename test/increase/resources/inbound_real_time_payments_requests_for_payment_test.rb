# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::InboundRealTimePaymentsRequestsForPaymentTest < Increase::Test::ResourceTest
  def test_retrieve
    response =
      @increase.inbound_real_time_payments_requests_for_payment.retrieve(
        "inbound_real_time_payments_request_for_payment_j9c5rm4hr6qf34en8tky"
      )

    assert_pattern do
      response => Increase::InboundRealTimePaymentsRequestForPayment
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        account_number_id: String,
        amount: Integer,
        created_at: Time,
        creditor: Increase::InboundRealTimePaymentsRequestForPayment::Creditor,
        creditor_account_number: String,
        creditor_routing_number: String,
        currency: Increase::InboundRealTimePaymentsRequestForPayment::Currency,
        debtor_name: String,
        end_to_end_identification: String,
        expires_at: Time,
        fulfillment_real_time_payments_transfer_id: String | nil,
        invoicer_identification: String | nil,
        payment_information_identification: String,
        requested_execution_at: Time | nil,
        type: Increase::InboundRealTimePaymentsRequestForPayment::Type,
        unstructured_remittance_information: String | nil
      }
    end
  end

  def test_list
    response = @increase.inbound_real_time_payments_requests_for_payment.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::InboundRealTimePaymentsRequestForPayment
    end

    assert_pattern do
      row => {
        id: String,
        account_id: String,
        account_number_id: String,
        amount: Integer,
        created_at: Time,
        creditor: Increase::InboundRealTimePaymentsRequestForPayment::Creditor,
        creditor_account_number: String,
        creditor_routing_number: String,
        currency: Increase::InboundRealTimePaymentsRequestForPayment::Currency,
        debtor_name: String,
        end_to_end_identification: String,
        expires_at: Time,
        fulfillment_real_time_payments_transfer_id: String | nil,
        invoicer_identification: String | nil,
        payment_information_identification: String,
        requested_execution_at: Time | nil,
        type: Increase::InboundRealTimePaymentsRequestForPayment::Type,
        unstructured_remittance_information: String | nil
      }
    end
  end
end
