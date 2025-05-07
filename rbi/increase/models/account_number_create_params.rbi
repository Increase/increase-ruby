# typed: strong

module Increase
  module Models
    class AccountNumberCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash = T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

      # The Account the Account Number should belong to.
      sig { returns(String) }
      attr_accessor :account_id

      # The name you choose for the Account Number.
      sig { returns(String) }
      attr_accessor :name

      # Options related to how this Account Number should handle inbound ACH transfers.
      sig do
        returns(T.nilable(Increase::AccountNumberCreateParams::InboundACH))
      end
      attr_reader :inbound_ach

      sig do
        params(
          inbound_ach: Increase::AccountNumberCreateParams::InboundACH::OrHash
        ).void
      end
      attr_writer :inbound_ach

      # Options related to how this Account Number should handle inbound check
      # withdrawals.
      sig do
        returns(T.nilable(Increase::AccountNumberCreateParams::InboundChecks))
      end
      attr_reader :inbound_checks

      sig do
        params(
          inbound_checks:
            Increase::AccountNumberCreateParams::InboundChecks::OrHash
        ).void
      end
      attr_writer :inbound_checks

      sig do
        params(
          account_id: String,
          name: String,
          inbound_ach: Increase::AccountNumberCreateParams::InboundACH::OrHash,
          inbound_checks:
            Increase::AccountNumberCreateParams::InboundChecks::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The Account the Account Number should belong to.
        account_id:,
        # The name you choose for the Account Number.
        name:,
        # Options related to how this Account Number should handle inbound ACH transfers.
        inbound_ach: nil,
        # Options related to how this Account Number should handle inbound check
        # withdrawals.
        inbound_checks: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            name: String,
            inbound_ach: Increase::AccountNumberCreateParams::InboundACH,
            inbound_checks: Increase::AccountNumberCreateParams::InboundChecks,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      class InboundACH < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

        # Whether ACH debits are allowed against this Account Number. Note that ACH debits
        # will be declined if this is `allowed` but the Account Number is not active. If
        # you do not specify this field, the default is `allowed`.
        sig do
          returns(
            Increase::AccountNumberCreateParams::InboundACH::DebitStatus::OrSymbol
          )
        end
        attr_accessor :debit_status

        # Options related to how this Account Number should handle inbound ACH transfers.
        sig do
          params(
            debit_status:
              Increase::AccountNumberCreateParams::InboundACH::DebitStatus::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Whether ACH debits are allowed against this Account Number. Note that ACH debits
          # will be declined if this is `allowed` but the Account Number is not active. If
          # you do not specify this field, the default is `allowed`.
          debit_status:
        )
        end

        sig do
          override.returns(
            {
              debit_status:
                Increase::AccountNumberCreateParams::InboundACH::DebitStatus::OrSymbol
            }
          )
        end
        def to_hash
        end

        # Whether ACH debits are allowed against this Account Number. Note that ACH debits
        # will be declined if this is `allowed` but the Account Number is not active. If
        # you do not specify this field, the default is `allowed`.
        module DebitStatus
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::AccountNumberCreateParams::InboundACH::DebitStatus
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # ACH Debits are allowed.
          ALLOWED =
            T.let(
              :allowed,
              Increase::AccountNumberCreateParams::InboundACH::DebitStatus::TaggedSymbol
            )

          # ACH Debits are blocked.
          BLOCKED =
            T.let(
              :blocked,
              Increase::AccountNumberCreateParams::InboundACH::DebitStatus::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::AccountNumberCreateParams::InboundACH::DebitStatus::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class InboundChecks < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

        # How Increase should process checks with this account number printed on them. If
        # you do not specify this field, the default is `check_transfers_only`.
        sig do
          returns(
            Increase::AccountNumberCreateParams::InboundChecks::Status::OrSymbol
          )
        end
        attr_accessor :status

        # Options related to how this Account Number should handle inbound check
        # withdrawals.
        sig do
          params(
            status:
              Increase::AccountNumberCreateParams::InboundChecks::Status::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # How Increase should process checks with this account number printed on them. If
          # you do not specify this field, the default is `check_transfers_only`.
          status:
        )
        end

        sig do
          override.returns(
            {
              status:
                Increase::AccountNumberCreateParams::InboundChecks::Status::OrSymbol
            }
          )
        end
        def to_hash
        end

        # How Increase should process checks with this account number printed on them. If
        # you do not specify this field, the default is `check_transfers_only`.
        module Status
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::AccountNumberCreateParams::InboundChecks::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Checks with this Account Number will be processed even if they are not associated with a Check Transfer.
          ALLOWED =
            T.let(
              :allowed,
              Increase::AccountNumberCreateParams::InboundChecks::Status::TaggedSymbol
            )

          # Checks with this Account Number will be processed only if they can be matched to an existing Check Transfer.
          CHECK_TRANSFERS_ONLY =
            T.let(
              :check_transfers_only,
              Increase::AccountNumberCreateParams::InboundChecks::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::AccountNumberCreateParams::InboundChecks::Status::TaggedSymbol
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
