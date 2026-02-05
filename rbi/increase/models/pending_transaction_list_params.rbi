# typed: strong

module Increase
  module Models
    class PendingTransactionListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::PendingTransactionListParams,
            Increase::Internal::AnyHash
          )
        end

      # Filter pending transactions to those belonging to the specified Account.
      sig { returns(T.nilable(String)) }
      attr_reader :account_id

      sig { params(account_id: String).void }
      attr_writer :account_id

      sig do
        returns(T.nilable(Increase::PendingTransactionListParams::Category))
      end
      attr_reader :category

      sig do
        params(
          category: Increase::PendingTransactionListParams::Category::OrHash
        ).void
      end
      attr_writer :category

      sig do
        returns(T.nilable(Increase::PendingTransactionListParams::CreatedAt))
      end
      attr_reader :created_at

      sig do
        params(
          created_at: Increase::PendingTransactionListParams::CreatedAt::OrHash
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

      # Filter pending transactions to those belonging to the specified Route.
      sig { returns(T.nilable(String)) }
      attr_reader :route_id

      sig { params(route_id: String).void }
      attr_writer :route_id

      sig { returns(T.nilable(Increase::PendingTransactionListParams::Status)) }
      attr_reader :status

      sig do
        params(
          status: Increase::PendingTransactionListParams::Status::OrHash
        ).void
      end
      attr_writer :status

      sig do
        params(
          account_id: String,
          category: Increase::PendingTransactionListParams::Category::OrHash,
          created_at: Increase::PendingTransactionListParams::CreatedAt::OrHash,
          cursor: String,
          limit: Integer,
          route_id: String,
          status: Increase::PendingTransactionListParams::Status::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Filter pending transactions to those belonging to the specified Account.
        account_id: nil,
        category: nil,
        created_at: nil,
        # Return the page of entries after this one.
        cursor: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        # objects.
        limit: nil,
        # Filter pending transactions to those belonging to the specified Route.
        route_id: nil,
        status: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            category: Increase::PendingTransactionListParams::Category,
            created_at: Increase::PendingTransactionListParams::CreatedAt,
            cursor: String,
            limit: Integer,
            route_id: String,
            status: Increase::PendingTransactionListParams::Status,
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
              Increase::PendingTransactionListParams::Category,
              Increase::Internal::AnyHash
            )
          end

        # Return results whose value is in the provided list. For GET requests, this
        # should be encoded as a comma-delimited string, such as `?in=one,two,three`.
        sig do
          returns(
            T.nilable(
              T::Array[
                Increase::PendingTransactionListParams::Category::In::OrSymbol
              ]
            )
          )
        end
        attr_reader :in_

        sig do
          params(
            in_:
              T::Array[
                Increase::PendingTransactionListParams::Category::In::OrSymbol
              ]
          ).void
        end
        attr_writer :in_

        sig do
          params(
            in_:
              T::Array[
                Increase::PendingTransactionListParams::Category::In::OrSymbol
              ]
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
                  Increase::PendingTransactionListParams::Category::In::OrSymbol
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
              T.all(
                Symbol,
                Increase::PendingTransactionListParams::Category::In
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Account Transfer Instruction: details will be under the `account_transfer_instruction` object.
          ACCOUNT_TRANSFER_INSTRUCTION =
            T.let(
              :account_transfer_instruction,
              Increase::PendingTransactionListParams::Category::In::TaggedSymbol
            )

          # ACH Transfer Instruction: details will be under the `ach_transfer_instruction` object.
          ACH_TRANSFER_INSTRUCTION =
            T.let(
              :ach_transfer_instruction,
              Increase::PendingTransactionListParams::Category::In::TaggedSymbol
            )

          # Card Authorization: details will be under the `card_authorization` object.
          CARD_AUTHORIZATION =
            T.let(
              :card_authorization,
              Increase::PendingTransactionListParams::Category::In::TaggedSymbol
            )

          # Check Deposit Instruction: details will be under the `check_deposit_instruction` object.
          CHECK_DEPOSIT_INSTRUCTION =
            T.let(
              :check_deposit_instruction,
              Increase::PendingTransactionListParams::Category::In::TaggedSymbol
            )

          # Check Transfer Instruction: details will be under the `check_transfer_instruction` object.
          CHECK_TRANSFER_INSTRUCTION =
            T.let(
              :check_transfer_instruction,
              Increase::PendingTransactionListParams::Category::In::TaggedSymbol
            )

          # FedNow Transfer Instruction: details will be under the `fednow_transfer_instruction` object.
          FEDNOW_TRANSFER_INSTRUCTION =
            T.let(
              :fednow_transfer_instruction,
              Increase::PendingTransactionListParams::Category::In::TaggedSymbol
            )

          # Inbound Funds Hold: details will be under the `inbound_funds_hold` object.
          INBOUND_FUNDS_HOLD =
            T.let(
              :inbound_funds_hold,
              Increase::PendingTransactionListParams::Category::In::TaggedSymbol
            )

          # User Initiated Hold: details will be under the `user_initiated_hold` object.
          USER_INITIATED_HOLD =
            T.let(
              :user_initiated_hold,
              Increase::PendingTransactionListParams::Category::In::TaggedSymbol
            )

          # Real-Time Payments Transfer Instruction: details will be under the `real_time_payments_transfer_instruction` object.
          REAL_TIME_PAYMENTS_TRANSFER_INSTRUCTION =
            T.let(
              :real_time_payments_transfer_instruction,
              Increase::PendingTransactionListParams::Category::In::TaggedSymbol
            )

          # Wire Transfer Instruction: details will be under the `wire_transfer_instruction` object.
          WIRE_TRANSFER_INSTRUCTION =
            T.let(
              :wire_transfer_instruction,
              Increase::PendingTransactionListParams::Category::In::TaggedSymbol
            )

          # Inbound Wire Transfer Reversal: details will be under the `inbound_wire_transfer_reversal` object.
          INBOUND_WIRE_TRANSFER_REVERSAL =
            T.let(
              :inbound_wire_transfer_reversal,
              Increase::PendingTransactionListParams::Category::In::TaggedSymbol
            )

          # Swift Transfer Instruction: details will be under the `swift_transfer_instruction` object.
          SWIFT_TRANSFER_INSTRUCTION =
            T.let(
              :swift_transfer_instruction,
              Increase::PendingTransactionListParams::Category::In::TaggedSymbol
            )

          # Card Push Transfer Instruction: details will be under the `card_push_transfer_instruction` object.
          CARD_PUSH_TRANSFER_INSTRUCTION =
            T.let(
              :card_push_transfer_instruction,
              Increase::PendingTransactionListParams::Category::In::TaggedSymbol
            )

          # Blockchain On-Ramp Transfer Instruction: details will be under the `blockchain_onramp_transfer_instruction` object.
          BLOCKCHAIN_ONRAMP_TRANSFER_INSTRUCTION =
            T.let(
              :blockchain_onramp_transfer_instruction,
              Increase::PendingTransactionListParams::Category::In::TaggedSymbol
            )

          # Blockchain Off-Ramp Transfer Instruction: details will be under the `blockchain_offramp_transfer_instruction` object.
          BLOCKCHAIN_OFFRAMP_TRANSFER_INSTRUCTION =
            T.let(
              :blockchain_offramp_transfer_instruction,
              Increase::PendingTransactionListParams::Category::In::TaggedSymbol
            )

          # The Pending Transaction was made for an undocumented or deprecated reason.
          OTHER =
            T.let(
              :other,
              Increase::PendingTransactionListParams::Category::In::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::PendingTransactionListParams::Category::In::TaggedSymbol
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
              Increase::PendingTransactionListParams::CreatedAt,
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

      class Status < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::PendingTransactionListParams::Status,
              Increase::Internal::AnyHash
            )
          end

        # Filter Pending Transactions for those with the specified status. By default only
        # Pending Transactions in with status `pending` will be returned. For GET
        # requests, this should be encoded as a comma-delimited string, such as
        # `?in=one,two,three`.
        sig do
          returns(
            T.nilable(
              T::Array[
                Increase::PendingTransactionListParams::Status::In::OrSymbol
              ]
            )
          )
        end
        attr_reader :in_

        sig do
          params(
            in_:
              T::Array[
                Increase::PendingTransactionListParams::Status::In::OrSymbol
              ]
          ).void
        end
        attr_writer :in_

        sig do
          params(
            in_:
              T::Array[
                Increase::PendingTransactionListParams::Status::In::OrSymbol
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # Filter Pending Transactions for those with the specified status. By default only
          # Pending Transactions in with status `pending` will be returned. For GET
          # requests, this should be encoded as a comma-delimited string, such as
          # `?in=one,two,three`.
          in_: nil
        )
        end

        sig do
          override.returns(
            {
              in_:
                T::Array[
                  Increase::PendingTransactionListParams::Status::In::OrSymbol
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
              T.all(Symbol, Increase::PendingTransactionListParams::Status::In)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The Pending Transaction is still awaiting confirmation.
          PENDING =
            T.let(
              :pending,
              Increase::PendingTransactionListParams::Status::In::TaggedSymbol
            )

          # The Pending Transaction is confirmed. An associated Transaction exists for this object. The Pending Transaction will no longer count against your balance and can generally be hidden from UIs, etc.
          COMPLETE =
            T.let(
              :complete,
              Increase::PendingTransactionListParams::Status::In::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::PendingTransactionListParams::Status::In::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
