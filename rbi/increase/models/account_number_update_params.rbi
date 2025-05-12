# typed: strong

module Increase
  module Models
    class AccountNumberUpdateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::AccountNumberUpdateParams,
            Increase::Internal::AnyHash
          )
        end

      # Options related to how this Account Number handles inbound ACH transfers.
      sig do
        returns(T.nilable(Increase::AccountNumberUpdateParams::InboundACH))
      end
      attr_reader :inbound_ach

      sig do
        params(
          inbound_ach: Increase::AccountNumberUpdateParams::InboundACH::OrHash
        ).void
      end
      attr_writer :inbound_ach

      # Options related to how this Account Number should handle inbound check
      # withdrawals.
      sig do
        returns(T.nilable(Increase::AccountNumberUpdateParams::InboundChecks))
      end
      attr_reader :inbound_checks

      sig do
        params(
          inbound_checks:
            Increase::AccountNumberUpdateParams::InboundChecks::OrHash
        ).void
      end
      attr_writer :inbound_checks

      # The name you choose for the Account Number.
      sig { returns(T.nilable(String)) }
      attr_reader :name

      sig { params(name: String).void }
      attr_writer :name

      # This indicates if transfers can be made to the Account Number.
      sig do
        returns(
          T.nilable(Increase::AccountNumberUpdateParams::Status::OrSymbol)
        )
      end
      attr_reader :status

      sig do
        params(
          status: Increase::AccountNumberUpdateParams::Status::OrSymbol
        ).void
      end
      attr_writer :status

      sig do
        params(
          inbound_ach: Increase::AccountNumberUpdateParams::InboundACH::OrHash,
          inbound_checks:
            Increase::AccountNumberUpdateParams::InboundChecks::OrHash,
          name: String,
          status: Increase::AccountNumberUpdateParams::Status::OrSymbol,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Options related to how this Account Number handles inbound ACH transfers.
        inbound_ach: nil,
        # Options related to how this Account Number should handle inbound check
        # withdrawals.
        inbound_checks: nil,
        # The name you choose for the Account Number.
        name: nil,
        # This indicates if transfers can be made to the Account Number.
        status: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            inbound_ach: Increase::AccountNumberUpdateParams::InboundACH,
            inbound_checks: Increase::AccountNumberUpdateParams::InboundChecks,
            name: String,
            status: Increase::AccountNumberUpdateParams::Status::OrSymbol,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      class InboundACH < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::AccountNumberUpdateParams::InboundACH,
              Increase::Internal::AnyHash
            )
          end

        # Whether ACH debits are allowed against this Account Number. Note that ACH debits
        # will be declined if this is `allowed` but the Account Number is not active.
        sig do
          returns(
            T.nilable(
              Increase::AccountNumberUpdateParams::InboundACH::DebitStatus::OrSymbol
            )
          )
        end
        attr_reader :debit_status

        sig do
          params(
            debit_status:
              Increase::AccountNumberUpdateParams::InboundACH::DebitStatus::OrSymbol
          ).void
        end
        attr_writer :debit_status

        # Options related to how this Account Number handles inbound ACH transfers.
        sig do
          params(
            debit_status:
              Increase::AccountNumberUpdateParams::InboundACH::DebitStatus::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Whether ACH debits are allowed against this Account Number. Note that ACH debits
          # will be declined if this is `allowed` but the Account Number is not active.
          debit_status: nil
        )
        end

        sig do
          override.returns(
            {
              debit_status:
                Increase::AccountNumberUpdateParams::InboundACH::DebitStatus::OrSymbol
            }
          )
        end
        def to_hash
        end

        # Whether ACH debits are allowed against this Account Number. Note that ACH debits
        # will be declined if this is `allowed` but the Account Number is not active.
        module DebitStatus
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::AccountNumberUpdateParams::InboundACH::DebitStatus
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # ACH Debits are allowed.
          ALLOWED =
            T.let(
              :allowed,
              Increase::AccountNumberUpdateParams::InboundACH::DebitStatus::TaggedSymbol
            )

          # ACH Debits are blocked.
          BLOCKED =
            T.let(
              :blocked,
              Increase::AccountNumberUpdateParams::InboundACH::DebitStatus::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::AccountNumberUpdateParams::InboundACH::DebitStatus::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class InboundChecks < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::AccountNumberUpdateParams::InboundChecks,
              Increase::Internal::AnyHash
            )
          end

        # How Increase should process checks with this account number printed on them.
        sig do
          returns(
            Increase::AccountNumberUpdateParams::InboundChecks::Status::OrSymbol
          )
        end
        attr_accessor :status

        # Options related to how this Account Number should handle inbound check
        # withdrawals.
        sig do
          params(
            status:
              Increase::AccountNumberUpdateParams::InboundChecks::Status::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # How Increase should process checks with this account number printed on them.
          status:
        )
        end

        sig do
          override.returns(
            {
              status:
                Increase::AccountNumberUpdateParams::InboundChecks::Status::OrSymbol
            }
          )
        end
        def to_hash
        end

        # How Increase should process checks with this account number printed on them.
        module Status
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::AccountNumberUpdateParams::InboundChecks::Status
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Checks with this Account Number will be processed even if they are not associated with a Check Transfer.
          ALLOWED =
            T.let(
              :allowed,
              Increase::AccountNumberUpdateParams::InboundChecks::Status::TaggedSymbol
            )

          # Checks with this Account Number will be processed only if they can be matched to an existing Check Transfer.
          CHECK_TRANSFERS_ONLY =
            T.let(
              :check_transfers_only,
              Increase::AccountNumberUpdateParams::InboundChecks::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::AccountNumberUpdateParams::InboundChecks::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # This indicates if transfers can be made to the Account Number.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::AccountNumberUpdateParams::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The account number is active.
        ACTIVE =
          T.let(
            :active,
            Increase::AccountNumberUpdateParams::Status::TaggedSymbol
          )

        # The account number is temporarily disabled.
        DISABLED =
          T.let(
            :disabled,
            Increase::AccountNumberUpdateParams::Status::TaggedSymbol
          )

        # The account number is permanently disabled.
        CANCELED =
          T.let(
            :canceled,
            Increase::AccountNumberUpdateParams::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::AccountNumberUpdateParams::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
