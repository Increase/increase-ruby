# typed: strong

module Increase
  module Models
    class DeclinedTransactionListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # Filter Declined Transactions to ones belonging to the specified Account.
      sig { returns(T.nilable(String)) }
      attr_reader :account_id

      sig { params(account_id: String).void }
      attr_writer :account_id

      sig { returns(T.nilable(Increase::Models::DeclinedTransactionListParams::Category)) }
      attr_reader :category

      sig do
        params(
          category: T.any(Increase::Models::DeclinedTransactionListParams::Category, Increase::Internal::AnyHash)
        )
          .void
      end
      attr_writer :category

      sig { returns(T.nilable(Increase::Models::DeclinedTransactionListParams::CreatedAt)) }
      attr_reader :created_at

      sig do
        params(
          created_at: T.any(Increase::Models::DeclinedTransactionListParams::CreatedAt, Increase::Internal::AnyHash)
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

      # Filter Declined Transactions to those belonging to the specified route.
      sig { returns(T.nilable(String)) }
      attr_reader :route_id

      sig { params(route_id: String).void }
      attr_writer :route_id

      sig do
        params(
          account_id: String,
          category: T.any(Increase::Models::DeclinedTransactionListParams::Category, Increase::Internal::AnyHash),
          created_at: T.any(Increase::Models::DeclinedTransactionListParams::CreatedAt, Increase::Internal::AnyHash),
          cursor: String,
          limit: Integer,
          route_id: String,
          request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
        account_id: nil,
        category: nil,
        created_at: nil,
        cursor: nil,
        limit: nil,
        route_id: nil,
        request_options: {}
      )
      end

      sig do
        override
          .returns(
            {
              account_id: String,
              category: Increase::Models::DeclinedTransactionListParams::Category,
              created_at: Increase::Models::DeclinedTransactionListParams::CreatedAt,
              cursor: String,
              limit: Integer,
              route_id: String,
              request_options: Increase::RequestOptions
            }
          )
      end
      def to_hash
      end

      class Category < Increase::Internal::Type::BaseModel
        # Return results whose value is in the provided list. For GET requests, this
        #   should be encoded as a comma-delimited string, such as `?in=one,two,three`.
        sig { returns(T.nilable(T::Array[Increase::Models::DeclinedTransactionListParams::Category::In::OrSymbol])) }
        attr_reader :in_

        sig { params(in_: T::Array[Increase::Models::DeclinedTransactionListParams::Category::In::OrSymbol]).void }
        attr_writer :in_

        sig do
          params(in_: T::Array[Increase::Models::DeclinedTransactionListParams::Category::In::OrSymbol])
            .returns(T.attached_class)
        end
        def self.new(in_: nil)
        end

        sig { override.returns({in_: T::Array[Increase::Models::DeclinedTransactionListParams::Category::In::OrSymbol]}) }
        def to_hash
        end

        module In
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Increase::Models::DeclinedTransactionListParams::Category::In) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::DeclinedTransactionListParams::Category::In::TaggedSymbol) }

          # ACH Decline: details will be under the `ach_decline` object.
          ACH_DECLINE =
            T.let(:ach_decline, Increase::Models::DeclinedTransactionListParams::Category::In::TaggedSymbol)

          # Card Decline: details will be under the `card_decline` object.
          CARD_DECLINE =
            T.let(:card_decline, Increase::Models::DeclinedTransactionListParams::Category::In::TaggedSymbol)

          # Check Decline: details will be under the `check_decline` object.
          CHECK_DECLINE =
            T.let(:check_decline, Increase::Models::DeclinedTransactionListParams::Category::In::TaggedSymbol)

          # Inbound Real-Time Payments Transfer Decline: details will be under the `inbound_real_time_payments_transfer_decline` object.
          INBOUND_REAL_TIME_PAYMENTS_TRANSFER_DECLINE =
            T.let(
              :inbound_real_time_payments_transfer_decline,
              Increase::Models::DeclinedTransactionListParams::Category::In::TaggedSymbol
            )

          # Wire Decline: details will be under the `wire_decline` object.
          WIRE_DECLINE =
            T.let(:wire_decline, Increase::Models::DeclinedTransactionListParams::Category::In::TaggedSymbol)

          # Check Deposit Rejection: details will be under the `check_deposit_rejection` object.
          CHECK_DEPOSIT_REJECTION =
            T.let(
              :check_deposit_rejection,
              Increase::Models::DeclinedTransactionListParams::Category::In::TaggedSymbol
            )

          # The Declined Transaction was made for an undocumented or deprecated reason.
          OTHER = T.let(:other, Increase::Models::DeclinedTransactionListParams::Category::In::TaggedSymbol)

          sig { override.returns(T::Array[Increase::Models::DeclinedTransactionListParams::Category::In::TaggedSymbol]) }
          def self.values
          end
        end
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
