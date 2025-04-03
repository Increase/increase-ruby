# typed: strong

module Increase
  module Resources
    class WireDrawdownRequests
      # Create a Wire Drawdown Request
      sig do
        params(
          account_number_id: String,
          amount: Integer,
          message_to_recipient: String,
          recipient_account_number: String,
          recipient_name: String,
          recipient_routing_number: String,
          originator_address_line1: String,
          originator_address_line2: String,
          originator_address_line3: String,
          originator_name: String,
          recipient_address_line1: String,
          recipient_address_line2: String,
          recipient_address_line3: String,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Models::WireDrawdownRequest)
      end
      def create(
        # The Account Number to which the recipient should send funds.
        account_number_id:,
        # The amount requested from the recipient, in USD cents.
        amount:,
        # A message the recipient will see as part of the request.
        message_to_recipient:,
        # The drawdown request's recipient's account number.
        recipient_account_number:,
        # The drawdown request's recipient's name.
        recipient_name:,
        # The drawdown request's recipient's routing number.
        recipient_routing_number:,
        # The drawdown request originator's address line 1. This is only necessary if
        #   you're requesting a payment to a commingled account. Otherwise, we'll use the
        #   associated entity's details.
        originator_address_line1: nil,
        # The drawdown request originator's address line 2. This is only necessary if
        #   you're requesting a payment to a commingled account. Otherwise, we'll use the
        #   associated entity's details.
        originator_address_line2: nil,
        # The drawdown request originator's address line 3. This is only necessary if
        #   you're requesting a payment to a commingled account. Otherwise, we'll use the
        #   associated entity's details.
        originator_address_line3: nil,
        # The drawdown request originator's name. This is only necessary if you're
        #   requesting a payment to a commingled account. Otherwise, we'll use the
        #   associated entity's details.
        originator_name: nil,
        # Line 1 of the drawdown request's recipient's address.
        recipient_address_line1: nil,
        # Line 2 of the drawdown request's recipient's address.
        recipient_address_line2: nil,
        # Line 3 of the drawdown request's recipient's address.
        recipient_address_line3: nil,
        request_options: {}
      )
      end

      # Retrieve a Wire Drawdown Request
      sig do
        params(
          wire_drawdown_request_id: String,
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Models::WireDrawdownRequest)
      end
      def retrieve(
        # The identifier of the Wire Drawdown Request to retrieve.
        wire_drawdown_request_id,
        request_options: {}
      )
      end

      # List Wire Drawdown Requests
      sig do
        params(
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          status: T.any(Increase::Models::WireDrawdownRequestListParams::Status, Increase::Internal::AnyHash),
          request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
        )
          .returns(Increase::Internal::Page[Increase::Models::WireDrawdownRequest])
      end
      def list(
        # Return the page of entries after this one.
        cursor: nil,
        # Filter records to the one with the specified `idempotency_key` you chose for
        #   that object. This value is unique across Increase and is used to ensure that a
        #   request is only processed once. Learn more about
        #   [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        #   objects.
        limit: nil,
        status: nil,
        request_options: {}
      )
      end

      # @api private
      sig { params(client: Increase::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
