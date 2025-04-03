# typed: strong

module Increase
  module Models
    class AccountNumberCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # The Account the Account Number should belong to.
      sig { returns(String) }
      attr_accessor :account_id

      # The name you choose for the Account Number.
      sig { returns(String) }
      attr_accessor :name

      # Options related to how this Account Number should handle inbound ACH transfers.
      sig { returns(T.nilable(Increase::Models::AccountNumberCreateParams::InboundACH)) }
      attr_reader :inbound_ach

      sig do
        params(
          inbound_ach: T.any(Increase::Models::AccountNumberCreateParams::InboundACH, Increase::Internal::AnyHash)
        )
          .void
      end
      attr_writer :inbound_ach

      # Options related to how this Account Number should handle inbound check
      #   withdrawals.
      sig { returns(T.nilable(Increase::Models::AccountNumberCreateParams::InboundChecks)) }
      attr_reader :inbound_checks

      sig do
        params(
          inbound_checks: T.any(Increase::Models::AccountNumberCreateParams::InboundChecks, Increase::Internal::AnyHash)
        )
          .void
      end
      attr_writer :inbound_checks

      sig do
        params(
          account_id: String,
          name: String,
          inbound_ach: T.any(Increase::Models::AccountNumberCreateParams::InboundACH, Increase::Internal::AnyHash),
          inbound_checks: T.any(Increase::Models::AccountNumberCreateParams::InboundChecks, Increase::Internal::AnyHash),
          request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(account_id:, name:, inbound_ach: nil, inbound_checks: nil, request_options: {})
      end

      sig do
        override
          .returns(
            {
              account_id: String,
              name: String,
              inbound_ach: Increase::Models::AccountNumberCreateParams::InboundACH,
              inbound_checks: Increase::Models::AccountNumberCreateParams::InboundChecks,
              request_options: Increase::RequestOptions
            }
          )
      end
      def to_hash
      end

      class InboundACH < Increase::Internal::Type::BaseModel
        # Whether ACH debits are allowed against this Account Number. Note that ACH debits
        #   will be declined if this is `allowed` but the Account Number is not active. If
        #   you do not specify this field, the default is `allowed`.
        sig { returns(Increase::Models::AccountNumberCreateParams::InboundACH::DebitStatus::OrSymbol) }
        attr_accessor :debit_status

        # Options related to how this Account Number should handle inbound ACH transfers.
        sig do
          params(debit_status: Increase::Models::AccountNumberCreateParams::InboundACH::DebitStatus::OrSymbol)
            .returns(T.attached_class)
        end
        def self.new(debit_status:)
        end

        sig do
          override
            .returns({debit_status: Increase::Models::AccountNumberCreateParams::InboundACH::DebitStatus::OrSymbol})
        end
        def to_hash
        end

        # Whether ACH debits are allowed against this Account Number. Note that ACH debits
        #   will be declined if this is `allowed` but the Account Number is not active. If
        #   you do not specify this field, the default is `allowed`.
        module DebitStatus
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Increase::Models::AccountNumberCreateParams::InboundACH::DebitStatus) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::AccountNumberCreateParams::InboundACH::DebitStatus::TaggedSymbol) }

          # ACH Debits are allowed.
          ALLOWED =
            T.let(:allowed, Increase::Models::AccountNumberCreateParams::InboundACH::DebitStatus::TaggedSymbol)

          # ACH Debits are blocked.
          BLOCKED =
            T.let(:blocked, Increase::Models::AccountNumberCreateParams::InboundACH::DebitStatus::TaggedSymbol)

          sig do
            override
              .returns(T::Array[Increase::Models::AccountNumberCreateParams::InboundACH::DebitStatus::TaggedSymbol])
          end
          def self.values
          end
        end
      end

      class InboundChecks < Increase::Internal::Type::BaseModel
        # How Increase should process checks with this account number printed on them. If
        #   you do not specify this field, the default is `check_transfers_only`.
        sig { returns(Increase::Models::AccountNumberCreateParams::InboundChecks::Status::OrSymbol) }
        attr_accessor :status

        # Options related to how this Account Number should handle inbound check
        #   withdrawals.
        sig do
          params(status: Increase::Models::AccountNumberCreateParams::InboundChecks::Status::OrSymbol)
            .returns(T.attached_class)
        end
        def self.new(status:)
        end

        sig { override.returns({status: Increase::Models::AccountNumberCreateParams::InboundChecks::Status::OrSymbol}) }
        def to_hash
        end

        # How Increase should process checks with this account number printed on them. If
        #   you do not specify this field, the default is `check_transfers_only`.
        module Status
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Increase::Models::AccountNumberCreateParams::InboundChecks::Status) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::AccountNumberCreateParams::InboundChecks::Status::TaggedSymbol) }

          # Checks with this Account Number will be processed even if they are not associated with a Check Transfer.
          ALLOWED =
            T.let(:allowed, Increase::Models::AccountNumberCreateParams::InboundChecks::Status::TaggedSymbol)

          # Checks with this Account Number will be processed only if they can be matched to an existing Check Transfer.
          CHECK_TRANSFERS_ONLY =
            T.let(
              :check_transfers_only,
              Increase::Models::AccountNumberCreateParams::InboundChecks::Status::TaggedSymbol
            )

          sig do
            override
              .returns(T::Array[Increase::Models::AccountNumberCreateParams::InboundChecks::Status::TaggedSymbol])
          end
          def self.values
          end
        end
      end
    end
  end
end
