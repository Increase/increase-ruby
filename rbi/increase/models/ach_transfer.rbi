# typed: strong

module Increase
  module Models
    class ACHTransfer < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::ACHTransfer, Increase::Internal::AnyHash)
        end

      # The ACH transfer's identifier.
      sig { returns(String) }
      attr_accessor :id

      # The Account to which the transfer belongs.
      sig { returns(String) }
      attr_accessor :account_id

      # The destination account number.
      sig { returns(String) }
      attr_accessor :account_number

      # After the transfer is acknowledged by FedACH, this will contain supplemental
      # details. The Federal Reserve sends an acknowledgement message for each file that
      # Increase submits.
      sig { returns(T.nilable(Increase::ACHTransfer::Acknowledgement)) }
      attr_reader :acknowledgement

      sig do
        params(
          acknowledgement:
            T.nilable(Increase::ACHTransfer::Acknowledgement::OrHash)
        ).void
      end
      attr_writer :acknowledgement

      # Additional information that will be sent to the recipient.
      sig { returns(T.nilable(Increase::ACHTransfer::Addenda)) }
      attr_reader :addenda

      sig do
        params(addenda: T.nilable(Increase::ACHTransfer::Addenda::OrHash)).void
      end
      attr_writer :addenda

      # The transfer amount in USD cents. A positive amount indicates a credit transfer
      # pushing funds to the receiving account. A negative amount indicates a debit
      # transfer pulling funds from the receiving account.
      sig { returns(Integer) }
      attr_accessor :amount

      # If your account requires approvals for transfers and the transfer was approved,
      # this will contain details of the approval.
      sig { returns(T.nilable(Increase::ACHTransfer::Approval)) }
      attr_reader :approval

      sig do
        params(
          approval: T.nilable(Increase::ACHTransfer::Approval::OrHash)
        ).void
      end
      attr_writer :approval

      # If your account requires approvals for transfers and the transfer was not
      # approved, this will contain details of the cancellation.
      sig { returns(T.nilable(Increase::ACHTransfer::Cancellation)) }
      attr_reader :cancellation

      sig do
        params(
          cancellation: T.nilable(Increase::ACHTransfer::Cancellation::OrHash)
        ).void
      end
      attr_writer :cancellation

      # The description of the date of the transfer.
      sig { returns(T.nilable(String)) }
      attr_accessor :company_descriptive_date

      # The data you chose to associate with the transfer.
      sig { returns(T.nilable(String)) }
      attr_accessor :company_discretionary_data

      # The description of the transfer you set to be shown to the recipient.
      sig { returns(T.nilable(String)) }
      attr_accessor :company_entry_description

      # The company ID associated with the transfer.
      sig { returns(String) }
      attr_accessor :company_id

      # The name by which the recipient knows you.
      sig { returns(T.nilable(String)) }
      attr_accessor :company_name

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      # the transfer was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # What object created the transfer, either via the API or the dashboard.
      sig { returns(T.nilable(Increase::ACHTransfer::CreatedBy)) }
      attr_reader :created_by

      sig do
        params(
          created_by: T.nilable(Increase::ACHTransfer::CreatedBy::OrHash)
        ).void
      end
      attr_writer :created_by

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's
      # currency. For ACH transfers this is always equal to `usd`.
      sig { returns(Increase::ACHTransfer::Currency::TaggedSymbol) }
      attr_accessor :currency

      # The type of entity that owns the account to which the ACH Transfer is being
      # sent.
      sig do
        returns(Increase::ACHTransfer::DestinationAccountHolder::TaggedSymbol)
      end
      attr_accessor :destination_account_holder

      # The identifier of the External Account the transfer was made to, if any.
      sig { returns(T.nilable(String)) }
      attr_accessor :external_account_id

      # The type of the account to which the transfer will be sent.
      sig { returns(Increase::ACHTransfer::Funding::TaggedSymbol) }
      attr_accessor :funding

      # The idempotency key you chose for this object. This value is unique across
      # Increase and is used to ensure that a request is only processed once. Learn more
      # about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # Increase will sometimes hold the funds for ACH debit transfers. If funds are
      # held, this sub-object will contain details of the hold.
      sig { returns(T.nilable(Increase::ACHTransfer::InboundFundsHold)) }
      attr_reader :inbound_funds_hold

      sig do
        params(
          inbound_funds_hold:
            T.nilable(Increase::ACHTransfer::InboundFundsHold::OrHash)
        ).void
      end
      attr_writer :inbound_funds_hold

      # Your identifier for the transfer recipient.
      sig { returns(T.nilable(String)) }
      attr_accessor :individual_id

      # The name of the transfer recipient. This value is information and not verified
      # by the recipient's bank.
      sig { returns(T.nilable(String)) }
      attr_accessor :individual_name

      # The transfer's network.
      sig { returns(Increase::ACHTransfer::Network::TaggedSymbol) }
      attr_accessor :network

      # If the receiving bank accepts the transfer but notifies that future transfers
      # should use different details, this will contain those details.
      sig { returns(T::Array[Increase::ACHTransfer::NotificationsOfChange]) }
      attr_accessor :notifications_of_change

      # The ID for the pending transaction representing the transfer. A pending
      # transaction is created when the transfer
      # [requires approval](https://increase.com/documentation/transfer-approvals#transfer-approvals)
      # by someone else in your organization.
      sig { returns(T.nilable(String)) }
      attr_accessor :pending_transaction_id

      # Configuration for how the effective date of the transfer will be set. This
      # determines same-day vs future-dated settlement timing. If not set, defaults to a
      # `settlement_schedule` of `same_day`. If set, exactly one of the child attributes
      # must be set.
      sig { returns(Increase::ACHTransfer::PreferredEffectiveDate) }
      attr_reader :preferred_effective_date

      sig do
        params(
          preferred_effective_date:
            Increase::ACHTransfer::PreferredEffectiveDate::OrHash
        ).void
      end
      attr_writer :preferred_effective_date

      # If your transfer is returned, this will contain details of the return.
      sig { returns(T.nilable(Increase::ACHTransfer::Return)) }
      attr_reader :return_

      sig do
        params(return_: T.nilable(Increase::ACHTransfer::Return::OrHash)).void
      end
      attr_writer :return_

      # The American Bankers' Association (ABA) Routing Transit Number (RTN).
      sig { returns(String) }
      attr_accessor :routing_number

      # A subhash containing information about when and how the transfer settled at the
      # Federal Reserve.
      sig { returns(T.nilable(Increase::ACHTransfer::Settlement)) }
      attr_reader :settlement

      sig do
        params(
          settlement: T.nilable(Increase::ACHTransfer::Settlement::OrHash)
        ).void
      end
      attr_writer :settlement

      # The Standard Entry Class (SEC) code to use for the transfer.
      sig do
        returns(Increase::ACHTransfer::StandardEntryClassCode::TaggedSymbol)
      end
      attr_accessor :standard_entry_class_code

      # The descriptor that will show on the recipient's bank statement.
      sig { returns(String) }
      attr_accessor :statement_descriptor

      # The lifecycle status of the transfer.
      sig { returns(Increase::ACHTransfer::Status::TaggedSymbol) }
      attr_accessor :status

      # After the transfer is submitted to FedACH, this will contain supplemental
      # details. Increase batches transfers and submits a file to the Federal Reserve
      # roughly every 30 minutes. The Federal Reserve processes ACH transfers during
      # weekdays according to their
      # [posted schedule](https://www.frbservices.org/resources/resource-centers/same-day-ach/fedach-processing-schedule.html).
      sig { returns(T.nilable(Increase::ACHTransfer::Submission)) }
      attr_reader :submission

      sig do
        params(
          submission: T.nilable(Increase::ACHTransfer::Submission::OrHash)
        ).void
      end
      attr_writer :submission

      # The ID for the transaction funding the transfer.
      sig { returns(T.nilable(String)) }
      attr_accessor :transaction_id

      # A constant representing the object's type. For this resource it will always be
      # `ach_transfer`.
      sig { returns(Increase::ACHTransfer::Type::TaggedSymbol) }
      attr_accessor :type

      # ACH transfers move funds between your Increase account and any other account
      # accessible by the Automated Clearing House (ACH).
      sig do
        params(
          id: String,
          account_id: String,
          account_number: String,
          acknowledgement:
            T.nilable(Increase::ACHTransfer::Acknowledgement::OrHash),
          addenda: T.nilable(Increase::ACHTransfer::Addenda::OrHash),
          amount: Integer,
          approval: T.nilable(Increase::ACHTransfer::Approval::OrHash),
          cancellation: T.nilable(Increase::ACHTransfer::Cancellation::OrHash),
          company_descriptive_date: T.nilable(String),
          company_discretionary_data: T.nilable(String),
          company_entry_description: T.nilable(String),
          company_id: String,
          company_name: T.nilable(String),
          created_at: Time,
          created_by: T.nilable(Increase::ACHTransfer::CreatedBy::OrHash),
          currency: Increase::ACHTransfer::Currency::OrSymbol,
          destination_account_holder:
            Increase::ACHTransfer::DestinationAccountHolder::OrSymbol,
          external_account_id: T.nilable(String),
          funding: Increase::ACHTransfer::Funding::OrSymbol,
          idempotency_key: T.nilable(String),
          inbound_funds_hold:
            T.nilable(Increase::ACHTransfer::InboundFundsHold::OrHash),
          individual_id: T.nilable(String),
          individual_name: T.nilable(String),
          network: Increase::ACHTransfer::Network::OrSymbol,
          notifications_of_change:
            T::Array[Increase::ACHTransfer::NotificationsOfChange::OrHash],
          pending_transaction_id: T.nilable(String),
          preferred_effective_date:
            Increase::ACHTransfer::PreferredEffectiveDate::OrHash,
          return_: T.nilable(Increase::ACHTransfer::Return::OrHash),
          routing_number: String,
          settlement: T.nilable(Increase::ACHTransfer::Settlement::OrHash),
          standard_entry_class_code:
            Increase::ACHTransfer::StandardEntryClassCode::OrSymbol,
          statement_descriptor: String,
          status: Increase::ACHTransfer::Status::OrSymbol,
          submission: T.nilable(Increase::ACHTransfer::Submission::OrHash),
          transaction_id: T.nilable(String),
          type: Increase::ACHTransfer::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The ACH transfer's identifier.
        id:,
        # The Account to which the transfer belongs.
        account_id:,
        # The destination account number.
        account_number:,
        # After the transfer is acknowledged by FedACH, this will contain supplemental
        # details. The Federal Reserve sends an acknowledgement message for each file that
        # Increase submits.
        acknowledgement:,
        # Additional information that will be sent to the recipient.
        addenda:,
        # The transfer amount in USD cents. A positive amount indicates a credit transfer
        # pushing funds to the receiving account. A negative amount indicates a debit
        # transfer pulling funds from the receiving account.
        amount:,
        # If your account requires approvals for transfers and the transfer was approved,
        # this will contain details of the approval.
        approval:,
        # If your account requires approvals for transfers and the transfer was not
        # approved, this will contain details of the cancellation.
        cancellation:,
        # The description of the date of the transfer.
        company_descriptive_date:,
        # The data you chose to associate with the transfer.
        company_discretionary_data:,
        # The description of the transfer you set to be shown to the recipient.
        company_entry_description:,
        # The company ID associated with the transfer.
        company_id:,
        # The name by which the recipient knows you.
        company_name:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the transfer was created.
        created_at:,
        # What object created the transfer, either via the API or the dashboard.
        created_by:,
        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's
        # currency. For ACH transfers this is always equal to `usd`.
        currency:,
        # The type of entity that owns the account to which the ACH Transfer is being
        # sent.
        destination_account_holder:,
        # The identifier of the External Account the transfer was made to, if any.
        external_account_id:,
        # The type of the account to which the transfer will be sent.
        funding:,
        # The idempotency key you chose for this object. This value is unique across
        # Increase and is used to ensure that a request is only processed once. Learn more
        # about [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key:,
        # Increase will sometimes hold the funds for ACH debit transfers. If funds are
        # held, this sub-object will contain details of the hold.
        inbound_funds_hold:,
        # Your identifier for the transfer recipient.
        individual_id:,
        # The name of the transfer recipient. This value is information and not verified
        # by the recipient's bank.
        individual_name:,
        # The transfer's network.
        network:,
        # If the receiving bank accepts the transfer but notifies that future transfers
        # should use different details, this will contain those details.
        notifications_of_change:,
        # The ID for the pending transaction representing the transfer. A pending
        # transaction is created when the transfer
        # [requires approval](https://increase.com/documentation/transfer-approvals#transfer-approvals)
        # by someone else in your organization.
        pending_transaction_id:,
        # Configuration for how the effective date of the transfer will be set. This
        # determines same-day vs future-dated settlement timing. If not set, defaults to a
        # `settlement_schedule` of `same_day`. If set, exactly one of the child attributes
        # must be set.
        preferred_effective_date:,
        # If your transfer is returned, this will contain details of the return.
        return_:,
        # The American Bankers' Association (ABA) Routing Transit Number (RTN).
        routing_number:,
        # A subhash containing information about when and how the transfer settled at the
        # Federal Reserve.
        settlement:,
        # The Standard Entry Class (SEC) code to use for the transfer.
        standard_entry_class_code:,
        # The descriptor that will show on the recipient's bank statement.
        statement_descriptor:,
        # The lifecycle status of the transfer.
        status:,
        # After the transfer is submitted to FedACH, this will contain supplemental
        # details. Increase batches transfers and submits a file to the Federal Reserve
        # roughly every 30 minutes. The Federal Reserve processes ACH transfers during
        # weekdays according to their
        # [posted schedule](https://www.frbservices.org/resources/resource-centers/same-day-ach/fedach-processing-schedule.html).
        submission:,
        # The ID for the transaction funding the transfer.
        transaction_id:,
        # A constant representing the object's type. For this resource it will always be
        # `ach_transfer`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            account_id: String,
            account_number: String,
            acknowledgement: T.nilable(Increase::ACHTransfer::Acknowledgement),
            addenda: T.nilable(Increase::ACHTransfer::Addenda),
            amount: Integer,
            approval: T.nilable(Increase::ACHTransfer::Approval),
            cancellation: T.nilable(Increase::ACHTransfer::Cancellation),
            company_descriptive_date: T.nilable(String),
            company_discretionary_data: T.nilable(String),
            company_entry_description: T.nilable(String),
            company_id: String,
            company_name: T.nilable(String),
            created_at: Time,
            created_by: T.nilable(Increase::ACHTransfer::CreatedBy),
            currency: Increase::ACHTransfer::Currency::TaggedSymbol,
            destination_account_holder:
              Increase::ACHTransfer::DestinationAccountHolder::TaggedSymbol,
            external_account_id: T.nilable(String),
            funding: Increase::ACHTransfer::Funding::TaggedSymbol,
            idempotency_key: T.nilable(String),
            inbound_funds_hold:
              T.nilable(Increase::ACHTransfer::InboundFundsHold),
            individual_id: T.nilable(String),
            individual_name: T.nilable(String),
            network: Increase::ACHTransfer::Network::TaggedSymbol,
            notifications_of_change:
              T::Array[Increase::ACHTransfer::NotificationsOfChange],
            pending_transaction_id: T.nilable(String),
            preferred_effective_date:
              Increase::ACHTransfer::PreferredEffectiveDate,
            return_: T.nilable(Increase::ACHTransfer::Return),
            routing_number: String,
            settlement: T.nilable(Increase::ACHTransfer::Settlement),
            standard_entry_class_code:
              Increase::ACHTransfer::StandardEntryClassCode::TaggedSymbol,
            statement_descriptor: String,
            status: Increase::ACHTransfer::Status::TaggedSymbol,
            submission: T.nilable(Increase::ACHTransfer::Submission),
            transaction_id: T.nilable(String),
            type: Increase::ACHTransfer::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Acknowledgement < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::ACHTransfer::Acknowledgement,
              Increase::Internal::AnyHash
            )
          end

        # When the Federal Reserve acknowledged the submitted file containing this
        # transfer.
        sig { returns(String) }
        attr_accessor :acknowledged_at

        # After the transfer is acknowledged by FedACH, this will contain supplemental
        # details. The Federal Reserve sends an acknowledgement message for each file that
        # Increase submits.
        sig { params(acknowledged_at: String).returns(T.attached_class) }
        def self.new(
          # When the Federal Reserve acknowledged the submitted file containing this
          # transfer.
          acknowledged_at:
        )
        end

        sig { override.returns({ acknowledged_at: String }) }
        def to_hash
        end
      end

      class Addenda < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Increase::ACHTransfer::Addenda, Increase::Internal::AnyHash)
          end

        # The type of the resource. We may add additional possible values for this enum
        # over time; your application should be able to handle such additions gracefully.
        sig { returns(Increase::ACHTransfer::Addenda::Category::TaggedSymbol) }
        attr_accessor :category

        # Unstructured `payment_related_information` passed through with the transfer.
        sig { returns(T.nilable(Increase::ACHTransfer::Addenda::Freeform)) }
        attr_reader :freeform

        sig do
          params(
            freeform:
              T.nilable(Increase::ACHTransfer::Addenda::Freeform::OrHash)
          ).void
        end
        attr_writer :freeform

        # Structured ASC X12 820 remittance advice records. Please reach out to
        # [support@increase.com](mailto:support@increase.com) for more information.
        sig do
          returns(
            T.nilable(
              Increase::ACHTransfer::Addenda::PaymentOrderRemittanceAdvice
            )
          )
        end
        attr_reader :payment_order_remittance_advice

        sig do
          params(
            payment_order_remittance_advice:
              T.nilable(
                Increase::ACHTransfer::Addenda::PaymentOrderRemittanceAdvice::OrHash
              )
          ).void
        end
        attr_writer :payment_order_remittance_advice

        # Additional information that will be sent to the recipient.
        sig do
          params(
            category: Increase::ACHTransfer::Addenda::Category::OrSymbol,
            freeform:
              T.nilable(Increase::ACHTransfer::Addenda::Freeform::OrHash),
            payment_order_remittance_advice:
              T.nilable(
                Increase::ACHTransfer::Addenda::PaymentOrderRemittanceAdvice::OrHash
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # The type of the resource. We may add additional possible values for this enum
          # over time; your application should be able to handle such additions gracefully.
          category:,
          # Unstructured `payment_related_information` passed through with the transfer.
          freeform:,
          # Structured ASC X12 820 remittance advice records. Please reach out to
          # [support@increase.com](mailto:support@increase.com) for more information.
          payment_order_remittance_advice:
        )
        end

        sig do
          override.returns(
            {
              category: Increase::ACHTransfer::Addenda::Category::TaggedSymbol,
              freeform: T.nilable(Increase::ACHTransfer::Addenda::Freeform),
              payment_order_remittance_advice:
                T.nilable(
                  Increase::ACHTransfer::Addenda::PaymentOrderRemittanceAdvice
                )
            }
          )
        end
        def to_hash
        end

        # The type of the resource. We may add additional possible values for this enum
        # over time; your application should be able to handle such additions gracefully.
        module Category
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::ACHTransfer::Addenda::Category)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Unstructured `payment_related_information` passed through with the transfer.
          FREEFORM =
            T.let(
              :freeform,
              Increase::ACHTransfer::Addenda::Category::TaggedSymbol
            )

          # Structured ASC X12 820 remittance advice records. Please reach out to [support@increase.com](mailto:support@increase.com) for more information.
          PAYMENT_ORDER_REMITTANCE_ADVICE =
            T.let(
              :payment_order_remittance_advice,
              Increase::ACHTransfer::Addenda::Category::TaggedSymbol
            )

          # Unknown addenda type.
          OTHER =
            T.let(
              :other,
              Increase::ACHTransfer::Addenda::Category::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Increase::ACHTransfer::Addenda::Category::TaggedSymbol]
            )
          end
          def self.values
          end
        end

        class Freeform < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::ACHTransfer::Addenda::Freeform,
                Increase::Internal::AnyHash
              )
            end

          # Each entry represents an addendum sent with the transfer.
          sig do
            returns(T::Array[Increase::ACHTransfer::Addenda::Freeform::Entry])
          end
          attr_accessor :entries

          # Unstructured `payment_related_information` passed through with the transfer.
          sig do
            params(
              entries:
                T::Array[
                  Increase::ACHTransfer::Addenda::Freeform::Entry::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(
            # Each entry represents an addendum sent with the transfer.
            entries:
          )
          end

          sig do
            override.returns(
              {
                entries:
                  T::Array[Increase::ACHTransfer::Addenda::Freeform::Entry]
              }
            )
          end
          def to_hash
          end

          class Entry < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::ACHTransfer::Addenda::Freeform::Entry,
                  Increase::Internal::AnyHash
                )
              end

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
            T.type_alias do
              T.any(
                Increase::ACHTransfer::Addenda::PaymentOrderRemittanceAdvice,
                Increase::Internal::AnyHash
              )
            end

          # ASC X12 RMR records for this specific transfer.
          sig do
            returns(
              T::Array[
                Increase::ACHTransfer::Addenda::PaymentOrderRemittanceAdvice::Invoice
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
                  Increase::ACHTransfer::Addenda::PaymentOrderRemittanceAdvice::Invoice::OrHash
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
                    Increase::ACHTransfer::Addenda::PaymentOrderRemittanceAdvice::Invoice
                  ]
              }
            )
          end
          def to_hash
          end

          class Invoice < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::ACHTransfer::Addenda::PaymentOrderRemittanceAdvice::Invoice,
                  Increase::Internal::AnyHash
                )
              end

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

      class Approval < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Increase::ACHTransfer::Approval, Increase::Internal::AnyHash)
          end

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the transfer was approved.
        sig { returns(Time) }
        attr_accessor :approved_at

        # If the Transfer was approved by a user in the dashboard, the email address of
        # that user.
        sig { returns(T.nilable(String)) }
        attr_accessor :approved_by

        # If your account requires approvals for transfers and the transfer was approved,
        # this will contain details of the approval.
        sig do
          params(approved_at: Time, approved_by: T.nilable(String)).returns(
            T.attached_class
          )
        end
        def self.new(
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the transfer was approved.
          approved_at:,
          # If the Transfer was approved by a user in the dashboard, the email address of
          # that user.
          approved_by:
        )
        end

        sig do
          override.returns(
            { approved_at: Time, approved_by: T.nilable(String) }
          )
        end
        def to_hash
        end
      end

      class Cancellation < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::ACHTransfer::Cancellation,
              Increase::Internal::AnyHash
            )
          end

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the Transfer was canceled.
        sig { returns(Time) }
        attr_accessor :canceled_at

        # If the Transfer was canceled by a user in the dashboard, the email address of
        # that user.
        sig { returns(T.nilable(String)) }
        attr_accessor :canceled_by

        # If your account requires approvals for transfers and the transfer was not
        # approved, this will contain details of the cancellation.
        sig do
          params(canceled_at: Time, canceled_by: T.nilable(String)).returns(
            T.attached_class
          )
        end
        def self.new(
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the Transfer was canceled.
          canceled_at:,
          # If the Transfer was canceled by a user in the dashboard, the email address of
          # that user.
          canceled_by:
        )
        end

        sig do
          override.returns(
            { canceled_at: Time, canceled_by: T.nilable(String) }
          )
        end
        def to_hash
        end
      end

      class CreatedBy < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Increase::ACHTransfer::CreatedBy, Increase::Internal::AnyHash)
          end

        # If present, details about the API key that created the transfer.
        sig { returns(T.nilable(Increase::ACHTransfer::CreatedBy::APIKey)) }
        attr_reader :api_key

        sig do
          params(
            api_key: T.nilable(Increase::ACHTransfer::CreatedBy::APIKey::OrHash)
          ).void
        end
        attr_writer :api_key

        # The type of object that created this transfer.
        sig do
          returns(Increase::ACHTransfer::CreatedBy::Category::TaggedSymbol)
        end
        attr_accessor :category

        # If present, details about the OAuth Application that created the transfer.
        sig do
          returns(T.nilable(Increase::ACHTransfer::CreatedBy::OAuthApplication))
        end
        attr_reader :oauth_application

        sig do
          params(
            oauth_application:
              T.nilable(
                Increase::ACHTransfer::CreatedBy::OAuthApplication::OrHash
              )
          ).void
        end
        attr_writer :oauth_application

        # If present, details about the User that created the transfer.
        sig { returns(T.nilable(Increase::ACHTransfer::CreatedBy::User)) }
        attr_reader :user

        sig do
          params(
            user: T.nilable(Increase::ACHTransfer::CreatedBy::User::OrHash)
          ).void
        end
        attr_writer :user

        # What object created the transfer, either via the API or the dashboard.
        sig do
          params(
            api_key:
              T.nilable(Increase::ACHTransfer::CreatedBy::APIKey::OrHash),
            category: Increase::ACHTransfer::CreatedBy::Category::OrSymbol,
            oauth_application:
              T.nilable(
                Increase::ACHTransfer::CreatedBy::OAuthApplication::OrHash
              ),
            user: T.nilable(Increase::ACHTransfer::CreatedBy::User::OrHash)
          ).returns(T.attached_class)
        end
        def self.new(
          # If present, details about the API key that created the transfer.
          api_key:,
          # The type of object that created this transfer.
          category:,
          # If present, details about the OAuth Application that created the transfer.
          oauth_application:,
          # If present, details about the User that created the transfer.
          user:
        )
        end

        sig do
          override.returns(
            {
              api_key: T.nilable(Increase::ACHTransfer::CreatedBy::APIKey),
              category:
                Increase::ACHTransfer::CreatedBy::Category::TaggedSymbol,
              oauth_application:
                T.nilable(Increase::ACHTransfer::CreatedBy::OAuthApplication),
              user: T.nilable(Increase::ACHTransfer::CreatedBy::User)
            }
          )
        end
        def to_hash
        end

        class APIKey < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::ACHTransfer::CreatedBy::APIKey,
                Increase::Internal::AnyHash
              )
            end

          # The description set for the API key when it was created.
          sig { returns(T.nilable(String)) }
          attr_accessor :description

          # If present, details about the API key that created the transfer.
          sig do
            params(description: T.nilable(String)).returns(T.attached_class)
          end
          def self.new(
            # The description set for the API key when it was created.
            description:
          )
          end

          sig { override.returns({ description: T.nilable(String) }) }
          def to_hash
          end
        end

        # The type of object that created this transfer.
        module Category
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::ACHTransfer::CreatedBy::Category)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # An API key. Details will be under the `api_key` object.
          API_KEY =
            T.let(
              :api_key,
              Increase::ACHTransfer::CreatedBy::Category::TaggedSymbol
            )

          # An OAuth application you connected to Increase. Details will be under the `oauth_application` object.
          OAUTH_APPLICATION =
            T.let(
              :oauth_application,
              Increase::ACHTransfer::CreatedBy::Category::TaggedSymbol
            )

          # A User in the Increase dashboard. Details will be under the `user` object.
          USER =
            T.let(
              :user,
              Increase::ACHTransfer::CreatedBy::Category::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Increase::ACHTransfer::CreatedBy::Category::TaggedSymbol]
            )
          end
          def self.values
          end
        end

        class OAuthApplication < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::ACHTransfer::CreatedBy::OAuthApplication,
                Increase::Internal::AnyHash
              )
            end

          # The name of the OAuth Application.
          sig { returns(String) }
          attr_accessor :name

          # If present, details about the OAuth Application that created the transfer.
          sig { params(name: String).returns(T.attached_class) }
          def self.new(
            # The name of the OAuth Application.
            name:
          )
          end

          sig { override.returns({ name: String }) }
          def to_hash
          end
        end

        class User < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::ACHTransfer::CreatedBy::User,
                Increase::Internal::AnyHash
              )
            end

          # The email address of the User.
          sig { returns(String) }
          attr_accessor :email

          # If present, details about the User that created the transfer.
          sig { params(email: String).returns(T.attached_class) }
          def self.new(
            # The email address of the User.
            email:
          )
          end

          sig { override.returns({ email: String }) }
          def to_hash
          end
        end
      end

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's
      # currency. For ACH transfers this is always equal to `usd`.
      module Currency
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::ACHTransfer::Currency) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # US Dollar (USD)
        USD = T.let(:USD, Increase::ACHTransfer::Currency::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::ACHTransfer::Currency::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # The type of entity that owns the account to which the ACH Transfer is being
      # sent.
      module DestinationAccountHolder
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::ACHTransfer::DestinationAccountHolder)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The External Account is owned by a business.
        BUSINESS =
          T.let(
            :business,
            Increase::ACHTransfer::DestinationAccountHolder::TaggedSymbol
          )

        # The External Account is owned by an individual.
        INDIVIDUAL =
          T.let(
            :individual,
            Increase::ACHTransfer::DestinationAccountHolder::TaggedSymbol
          )

        # It's unknown what kind of entity owns the External Account.
        UNKNOWN =
          T.let(
            :unknown,
            Increase::ACHTransfer::DestinationAccountHolder::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Increase::ACHTransfer::DestinationAccountHolder::TaggedSymbol
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
          T.type_alias { T.all(Symbol, Increase::ACHTransfer::Funding) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # A checking account.
        CHECKING =
          T.let(:checking, Increase::ACHTransfer::Funding::TaggedSymbol)

        # A savings account.
        SAVINGS = T.let(:savings, Increase::ACHTransfer::Funding::TaggedSymbol)

        # A bank's general ledger. Uncommon.
        GENERAL_LEDGER =
          T.let(:general_ledger, Increase::ACHTransfer::Funding::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::ACHTransfer::Funding::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class InboundFundsHold < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::ACHTransfer::InboundFundsHold,
              Increase::Internal::AnyHash
            )
          end

        # The held amount in the minor unit of the account's currency. For dollars, for
        # example, this is cents.
        sig { returns(Integer) }
        attr_accessor :amount

        # When the hold will be released automatically. Certain conditions may cause it to
        # be released before this time.
        sig { returns(Time) }
        attr_accessor :automatically_releases_at

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the hold
        # was created.
        sig { returns(Time) }
        attr_accessor :created_at

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the hold's
        # currency.
        sig do
          returns(
            Increase::ACHTransfer::InboundFundsHold::Currency::TaggedSymbol
          )
        end
        attr_accessor :currency

        # The ID of the Transaction for which funds were held.
        sig { returns(T.nilable(String)) }
        attr_accessor :held_transaction_id

        # The ID of the Pending Transaction representing the held funds.
        sig { returns(T.nilable(String)) }
        attr_accessor :pending_transaction_id

        # When the hold was released (if it has been released).
        sig { returns(T.nilable(Time)) }
        attr_accessor :released_at

        # The status of the hold.
        sig do
          returns(Increase::ACHTransfer::InboundFundsHold::Status::TaggedSymbol)
        end
        attr_accessor :status

        # A constant representing the object's type. For this resource it will always be
        # `inbound_funds_hold`.
        sig do
          returns(Increase::ACHTransfer::InboundFundsHold::Type::TaggedSymbol)
        end
        attr_accessor :type

        # Increase will sometimes hold the funds for ACH debit transfers. If funds are
        # held, this sub-object will contain details of the hold.
        sig do
          params(
            amount: Integer,
            automatically_releases_at: Time,
            created_at: Time,
            currency:
              Increase::ACHTransfer::InboundFundsHold::Currency::OrSymbol,
            held_transaction_id: T.nilable(String),
            pending_transaction_id: T.nilable(String),
            released_at: T.nilable(Time),
            status: Increase::ACHTransfer::InboundFundsHold::Status::OrSymbol,
            type: Increase::ACHTransfer::InboundFundsHold::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The held amount in the minor unit of the account's currency. For dollars, for
          # example, this is cents.
          amount:,
          # When the hold will be released automatically. Certain conditions may cause it to
          # be released before this time.
          automatically_releases_at:,
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the hold
          # was created.
          created_at:,
          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the hold's
          # currency.
          currency:,
          # The ID of the Transaction for which funds were held.
          held_transaction_id:,
          # The ID of the Pending Transaction representing the held funds.
          pending_transaction_id:,
          # When the hold was released (if it has been released).
          released_at:,
          # The status of the hold.
          status:,
          # A constant representing the object's type. For this resource it will always be
          # `inbound_funds_hold`.
          type:
        )
        end

        sig do
          override.returns(
            {
              amount: Integer,
              automatically_releases_at: Time,
              created_at: Time,
              currency:
                Increase::ACHTransfer::InboundFundsHold::Currency::TaggedSymbol,
              held_transaction_id: T.nilable(String),
              pending_transaction_id: T.nilable(String),
              released_at: T.nilable(Time),
              status:
                Increase::ACHTransfer::InboundFundsHold::Status::TaggedSymbol,
              type: Increase::ACHTransfer::InboundFundsHold::Type::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the hold's
        # currency.
        module Currency
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::ACHTransfer::InboundFundsHold::Currency)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # US Dollar (USD)
          USD =
            T.let(
              :USD,
              Increase::ACHTransfer::InboundFundsHold::Currency::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::ACHTransfer::InboundFundsHold::Currency::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # The status of the hold.
        module Status
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::ACHTransfer::InboundFundsHold::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Funds are still being held.
          HELD =
            T.let(
              :held,
              Increase::ACHTransfer::InboundFundsHold::Status::TaggedSymbol
            )

          # Funds have been released.
          COMPLETE =
            T.let(
              :complete,
              Increase::ACHTransfer::InboundFundsHold::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::ACHTransfer::InboundFundsHold::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # A constant representing the object's type. For this resource it will always be
        # `inbound_funds_hold`.
        module Type
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::ACHTransfer::InboundFundsHold::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          INBOUND_FUNDS_HOLD =
            T.let(
              :inbound_funds_hold,
              Increase::ACHTransfer::InboundFundsHold::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::ACHTransfer::InboundFundsHold::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # The transfer's network.
      module Network
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::ACHTransfer::Network) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACH = T.let(:ach, Increase::ACHTransfer::Network::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::ACHTransfer::Network::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class NotificationsOfChange < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::ACHTransfer::NotificationsOfChange,
              Increase::Internal::AnyHash
            )
          end

        # The required type of change that is being signaled by the receiving financial
        # institution.
        sig do
          returns(
            Increase::ACHTransfer::NotificationsOfChange::ChangeCode::TaggedSymbol
          )
        end
        attr_accessor :change_code

        # The corrected data that should be used in future ACHs to this account. This may
        # contain the suggested new account number or routing number. When the
        # `change_code` is `incorrect_transaction_code`, this field contains an integer.
        # Numbers starting with a 2 encourage changing the `funding` parameter to
        # checking; numbers starting with a 3 encourage changing to savings.
        sig { returns(String) }
        attr_accessor :corrected_data

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the notification occurred.
        sig { returns(Time) }
        attr_accessor :created_at

        sig do
          params(
            change_code:
              Increase::ACHTransfer::NotificationsOfChange::ChangeCode::OrSymbol,
            corrected_data: String,
            created_at: Time
          ).returns(T.attached_class)
        end
        def self.new(
          # The required type of change that is being signaled by the receiving financial
          # institution.
          change_code:,
          # The corrected data that should be used in future ACHs to this account. This may
          # contain the suggested new account number or routing number. When the
          # `change_code` is `incorrect_transaction_code`, this field contains an integer.
          # Numbers starting with a 2 encourage changing the `funding` parameter to
          # checking; numbers starting with a 3 encourage changing to savings.
          corrected_data:,
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the notification occurred.
          created_at:
        )
        end

        sig do
          override.returns(
            {
              change_code:
                Increase::ACHTransfer::NotificationsOfChange::ChangeCode::TaggedSymbol,
              corrected_data: String,
              created_at: Time
            }
          )
        end
        def to_hash
        end

        # The required type of change that is being signaled by the receiving financial
        # institution.
        module ChangeCode
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::ACHTransfer::NotificationsOfChange::ChangeCode
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The account number was incorrect.
          INCORRECT_ACCOUNT_NUMBER =
            T.let(
              :incorrect_account_number,
              Increase::ACHTransfer::NotificationsOfChange::ChangeCode::TaggedSymbol
            )

          # The routing number was incorrect.
          INCORRECT_ROUTING_NUMBER =
            T.let(
              :incorrect_routing_number,
              Increase::ACHTransfer::NotificationsOfChange::ChangeCode::TaggedSymbol
            )

          # Both the routing number and the account number were incorrect.
          INCORRECT_ROUTING_NUMBER_AND_ACCOUNT_NUMBER =
            T.let(
              :incorrect_routing_number_and_account_number,
              Increase::ACHTransfer::NotificationsOfChange::ChangeCode::TaggedSymbol
            )

          # The transaction code was incorrect. Try changing the `funding` parameter from checking to savings or vice-versa.
          INCORRECT_TRANSACTION_CODE =
            T.let(
              :incorrect_transaction_code,
              Increase::ACHTransfer::NotificationsOfChange::ChangeCode::TaggedSymbol
            )

          # The account number and the transaction code were incorrect.
          INCORRECT_ACCOUNT_NUMBER_AND_TRANSACTION_CODE =
            T.let(
              :incorrect_account_number_and_transaction_code,
              Increase::ACHTransfer::NotificationsOfChange::ChangeCode::TaggedSymbol
            )

          # The routing number, account number, and transaction code were incorrect.
          INCORRECT_ROUTING_NUMBER_ACCOUNT_NUMBER_AND_TRANSACTION_CODE =
            T.let(
              :incorrect_routing_number_account_number_and_transaction_code,
              Increase::ACHTransfer::NotificationsOfChange::ChangeCode::TaggedSymbol
            )

          # The receiving depository financial institution identification was incorrect.
          INCORRECT_RECEIVING_DEPOSITORY_FINANCIAL_INSTITUTION_IDENTIFICATION =
            T.let(
              :incorrect_receiving_depository_financial_institution_identification,
              Increase::ACHTransfer::NotificationsOfChange::ChangeCode::TaggedSymbol
            )

          # The individual identification number was incorrect.
          INCORRECT_INDIVIDUAL_IDENTIFICATION_NUMBER =
            T.let(
              :incorrect_individual_identification_number,
              Increase::ACHTransfer::NotificationsOfChange::ChangeCode::TaggedSymbol
            )

          # The addenda had an incorrect format.
          ADDENDA_FORMAT_ERROR =
            T.let(
              :addenda_format_error,
              Increase::ACHTransfer::NotificationsOfChange::ChangeCode::TaggedSymbol
            )

          # The standard entry class code was incorrect for an outbound international payment.
          INCORRECT_STANDARD_ENTRY_CLASS_CODE_FOR_OUTBOUND_INTERNATIONAL_PAYMENT =
            T.let(
              :incorrect_standard_entry_class_code_for_outbound_international_payment,
              Increase::ACHTransfer::NotificationsOfChange::ChangeCode::TaggedSymbol
            )

          # The notification of change was misrouted.
          MISROUTED_NOTIFICATION_OF_CHANGE =
            T.let(
              :misrouted_notification_of_change,
              Increase::ACHTransfer::NotificationsOfChange::ChangeCode::TaggedSymbol
            )

          # The trace number was incorrect.
          INCORRECT_TRACE_NUMBER =
            T.let(
              :incorrect_trace_number,
              Increase::ACHTransfer::NotificationsOfChange::ChangeCode::TaggedSymbol
            )

          # The company identification number was incorrect.
          INCORRECT_COMPANY_IDENTIFICATION_NUMBER =
            T.let(
              :incorrect_company_identification_number,
              Increase::ACHTransfer::NotificationsOfChange::ChangeCode::TaggedSymbol
            )

          # The individual identification number or identification number was incorrect.
          INCORRECT_IDENTIFICATION_NUMBER =
            T.let(
              :incorrect_identification_number,
              Increase::ACHTransfer::NotificationsOfChange::ChangeCode::TaggedSymbol
            )

          # The corrected data was incorrectly formatted.
          INCORRECTLY_FORMATTED_CORRECTED_DATA =
            T.let(
              :incorrectly_formatted_corrected_data,
              Increase::ACHTransfer::NotificationsOfChange::ChangeCode::TaggedSymbol
            )

          # The discretionary data was incorrect.
          INCORRECT_DISCRETIONARY_DATA =
            T.let(
              :incorrect_discretionary_data,
              Increase::ACHTransfer::NotificationsOfChange::ChangeCode::TaggedSymbol
            )

          # The routing number was not from the original entry detail record.
          ROUTING_NUMBER_NOT_FROM_ORIGINAL_ENTRY_DETAIL_RECORD =
            T.let(
              :routing_number_not_from_original_entry_detail_record,
              Increase::ACHTransfer::NotificationsOfChange::ChangeCode::TaggedSymbol
            )

          # The depository financial institution account number was not from the original entry detail record.
          DEPOSITORY_FINANCIAL_INSTITUTION_ACCOUNT_NUMBER_NOT_FROM_ORIGINAL_ENTRY_DETAIL_RECORD =
            T.let(
              :depository_financial_institution_account_number_not_from_original_entry_detail_record,
              Increase::ACHTransfer::NotificationsOfChange::ChangeCode::TaggedSymbol
            )

          # The transaction code was incorrect, initiated by the originating depository financial institution.
          INCORRECT_TRANSACTION_CODE_BY_ORIGINATING_DEPOSITORY_FINANCIAL_INSTITUTION =
            T.let(
              :incorrect_transaction_code_by_originating_depository_financial_institution,
              Increase::ACHTransfer::NotificationsOfChange::ChangeCode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::ACHTransfer::NotificationsOfChange::ChangeCode::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class PreferredEffectiveDate < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::ACHTransfer::PreferredEffectiveDate,
              Increase::Internal::AnyHash
            )
          end

        # A specific date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format to
        # use as the effective date when submitting this transfer.
        sig { returns(T.nilable(Date)) }
        attr_accessor :date

        # A schedule by which Increase will choose an effective date for the transfer.
        sig do
          returns(
            T.nilable(
              Increase::ACHTransfer::PreferredEffectiveDate::SettlementSchedule::TaggedSymbol
            )
          )
        end
        attr_accessor :settlement_schedule

        # Configuration for how the effective date of the transfer will be set. This
        # determines same-day vs future-dated settlement timing. If not set, defaults to a
        # `settlement_schedule` of `same_day`. If set, exactly one of the child attributes
        # must be set.
        sig do
          params(
            date: T.nilable(Date),
            settlement_schedule:
              T.nilable(
                Increase::ACHTransfer::PreferredEffectiveDate::SettlementSchedule::OrSymbol
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # A specific date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format to
          # use as the effective date when submitting this transfer.
          date:,
          # A schedule by which Increase will choose an effective date for the transfer.
          settlement_schedule:
        )
        end

        sig do
          override.returns(
            {
              date: T.nilable(Date),
              settlement_schedule:
                T.nilable(
                  Increase::ACHTransfer::PreferredEffectiveDate::SettlementSchedule::TaggedSymbol
                )
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
                Increase::ACHTransfer::PreferredEffectiveDate::SettlementSchedule
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The chosen effective date will be the same as the ACH processing date on which the transfer is submitted.
          # This is necessary, but not sufficient for the transfer to be settled same-day:
          # it must also be submitted before the last same-day cutoff
          # and be less than or equal to $1,000.000.00.
          SAME_DAY =
            T.let(
              :same_day,
              Increase::ACHTransfer::PreferredEffectiveDate::SettlementSchedule::TaggedSymbol
            )

          # The chosen effective date will be the business day following the ACH processing date on which the transfer is submitted. The transfer will be settled on that future day.
          FUTURE_DATED =
            T.let(
              :future_dated,
              Increase::ACHTransfer::PreferredEffectiveDate::SettlementSchedule::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::ACHTransfer::PreferredEffectiveDate::SettlementSchedule::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Return < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Increase::ACHTransfer::Return, Increase::Internal::AnyHash)
          end

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the transfer was created.
        sig { returns(Time) }
        attr_accessor :created_at

        # The three character ACH return code, in the range R01 to R85.
        sig { returns(String) }
        attr_accessor :raw_return_reason_code

        # Why the ACH Transfer was returned. This reason code is sent by the receiving
        # bank back to Increase.
        sig do
          returns(Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol)
        end
        attr_accessor :return_reason_code

        # A 15 digit number that was generated by the bank that initiated the return. The
        # trace number of the return is different than that of the original transfer. ACH
        # trace numbers are not unique, but along with the amount and date this number can
        # be used to identify the ACH return at the bank that initiated it.
        sig { returns(String) }
        attr_accessor :trace_number

        # The identifier of the Transaction associated with this return.
        sig { returns(String) }
        attr_accessor :transaction_id

        # The identifier of the ACH Transfer associated with this return.
        sig { returns(String) }
        attr_accessor :transfer_id

        # If your transfer is returned, this will contain details of the return.
        sig do
          params(
            created_at: Time,
            raw_return_reason_code: String,
            return_reason_code:
              Increase::ACHTransfer::Return::ReturnReasonCode::OrSymbol,
            trace_number: String,
            transaction_id: String,
            transfer_id: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the transfer was created.
          created_at:,
          # The three character ACH return code, in the range R01 to R85.
          raw_return_reason_code:,
          # Why the ACH Transfer was returned. This reason code is sent by the receiving
          # bank back to Increase.
          return_reason_code:,
          # A 15 digit number that was generated by the bank that initiated the return. The
          # trace number of the return is different than that of the original transfer. ACH
          # trace numbers are not unique, but along with the amount and date this number can
          # be used to identify the ACH return at the bank that initiated it.
          trace_number:,
          # The identifier of the Transaction associated with this return.
          transaction_id:,
          # The identifier of the ACH Transfer associated with this return.
          transfer_id:
        )
        end

        sig do
          override.returns(
            {
              created_at: Time,
              raw_return_reason_code: String,
              return_reason_code:
                Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol,
              trace_number: String,
              transaction_id: String,
              transfer_id: String
            }
          )
        end
        def to_hash
        end

        # Why the ACH Transfer was returned. This reason code is sent by the receiving
        # bank back to Increase.
        module ReturnReasonCode
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::ACHTransfer::Return::ReturnReasonCode)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Code R01. Insufficient funds in the receiving account. Sometimes abbreviated to NSF.
          INSUFFICIENT_FUND =
            T.let(
              :insufficient_fund,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R03. The account does not exist or the receiving bank was unable to locate it.
          NO_ACCOUNT =
            T.let(
              :no_account,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R02. The account is closed at the receiving bank.
          ACCOUNT_CLOSED =
            T.let(
              :account_closed,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R04. The account number is invalid at the receiving bank.
          INVALID_ACCOUNT_NUMBER_STRUCTURE =
            T.let(
              :invalid_account_number_structure,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R16. The account at the receiving bank was frozen per the Office of Foreign Assets Control.
          ACCOUNT_FROZEN_ENTRY_RETURNED_PER_OFAC_INSTRUCTION =
            T.let(
              :account_frozen_entry_returned_per_ofac_instruction,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R23. The receiving bank account refused a credit transfer.
          CREDIT_ENTRY_REFUSED_BY_RECEIVER =
            T.let(
              :credit_entry_refused_by_receiver,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R05. The receiving bank rejected because of an incorrect Standard Entry Class code.
          UNAUTHORIZED_DEBIT_TO_CONSUMER_ACCOUNT_USING_CORPORATE_SEC_CODE =
            T.let(
              :unauthorized_debit_to_consumer_account_using_corporate_sec_code,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R29. The corporate customer at the receiving bank reversed the transfer.
          CORPORATE_CUSTOMER_ADVISED_NOT_AUTHORIZED =
            T.let(
              :corporate_customer_advised_not_authorized,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R08. The receiving bank stopped payment on this transfer.
          PAYMENT_STOPPED =
            T.let(
              :payment_stopped,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R20. The receiving bank account does not perform transfers.
          NON_TRANSACTION_ACCOUNT =
            T.let(
              :non_transaction_account,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R09. The receiving bank account does not have enough available balance for the transfer.
          UNCOLLECTED_FUNDS =
            T.let(
              :uncollected_funds,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R28. The routing number is incorrect.
          ROUTING_NUMBER_CHECK_DIGIT_ERROR =
            T.let(
              :routing_number_check_digit_error,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R10. The customer at the receiving bank reversed the transfer.
          CUSTOMER_ADVISED_UNAUTHORIZED_IMPROPER_INELIGIBLE_OR_INCOMPLETE =
            T.let(
              :customer_advised_unauthorized_improper_ineligible_or_incomplete,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R19. The amount field is incorrect or too large.
          AMOUNT_FIELD_ERROR =
            T.let(
              :amount_field_error,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R07. The customer at the receiving institution informed their bank that they have revoked authorization for a previously authorized transfer.
          AUTHORIZATION_REVOKED_BY_CUSTOMER =
            T.let(
              :authorization_revoked_by_customer,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R13. The routing number is invalid.
          INVALID_ACH_ROUTING_NUMBER =
            T.let(
              :invalid_ach_routing_number,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R17. The receiving bank is unable to process a field in the transfer.
          FILE_RECORD_EDIT_CRITERIA =
            T.let(
              :file_record_edit_criteria,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R45. The individual name field was invalid.
          ENR_INVALID_INDIVIDUAL_NAME =
            T.let(
              :enr_invalid_individual_name,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R06. The originating financial institution asked for this transfer to be returned. The receiving bank is complying with the request.
          RETURNED_PER_ODFI_REQUEST =
            T.let(
              :returned_per_odfi_request,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R34. The receiving bank's regulatory supervisor has limited their participation in the ACH network.
          LIMITED_PARTICIPATION_DFI =
            T.let(
              :limited_participation_dfi,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R85. The outbound international ACH transfer was incorrect.
          INCORRECTLY_CODED_OUTBOUND_INTERNATIONAL_PAYMENT =
            T.let(
              :incorrectly_coded_outbound_international_payment,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R12. A rare return reason. The account was sold to another bank.
          ACCOUNT_SOLD_TO_ANOTHER_DFI =
            T.let(
              :account_sold_to_another_dfi,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R25. The addenda record is incorrect or missing.
          ADDENDA_ERROR =
            T.let(
              :addenda_error,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R15. A rare return reason. The account holder is deceased.
          BENEFICIARY_OR_ACCOUNT_HOLDER_DECEASED =
            T.let(
              :beneficiary_or_account_holder_deceased,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R11. A rare return reason. The customer authorized some payment to the sender, but this payment was not in error.
          CUSTOMER_ADVISED_NOT_WITHIN_AUTHORIZATION_TERMS =
            T.let(
              :customer_advised_not_within_authorization_terms,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R74. A rare return reason. Sent in response to a return that was returned with code `field_error`. The latest return should include the corrected field(s).
          CORRECTED_RETURN =
            T.let(
              :corrected_return,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R24. A rare return reason. The receiving bank received an exact duplicate entry with the same trace number and amount.
          DUPLICATE_ENTRY =
            T.let(
              :duplicate_entry,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R67. A rare return reason. The return this message refers to was a duplicate.
          DUPLICATE_RETURN =
            T.let(
              :duplicate_return,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R47. A rare return reason. Only used for US Government agency non-monetary automatic enrollment messages.
          ENR_DUPLICATE_ENROLLMENT =
            T.let(
              :enr_duplicate_enrollment,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R43. A rare return reason. Only used for US Government agency non-monetary automatic enrollment messages.
          ENR_INVALID_DFI_ACCOUNT_NUMBER =
            T.let(
              :enr_invalid_dfi_account_number,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R44. A rare return reason. Only used for US Government agency non-monetary automatic enrollment messages.
          ENR_INVALID_INDIVIDUAL_ID_NUMBER =
            T.let(
              :enr_invalid_individual_id_number,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R46. A rare return reason. Only used for US Government agency non-monetary automatic enrollment messages.
          ENR_INVALID_REPRESENTATIVE_PAYEE_INDICATOR =
            T.let(
              :enr_invalid_representative_payee_indicator,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R41. A rare return reason. Only used for US Government agency non-monetary automatic enrollment messages.
          ENR_INVALID_TRANSACTION_CODE =
            T.let(
              :enr_invalid_transaction_code,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R40. A rare return reason. Only used for US Government agency non-monetary automatic enrollment messages.
          ENR_RETURN_OF_ENR_ENTRY =
            T.let(
              :enr_return_of_enr_entry,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R42. A rare return reason. Only used for US Government agency non-monetary automatic enrollment messages.
          ENR_ROUTING_NUMBER_CHECK_DIGIT_ERROR =
            T.let(
              :enr_routing_number_check_digit_error,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R84. A rare return reason. The International ACH Transfer cannot be processed by the gateway.
          ENTRY_NOT_PROCESSED_BY_GATEWAY =
            T.let(
              :entry_not_processed_by_gateway,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R69. A rare return reason. One or more of the fields in the ACH were malformed.
          FIELD_ERROR =
            T.let(
              :field_error,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R83. A rare return reason. The Foreign receiving bank was unable to settle this ACH transfer.
          FOREIGN_RECEIVING_DFI_UNABLE_TO_SETTLE =
            T.let(
              :foreign_receiving_dfi_unable_to_settle,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R80. A rare return reason. The International ACH Transfer is malformed.
          IAT_ENTRY_CODING_ERROR =
            T.let(
              :iat_entry_coding_error,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R18. A rare return reason. The ACH has an improper effective entry date field.
          IMPROPER_EFFECTIVE_ENTRY_DATE =
            T.let(
              :improper_effective_entry_date,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R39. A rare return reason. The source document related to this ACH, usually an ACH check conversion, was presented to the bank.
          IMPROPER_SOURCE_DOCUMENT_SOURCE_DOCUMENT_PRESENTED =
            T.let(
              :improper_source_document_source_document_presented,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R21. A rare return reason. The Company ID field of the ACH was invalid.
          INVALID_COMPANY_ID =
            T.let(
              :invalid_company_id,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R82. A rare return reason. The foreign receiving bank identifier for an International ACH Transfer was invalid.
          INVALID_FOREIGN_RECEIVING_DFI_IDENTIFICATION =
            T.let(
              :invalid_foreign_receiving_dfi_identification,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R22. A rare return reason. The Individual ID number field of the ACH was invalid.
          INVALID_INDIVIDUAL_ID_NUMBER =
            T.let(
              :invalid_individual_id_number,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R53. A rare return reason. Both the Represented Check ("RCK") entry and the original check were presented to the bank.
          ITEM_AND_RCK_ENTRY_PRESENTED_FOR_PAYMENT =
            T.let(
              :item_and_rck_entry_presented_for_payment,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R51. A rare return reason. The Represented Check ("RCK") entry is ineligible.
          ITEM_RELATED_TO_RCK_ENTRY_IS_INELIGIBLE =
            T.let(
              :item_related_to_rck_entry_is_ineligible,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R26. A rare return reason. The ACH is missing a required field.
          MANDATORY_FIELD_ERROR =
            T.let(
              :mandatory_field_error,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R71. A rare return reason. The receiving bank does not recognize the routing number in a dishonored return entry.
          MISROUTED_DISHONORED_RETURN =
            T.let(
              :misrouted_dishonored_return,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R61. A rare return reason. The receiving bank does not recognize the routing number in a return entry.
          MISROUTED_RETURN =
            T.let(
              :misrouted_return,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R76. A rare return reason. Sent in response to a return, the bank does not find the errors alleged by the returning bank.
          NO_ERRORS_FOUND =
            T.let(
              :no_errors_found,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R77. A rare return reason. The receiving bank does not accept the return of the erroneous debit. The funds are not available at the receiving bank.
          NON_ACCEPTANCE_OF_R62_DISHONORED_RETURN =
            T.let(
              :non_acceptance_of_r62_dishonored_return,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R81. A rare return reason. The receiving bank does not accept International ACH Transfers.
          NON_PARTICIPANT_IN_IAT_PROGRAM =
            T.let(
              :non_participant_in_iat_program,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R31. A rare return reason. A return that has been agreed to be accepted by the receiving bank, despite falling outside of the usual return timeframe.
          PERMISSIBLE_RETURN_ENTRY =
            T.let(
              :permissible_return_entry,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R70. A rare return reason. The receiving bank had not approved this return.
          PERMISSIBLE_RETURN_ENTRY_NOT_ACCEPTED =
            T.let(
              :permissible_return_entry_not_accepted,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R32. A rare return reason. The receiving bank could not settle this transaction.
          RDFI_NON_SETTLEMENT =
            T.let(
              :rdfi_non_settlement,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R30. A rare return reason. The receiving bank does not accept Check Truncation ACH transfers.
          RDFI_PARTICIPANT_IN_CHECK_TRUNCATION_PROGRAM =
            T.let(
              :rdfi_participant_in_check_truncation_program,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R14. A rare return reason. The payee is deceased.
          REPRESENTATIVE_PAYEE_DECEASED_OR_UNABLE_TO_CONTINUE_IN_THAT_CAPACITY =
            T.let(
              :representative_payee_deceased_or_unable_to_continue_in_that_capacity,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R75. A rare return reason. The originating bank disputes that an earlier `duplicate_entry` return was actually a duplicate.
          RETURN_NOT_A_DUPLICATE =
            T.let(
              :return_not_a_duplicate,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R62. A rare return reason. The originating financial institution made a mistake and this return corrects it.
          RETURN_OF_ERRONEOUS_OR_REVERSING_DEBIT =
            T.let(
              :return_of_erroneous_or_reversing_debit,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R36. A rare return reason. Return of a malformed credit entry.
          RETURN_OF_IMPROPER_CREDIT_ENTRY =
            T.let(
              :return_of_improper_credit_entry,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R35. A rare return reason. Return of a malformed debit entry.
          RETURN_OF_IMPROPER_DEBIT_ENTRY =
            T.let(
              :return_of_improper_debit_entry,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R33. A rare return reason. Return of a Destroyed Check ("XKC") entry.
          RETURN_OF_XCK_ENTRY =
            T.let(
              :return_of_xck_entry,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R37. A rare return reason. The source document related to this ACH, usually an ACH check conversion, was presented to the bank.
          SOURCE_DOCUMENT_PRESENTED_FOR_PAYMENT =
            T.let(
              :source_document_presented_for_payment,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R50. A rare return reason. State law prevents the bank from accepting the Represented Check ("RCK") entry.
          STATE_LAW_AFFECTING_RCK_ACCEPTANCE =
            T.let(
              :state_law_affecting_rck_acceptance,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R52. A rare return reason. A stop payment was issued on a Represented Check ("RCK") entry.
          STOP_PAYMENT_ON_ITEM_RELATED_TO_RCK_ENTRY =
            T.let(
              :stop_payment_on_item_related_to_rck_entry,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R38. A rare return reason. The source attached to the ACH, usually an ACH check conversion, includes a stop payment.
          STOP_PAYMENT_ON_SOURCE_DOCUMENT =
            T.let(
              :stop_payment_on_source_document,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R73. A rare return reason. The bank receiving an `untimely_return` believes it was on time.
          TIMELY_ORIGINAL_RETURN =
            T.let(
              :timely_original_return,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R27. A rare return reason. An ACH return's trace number does not match an originated ACH.
          TRACE_NUMBER_ERROR =
            T.let(
              :trace_number_error,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R72. A rare return reason. The dishonored return was sent too late.
          UNTIMELY_DISHONORED_RETURN =
            T.let(
              :untimely_dishonored_return,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          # Code R68. A rare return reason. The return was sent too late.
          UNTIMELY_RETURN =
            T.let(
              :untimely_return,
              Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::ACHTransfer::Return::ReturnReasonCode::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Settlement < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::ACHTransfer::Settlement,
              Increase::Internal::AnyHash
            )
          end

        # When the funds for this transfer have settled at the destination bank at the
        # Federal Reserve.
        sig { returns(Time) }
        attr_accessor :settled_at

        # A subhash containing information about when and how the transfer settled at the
        # Federal Reserve.
        sig { params(settled_at: Time).returns(T.attached_class) }
        def self.new(
          # When the funds for this transfer have settled at the destination bank at the
          # Federal Reserve.
          settled_at:
        )
        end

        sig { override.returns({ settled_at: Time }) }
        def to_hash
        end
      end

      # The Standard Entry Class (SEC) code to use for the transfer.
      module StandardEntryClassCode
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::ACHTransfer::StandardEntryClassCode)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # Corporate Credit and Debit (CCD).
        CORPORATE_CREDIT_OR_DEBIT =
          T.let(
            :corporate_credit_or_debit,
            Increase::ACHTransfer::StandardEntryClassCode::TaggedSymbol
          )

        # Corporate Trade Exchange (CTX).
        CORPORATE_TRADE_EXCHANGE =
          T.let(
            :corporate_trade_exchange,
            Increase::ACHTransfer::StandardEntryClassCode::TaggedSymbol
          )

        # Prearranged Payments and Deposits (PPD).
        PREARRANGED_PAYMENTS_AND_DEPOSIT =
          T.let(
            :prearranged_payments_and_deposit,
            Increase::ACHTransfer::StandardEntryClassCode::TaggedSymbol
          )

        # Internet Initiated (WEB).
        INTERNET_INITIATED =
          T.let(
            :internet_initiated,
            Increase::ACHTransfer::StandardEntryClassCode::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Increase::ACHTransfer::StandardEntryClassCode::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # The lifecycle status of the transfer.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::ACHTransfer::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The transfer is pending approval.
        PENDING_APPROVAL =
          T.let(:pending_approval, Increase::ACHTransfer::Status::TaggedSymbol)

        # The transfer belongs to a Transfer Session that is pending confirmation.
        PENDING_TRANSFER_SESSION_CONFIRMATION =
          T.let(
            :pending_transfer_session_confirmation,
            Increase::ACHTransfer::Status::TaggedSymbol
          )

        # The transfer has been canceled.
        CANCELED = T.let(:canceled, Increase::ACHTransfer::Status::TaggedSymbol)

        # The transfer is pending submission to the Federal Reserve.
        PENDING_SUBMISSION =
          T.let(
            :pending_submission,
            Increase::ACHTransfer::Status::TaggedSymbol
          )

        # The transfer is pending review by Increase.
        PENDING_REVIEWING =
          T.let(:pending_reviewing, Increase::ACHTransfer::Status::TaggedSymbol)

        # The transfer requires attention from an Increase operator.
        REQUIRES_ATTENTION =
          T.let(
            :requires_attention,
            Increase::ACHTransfer::Status::TaggedSymbol
          )

        # The transfer has been rejected.
        REJECTED = T.let(:rejected, Increase::ACHTransfer::Status::TaggedSymbol)

        # The transfer is complete.
        SUBMITTED =
          T.let(:submitted, Increase::ACHTransfer::Status::TaggedSymbol)

        # The transfer has been returned.
        RETURNED = T.let(:returned, Increase::ACHTransfer::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::ACHTransfer::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Submission < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::ACHTransfer::Submission,
              Increase::Internal::AnyHash
            )
          end

        # The timestamp by which any administrative returns are expected to be received
        # by. This follows the NACHA guidelines for return windows, which are: "In
        # general, return entries must be received by the RDFI’s ACH Operator by its
        # deposit deadline for the return entry to be made available to the ODFI no later
        # than the opening of business on the second banking day following the Settlement
        # Date of the original entry.".
        sig { returns(Time) }
        attr_accessor :administrative_returns_expected_by

        # The ACH transfer's effective date as sent to the Federal Reserve. If a specific
        # date was configured using `preferred_effective_date`, this will match that
        # value. Otherwise, it will be the date selected (following the specified
        # settlement schedule) at the time the transfer was submitted.
        sig { returns(Date) }
        attr_accessor :effective_date

        # When the transfer is expected to settle in the recipient's account. Credits may
        # be available sooner, at the receiving banks discretion. The FedACH schedule is
        # published
        # [here](https://www.frbservices.org/resources/resource-centers/same-day-ach/fedach-processing-schedule.html).
        sig { returns(Time) }
        attr_accessor :expected_funds_settlement_at

        # The settlement schedule the transfer is expected to follow. This expectation
        # takes into account the `effective_date`, `submitted_at`, and the amount of the
        # transfer.
        sig do
          returns(
            Increase::ACHTransfer::Submission::ExpectedSettlementSchedule::TaggedSymbol
          )
        end
        attr_accessor :expected_settlement_schedule

        # When the ACH transfer was sent to FedACH.
        sig { returns(Time) }
        attr_accessor :submitted_at

        # A 15 digit number recorded in the Nacha file and transmitted to the receiving
        # bank. Along with the amount, date, and originating routing number, this can be
        # used to identify the ACH transfer at the receiving bank. ACH trace numbers are
        # not unique, but are
        # [used to correlate returns](https://increase.com/documentation/ach-returns#ach-returns).
        sig { returns(String) }
        attr_accessor :trace_number

        # After the transfer is submitted to FedACH, this will contain supplemental
        # details. Increase batches transfers and submits a file to the Federal Reserve
        # roughly every 30 minutes. The Federal Reserve processes ACH transfers during
        # weekdays according to their
        # [posted schedule](https://www.frbservices.org/resources/resource-centers/same-day-ach/fedach-processing-schedule.html).
        sig do
          params(
            administrative_returns_expected_by: Time,
            effective_date: Date,
            expected_funds_settlement_at: Time,
            expected_settlement_schedule:
              Increase::ACHTransfer::Submission::ExpectedSettlementSchedule::OrSymbol,
            submitted_at: Time,
            trace_number: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The timestamp by which any administrative returns are expected to be received
          # by. This follows the NACHA guidelines for return windows, which are: "In
          # general, return entries must be received by the RDFI’s ACH Operator by its
          # deposit deadline for the return entry to be made available to the ODFI no later
          # than the opening of business on the second banking day following the Settlement
          # Date of the original entry.".
          administrative_returns_expected_by:,
          # The ACH transfer's effective date as sent to the Federal Reserve. If a specific
          # date was configured using `preferred_effective_date`, this will match that
          # value. Otherwise, it will be the date selected (following the specified
          # settlement schedule) at the time the transfer was submitted.
          effective_date:,
          # When the transfer is expected to settle in the recipient's account. Credits may
          # be available sooner, at the receiving banks discretion. The FedACH schedule is
          # published
          # [here](https://www.frbservices.org/resources/resource-centers/same-day-ach/fedach-processing-schedule.html).
          expected_funds_settlement_at:,
          # The settlement schedule the transfer is expected to follow. This expectation
          # takes into account the `effective_date`, `submitted_at`, and the amount of the
          # transfer.
          expected_settlement_schedule:,
          # When the ACH transfer was sent to FedACH.
          submitted_at:,
          # A 15 digit number recorded in the Nacha file and transmitted to the receiving
          # bank. Along with the amount, date, and originating routing number, this can be
          # used to identify the ACH transfer at the receiving bank. ACH trace numbers are
          # not unique, but are
          # [used to correlate returns](https://increase.com/documentation/ach-returns#ach-returns).
          trace_number:
        )
        end

        sig do
          override.returns(
            {
              administrative_returns_expected_by: Time,
              effective_date: Date,
              expected_funds_settlement_at: Time,
              expected_settlement_schedule:
                Increase::ACHTransfer::Submission::ExpectedSettlementSchedule::TaggedSymbol,
              submitted_at: Time,
              trace_number: String
            }
          )
        end
        def to_hash
        end

        # The settlement schedule the transfer is expected to follow. This expectation
        # takes into account the `effective_date`, `submitted_at`, and the amount of the
        # transfer.
        module ExpectedSettlementSchedule
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::ACHTransfer::Submission::ExpectedSettlementSchedule
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The transfer is expected to settle same-day.
          SAME_DAY =
            T.let(
              :same_day,
              Increase::ACHTransfer::Submission::ExpectedSettlementSchedule::TaggedSymbol
            )

          # The transfer is expected to settle on a future date.
          FUTURE_DATED =
            T.let(
              :future_dated,
              Increase::ACHTransfer::Submission::ExpectedSettlementSchedule::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::ACHTransfer::Submission::ExpectedSettlementSchedule::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `ach_transfer`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::ACHTransfer::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ACH_TRANSFER =
          T.let(:ach_transfer, Increase::ACHTransfer::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[Increase::ACHTransfer::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
