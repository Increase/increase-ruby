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

      # The person or business that is receiving the funds from the transfer.
      sig { returns(Increase::WireTransferCreateParams::Creditor) }
      attr_reader :creditor

      sig do
        params(
          creditor: Increase::WireTransferCreateParams::Creditor::OrHash
        ).void
      end
      attr_writer :creditor

      # Additional remittance information related to the wire transfer.
      sig { returns(Increase::WireTransferCreateParams::Remittance) }
      attr_reader :remittance

      sig do
        params(
          remittance: Increase::WireTransferCreateParams::Remittance::OrHash
        ).void
      end
      attr_writer :remittance

      # The account number for the destination account.
      sig { returns(T.nilable(String)) }
      attr_reader :account_number

      sig { params(account_number: String).void }
      attr_writer :account_number

      # The person or business whose funds are being transferred. This is only necessary
      # if you're transferring from a commingled account. Otherwise, we'll use the
      # associated entity's details.
      sig { returns(T.nilable(Increase::WireTransferCreateParams::Debtor)) }
      attr_reader :debtor

      sig do
        params(debtor: Increase::WireTransferCreateParams::Debtor::OrHash).void
      end
      attr_writer :debtor

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
          creditor: Increase::WireTransferCreateParams::Creditor::OrHash,
          remittance: Increase::WireTransferCreateParams::Remittance::OrHash,
          account_number: String,
          debtor: Increase::WireTransferCreateParams::Debtor::OrHash,
          external_account_id: String,
          inbound_wire_drawdown_request_id: String,
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
        # The person or business that is receiving the funds from the transfer.
        creditor:,
        # Additional remittance information related to the wire transfer.
        remittance:,
        # The account number for the destination account.
        account_number: nil,
        # The person or business whose funds are being transferred. This is only necessary
        # if you're transferring from a commingled account. Otherwise, we'll use the
        # associated entity's details.
        debtor: nil,
        # The ID of an External Account to initiate a transfer to. If this parameter is
        # provided, `account_number` and `routing_number` must be absent.
        external_account_id: nil,
        # The ID of an Inbound Wire Drawdown Request in response to which this transfer is
        # being sent.
        inbound_wire_drawdown_request_id: nil,
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
            creditor: Increase::WireTransferCreateParams::Creditor,
            remittance: Increase::WireTransferCreateParams::Remittance,
            account_number: String,
            debtor: Increase::WireTransferCreateParams::Debtor,
            external_account_id: String,
            inbound_wire_drawdown_request_id: String,
            require_approval: T::Boolean,
            routing_number: String,
            source_account_number_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Creditor < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::WireTransferCreateParams::Creditor,
              Increase::Internal::AnyHash
            )
          end

        # The person or business's name.
        sig { returns(String) }
        attr_accessor :name

        # The person or business's address.
        sig do
          returns(
            T.nilable(Increase::WireTransferCreateParams::Creditor::Address)
          )
        end
        attr_reader :address

        sig do
          params(
            address:
              Increase::WireTransferCreateParams::Creditor::Address::OrHash
          ).void
        end
        attr_writer :address

        # The person or business that is receiving the funds from the transfer.
        sig do
          params(
            name: String,
            address:
              Increase::WireTransferCreateParams::Creditor::Address::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The person or business's name.
          name:,
          # The person or business's address.
          address: nil
        )
        end

        sig do
          override.returns(
            {
              name: String,
              address: Increase::WireTransferCreateParams::Creditor::Address
            }
          )
        end
        def to_hash
        end

        class Address < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::WireTransferCreateParams::Creditor::Address,
                Increase::Internal::AnyHash
              )
            end

          # Unstructured address lines.
          sig do
            returns(
              Increase::WireTransferCreateParams::Creditor::Address::Unstructured
            )
          end
          attr_reader :unstructured

          sig do
            params(
              unstructured:
                Increase::WireTransferCreateParams::Creditor::Address::Unstructured::OrHash
            ).void
          end
          attr_writer :unstructured

          # The person or business's address.
          sig do
            params(
              unstructured:
                Increase::WireTransferCreateParams::Creditor::Address::Unstructured::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Unstructured address lines.
            unstructured:
          )
          end

          sig do
            override.returns(
              {
                unstructured:
                  Increase::WireTransferCreateParams::Creditor::Address::Unstructured
              }
            )
          end
          def to_hash
          end

          class Unstructured < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::WireTransferCreateParams::Creditor::Address::Unstructured,
                  Increase::Internal::AnyHash
                )
              end

            # The address line 1.
            sig { returns(String) }
            attr_accessor :line1

            # The address line 2.
            sig { returns(T.nilable(String)) }
            attr_reader :line2

            sig { params(line2: String).void }
            attr_writer :line2

            # The address line 3.
            sig { returns(T.nilable(String)) }
            attr_reader :line3

            sig { params(line3: String).void }
            attr_writer :line3

            # Unstructured address lines.
            sig do
              params(line1: String, line2: String, line3: String).returns(
                T.attached_class
              )
            end
            def self.new(
              # The address line 1.
              line1:,
              # The address line 2.
              line2: nil,
              # The address line 3.
              line3: nil
            )
            end

            sig do
              override.returns({ line1: String, line2: String, line3: String })
            end
            def to_hash
            end
          end
        end
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

          # The information.
          sig { returns(String) }
          attr_accessor :message

          # Unstructured remittance information. Required if `category` is equal to
          # `unstructured`.
          sig { params(message: String).returns(T.attached_class) }
          def self.new(
            # The information.
            message:
          )
          end

          sig { override.returns({ message: String }) }
          def to_hash
          end
        end
      end

      class Debtor < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::WireTransferCreateParams::Debtor,
              Increase::Internal::AnyHash
            )
          end

        # The person or business's name.
        sig { returns(String) }
        attr_accessor :name

        # The person or business's address.
        sig do
          returns(
            T.nilable(Increase::WireTransferCreateParams::Debtor::Address)
          )
        end
        attr_reader :address

        sig do
          params(
            address: Increase::WireTransferCreateParams::Debtor::Address::OrHash
          ).void
        end
        attr_writer :address

        # The person or business whose funds are being transferred. This is only necessary
        # if you're transferring from a commingled account. Otherwise, we'll use the
        # associated entity's details.
        sig do
          params(
            name: String,
            address: Increase::WireTransferCreateParams::Debtor::Address::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The person or business's name.
          name:,
          # The person or business's address.
          address: nil
        )
        end

        sig do
          override.returns(
            {
              name: String,
              address: Increase::WireTransferCreateParams::Debtor::Address
            }
          )
        end
        def to_hash
        end

        class Address < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::WireTransferCreateParams::Debtor::Address,
                Increase::Internal::AnyHash
              )
            end

          # Unstructured address lines.
          sig do
            returns(
              Increase::WireTransferCreateParams::Debtor::Address::Unstructured
            )
          end
          attr_reader :unstructured

          sig do
            params(
              unstructured:
                Increase::WireTransferCreateParams::Debtor::Address::Unstructured::OrHash
            ).void
          end
          attr_writer :unstructured

          # The person or business's address.
          sig do
            params(
              unstructured:
                Increase::WireTransferCreateParams::Debtor::Address::Unstructured::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Unstructured address lines.
            unstructured:
          )
          end

          sig do
            override.returns(
              {
                unstructured:
                  Increase::WireTransferCreateParams::Debtor::Address::Unstructured
              }
            )
          end
          def to_hash
          end

          class Unstructured < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::WireTransferCreateParams::Debtor::Address::Unstructured,
                  Increase::Internal::AnyHash
                )
              end

            # The address line 1.
            sig { returns(String) }
            attr_accessor :line1

            # The address line 2.
            sig { returns(T.nilable(String)) }
            attr_reader :line2

            sig { params(line2: String).void }
            attr_writer :line2

            # The address line 3.
            sig { returns(T.nilable(String)) }
            attr_reader :line3

            sig { params(line3: String).void }
            attr_writer :line3

            # Unstructured address lines.
            sig do
              params(line1: String, line2: String, line3: String).returns(
                T.attached_class
              )
            end
            def self.new(
              # The address line 1.
              line1:,
              # The address line 2.
              line2: nil,
              # The address line 3.
              line3: nil
            )
            end

            sig do
              override.returns({ line1: String, line2: String, line3: String })
            end
            def to_hash
            end
          end
        end
      end
    end
  end
end
