# typed: strong

module Increase
  module Models
    class TransactionListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # Filter Transactions for those belonging to the specified Account.
      sig { returns(T.nilable(String)) }
      attr_reader :account_id

      sig { params(account_id: String).void }
      attr_writer :account_id

      sig { returns(T.nilable(Increase::Models::TransactionListParams::Category)) }
      attr_reader :category

      sig do
        params(category: T.any(Increase::Models::TransactionListParams::Category, Increase::Internal::AnyHash))
          .void
      end
      attr_writer :category

      sig { returns(T.nilable(Increase::Models::TransactionListParams::CreatedAt)) }
      attr_reader :created_at

      sig do
        params(created_at: T.any(Increase::Models::TransactionListParams::CreatedAt, Increase::Internal::AnyHash))
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

      # Filter Transactions for those belonging to the specified route. This could be a
      #   Card ID or an Account Number ID.
      sig { returns(T.nilable(String)) }
      attr_reader :route_id

      sig { params(route_id: String).void }
      attr_writer :route_id

      sig do
        params(
          account_id: String,
          category: T.any(Increase::Models::TransactionListParams::Category, Increase::Internal::AnyHash),
          created_at: T.any(Increase::Models::TransactionListParams::CreatedAt, Increase::Internal::AnyHash),
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
              category: Increase::Models::TransactionListParams::Category,
              created_at: Increase::Models::TransactionListParams::CreatedAt,
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
        sig { returns(T.nilable(T::Array[Increase::Models::TransactionListParams::Category::In::OrSymbol])) }
        attr_reader :in_

        sig { params(in_: T::Array[Increase::Models::TransactionListParams::Category::In::OrSymbol]).void }
        attr_writer :in_

        sig do
          params(in_: T::Array[Increase::Models::TransactionListParams::Category::In::OrSymbol])
            .returns(T.attached_class)
        end
        def self.new(in_: nil)
        end

        sig { override.returns({in_: T::Array[Increase::Models::TransactionListParams::Category::In::OrSymbol]}) }
        def to_hash
        end

        module In
          extend Increase::Internal::Type::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::TransactionListParams::Category::In) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::TransactionListParams::Category::In::TaggedSymbol) }

          # Account Transfer Intention: details will be under the `account_transfer_intention` object.
          ACCOUNT_TRANSFER_INTENTION =
            T.let(:account_transfer_intention, Increase::Models::TransactionListParams::Category::In::TaggedSymbol)

          # ACH Transfer Intention: details will be under the `ach_transfer_intention` object.
          ACH_TRANSFER_INTENTION =
            T.let(:ach_transfer_intention, Increase::Models::TransactionListParams::Category::In::TaggedSymbol)

          # ACH Transfer Rejection: details will be under the `ach_transfer_rejection` object.
          ACH_TRANSFER_REJECTION =
            T.let(:ach_transfer_rejection, Increase::Models::TransactionListParams::Category::In::TaggedSymbol)

          # ACH Transfer Return: details will be under the `ach_transfer_return` object.
          ACH_TRANSFER_RETURN =
            T.let(:ach_transfer_return, Increase::Models::TransactionListParams::Category::In::TaggedSymbol)

          # Cashback Payment: details will be under the `cashback_payment` object.
          CASHBACK_PAYMENT =
            T.let(:cashback_payment, Increase::Models::TransactionListParams::Category::In::TaggedSymbol)

          # Card Dispute Acceptance: details will be under the `card_dispute_acceptance` object.
          CARD_DISPUTE_ACCEPTANCE =
            T.let(:card_dispute_acceptance, Increase::Models::TransactionListParams::Category::In::TaggedSymbol)

          # Card Dispute Loss: details will be under the `card_dispute_loss` object.
          CARD_DISPUTE_LOSS =
            T.let(:card_dispute_loss, Increase::Models::TransactionListParams::Category::In::TaggedSymbol)

          # Card Refund: details will be under the `card_refund` object.
          CARD_REFUND = T.let(:card_refund, Increase::Models::TransactionListParams::Category::In::TaggedSymbol)

          # Card Settlement: details will be under the `card_settlement` object.
          CARD_SETTLEMENT =
            T.let(:card_settlement, Increase::Models::TransactionListParams::Category::In::TaggedSymbol)

          # Card Revenue Payment: details will be under the `card_revenue_payment` object.
          CARD_REVENUE_PAYMENT =
            T.let(:card_revenue_payment, Increase::Models::TransactionListParams::Category::In::TaggedSymbol)

          # Check Deposit Acceptance: details will be under the `check_deposit_acceptance` object.
          CHECK_DEPOSIT_ACCEPTANCE =
            T.let(:check_deposit_acceptance, Increase::Models::TransactionListParams::Category::In::TaggedSymbol)

          # Check Deposit Return: details will be under the `check_deposit_return` object.
          CHECK_DEPOSIT_RETURN =
            T.let(:check_deposit_return, Increase::Models::TransactionListParams::Category::In::TaggedSymbol)

          # Check Transfer Deposit: details will be under the `check_transfer_deposit` object.
          CHECK_TRANSFER_DEPOSIT =
            T.let(:check_transfer_deposit, Increase::Models::TransactionListParams::Category::In::TaggedSymbol)

          # Fee Payment: details will be under the `fee_payment` object.
          FEE_PAYMENT = T.let(:fee_payment, Increase::Models::TransactionListParams::Category::In::TaggedSymbol)

          # Inbound ACH Transfer Intention: details will be under the `inbound_ach_transfer` object.
          INBOUND_ACH_TRANSFER =
            T.let(:inbound_ach_transfer, Increase::Models::TransactionListParams::Category::In::TaggedSymbol)

          # Inbound ACH Transfer Return Intention: details will be under the `inbound_ach_transfer_return_intention` object.
          INBOUND_ACH_TRANSFER_RETURN_INTENTION =
            T.let(
              :inbound_ach_transfer_return_intention,
              Increase::Models::TransactionListParams::Category::In::TaggedSymbol
            )

          # Inbound Check Deposit Return Intention: details will be under the `inbound_check_deposit_return_intention` object.
          INBOUND_CHECK_DEPOSIT_RETURN_INTENTION =
            T.let(
              :inbound_check_deposit_return_intention,
              Increase::Models::TransactionListParams::Category::In::TaggedSymbol
            )

          # Inbound Check Adjustment: details will be under the `inbound_check_adjustment` object.
          INBOUND_CHECK_ADJUSTMENT =
            T.let(:inbound_check_adjustment, Increase::Models::TransactionListParams::Category::In::TaggedSymbol)

          # Inbound Real-Time Payments Transfer Confirmation: details will be under the `inbound_real_time_payments_transfer_confirmation` object.
          INBOUND_REAL_TIME_PAYMENTS_TRANSFER_CONFIRMATION =
            T.let(
              :inbound_real_time_payments_transfer_confirmation,
              Increase::Models::TransactionListParams::Category::In::TaggedSymbol
            )

          # Inbound Real-Time Payments Transfer Decline: details will be under the `inbound_real_time_payments_transfer_decline` object.
          INBOUND_REAL_TIME_PAYMENTS_TRANSFER_DECLINE =
            T.let(
              :inbound_real_time_payments_transfer_decline,
              Increase::Models::TransactionListParams::Category::In::TaggedSymbol
            )

          # Inbound Wire Reversal: details will be under the `inbound_wire_reversal` object.
          INBOUND_WIRE_REVERSAL =
            T.let(:inbound_wire_reversal, Increase::Models::TransactionListParams::Category::In::TaggedSymbol)

          # Inbound Wire Transfer Intention: details will be under the `inbound_wire_transfer` object.
          INBOUND_WIRE_TRANSFER =
            T.let(:inbound_wire_transfer, Increase::Models::TransactionListParams::Category::In::TaggedSymbol)

          # Inbound Wire Transfer Reversal Intention: details will be under the `inbound_wire_transfer_reversal` object.
          INBOUND_WIRE_TRANSFER_REVERSAL =
            T.let(
              :inbound_wire_transfer_reversal,
              Increase::Models::TransactionListParams::Category::In::TaggedSymbol
            )

          # Interest Payment: details will be under the `interest_payment` object.
          INTEREST_PAYMENT =
            T.let(:interest_payment, Increase::Models::TransactionListParams::Category::In::TaggedSymbol)

          # Internal Source: details will be under the `internal_source` object.
          INTERNAL_SOURCE =
            T.let(:internal_source, Increase::Models::TransactionListParams::Category::In::TaggedSymbol)

          # Real-Time Payments Transfer Acknowledgement: details will be under the `real_time_payments_transfer_acknowledgement` object.
          REAL_TIME_PAYMENTS_TRANSFER_ACKNOWLEDGEMENT =
            T.let(
              :real_time_payments_transfer_acknowledgement,
              Increase::Models::TransactionListParams::Category::In::TaggedSymbol
            )

          # Sample Funds: details will be under the `sample_funds` object.
          SAMPLE_FUNDS = T.let(:sample_funds, Increase::Models::TransactionListParams::Category::In::TaggedSymbol)

          # Wire Transfer Intention: details will be under the `wire_transfer_intention` object.
          WIRE_TRANSFER_INTENTION =
            T.let(:wire_transfer_intention, Increase::Models::TransactionListParams::Category::In::TaggedSymbol)

          # The Transaction was made for an undocumented or deprecated reason.
          OTHER = T.let(:other, Increase::Models::TransactionListParams::Category::In::TaggedSymbol)

          sig { override.returns(T::Array[Increase::Models::TransactionListParams::Category::In::TaggedSymbol]) }
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
