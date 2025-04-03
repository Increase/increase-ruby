# typed: strong

module Increase
  module Resources
    class Simulations
      class InboundWireTransfers
        # Simulates an [Inbound Wire Transfer](#inbound-wire-transfers) to your account.
        sig do
          params(
            account_number_id: String,
            amount: Integer,
            beneficiary_address_line1: String,
            beneficiary_address_line2: String,
            beneficiary_address_line3: String,
            beneficiary_name: String,
            beneficiary_reference: String,
            originator_address_line1: String,
            originator_address_line2: String,
            originator_address_line3: String,
            originator_name: String,
            originator_routing_number: String,
            originator_to_beneficiary_information_line1: String,
            originator_to_beneficiary_information_line2: String,
            originator_to_beneficiary_information_line3: String,
            originator_to_beneficiary_information_line4: String,
            sender_reference: String,
            request_options: T.nilable(T.any(Increase::RequestOptions, Increase::Internal::AnyHash))
          )
            .returns(Increase::Models::InboundWireTransfer)
        end
        def create(
          # The identifier of the Account Number the inbound Wire Transfer is for.
          account_number_id:,
          # The transfer amount in cents. Must be positive.
          amount:,
          # The sending bank will set beneficiary_address_line1 in production. You can
          #   simulate any value here.
          beneficiary_address_line1: nil,
          # The sending bank will set beneficiary_address_line2 in production. You can
          #   simulate any value here.
          beneficiary_address_line2: nil,
          # The sending bank will set beneficiary_address_line3 in production. You can
          #   simulate any value here.
          beneficiary_address_line3: nil,
          # The sending bank will set beneficiary_name in production. You can simulate any
          #   value here.
          beneficiary_name: nil,
          # The sending bank will set beneficiary_reference in production. You can simulate
          #   any value here.
          beneficiary_reference: nil,
          # The sending bank will set originator_address_line1 in production. You can
          #   simulate any value here.
          originator_address_line1: nil,
          # The sending bank will set originator_address_line2 in production. You can
          #   simulate any value here.
          originator_address_line2: nil,
          # The sending bank will set originator_address_line3 in production. You can
          #   simulate any value here.
          originator_address_line3: nil,
          # The sending bank will set originator_name in production. You can simulate any
          #   value here.
          originator_name: nil,
          # The sending bank will set originator_routing_number in production. You can
          #   simulate any value here.
          originator_routing_number: nil,
          # The sending bank will set originator_to_beneficiary_information_line1 in
          #   production. You can simulate any value here.
          originator_to_beneficiary_information_line1: nil,
          # The sending bank will set originator_to_beneficiary_information_line2 in
          #   production. You can simulate any value here.
          originator_to_beneficiary_information_line2: nil,
          # The sending bank will set originator_to_beneficiary_information_line3 in
          #   production. You can simulate any value here.
          originator_to_beneficiary_information_line3: nil,
          # The sending bank will set originator_to_beneficiary_information_line4 in
          #   production. You can simulate any value here.
          originator_to_beneficiary_information_line4: nil,
          # The sending bank will set sender_reference in production. You can simulate any
          #   value here.
          sender_reference: nil,
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
