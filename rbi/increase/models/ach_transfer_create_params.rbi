# typed: strong

module Increase
  module Models
    class ACHTransferCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash = T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

      # The Increase identifier for the account that will send the transfer.
      sig { returns(String) }
      attr_accessor :account_id

      # The transfer amount in USD cents. A positive amount originates a credit transfer
      # pushing funds to the receiving account. A negative amount originates a debit
      # transfer pulling funds from the receiving account.
      sig { returns(Integer) }
      attr_accessor :amount

      # A description you choose to give the transfer. This will be saved with the
      # transfer details, displayed in the dashboard, and returned by the API. If
      # `individual_name` and `company_name` are not explicitly set by this API, the
      # `statement_descriptor` will be sent in those fields to the receiving bank to
      # help the customer recognize the transfer. You are highly encouraged to pass
      # `individual_name` and `company_name` instead of relying on this fallback.
      sig { returns(String) }
      attr_accessor :statement_descriptor

      # The account number for the destination account.
      sig { returns(T.nilable(String)) }
      attr_reader :account_number

      sig { params(account_number: String).void }
      attr_writer :account_number

      # Additional information that will be sent to the recipient. This is included in
      # the transfer data sent to the receiving bank.
      sig { returns(T.nilable(Increase::ACHTransferCreateParams::Addenda)) }
      attr_reader :addenda

      sig do
        params(addenda: Increase::ACHTransferCreateParams::Addenda::OrHash).void
      end
      attr_writer :addenda

      # The description of the date of the transfer, usually in the format `YYMMDD`.
      # This is included in the transfer data sent to the receiving bank.
      sig { returns(T.nilable(String)) }
      attr_reader :company_descriptive_date

      sig { params(company_descriptive_date: String).void }
      attr_writer :company_descriptive_date

      # The data you choose to associate with the transfer. This is included in the
      # transfer data sent to the receiving bank.
      sig { returns(T.nilable(String)) }
      attr_reader :company_discretionary_data

      sig { params(company_discretionary_data: String).void }
      attr_writer :company_discretionary_data

      # A description of the transfer. This is included in the transfer data sent to the
      # receiving bank.
      sig { returns(T.nilable(String)) }
      attr_reader :company_entry_description

      sig { params(company_entry_description: String).void }
      attr_writer :company_entry_description

      # The name by which the recipient knows you. This is included in the transfer data
      # sent to the receiving bank.
      sig { returns(T.nilable(String)) }
      attr_reader :company_name

      sig { params(company_name: String).void }
      attr_writer :company_name

      # The type of entity that owns the account to which the ACH Transfer is being
      # sent.
      sig do
        returns(
          T.nilable(
            Increase::ACHTransferCreateParams::DestinationAccountHolder::OrSymbol
          )
        )
      end
      attr_reader :destination_account_holder

      sig do
        params(
          destination_account_holder:
            Increase::ACHTransferCreateParams::DestinationAccountHolder::OrSymbol
        ).void
      end
      attr_writer :destination_account_holder

      # The ID of an External Account to initiate a transfer to. If this parameter is
      # provided, `account_number`, `routing_number`, and `funding` must be absent.
      sig { returns(T.nilable(String)) }
      attr_reader :external_account_id

      sig { params(external_account_id: String).void }
      attr_writer :external_account_id

      # The type of the account to which the transfer will be sent.
      sig do
        returns(T.nilable(Increase::ACHTransferCreateParams::Funding::OrSymbol))
      end
      attr_reader :funding

      sig do
        params(
          funding: Increase::ACHTransferCreateParams::Funding::OrSymbol
        ).void
      end
      attr_writer :funding

      # Your identifier for the transfer recipient.
      sig { returns(T.nilable(String)) }
      attr_reader :individual_id

      sig { params(individual_id: String).void }
      attr_writer :individual_id

      # The name of the transfer recipient. This value is informational and not verified
      # by the recipient's bank.
      sig { returns(T.nilable(String)) }
      attr_reader :individual_name

      sig { params(individual_name: String).void }
      attr_writer :individual_name

      # Configuration for how the effective date of the transfer will be set. This
      # determines same-day vs future-dated settlement timing. If not set, defaults to a
      # `settlement_schedule` of `same_day`. If set, exactly one of the child attributes
      # must be set.
      sig do
        returns(
          T.nilable(Increase::ACHTransferCreateParams::PreferredEffectiveDate)
        )
      end
      attr_reader :preferred_effective_date

      sig do
        params(
          preferred_effective_date:
            Increase::ACHTransferCreateParams::PreferredEffectiveDate::OrHash
        ).void
      end
      attr_writer :preferred_effective_date

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

      # The Standard Entry Class (SEC) code to use for the transfer.
      sig do
        returns(
          T.nilable(
            Increase::ACHTransferCreateParams::StandardEntryClassCode::OrSymbol
          )
        )
      end
      attr_reader :standard_entry_class_code

      sig do
        params(
          standard_entry_class_code:
            Increase::ACHTransferCreateParams::StandardEntryClassCode::OrSymbol
        ).void
      end
      attr_writer :standard_entry_class_code

      # The timing of the transaction.
      sig do
        returns(
          T.nilable(
            Increase::ACHTransferCreateParams::TransactionTiming::OrSymbol
          )
        )
      end
      attr_reader :transaction_timing

      sig do
        params(
          transaction_timing:
            Increase::ACHTransferCreateParams::TransactionTiming::OrSymbol
        ).void
      end
      attr_writer :transaction_timing

      sig do
        params(
          account_id: String,
          amount: Integer,
          statement_descriptor: String,
          account_number: String,
          addenda: Increase::ACHTransferCreateParams::Addenda::OrHash,
          company_descriptive_date: String,
          company_discretionary_data: String,
          company_entry_description: String,
          company_name: String,
          destination_account_holder:
            Increase::ACHTransferCreateParams::DestinationAccountHolder::OrSymbol,
          external_account_id: String,
          funding: Increase::ACHTransferCreateParams::Funding::OrSymbol,
          individual_id: String,
          individual_name: String,
          preferred_effective_date:
            Increase::ACHTransferCreateParams::PreferredEffectiveDate::OrHash,
          require_approval: T::Boolean,
          routing_number: String,
          standard_entry_class_code:
            Increase::ACHTransferCreateParams::StandardEntryClassCode::OrSymbol,
          transaction_timing:
            Increase::ACHTransferCreateParams::TransactionTiming::OrSymbol,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The Increase identifier for the account that will send the transfer.
        account_id:,
        # The transfer amount in USD cents. A positive amount originates a credit transfer
        # pushing funds to the receiving account. A negative amount originates a debit
        # transfer pulling funds from the receiving account.
        amount:,
        # A description you choose to give the transfer. This will be saved with the
        # transfer details, displayed in the dashboard, and returned by the API. If
        # `individual_name` and `company_name` are not explicitly set by this API, the
        # `statement_descriptor` will be sent in those fields to the receiving bank to
        # help the customer recognize the transfer. You are highly encouraged to pass
        # `individual_name` and `company_name` instead of relying on this fallback.
        statement_descriptor:,
        # The account number for the destination account.
        account_number: nil,
        # Additional information that will be sent to the recipient. This is included in
        # the transfer data sent to the receiving bank.
        addenda: nil,
        # The description of the date of the transfer, usually in the format `YYMMDD`.
        # This is included in the transfer data sent to the receiving bank.
        company_descriptive_date: nil,
        # The data you choose to associate with the transfer. This is included in the
        # transfer data sent to the receiving bank.
        company_discretionary_data: nil,
        # A description of the transfer. This is included in the transfer data sent to the
        # receiving bank.
        company_entry_description: nil,
        # The name by which the recipient knows you. This is included in the transfer data
        # sent to the receiving bank.
        company_name: nil,
        # The type of entity that owns the account to which the ACH Transfer is being
        # sent.
        destination_account_holder: nil,
        # The ID of an External Account to initiate a transfer to. If this parameter is
        # provided, `account_number`, `routing_number`, and `funding` must be absent.
        external_account_id: nil,
        # The type of the account to which the transfer will be sent.
        funding: nil,
        # Your identifier for the transfer recipient.
        individual_id: nil,
        # The name of the transfer recipient. This value is informational and not verified
        # by the recipient's bank.
        individual_name: nil,
        # Configuration for how the effective date of the transfer will be set. This
        # determines same-day vs future-dated settlement timing. If not set, defaults to a
        # `settlement_schedule` of `same_day`. If set, exactly one of the child attributes
        # must be set.
        preferred_effective_date: nil,
        # Whether the transfer requires explicit approval via the dashboard or API.
        require_approval: nil,
        # The American Bankers' Association (ABA) Routing Transit Number (RTN) for the
        # destination account.
        routing_number: nil,
        # The Standard Entry Class (SEC) code to use for the transfer.
        standard_entry_class_code: nil,
        # The timing of the transaction.
        transaction_timing: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            amount: Integer,
            statement_descriptor: String,
            account_number: String,
            addenda: Increase::ACHTransferCreateParams::Addenda,
            company_descriptive_date: String,
            company_discretionary_data: String,
            company_entry_description: String,
            company_name: String,
            destination_account_holder:
              Increase::ACHTransferCreateParams::DestinationAccountHolder::OrSymbol,
            external_account_id: String,
            funding: Increase::ACHTransferCreateParams::Funding::OrSymbol,
            individual_id: String,
            individual_name: String,
            preferred_effective_date:
              Increase::ACHTransferCreateParams::PreferredEffectiveDate,
            require_approval: T::Boolean,
            routing_number: String,
            standard_entry_class_code:
              Increase::ACHTransferCreateParams::StandardEntryClassCode::OrSymbol,
            transaction_timing:
              Increase::ACHTransferCreateParams::TransactionTiming::OrSymbol,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Addenda < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

        # The type of addenda to pass with the transfer.
        sig do
          returns(
            Increase::ACHTransferCreateParams::Addenda::Category::OrSymbol
          )
        end
        attr_accessor :category

        # Unstructured `payment_related_information` passed through with the transfer.
        sig do
          returns(
            T.nilable(Increase::ACHTransferCreateParams::Addenda::Freeform)
          )
        end
        attr_reader :freeform

        sig do
          params(
            freeform:
              Increase::ACHTransferCreateParams::Addenda::Freeform::OrHash
          ).void
        end
        attr_writer :freeform

        # Structured ASC X12 820 remittance advice records. Please reach out to
        # [support@increase.com](mailto:support@increase.com) for more information.
        sig do
          returns(
            T.nilable(
              Increase::ACHTransferCreateParams::Addenda::PaymentOrderRemittanceAdvice
            )
          )
        end
        attr_reader :payment_order_remittance_advice

        sig do
          params(
            payment_order_remittance_advice:
              Increase::ACHTransferCreateParams::Addenda::PaymentOrderRemittanceAdvice::OrHash
          ).void
        end
        attr_writer :payment_order_remittance_advice

        # Additional information that will be sent to the recipient. This is included in
        # the transfer data sent to the receiving bank.
        sig do
          params(
            category:
              Increase::ACHTransferCreateParams::Addenda::Category::OrSymbol,
            freeform:
              Increase::ACHTransferCreateParams::Addenda::Freeform::OrHash,
            payment_order_remittance_advice:
              Increase::ACHTransferCreateParams::Addenda::PaymentOrderRemittanceAdvice::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The type of addenda to pass with the transfer.
          category:,
          # Unstructured `payment_related_information` passed through with the transfer.
          freeform: nil,
          # Structured ASC X12 820 remittance advice records. Please reach out to
          # [support@increase.com](mailto:support@increase.com) for more information.
          payment_order_remittance_advice: nil
        )
        end

        sig do
          override.returns(
            {
              category:
                Increase::ACHTransferCreateParams::Addenda::Category::OrSymbol,
              freeform: Increase::ACHTransferCreateParams::Addenda::Freeform,
              payment_order_remittance_advice:
                Increase::ACHTransferCreateParams::Addenda::PaymentOrderRemittanceAdvice
            }
          )
        end
        def to_hash
        end

        # The type of addenda to pass with the transfer.
        module Category
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::ACHTransferCreateParams::Addenda::Category
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Unstructured `payment_related_information` passed through with the transfer.
          FREEFORM =
            T.let(
              :freeform,
              Increase::ACHTransferCreateParams::Addenda::Category::TaggedSymbol
            )

          # Structured ASC X12 820 remittance advice records. Please reach out to [support@increase.com](mailto:support@increase.com) for more information.
          PAYMENT_ORDER_REMITTANCE_ADVICE =
            T.let(
              :payment_order_remittance_advice,
              Increase::ACHTransferCreateParams::Addenda::Category::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::ACHTransferCreateParams::Addenda::Category::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Freeform < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

          # Each entry represents an addendum sent with the transfer. Please reach out to
          # [support@increase.com](mailto:support@increase.com) to send more than one
          # addendum.
          sig do
            returns(
              T::Array[
                Increase::ACHTransferCreateParams::Addenda::Freeform::Entry
              ]
            )
          end
          attr_accessor :entries

          # Unstructured `payment_related_information` passed through with the transfer.
          sig do
            params(
              entries:
                T::Array[
                  Increase::ACHTransferCreateParams::Addenda::Freeform::Entry::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(
            # Each entry represents an addendum sent with the transfer. Please reach out to
            # [support@increase.com](mailto:support@increase.com) to send more than one
            # addendum.
            entries:
          )
          end

          sig do
            override.returns(
              {
                entries:
                  T::Array[
                    Increase::ACHTransferCreateParams::Addenda::Freeform::Entry
                  ]
              }
            )
          end
          def to_hash
          end

          class Entry < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

            # The payment related information passed in the addendum.
            sig { returns(String) }
            attr_accessor :payment_related_information

            sig do
              params(payment_related_information: String).returns(
                T.attached_class
              )
            end
            def self.new(
              # The payment related information passed in the addendum.
              payment_related_information:
            )
            end

            sig { override.returns({ payment_related_information: String }) }
            def to_hash
            end
          end
        end

        class PaymentOrderRemittanceAdvice < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

          # ASC X12 RMR records for this specific transfer.
          sig do
            returns(
              T::Array[
                Increase::ACHTransferCreateParams::Addenda::PaymentOrderRemittanceAdvice::Invoice
              ]
            )
          end
          attr_accessor :invoices

          # Structured ASC X12 820 remittance advice records. Please reach out to
          # [support@increase.com](mailto:support@increase.com) for more information.
          sig do
            params(
              invoices:
                T::Array[
                  Increase::ACHTransferCreateParams::Addenda::PaymentOrderRemittanceAdvice::Invoice::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(
            # ASC X12 RMR records for this specific transfer.
            invoices:
          )
          end

          sig do
            override.returns(
              {
                invoices:
                  T::Array[
                    Increase::ACHTransferCreateParams::Addenda::PaymentOrderRemittanceAdvice::Invoice
                  ]
              }
            )
          end
          def to_hash
          end

          class Invoice < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

            # The invoice number for this reference, determined in advance with the receiver.
            sig { returns(String) }
            attr_accessor :invoice_number

            # The amount that was paid for this invoice in the minor unit of its currency. For
            # dollars, for example, this is cents.
            sig { returns(Integer) }
            attr_accessor :paid_amount

            sig do
              params(invoice_number: String, paid_amount: Integer).returns(
                T.attached_class
              )
            end
            def self.new(
              # The invoice number for this reference, determined in advance with the receiver.
              invoice_number:,
              # The amount that was paid for this invoice in the minor unit of its currency. For
              # dollars, for example, this is cents.
              paid_amount:
            )
            end

            sig do
              override.returns({ invoice_number: String, paid_amount: Integer })
            end
            def to_hash
            end
          end
        end
      end

      # The type of entity that owns the account to which the ACH Transfer is being
      # sent.
      module DestinationAccountHolder
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              Increase::ACHTransferCreateParams::DestinationAccountHolder
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The External Account is owned by a business.
        BUSINESS =
          T.let(
            :business,
            Increase::ACHTransferCreateParams::DestinationAccountHolder::TaggedSymbol
          )

        # The External Account is owned by an individual.
        INDIVIDUAL =
          T.let(
            :individual,
            Increase::ACHTransferCreateParams::DestinationAccountHolder::TaggedSymbol
          )

        # It's unknown what kind of entity owns the External Account.
        UNKNOWN =
          T.let(
            :unknown,
            Increase::ACHTransferCreateParams::DestinationAccountHolder::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Increase::ACHTransferCreateParams::DestinationAccountHolder::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # The type of the account to which the transfer will be sent.
      module Funding
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::ACHTransferCreateParams::Funding)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # A checking account.
        CHECKING =
          T.let(
            :checking,
            Increase::ACHTransferCreateParams::Funding::TaggedSymbol
          )

        # A savings account.
        SAVINGS =
          T.let(
            :savings,
            Increase::ACHTransferCreateParams::Funding::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::ACHTransferCreateParams::Funding::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class PreferredEffectiveDate < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

        # A specific date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format to
        # use as the effective date when submitting this transfer.
        sig { returns(T.nilable(Date)) }
        attr_reader :date

        sig { params(date: Date).void }
        attr_writer :date

        # A schedule by which Increase will choose an effective date for the transfer.
        sig do
          returns(
            T.nilable(
              Increase::ACHTransferCreateParams::PreferredEffectiveDate::SettlementSchedule::OrSymbol
            )
          )
        end
        attr_reader :settlement_schedule

        sig do
          params(
            settlement_schedule:
              Increase::ACHTransferCreateParams::PreferredEffectiveDate::SettlementSchedule::OrSymbol
          ).void
        end
        attr_writer :settlement_schedule

        # Configuration for how the effective date of the transfer will be set. This
        # determines same-day vs future-dated settlement timing. If not set, defaults to a
        # `settlement_schedule` of `same_day`. If set, exactly one of the child attributes
        # must be set.
        sig do
          params(
            date: Date,
            settlement_schedule:
              Increase::ACHTransferCreateParams::PreferredEffectiveDate::SettlementSchedule::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # A specific date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format to
          # use as the effective date when submitting this transfer.
          date: nil,
          # A schedule by which Increase will choose an effective date for the transfer.
          settlement_schedule: nil
        )
        end

        sig do
          override.returns(
            {
              date: Date,
              settlement_schedule:
                Increase::ACHTransferCreateParams::PreferredEffectiveDate::SettlementSchedule::OrSymbol
            }
          )
        end
        def to_hash
        end

        # A schedule by which Increase will choose an effective date for the transfer.
        module SettlementSchedule
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::ACHTransferCreateParams::PreferredEffectiveDate::SettlementSchedule
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The chosen effective date will be the same as the ACH processing date on which the transfer is submitted. This is necessary, but not sufficient for the transfer to be settled same-day: it must also be submitted before the last same-day cutoff and be less than or equal to $1,000.000.00.
          SAME_DAY =
            T.let(
              :same_day,
              Increase::ACHTransferCreateParams::PreferredEffectiveDate::SettlementSchedule::TaggedSymbol
            )

          # The chosen effective date will be the business day following the ACH processing date on which the transfer is submitted. The transfer will be settled on that future day.
          FUTURE_DATED =
            T.let(
              :future_dated,
              Increase::ACHTransferCreateParams::PreferredEffectiveDate::SettlementSchedule::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::ACHTransferCreateParams::PreferredEffectiveDate::SettlementSchedule::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # The Standard Entry Class (SEC) code to use for the transfer.
      module StandardEntryClassCode
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              Increase::ACHTransferCreateParams::StandardEntryClassCode
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # Corporate Credit and Debit (CCD).
        CORPORATE_CREDIT_OR_DEBIT =
          T.let(
            :corporate_credit_or_debit,
            Increase::ACHTransferCreateParams::StandardEntryClassCode::TaggedSymbol
          )

        # Corporate Trade Exchange (CTX).
        CORPORATE_TRADE_EXCHANGE =
          T.let(
            :corporate_trade_exchange,
            Increase::ACHTransferCreateParams::StandardEntryClassCode::TaggedSymbol
          )

        # Prearranged Payments and Deposits (PPD).
        PREARRANGED_PAYMENTS_AND_DEPOSIT =
          T.let(
            :prearranged_payments_and_deposit,
            Increase::ACHTransferCreateParams::StandardEntryClassCode::TaggedSymbol
          )

        # Internet Initiated (WEB).
        INTERNET_INITIATED =
          T.let(
            :internet_initiated,
            Increase::ACHTransferCreateParams::StandardEntryClassCode::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Increase::ACHTransferCreateParams::StandardEntryClassCode::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # The timing of the transaction.
      module TransactionTiming
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::ACHTransferCreateParams::TransactionTiming)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # A Transaction will be created immediately.
        SYNCHRONOUS =
          T.let(
            :synchronous,
            Increase::ACHTransferCreateParams::TransactionTiming::TaggedSymbol
          )

        # A Transaction will be created when the funds settle at the Federal Reserve.
        ASYNCHRONOUS =
          T.let(
            :asynchronous,
            Increase::ACHTransferCreateParams::TransactionTiming::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Increase::ACHTransferCreateParams::TransactionTiming::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
