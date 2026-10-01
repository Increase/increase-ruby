# typed: strong

module Increase
  module Models
    class CardCreateDetailsTokenParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::CardCreateDetailsTokenParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Card to mint a details token for.
      sig { returns(String) }
      attr_accessor :card_id

      sig do
        params(
          card_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Card to mint a details token for.
        card_id:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          { card_id: String, request_options: Increase::RequestOptions }
        )
      end
      def to_hash
      end
    end
  end
end
