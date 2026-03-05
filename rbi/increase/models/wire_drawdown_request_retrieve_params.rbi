# typed: strong

module Increase
  module Models
    class WireDrawdownRequestRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::WireDrawdownRequestRetrieveParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Wire Drawdown Request to retrieve.
      sig { returns(String) }
      attr_accessor :wire_drawdown_request_id

      sig do
        params(
          wire_drawdown_request_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Wire Drawdown Request to retrieve.
        wire_drawdown_request_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            wire_drawdown_request_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
