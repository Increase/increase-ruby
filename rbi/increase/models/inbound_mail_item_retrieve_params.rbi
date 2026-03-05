# typed: strong

module Increase
  module Models
    class InboundMailItemRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::InboundMailItemRetrieveParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Inbound Mail Item to retrieve.
      sig { returns(String) }
      attr_accessor :inbound_mail_item_id

      sig do
        params(
          inbound_mail_item_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Inbound Mail Item to retrieve.
        inbound_mail_item_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            inbound_mail_item_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
