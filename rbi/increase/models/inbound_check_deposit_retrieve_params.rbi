# typed: strong

module Increase
  module Models
    class InboundCheckDepositRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::InboundCheckDepositRetrieveParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Inbound Check Deposit to get details for.
      sig { returns(String) }
      attr_accessor :inbound_check_deposit_id

      sig do
        params(
          inbound_check_deposit_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Inbound Check Deposit to get details for.
        inbound_check_deposit_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            inbound_check_deposit_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
