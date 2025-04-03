# typed: strong

module Increase
  module Models
    class CardPurchaseSupplementListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # Filter Card Purchase Supplements to ones belonging to the specified Card
      #   Payment.
      sig { returns(T.nilable(String)) }
      attr_reader :card_payment_id

      sig { params(card_payment_id: String).void }
      attr_writer :card_payment_id

      sig { returns(T.nilable(Increase::Models::CardPurchaseSupplementListParams::CreatedAt)) }
      attr_reader :created_at

      sig do
        params(
          created_at: T.any(Increase::Models::CardPurchaseSupplementListParams::CreatedAt, Increase::Internal::AnyHash)
        )
          .void
      end
      attr_writer :created_at

      # Return the page of entries after this one.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Limit the size of the list that is returned. The default (and maximum) is 100
      #   objects.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      sig do
        params(
          card_payment_id: String,
          created_at: T.any(Increase::Models::CardPurchaseSupplementListParams::CreatedAt, Increase::Internal::AnyHash),
          cursor: String,
          limit: Integer,
          request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(card_payment_id: nil, created_at: nil, cursor: nil, limit: nil, request_options: {})
      end

      sig do
        override
          .returns(
            {
              card_payment_id: String,
              created_at: Increase::Models::CardPurchaseSupplementListParams::CreatedAt,
              cursor: String,
              limit: Integer,
              request_options: Increase::RequestOptions
            }
          )
      end
      def to_hash
      end

      class CreatedAt < Increase::Internal::Type::BaseModel
        # Return results after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
        #   timestamp.
        sig { returns(T.nilable(Time)) }
        attr_reader :after

        sig { params(after: Time).void }
        attr_writer :after

        # Return results before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
        #   timestamp.
        sig { returns(T.nilable(Time)) }
        attr_reader :before

        sig { params(before: Time).void }
        attr_writer :before

        # Return results on or after this
        #   [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
        sig { returns(T.nilable(Time)) }
        attr_reader :on_or_after

        sig { params(on_or_after: Time).void }
        attr_writer :on_or_after

        # Return results on or before this
        #   [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
        sig { returns(T.nilable(Time)) }
        attr_reader :on_or_before

        sig { params(on_or_before: Time).void }
        attr_writer :on_or_before

        sig do
          params(after: Time, before: Time, on_or_after: Time, on_or_before: Time).returns(T.attached_class)
        end
        def self.new(after: nil, before: nil, on_or_after: nil, on_or_before: nil)
        end

        sig { override.returns({after: Time, before: Time, on_or_after: Time, on_or_before: Time}) }
        def to_hash
        end
      end
    end
  end
end
