# typed: strong

module Increase
  module Resources
    class Simulations
      class InboundWireDrawdownRequests
        # Simulates receiving an
        # [Inbound Wire Drawdown Request](#inbound-wire-drawdown-requests).
        sig do
          params(
            amount: Integer,
            beneficiary_account_number: String,
            beneficiary_routing_number: String,
            currency: String,
            message_to_recipient: String,
            originator_account_number: String,
            originator_routing_number: String,
            recipient_account_number_id: String,
            beneficiary_address_line1: String,
            beneficiary_address_line2: String,
            beneficiary_address_line3: String,
            beneficiary_name: String,
            originator_address_line1: String,
            originator_address_line2: String,
            originator_address_line3: String,
            originator_name: String,
            originator_to_beneficiary_information_line1: String,
            originator_to_beneficiary_information_line2: String,
            originator_to_beneficiary_information_line3: String,
            originator_to_beneficiary_information_line4: String,
            request_options: Increase::RequestOptions::OrHash
          ).returns(Increase::InboundWireDrawdownRequest)
        end
        def create(
          # The amount being requested in cents.
          amount:,
          # The drawdown request's beneficiary's account number.
          beneficiary_account_number:,
          # The drawdown request's beneficiary's routing number.
          beneficiary_routing_number:,
          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the amount being
          # requested. Will always be "USD".
          currency:,
          # A message from the drawdown request's originator.
          message_to_recipient:,
          # The drawdown request's originator's account number.
          originator_account_number:,
          # The drawdown request's originator's routing number.
          originator_routing_number:,
          # The Account Number to which the recipient of this request is being requested to
          # send funds from.
          recipient_account_number_id:,
          # Line 1 of the drawdown request's beneficiary's address.
          beneficiary_address_line1: nil,
          # Line 2 of the drawdown request's beneficiary's address.
          beneficiary_address_line2: nil,
          # Line 3 of the drawdown request's beneficiary's address.
          beneficiary_address_line3: nil,
          # The drawdown request's beneficiary's name.
          beneficiary_name: nil,
          # Line 1 of the drawdown request's originator's address.
          originator_address_line1: nil,
          # Line 2 of the drawdown request's originator's address.
          originator_address_line2: nil,
          # Line 3 of the drawdown request's originator's address.
          originator_address_line3: nil,
          # The drawdown request's originator's name.
          originator_name: nil,
          # Line 1 of the information conveyed from the originator of the message to the
          # beneficiary.
          originator_to_beneficiary_information_line1: nil,
          # Line 2 of the information conveyed from the originator of the message to the
          # beneficiary.
          originator_to_beneficiary_information_line2: nil,
          # Line 3 of the information conveyed from the originator of the message to the
          # beneficiary.
          originator_to_beneficiary_information_line3: nil,
          # Line 4 of the information conveyed from the originator of the message to the
          # beneficiary.
          originator_to_beneficiary_information_line4: nil,
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
end
