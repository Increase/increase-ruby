# typed: strong

module Increase
  module Models
    class TransactionListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Increase::TransactionListParams, Increase::Internal::AnyHash)
        end

      # Filter Transactions for those belonging to the specified Account.
      sig { returns(T.nilable(String)) }
      attr_reader :account_id

      sig { params(account_id: String).void }
      attr_writer :account_id

      sig { returns(T.nilable(Increase::TransactionListParams::Category)) }
      attr_reader :category

      sig do
        params(category: Increase::TransactionListParams::Category::OrHash).void
      end
      attr_writer :category

      sig { returns(T.nilable(Increase::TransactionListParams::CreatedAt)) }
      attr_reader :created_at

      sig do
        params(
          created_at: Increase::TransactionListParams::CreatedAt::OrHash
        ).void
      end
      attr_writer :created_at

      # Return the page of entries after this one.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Limit the size of the list that is returned. The default (and maximum) is 100
      # objects.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Filter Transactions for those belonging to the specified route. This could be a
      # Card ID or an Account Number ID.
      sig { returns(T.nilable(String)) }
      attr_reader :route_id

      sig { params(route_id: String).void }
      attr_writer :route_id

      sig do
        params(
          account_id: String,
          category: Increase::TransactionListParams::Category::OrHash,
          created_at: Increase::TransactionListParams::CreatedAt::OrHash,
          cursor: String,
          limit: Integer,
          route_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Filter Transactions for those belonging to the specified Account.
        account_id: nil,
        category: nil,
        created_at: nil,
        # Return the page of entries after this one.
        cursor: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        # objects.
        limit: nil,
        # Filter Transactions for those belonging to the specified route. This could be a
        # Card ID or an Account Number ID.
        route_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            category: Increase::TransactionListParams::Category,
            created_at: Increase::TransactionListParams::CreatedAt,
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
        OrHash =
          T.type_alias do
            T.any(
              Increase::TransactionListParams::Category,
              Increase::Internal::AnyHash
            )
          end

        # Return results whose value is in the provided list. For GET requests, this
        # should be encoded as a comma-delimited string, such as `?in=one,two,three`.
        sig do
          returns(
            T.nilable(
              T::Array[Increase::TransactionListParams::Category::In::OrSymbol]
            )
          )
        end
        attr_reader :in_

        sig do
          params(
            in_:
              T::Array[Increase::TransactionListParams::Category::In::OrSymbol]
          ).void
        end
        attr_writer :in_

        sig do
          params(
            in_:
              T::Array[Increase::TransactionListParams::Category::In::OrSymbol]
          ).returns(T.attached_class)
        end
        def self.new(
          # Return results whose value is in the provided list. For GET requests, this
          # should be encoded as a comma-delimited string, such as `?in=one,two,three`.
          in_: nil
        )
        end

        sig do
          override.returns(
            {
              in_:
                T::Array[
                  Increase::TransactionListParams::Category::In::OrSymbol
                ]
            }
          )
        end
        def to_hash
        end

        module In
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::TransactionListParams::Category::In)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Account Transfer Intention: details will be under the `account_transfer_intention` object.
          ACCOUNT_TRANSFER_INTENTION =
            T.let(
              :account_transfer_intention,
              Increase::TransactionListParams::Category::In::TaggedSymbol
            )

          # ACH Transfer Intention: details will be under the `ach_transfer_intention` object.
          ACH_TRANSFER_INTENTION =
            T.let(
              :ach_transfer_intention,
              Increase::TransactionListParams::Category::In::TaggedSymbol
            )

          # ACH Transfer Rejection: details will be under the `ach_transfer_rejection` object.
          ACH_TRANSFER_REJECTION =
            T.let(
              :ach_transfer_rejection,
              Increase::TransactionListParams::Category::In::TaggedSymbol
            )

          # ACH Transfer Return: details will be under the `ach_transfer_return` object.
          ACH_TRANSFER_RETURN =
            T.let(
              :ach_transfer_return,
              Increase::TransactionListParams::Category::In::TaggedSymbol
            )

          # Cashback Payment: details will be under the `cashback_payment` object.
          CASHBACK_PAYMENT =
            T.let(
              :cashback_payment,
              Increase::TransactionListParams::Category::In::TaggedSymbol
            )

          # Card Dispute Acceptance: details will be under the `card_dispute_acceptance` object.
          CARD_DISPUTE_ACCEPTANCE =
            T.let(
              :card_dispute_acceptance,
              Increase::TransactionListParams::Category::In::TaggedSymbol
            )

          # Card Dispute Financial: details will be under the `card_dispute_financial` object.
          CARD_DISPUTE_FINANCIAL =
            T.let(
              :card_dispute_financial,
              Increase::TransactionListParams::Category::In::TaggedSymbol
            )

          # Card Dispute Loss: details will be under the `card_dispute_loss` object.
          CARD_DISPUTE_LOSS =
            T.let(
              :card_dispute_loss,
              Increase::TransactionListParams::Category::In::TaggedSymbol
            )

          # Card Refund: details will be under the `card_refund` object.
          CARD_REFUND =
            T.let(
              :card_refund,
              Increase::TransactionListParams::Category::In::TaggedSymbol
            )

          # Card Settlement: details will be under the `card_settlement` object.
          CARD_SETTLEMENT =
            T.let(
              :card_settlement,
              Increase::TransactionListParams::Category::In::TaggedSymbol
            )

          # Card Financial: details will be under the `card_financial` object.
          CARD_FINANCIAL =
            T.let(
              :card_financial,
              Increase::TransactionListParams::Category::In::TaggedSymbol
            )

          # Card Revenue Payment: details will be under the `card_revenue_payment` object.
          CARD_REVENUE_PAYMENT =
            T.let(
              :card_revenue_payment,
              Increase::TransactionListParams::Category::In::TaggedSymbol
            )

          # Check Deposit Acceptance: details will be under the `check_deposit_acceptance` object.
          CHECK_DEPOSIT_ACCEPTANCE =
            T.let(
              :check_deposit_acceptance,
              Increase::TransactionListParams::Category::In::TaggedSymbol
            )

          # Check Deposit Return: details will be under the `check_deposit_return` object.
          CHECK_DEPOSIT_RETURN =
            T.let(
              :check_deposit_return,
              Increase::TransactionListParams::Category::In::TaggedSymbol
            )

          # FedNow Transfer Acknowledgement: details will be under the `fednow_transfer_acknowledgement` object.
          FEDNOW_TRANSFER_ACKNOWLEDGEMENT =
            T.let(
              :fednow_transfer_acknowledgement,
              Increase::TransactionListParams::Category::In::TaggedSymbol
            )

          # Check Transfer Deposit: details will be under the `check_transfer_deposit` object.
          CHECK_TRANSFER_DEPOSIT =
            T.let(
              :check_transfer_deposit,
              Increase::TransactionListParams::Category::In::TaggedSymbol
            )

          # Fee Payment: details will be under the `fee_payment` object.
          FEE_PAYMENT =
            T.let(
              :fee_payment,
              Increase::TransactionListParams::Category::In::TaggedSymbol
            )

          # Inbound ACH Transfer Intention: details will be under the `inbound_ach_transfer` object.
          INBOUND_ACH_TRANSFER =
            T.let(
              :inbound_ach_transfer,
              Increase::TransactionListParams::Category::In::TaggedSymbol
            )

          # Inbound ACH Transfer Return Intention: details will be under the `inbound_ach_transfer_return_intention` object.
          INBOUND_ACH_TRANSFER_RETURN_INTENTION =
            T.let(
              :inbound_ach_transfer_return_intention,
              Increase::TransactionListParams::Category::In::TaggedSymbol
            )

          # Inbound Check Deposit Return Intention: details will be under the `inbound_check_deposit_return_intention` object.
          INBOUND_CHECK_DEPOSIT_RETURN_INTENTION =
            T.let(
              :inbound_check_deposit_return_intention,
              Increase::TransactionListParams::Category::In::TaggedSymbol
            )

          # Inbound Check Adjustment: details will be under the `inbound_check_adjustment` object.
          INBOUND_CHECK_ADJUSTMENT =
            T.let(
              :inbound_check_adjustment,
              Increase::TransactionListParams::Category::In::TaggedSymbol
            )

          # Inbound FedNow Transfer Confirmation: details will be under the `inbound_fednow_transfer_confirmation` object.
          INBOUND_FEDNOW_TRANSFER_CONFIRMATION =
            T.let(
              :inbound_fednow_transfer_confirmation,
              Increase::TransactionListParams::Category::In::TaggedSymbol
            )

          # Inbound Real-Time Payments Transfer Confirmation: details will be under the `inbound_real_time_payments_transfer_confirmation` object.
          INBOUND_REAL_TIME_PAYMENTS_TRANSFER_CONFIRMATION =
            T.let(
              :inbound_real_time_payments_transfer_confirmation,
              Increase::TransactionListParams::Category::In::TaggedSymbol
            )

          # Inbound Wire Reversal: details will be under the `inbound_wire_reversal` object.
          INBOUND_WIRE_REVERSAL =
            T.let(
              :inbound_wire_reversal,
              Increase::TransactionListParams::Category::In::TaggedSymbol
            )

          # Inbound Wire Transfer Intention: details will be under the `inbound_wire_transfer` object.
          INBOUND_WIRE_TRANSFER =
            T.let(
              :inbound_wire_transfer,
              Increase::TransactionListParams::Category::In::TaggedSymbol
            )

          # Inbound Wire Transfer Reversal Intention: details will be under the `inbound_wire_transfer_reversal` object.
          INBOUND_WIRE_TRANSFER_REVERSAL =
            T.let(
              :inbound_wire_transfer_reversal,
              Increase::TransactionListParams::Category::In::TaggedSymbol
            )

          # Interest Payment: details will be under the `interest_payment` object.
          INTEREST_PAYMENT =
            T.let(
              :interest_payment,
              Increase::TransactionListParams::Category::In::TaggedSymbol
            )

          # Internal Source: details will be under the `internal_source` object.
          INTERNAL_SOURCE =
            T.let(
              :internal_source,
              Increase::TransactionListParams::Category::In::TaggedSymbol
            )

          # Real-Time Payments Transfer Acknowledgement: details will be under the `real_time_payments_transfer_acknowledgement` object.
          REAL_TIME_PAYMENTS_TRANSFER_ACKNOWLEDGEMENT =
            T.let(
              :real_time_payments_transfer_acknowledgement,
              Increase::TransactionListParams::Category::In::TaggedSymbol
            )

          # Sample Funds: details will be under the `sample_funds` object.
          SAMPLE_FUNDS =
            T.let(
              :sample_funds,
              Increase::TransactionListParams::Category::In::TaggedSymbol
            )

          # Wire Transfer Intention: details will be under the `wire_transfer_intention` object.
          WIRE_TRANSFER_INTENTION =
            T.let(
              :wire_transfer_intention,
              Increase::TransactionListParams::Category::In::TaggedSymbol
            )

          # Swift Transfer Intention: details will be under the `swift_transfer_intention` object.
          SWIFT_TRANSFER_INTENTION =
            T.let(
              :swift_transfer_intention,
              Increase::TransactionListParams::Category::In::TaggedSymbol
            )

          # Swift Transfer Return: details will be under the `swift_transfer_return` object.
          SWIFT_TRANSFER_RETURN =
            T.let(
              :swift_transfer_return,
              Increase::TransactionListParams::Category::In::TaggedSymbol
            )

          # Card Push Transfer Acceptance: details will be under the `card_push_transfer_acceptance` object.
          CARD_PUSH_TRANSFER_ACCEPTANCE =
            T.let(
              :card_push_transfer_acceptance,
              Increase::TransactionListParams::Category::In::TaggedSymbol
            )

          # Account Revenue Payment: details will be under the `account_revenue_payment` object.
          ACCOUNT_REVENUE_PAYMENT =
            T.let(
              :account_revenue_payment,
              Increase::TransactionListParams::Category::In::TaggedSymbol
            )

          # The Transaction was made for an undocumented or deprecated reason.
          OTHER =
            T.let(
              :other,
              Increase::TransactionListParams::Category::In::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::TransactionListParams::Category::In::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class CreatedAt < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::TransactionListParams::CreatedAt,
              Increase::Internal::AnyHash
            )
          end

        # Return results after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
        # timestamp.
        sig { returns(T.nilable(Time)) }
        attr_reader :after

        sig { params(after: Time).void }
        attr_writer :after

        # Return results before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
        # timestamp.
        sig { returns(T.nilable(Time)) }
        attr_reader :before

        sig { params(before: Time).void }
        attr_writer :before

        # Return results on or after this
        # [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
        sig { returns(T.nilable(Time)) }
        attr_reader :on_or_after

        sig { params(on_or_after: Time).void }
        attr_writer :on_or_after

        # Return results on or before this
        # [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
        sig { returns(T.nilable(Time)) }
        attr_reader :on_or_before

        sig { params(on_or_before: Time).void }
        attr_writer :on_or_before

        sig do
          params(
            after: Time,
            before: Time,
            on_or_after: Time,
            on_or_before: Time
          ).returns(T.attached_class)
        end
        def self.new(
          # Return results after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
          # timestamp.
          after: nil,
          # Return results before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
          # timestamp.
          before: nil,
          # Return results on or after this
          # [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
          on_or_after: nil,
          # Return results on or before this
          # [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
          on_or_before: nil
        )
        end

        sig do
          override.returns(
            { after: Time, before: Time, on_or_after: Time, on_or_before: Time }
          )
        end
        def to_hash
        end
      end
    end
  end
end
