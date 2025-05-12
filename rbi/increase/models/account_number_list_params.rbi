# typed: strong

module Increase
  module Models
    class AccountNumberListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Increase::AccountNumberListParams, Increase::Internal::AnyHash)
        end

      # Filter Account Numbers to those belonging to the specified Account.
      sig { returns(T.nilable(String)) }
      attr_reader :account_id

      sig { params(account_id: String).void }
      attr_writer :account_id

      sig do
        returns(T.nilable(Increase::AccountNumberListParams::ACHDebitStatus))
      end
      attr_reader :ach_debit_status

      sig do
        params(
          ach_debit_status:
            Increase::AccountNumberListParams::ACHDebitStatus::OrHash
        ).void
      end
      attr_writer :ach_debit_status

      sig { returns(T.nilable(Increase::AccountNumberListParams::CreatedAt)) }
      attr_reader :created_at

      sig do
        params(
          created_at: Increase::AccountNumberListParams::CreatedAt::OrHash
        ).void
      end
      attr_writer :created_at

      # Return the page of entries after this one.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Filter records to the one with the specified `idempotency_key` you chose for
      # that object. This value is unique across Increase and is used to ensure that a
      # request is only processed once. Learn more about
      # [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_reader :idempotency_key

      sig { params(idempotency_key: String).void }
      attr_writer :idempotency_key

      # Limit the size of the list that is returned. The default (and maximum) is 100
      # objects.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      sig { returns(T.nilable(Increase::AccountNumberListParams::Status)) }
      attr_reader :status

      sig do
        params(status: Increase::AccountNumberListParams::Status::OrHash).void
      end
      attr_writer :status

      sig do
        params(
          account_id: String,
          ach_debit_status:
            Increase::AccountNumberListParams::ACHDebitStatus::OrHash,
          created_at: Increase::AccountNumberListParams::CreatedAt::OrHash,
          cursor: String,
          idempotency_key: String,
          limit: Integer,
          status: Increase::AccountNumberListParams::Status::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Filter Account Numbers to those belonging to the specified Account.
        account_id: nil,
        ach_debit_status: nil,
        created_at: nil,
        # Return the page of entries after this one.
        cursor: nil,
        # Filter records to the one with the specified `idempotency_key` you chose for
        # that object. This value is unique across Increase and is used to ensure that a
        # request is only processed once. Learn more about
        # [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key: nil,
        # Limit the size of the list that is returned. The default (and maximum) is 100
        # objects.
        limit: nil,
        status: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            ach_debit_status: Increase::AccountNumberListParams::ACHDebitStatus,
            created_at: Increase::AccountNumberListParams::CreatedAt,
            cursor: String,
            idempotency_key: String,
            limit: Integer,
            status: Increase::AccountNumberListParams::Status,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      class ACHDebitStatus < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::AccountNumberListParams::ACHDebitStatus,
              Increase::Internal::AnyHash
            )
          end

        # The ACH Debit status to retrieve Account Numbers for. For GET requests, this
        # should be encoded as a comma-delimited string, such as `?in=one,two,three`.
        sig do
          returns(
            T.nilable(
              T::Array[
                Increase::AccountNumberListParams::ACHDebitStatus::In::OrSymbol
              ]
            )
          )
        end
        attr_reader :in_

        sig do
          params(
            in_:
              T::Array[
                Increase::AccountNumberListParams::ACHDebitStatus::In::OrSymbol
              ]
          ).void
        end
        attr_writer :in_

        sig do
          params(
            in_:
              T::Array[
                Increase::AccountNumberListParams::ACHDebitStatus::In::OrSymbol
              ]
          ).returns(T.attached_class)
        end
        def self.new(
          # The ACH Debit status to retrieve Account Numbers for. For GET requests, this
          # should be encoded as a comma-delimited string, such as `?in=one,two,three`.
          in_: nil
        )
        end

        sig do
          override.returns(
            {
              in_:
                T::Array[
                  Increase::AccountNumberListParams::ACHDebitStatus::In::OrSymbol
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
                Increase::AccountNumberListParams::ACHDebitStatus::In
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # ACH Debits are allowed.
          ALLOWED =
            T.let(
              :allowed,
              Increase::AccountNumberListParams::ACHDebitStatus::In::TaggedSymbol
            )

          # ACH Debits are blocked.
          BLOCKED =
            T.let(
              :blocked,
              Increase::AccountNumberListParams::ACHDebitStatus::In::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::AccountNumberListParams::ACHDebitStatus::In::TaggedSymbol
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
              Increase::AccountNumberListParams::CreatedAt,
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
              Increase::AccountNumberListParams::Status,
              Increase::Internal::AnyHash
            )
          end

        # The status to retrieve Account Numbers for. For GET requests, this should be
        # encoded as a comma-delimited string, such as `?in=one,two,three`.
        sig do
          returns(
            T.nilable(
              T::Array[Increase::AccountNumberListParams::Status::In::OrSymbol]
            )
          )
        end
        attr_reader :in_

        sig do
          params(
            in_:
              T::Array[Increase::AccountNumberListParams::Status::In::OrSymbol]
          ).void
        end
        attr_writer :in_

        sig do
          params(
            in_:
              T::Array[Increase::AccountNumberListParams::Status::In::OrSymbol]
          ).returns(T.attached_class)
        end
        def self.new(
          # The status to retrieve Account Numbers for. For GET requests, this should be
          # encoded as a comma-delimited string, such as `?in=one,two,three`.
          in_: nil
        )
        end

        sig do
          override.returns(
            {
              in_:
                T::Array[
                  Increase::AccountNumberListParams::Status::In::OrSymbol
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
              T.all(Symbol, Increase::AccountNumberListParams::Status::In)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The account number is active.
          ACTIVE =
            T.let(
              :active,
              Increase::AccountNumberListParams::Status::In::TaggedSymbol
            )

          # The account number is temporarily disabled.
          DISABLED =
            T.let(
              :disabled,
              Increase::AccountNumberListParams::Status::In::TaggedSymbol
            )

          # The account number is permanently disabled.
          CANCELED =
            T.let(
              :canceled,
              Increase::AccountNumberListParams::Status::In::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::AccountNumberListParams::Status::In::TaggedSymbol
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
