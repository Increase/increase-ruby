# frozen_string_literal: true

require_relative "../test_helper"

class Increase::Test::Resources::RealTimePaymentsRequestsForPaymentTest < Increase::Test::ResourceTest
  def test_create_required_params
    response =
      @increase.real_time_payments_requests_for_payment.create(
        account_number_id: "account_number_v18nkfqm6afpsrvy82b2",
        amount: 100,
        debtor: {address: {country: "US"}, name: "Ian Crease"},
        debtor_account_number: "987654321",
        debtor_routing_number: "101050001",
        expires_at: "2020-02-14T23:59:59Z",
        requested_execution_at: "2020-02-07T23:59:59Z",
        unstructured_remittance_information: "Invoice 29582"
      )

    assert_pattern do
      response => Increase::RealTimePaymentsRequestForPayment
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        account_number_id: String,
        amount: Integer,
        cancellation: Increase::RealTimePaymentsRequestForPayment::Cancellation | nil,
        created_at: Time,
        creditor_name: String,
        currency: Increase::RealTimePaymentsRequestForPayment::Currency,
        debtor: Increase::RealTimePaymentsRequestForPayment::Debtor,
        debtor_account_number: String,
        debtor_routing_number: String,
        expires_at: Time,
        fulfillment_inbound_real_time_payments_transfer_id: String | nil,
        idempotency_key: String | nil,
        refusal: Increase::RealTimePaymentsRequestForPayment::Refusal | nil,
        rejection: Increase::RealTimePaymentsRequestForPayment::Rejection | nil,
        requested_execution_at: Time | nil,
        status: Increase::RealTimePaymentsRequestForPayment::Status,
        submission: Increase::RealTimePaymentsRequestForPayment::Submission | nil,
        type: Increase::RealTimePaymentsRequestForPayment::Type,
        unstructured_remittance_information: String
      }
    end
  end

  def test_retrieve
    response =
      @increase.real_time_payments_requests_for_payment.retrieve(
        "real_time_payments_request_for_payment_28kcliz1oevcnqyn9qp7"
      )

    assert_pattern do
      response => Increase::RealTimePaymentsRequestForPayment
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        account_number_id: String,
        amount: Integer,
        cancellation: Increase::RealTimePaymentsRequestForPayment::Cancellation | nil,
        created_at: Time,
        creditor_name: String,
        currency: Increase::RealTimePaymentsRequestForPayment::Currency,
        debtor: Increase::RealTimePaymentsRequestForPayment::Debtor,
        debtor_account_number: String,
        debtor_routing_number: String,
        expires_at: Time,
        fulfillment_inbound_real_time_payments_transfer_id: String | nil,
        idempotency_key: String | nil,
        refusal: Increase::RealTimePaymentsRequestForPayment::Refusal | nil,
        rejection: Increase::RealTimePaymentsRequestForPayment::Rejection | nil,
        requested_execution_at: Time | nil,
        status: Increase::RealTimePaymentsRequestForPayment::Status,
        submission: Increase::RealTimePaymentsRequestForPayment::Submission | nil,
        type: Increase::RealTimePaymentsRequestForPayment::Type,
        unstructured_remittance_information: String
      }
    end
  end

  def test_list
    response = @increase.real_time_payments_requests_for_payment.list

    assert_pattern do
      response => Increase::Internal::Page
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Increase::RealTimePaymentsRequestForPayment
    end

    assert_pattern do
      row => {
        id: String,
        account_id: String,
        account_number_id: String,
        amount: Integer,
        cancellation: Increase::RealTimePaymentsRequestForPayment::Cancellation | nil,
        created_at: Time,
        creditor_name: String,
        currency: Increase::RealTimePaymentsRequestForPayment::Currency,
        debtor: Increase::RealTimePaymentsRequestForPayment::Debtor,
        debtor_account_number: String,
        debtor_routing_number: String,
        expires_at: Time,
        fulfillment_inbound_real_time_payments_transfer_id: String | nil,
        idempotency_key: String | nil,
        refusal: Increase::RealTimePaymentsRequestForPayment::Refusal | nil,
        rejection: Increase::RealTimePaymentsRequestForPayment::Rejection | nil,
        requested_execution_at: Time | nil,
        status: Increase::RealTimePaymentsRequestForPayment::Status,
        submission: Increase::RealTimePaymentsRequestForPayment::Submission | nil,
        type: Increase::RealTimePaymentsRequestForPayment::Type,
        unstructured_remittance_information: String
      }
    end
  end

  def test_cancel
    response =
      @increase.real_time_payments_requests_for_payment.cancel(
        "real_time_payments_request_for_payment_28kcliz1oevcnqyn9qp7"
      )

    assert_pattern do
      response => Increase::RealTimePaymentsRequestForPayment
    end

    assert_pattern do
      response => {
        id: String,
        account_id: String,
        account_number_id: String,
        amount: Integer,
        cancellation: Increase::RealTimePaymentsRequestForPayment::Cancellation | nil,
        created_at: Time,
        creditor_name: String,
        currency: Increase::RealTimePaymentsRequestForPayment::Currency,
        debtor: Increase::RealTimePaymentsRequestForPayment::Debtor,
        debtor_account_number: String,
        debtor_routing_number: String,
        expires_at: Time,
        fulfillment_inbound_real_time_payments_transfer_id: String | nil,
        idempotency_key: String | nil,
        refusal: Increase::RealTimePaymentsRequestForPayment::Refusal | nil,
        rejection: Increase::RealTimePaymentsRequestForPayment::Rejection | nil,
        requested_execution_at: Time | nil,
        status: Increase::RealTimePaymentsRequestForPayment::Status,
        submission: Increase::RealTimePaymentsRequestForPayment::Submission | nil,
        type: Increase::RealTimePaymentsRequestForPayment::Type,
        unstructured_remittance_information: String
      }
    end
  end
end
