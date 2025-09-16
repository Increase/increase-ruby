# typed: strong

module Increase
  module Models
    class WireTransferCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Increase::WireTransferCreateParams, Increase::Internal::AnyHash)
        end

      # The identifier for the account that will send the transfer.
      sig { returns(String) }
      attr_accessor :account_id

      # The transfer amount in USD cents.
      sig { returns(Integer) }
      attr_accessor :amount

      # The beneficiary's name.
      sig { returns(String) }
      attr_accessor :beneficiary_name

      # The account number for the destination account.
      sig { returns(T.nilable(String)) }
      attr_reader :account_number

      sig { params(account_number: String).void }
      attr_writer :account_number

      # The beneficiary's address line 1.
      sig { returns(T.nilable(String)) }
      attr_reader :beneficiary_address_line1

      sig { params(beneficiary_address_line1: String).void }
      attr_writer :beneficiary_address_line1

      # The beneficiary's address line 2.
      sig { returns(T.nilable(String)) }
      attr_reader :beneficiary_address_line2

      sig { params(beneficiary_address_line2: String).void }
      attr_writer :beneficiary_address_line2

      # The beneficiary's address line 3.
      sig { returns(T.nilable(String)) }
      attr_reader :beneficiary_address_line3

      sig { params(beneficiary_address_line3: String).void }
      attr_writer :beneficiary_address_line3

      # The ID of an External Account to initiate a transfer to. If this parameter is
      # provided, `account_number` and `routing_number` must be absent.
      sig { returns(T.nilable(String)) }
      attr_reader :external_account_id

      sig { params(external_account_id: String).void }
      attr_writer :external_account_id

      # The ID of an Inbound Wire Drawdown Request in response to which this transfer is
      # being sent.
      sig { returns(T.nilable(String)) }
      attr_reader :inbound_wire_drawdown_request_id

      sig { params(inbound_wire_drawdown_request_id: String).void }
      attr_writer :inbound_wire_drawdown_request_id

      # The originator's address line 1. This is only necessary if you're transferring
      # from a commingled account. Otherwise, we'll use the associated entity's details.
      sig { returns(T.nilable(String)) }
      attr_reader :originator_address_line1

      sig { params(originator_address_line1: String).void }
      attr_writer :originator_address_line1

      # The originator's address line 2. This is only necessary if you're transferring
      # from a commingled account. Otherwise, we'll use the associated entity's details.
      sig { returns(T.nilable(String)) }
      attr_reader :originator_address_line2

      sig { params(originator_address_line2: String).void }
      attr_writer :originator_address_line2

      # The originator's address line 3. This is only necessary if you're transferring
      # from a commingled account. Otherwise, we'll use the associated entity's details.
      sig { returns(T.nilable(String)) }
      attr_reader :originator_address_line3

      sig { params(originator_address_line3: String).void }
      attr_writer :originator_address_line3

      # The originator's name. This is only necessary if you're transferring from a
      # commingled account. Otherwise, we'll use the associated entity's details.
      sig { returns(T.nilable(String)) }
      attr_reader :originator_name

      sig { params(originator_name: String).void }
      attr_writer :originator_name

      # Additional remittance information related to the wire transfer.
      sig { returns(T.nilable(Increase::WireTransferCreateParams::Remittance)) }
      attr_reader :remittance

      sig do
        params(
          remittance: Increase::WireTransferCreateParams::Remittance::OrHash
        ).void
      end
      attr_writer :remittance

      # Whether the transfer requires explicit approval via the dashboard or API.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :require_approval

      sig { params(require_approval: T::Boolean).void }
      attr_writer :require_approval

      # The American Bankers' Association (ABA) Routing Transit Number (RTN) for the
      # destination account.
      sig { returns(T.nilable(String)) }
      attr_reader :routing_number

      sig { params(routing_number: String).void }
      attr_writer :routing_number

      # The ID of an Account Number that will be passed to the wire's recipient
      sig { returns(T.nilable(String)) }
      attr_reader :source_account_number_id

      sig { params(source_account_number_id: String).void }
      attr_writer :source_account_number_id

      sig do
        params(
          account_id: String,
          amount: Integer,
          beneficiary_name: String,
          account_number: String,
          beneficiary_address_line1: String,
          beneficiary_address_line2: String,
          beneficiary_address_line3: String,
          external_account_id: String,
          inbound_wire_drawdown_request_id: String,
          originator_address_line1: String,
          originator_address_line2: String,
          originator_address_line3: String,
          originator_name: String,
          remittance: Increase::WireTransferCreateParams::Remittance::OrHash,
          require_approval: T::Boolean,
          routing_number: String,
          source_account_number_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier for the account that will send the transfer.
        account_id:,
        # The transfer amount in USD cents.
        amount:,
        # The beneficiary's name.
        beneficiary_name:,
        # The account number for the destination account.
        account_number: nil,
        # The beneficiary's address line 1.
        beneficiary_address_line1: nil,
        # The beneficiary's address line 2.
        beneficiary_address_line2: nil,
        # The beneficiary's address line 3.
        beneficiary_address_line3: nil,
        # The ID of an External Account to initiate a transfer to. If this parameter is
        # provided, `account_number` and `routing_number` must be absent.
        external_account_id: nil,
        # The ID of an Inbound Wire Drawdown Request in response to which this transfer is
        # being sent.
        inbound_wire_drawdown_request_id: nil,
        # The originator's address line 1. This is only necessary if you're transferring
        # from a commingled account. Otherwise, we'll use the associated entity's details.
        originator_address_line1: nil,
        # The originator's address line 2. This is only necessary if you're transferring
        # from a commingled account. Otherwise, we'll use the associated entity's details.
        originator_address_line2: nil,
        # The originator's address line 3. This is only necessary if you're transferring
        # from a commingled account. Otherwise, we'll use the associated entity's details.
        originator_address_line3: nil,
        # The originator's name. This is only necessary if you're transferring from a
        # commingled account. Otherwise, we'll use the associated entity's details.
        originator_name: nil,
        # Additional remittance information related to the wire transfer.
        remittance: nil,
        # Whether the transfer requires explicit approval via the dashboard or API.
        require_approval: nil,
        # The American Bankers' Association (ABA) Routing Transit Number (RTN) for the
        # destination account.
        routing_number: nil,
        # The ID of an Account Number that will be passed to the wire's recipient
        source_account_number_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            amount: Integer,
            beneficiary_name: String,
            account_number: String,
            beneficiary_address_line1: String,
            beneficiary_address_line2: String,
            beneficiary_address_line3: String,
            external_account_id: String,
            inbound_wire_drawdown_request_id: String,
            originator_address_line1: String,
            originator_address_line2: String,
            originator_address_line3: String,
            originator_name: String,
            remittance: Increase::WireTransferCreateParams::Remittance,
            require_approval: T::Boolean,
            routing_number: String,
            source_account_number_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Remittance < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::WireTransferCreateParams::Remittance,
              Increase::Internal::AnyHash
            )
          end

        # The type of remittance information being passed.
        sig do
          returns(
            Increase::WireTransferCreateParams::Remittance::Category::OrSymbol
          )
        end
        attr_accessor :category

        # Internal Revenue Service (IRS) tax repayment information. Required if `category`
        # is equal to `tax`.
        sig do
          returns(
            T.nilable(Increase::WireTransferCreateParams::Remittance::Tax)
          )
        end
        attr_reader :tax

        sig do
          params(
            tax: Increase::WireTransferCreateParams::Remittance::Tax::OrHash
          ).void
        end
        attr_writer :tax

        # Unstructured remittance information. Required if `category` is equal to
        # `unstructured`.
        sig do
          returns(
            T.nilable(
              Increase::WireTransferCreateParams::Remittance::Unstructured
            )
          )
        end
        attr_reader :unstructured

        sig do
          params(
            unstructured:
              Increase::WireTransferCreateParams::Remittance::Unstructured::OrHash
          ).void
        end
        attr_writer :unstructured

        # Additional remittance information related to the wire transfer.
        sig do
          params(
            category:
              Increase::WireTransferCreateParams::Remittance::Category::OrSymbol,
            tax: Increase::WireTransferCreateParams::Remittance::Tax::OrHash,
            unstructured:
              Increase::WireTransferCreateParams::Remittance::Unstructured::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The type of remittance information being passed.
          category:,
          # Internal Revenue Service (IRS) tax repayment information. Required if `category`
          # is equal to `tax`.
          tax: nil,
          # Unstructured remittance information. Required if `category` is equal to
          # `unstructured`.
          unstructured: nil
        )
        end

        sig do
          override.returns(
            {
              category:
                Increase::WireTransferCreateParams::Remittance::Category::OrSymbol,
              tax: Increase::WireTransferCreateParams::Remittance::Tax,
              unstructured:
                Increase::WireTransferCreateParams::Remittance::Unstructured
            }
          )
        end
        def to_hash
        end

        # The type of remittance information being passed.
        module Category
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::WireTransferCreateParams::Remittance::Category
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The wire transfer contains unstructured remittance information.
          UNSTRUCTURED =
            T.let(
              :unstructured,
              Increase::WireTransferCreateParams::Remittance::Category::TaggedSymbol
            )

          # The wire transfer is for tax payment purposes to the Internal Revenue Service (IRS).
          TAX =
            T.let(
              :tax,
              Increase::WireTransferCreateParams::Remittance::Category::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::WireTransferCreateParams::Remittance::Category::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Tax < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::WireTransferCreateParams::Remittance::Tax,
                Increase::Internal::AnyHash
              )
            end

          # The month and year the tax payment is for, in YYYY-MM-DD format. The day is
          # ignored.
          sig { returns(Date) }
          attr_accessor :date

          # The 9-digit Tax Identification Number (TIN) or Employer Identification Number
          # (EIN).
          sig { returns(String) }
          attr_accessor :identification_number

          # The 5-character tax type code.
          sig { returns(String) }
          attr_accessor :type_code

          # Internal Revenue Service (IRS) tax repayment information. Required if `category`
          # is equal to `tax`.
          sig do
            params(
              date: Date,
              identification_number: String,
              type_code: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The month and year the tax payment is for, in YYYY-MM-DD format. The day is
            # ignored.
            date:,
            # The 9-digit Tax Identification Number (TIN) or Employer Identification Number
            # (EIN).
            identification_number:,
            # The 5-character tax type code.
            type_code:
          )
          end

          sig do
            override.returns(
              { date: Date, identification_number: String, type_code: String }
            )
          end
          def to_hash
          end
        end

        class Unstructured < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::WireTransferCreateParams::Remittance::Unstructured,
                Increase::Internal::AnyHash
              )
            end

          # The message to the beneficiary.
          sig { returns(String) }
          attr_accessor :message

          # Unstructured remittance information. Required if `category` is equal to
          # `unstructured`.
          sig { params(message: String).returns(T.attached_class) }
          def self.new(
            # The message to the beneficiary.
            message:
          )
          end

          sig { override.returns({ message: String }) }
          def to_hash
          end
        end
      end
    end
  end
end
