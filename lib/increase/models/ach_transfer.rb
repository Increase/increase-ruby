# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::ACHTransfers#create
    class ACHTransfer < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The ACH transfer's identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute account_id
      #   The Account to which the transfer belongs.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute account_number
      #   The destination account number.
      #
      #   @return [String]
      required :account_number, String

      # @!attribute acknowledgement
      #   After the transfer is acknowledged by FedACH, this will contain supplemental
      #   details. The Federal Reserve sends an acknowledgement message for each file that
      #   Increase submits.
      #
      #   @return [Increase::Models::ACHTransfer::Acknowledgement, nil]
      required :acknowledgement, -> { Increase::ACHTransfer::Acknowledgement }, nil?: true

      # @!attribute addenda
      #   Additional information that will be sent to the recipient.
      #
      #   @return [Increase::Models::ACHTransfer::Addenda, nil]
      required :addenda, -> { Increase::ACHTransfer::Addenda }, nil?: true

      # @!attribute amount
      #   The transfer amount in USD cents. A positive amount indicates a credit transfer
      #   pushing funds to the receiving account. A negative amount indicates a debit
      #   transfer pulling funds from the receiving account.
      #
      #   @return [Integer]
      required :amount, Integer

      # @!attribute approval
      #   If your account requires approvals for transfers and the transfer was approved,
      #   this will contain details of the approval.
      #
      #   @return [Increase::Models::ACHTransfer::Approval, nil]
      required :approval, -> { Increase::ACHTransfer::Approval }, nil?: true

      # @!attribute cancellation
      #   If your account requires approvals for transfers and the transfer was not
      #   approved, this will contain details of the cancellation.
      #
      #   @return [Increase::Models::ACHTransfer::Cancellation, nil]
      required :cancellation, -> { Increase::ACHTransfer::Cancellation }, nil?: true

      # @!attribute company_descriptive_date
      #   The description of the date of the transfer.
      #
      #   @return [String, nil]
      required :company_descriptive_date, String, nil?: true

      # @!attribute company_discretionary_data
      #   The data you chose to associate with the transfer.
      #
      #   @return [String, nil]
      required :company_discretionary_data, String, nil?: true

      # @!attribute company_entry_description
      #   The description of the transfer you set to be shown to the recipient.
      #
      #   @return [String, nil]
      required :company_entry_description, String, nil?: true

      # @!attribute company_id
      #   The company ID associated with the transfer.
      #
      #   @return [String]
      required :company_id, String

      # @!attribute company_name
      #   The name by which the recipient knows you.
      #
      #   @return [String, nil]
      required :company_name, String, nil?: true

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the transfer was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute created_by
      #   What object created the transfer, either via the API or the dashboard.
      #
      #   @return [Increase::Models::ACHTransfer::CreatedBy, nil]
      required :created_by, -> { Increase::ACHTransfer::CreatedBy }, nil?: true

      # @!attribute currency
      #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's
      #   currency. For ACH transfers this is always equal to `usd`.
      #
      #   @return [Symbol, Increase::Models::ACHTransfer::Currency]
      required :currency, enum: -> { Increase::ACHTransfer::Currency }

      # @!attribute destination_account_holder
      #   The type of entity that owns the account to which the ACH Transfer is being
      #   sent.
      #
      #   @return [Symbol, Increase::Models::ACHTransfer::DestinationAccountHolder]
      required :destination_account_holder, enum: -> { Increase::ACHTransfer::DestinationAccountHolder }

      # @!attribute external_account_id
      #   The identifier of the External Account the transfer was made to, if any.
      #
      #   @return [String, nil]
      required :external_account_id, String, nil?: true

      # @!attribute funding
      #   The type of the account to which the transfer will be sent.
      #
      #   @return [Symbol, Increase::Models::ACHTransfer::Funding]
      required :funding, enum: -> { Increase::ACHTransfer::Funding }

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String, nil?: true

      # @!attribute inbound_funds_hold
      #   Increase will sometimes hold the funds for ACH debit transfers. If funds are
      #   held, this sub-object will contain details of the hold.
      #
      #   @return [Increase::Models::ACHTransfer::InboundFundsHold, nil]
      required :inbound_funds_hold, -> { Increase::ACHTransfer::InboundFundsHold }, nil?: true

      # @!attribute individual_id
      #   Your identifier for the transfer recipient.
      #
      #   @return [String, nil]
      required :individual_id, String, nil?: true

      # @!attribute individual_name
      #   The name of the transfer recipient. This value is information and not verified
      #   by the recipient's bank.
      #
      #   @return [String, nil]
      required :individual_name, String, nil?: true

      # @!attribute network
      #   The transfer's network.
      #
      #   @return [Symbol, Increase::Models::ACHTransfer::Network]
      required :network, enum: -> { Increase::ACHTransfer::Network }

      # @!attribute notifications_of_change
      #   If the receiving bank accepts the transfer but notifies that future transfers
      #   should use different details, this will contain those details.
      #
      #   @return [Array<Increase::Models::ACHTransfer::NotificationsOfChange>]
      required :notifications_of_change,
               -> { Increase::Internal::Type::ArrayOf[Increase::ACHTransfer::NotificationsOfChange] }

      # @!attribute pending_transaction_id
      #   The ID for the pending transaction representing the transfer. A pending
      #   transaction is created when the transfer
      #   [requires approval](https://increase.com/documentation/transfer-approvals#transfer-approvals)
      #   by someone else in your organization.
      #
      #   @return [String, nil]
      required :pending_transaction_id, String, nil?: true

      # @!attribute preferred_effective_date
      #   Configuration for how the effective date of the transfer will be set. This
      #   determines same-day vs future-dated settlement timing. If not set, defaults to a
      #   `settlement_schedule` of `same_day`. If set, exactly one of the child attributes
      #   must be set.
      #
      #   @return [Increase::Models::ACHTransfer::PreferredEffectiveDate]
      required :preferred_effective_date, -> { Increase::ACHTransfer::PreferredEffectiveDate }

      # @!attribute return_
      #   If your transfer is returned, this will contain details of the return.
      #
      #   @return [Increase::Models::ACHTransfer::Return, nil]
      required :return_, -> { Increase::ACHTransfer::Return }, api_name: :return, nil?: true

      # @!attribute routing_number
      #   The American Bankers' Association (ABA) Routing Transit Number (RTN).
      #
      #   @return [String]
      required :routing_number, String

      # @!attribute settlement
      #   A subhash containing information about when and how the transfer settled at the
      #   Federal Reserve.
      #
      #   @return [Increase::Models::ACHTransfer::Settlement, nil]
      required :settlement, -> { Increase::ACHTransfer::Settlement }, nil?: true

      # @!attribute standard_entry_class_code
      #   The
      #   [Standard Entry Class (SEC) code](/documentation/ach-standard-entry-class-codes)
      #   to use for the transfer.
      #
      #   @return [Symbol, Increase::Models::ACHTransfer::StandardEntryClassCode]
      required :standard_entry_class_code, enum: -> { Increase::ACHTransfer::StandardEntryClassCode }

      # @!attribute statement_descriptor
      #   The descriptor that will show on the recipient's bank statement.
      #
      #   @return [String]
      required :statement_descriptor, String

      # @!attribute status
      #   The lifecycle status of the transfer.
      #
      #   @return [Symbol, Increase::Models::ACHTransfer::Status]
      required :status, enum: -> { Increase::ACHTransfer::Status }

      # @!attribute submission
      #   After the transfer is submitted to FedACH, this will contain supplemental
      #   details. Increase batches transfers and submits a file to the Federal Reserve
      #   roughly every 30 minutes. The Federal Reserve processes ACH transfers during
      #   weekdays according to their
      #   [posted schedule](https://www.frbservices.org/resources/resource-centers/same-day-ach/fedach-processing-schedule.html).
      #
      #   @return [Increase::Models::ACHTransfer::Submission, nil]
      required :submission, -> { Increase::ACHTransfer::Submission }, nil?: true

      # @!attribute transaction_id
      #   The ID for the transaction funding the transfer.
      #
      #   @return [String, nil]
      required :transaction_id, String, nil?: true

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `ach_transfer`.
      #
      #   @return [Symbol, Increase::Models::ACHTransfer::Type]
      required :type, enum: -> { Increase::ACHTransfer::Type }

      # @!method initialize(id:, account_id:, account_number:, acknowledgement:, addenda:, amount:, approval:, cancellation:, company_descriptive_date:, company_discretionary_data:, company_entry_description:, company_id:, company_name:, created_at:, created_by:, currency:, destination_account_holder:, external_account_id:, funding:, idempotency_key:, inbound_funds_hold:, individual_id:, individual_name:, network:, notifications_of_change:, pending_transaction_id:, preferred_effective_date:, return_:, routing_number:, settlement:, standard_entry_class_code:, statement_descriptor:, status:, submission:, transaction_id:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::ACHTransfer} for more details.
      #
      #   ACH transfers move funds between your Increase account and any other account
      #   accessible by the Automated Clearing House (ACH).
      #
      #   @param id [String] The ACH transfer's identifier.
      #
      #   @param account_id [String] The Account to which the transfer belongs.
      #
      #   @param account_number [String] The destination account number.
      #
      #   @param acknowledgement [Increase::Models::ACHTransfer::Acknowledgement, nil] After the transfer is acknowledged by FedACH, this will contain supplemental det
      #
      #   @param addenda [Increase::Models::ACHTransfer::Addenda, nil] Additional information that will be sent to the recipient.
      #
      #   @param amount [Integer] The transfer amount in USD cents. A positive amount indicates a credit transfer
      #
      #   @param approval [Increase::Models::ACHTransfer::Approval, nil] If your account requires approvals for transfers and the transfer was approved,
      #
      #   @param cancellation [Increase::Models::ACHTransfer::Cancellation, nil] If your account requires approvals for transfers and the transfer was not approv
      #
      #   @param company_descriptive_date [String, nil] The description of the date of the transfer.
      #
      #   @param company_discretionary_data [String, nil] The data you chose to associate with the transfer.
      #
      #   @param company_entry_description [String, nil] The description of the transfer you set to be shown to the recipient.
      #
      #   @param company_id [String] The company ID associated with the transfer.
      #
      #   @param company_name [String, nil] The name by which the recipient knows you.
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
      #
      #   @param created_by [Increase::Models::ACHTransfer::CreatedBy, nil] What object created the transfer, either via the API or the dashboard.
      #
      #   @param currency [Symbol, Increase::Models::ACHTransfer::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's c
      #
      #   @param destination_account_holder [Symbol, Increase::Models::ACHTransfer::DestinationAccountHolder] The type of entity that owns the account to which the ACH Transfer is being sent
      #
      #   @param external_account_id [String, nil] The identifier of the External Account the transfer was made to, if any.
      #
      #   @param funding [Symbol, Increase::Models::ACHTransfer::Funding] The type of the account to which the transfer will be sent.
      #
      #   @param idempotency_key [String, nil] The idempotency key you chose for this object. This value is unique across Incre
      #
      #   @param inbound_funds_hold [Increase::Models::ACHTransfer::InboundFundsHold, nil] Increase will sometimes hold the funds for ACH debit transfers. If funds are hel
      #
      #   @param individual_id [String, nil] Your identifier for the transfer recipient.
      #
      #   @param individual_name [String, nil] The name of the transfer recipient. This value is information and not verified b
      #
      #   @param network [Symbol, Increase::Models::ACHTransfer::Network] The transfer's network.
      #
      #   @param notifications_of_change [Array<Increase::Models::ACHTransfer::NotificationsOfChange>] If the receiving bank accepts the transfer but notifies that future transfers sh
      #
      #   @param pending_transaction_id [String, nil] The ID for the pending transaction representing the transfer. A pending transact
      #
      #   @param preferred_effective_date [Increase::Models::ACHTransfer::PreferredEffectiveDate] Configuration for how the effective date of the transfer will be set. This deter
      #
      #   @param return_ [Increase::Models::ACHTransfer::Return, nil] If your transfer is returned, this will contain details of the return.
      #
      #   @param routing_number [String] The American Bankers' Association (ABA) Routing Transit Number (RTN).
      #
      #   @param settlement [Increase::Models::ACHTransfer::Settlement, nil] A subhash containing information about when and how the transfer settled at the
      #
      #   @param standard_entry_class_code [Symbol, Increase::Models::ACHTransfer::StandardEntryClassCode] The [Standard Entry Class (SEC) code](/documentation/ach-standard-entry-class-co
      #
      #   @param statement_descriptor [String] The descriptor that will show on the recipient's bank statement.
      #
      #   @param status [Symbol, Increase::Models::ACHTransfer::Status] The lifecycle status of the transfer.
      #
      #   @param submission [Increase::Models::ACHTransfer::Submission, nil] After the transfer is submitted to FedACH, this will contain supplemental detail
      #
      #   @param transaction_id [String, nil] The ID for the transaction funding the transfer.
      #
      #   @param type [Symbol, Increase::Models::ACHTransfer::Type] A constant representing the object's type. For this resource it will always be `

      # @see Increase::Models::ACHTransfer#acknowledgement
      class Acknowledgement < Increase::Internal::Type::BaseModel
        # @!attribute acknowledged_at
        #   When the Federal Reserve acknowledged the submitted file containing this
        #   transfer.
        #
        #   @return [String]
        required :acknowledged_at, String

        # @!method initialize(acknowledged_at:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::ACHTransfer::Acknowledgement} for more details.
        #
        #   After the transfer is acknowledged by FedACH, this will contain supplemental
        #   details. The Federal Reserve sends an acknowledgement message for each file that
        #   Increase submits.
        #
        #   @param acknowledged_at [String] When the Federal Reserve acknowledged the submitted file containing this transfe
      end

      # @see Increase::Models::ACHTransfer#addenda
      class Addenda < Increase::Internal::Type::BaseModel
        # @!attribute category
        #   The type of the resource. We may add additional possible values for this enum
        #   over time; your application should be able to handle such additions gracefully.
        #
        #   @return [Symbol, Increase::Models::ACHTransfer::Addenda::Category]
        required :category, enum: -> { Increase::ACHTransfer::Addenda::Category }

        # @!attribute freeform
        #   Unstructured `payment_related_information` passed through with the transfer.
        #
        #   @return [Increase::Models::ACHTransfer::Addenda::Freeform, nil]
        optional :freeform, -> { Increase::ACHTransfer::Addenda::Freeform }, nil?: true

        # @!attribute payment_order_remittance_advice
        #   Structured ASC X12 820 remittance advice records. Please reach out to
        #   [support@increase.com](mailto:support@increase.com) for more information.
        #
        #   @return [Increase::Models::ACHTransfer::Addenda::PaymentOrderRemittanceAdvice, nil]
        optional :payment_order_remittance_advice,
                 -> { Increase::ACHTransfer::Addenda::PaymentOrderRemittanceAdvice },
                 nil?: true

        # @!method initialize(category:, freeform: nil, payment_order_remittance_advice: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::ACHTransfer::Addenda} for more details.
        #
        #   Additional information that will be sent to the recipient.
        #
        #   @param category [Symbol, Increase::Models::ACHTransfer::Addenda::Category] The type of the resource. We may add additional possible values for this enum ov
        #
        #   @param freeform [Increase::Models::ACHTransfer::Addenda::Freeform, nil] Unstructured `payment_related_information` passed through with the transfer.
        #
        #   @param payment_order_remittance_advice [Increase::Models::ACHTransfer::Addenda::PaymentOrderRemittanceAdvice, nil] Structured ASC X12 820 remittance advice records. Please reach out to [support@i

        # The type of the resource. We may add additional possible values for this enum
        # over time; your application should be able to handle such additions gracefully.
        #
        # @see Increase::Models::ACHTransfer::Addenda#category
        module Category
          extend Increase::Internal::Type::Enum

          # Unstructured `payment_related_information` passed through with the transfer.
          FREEFORM = :freeform

          # Structured ASC X12 820 remittance advice records. Please reach out to [support@increase.com](mailto:support@increase.com) for more information.
          PAYMENT_ORDER_REMITTANCE_ADVICE = :payment_order_remittance_advice

          # Unknown addenda type.
          OTHER = :other

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Increase::Models::ACHTransfer::Addenda#freeform
        class Freeform < Increase::Internal::Type::BaseModel
          # @!attribute entries
          #   Each entry represents an addendum sent with the transfer.
          #
          #   @return [Array<Increase::Models::ACHTransfer::Addenda::Freeform::Entry>]
          required :entries,
                   -> { Increase::Internal::Type::ArrayOf[Increase::ACHTransfer::Addenda::Freeform::Entry] }

          # @!method initialize(entries:)
          #   Unstructured `payment_related_information` passed through with the transfer.
          #
          #   @param entries [Array<Increase::Models::ACHTransfer::Addenda::Freeform::Entry>] Each entry represents an addendum sent with the transfer.

          class Entry < Increase::Internal::Type::BaseModel
            # @!attribute payment_related_information
            #   The payment related information passed in the addendum.
            #
            #   @return [String]
            required :payment_related_information, String

            # @!method initialize(payment_related_information:)
            #   @param payment_related_information [String] The payment related information passed in the addendum.
          end
        end

        # @see Increase::Models::ACHTransfer::Addenda#payment_order_remittance_advice
        class PaymentOrderRemittanceAdvice < Increase::Internal::Type::BaseModel
          # @!attribute invoices
          #   ASC X12 RMR records for this specific transfer.
          #
          #   @return [Array<Increase::Models::ACHTransfer::Addenda::PaymentOrderRemittanceAdvice::Invoice>]
          required :invoices,
                   -> { Increase::Internal::Type::ArrayOf[Increase::ACHTransfer::Addenda::PaymentOrderRemittanceAdvice::Invoice] }

          # @!method initialize(invoices:)
          #   Structured ASC X12 820 remittance advice records. Please reach out to
          #   [support@increase.com](mailto:support@increase.com) for more information.
          #
          #   @param invoices [Array<Increase::Models::ACHTransfer::Addenda::PaymentOrderRemittanceAdvice::Invoice>] ASC X12 RMR records for this specific transfer.

          class Invoice < Increase::Internal::Type::BaseModel
            # @!attribute invoice_number
            #   The invoice number for this reference, determined in advance with the receiver.
            #
            #   @return [String]
            required :invoice_number, String

            # @!attribute paid_amount
            #   The amount that was paid for this invoice in the minor unit of its currency. For
            #   dollars, for example, this is cents.
            #
            #   @return [Integer]
            required :paid_amount, Integer

            # @!method initialize(invoice_number:, paid_amount:)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::ACHTransfer::Addenda::PaymentOrderRemittanceAdvice::Invoice}
            #   for more details.
            #
            #   @param invoice_number [String] The invoice number for this reference, determined in advance with the receiver.
            #
            #   @param paid_amount [Integer] The amount that was paid for this invoice in the minor unit of its currency. For
          end
        end
      end

      # @see Increase::Models::ACHTransfer#approval
      class Approval < Increase::Internal::Type::BaseModel
        # @!attribute approved_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   the transfer was approved.
        #
        #   @return [Time]
        required :approved_at, Time

        # @!attribute approved_by
        #   If the Transfer was approved by a user in the dashboard, the email address of
        #   that user.
        #
        #   @return [String, nil]
        required :approved_by, String, nil?: true

        # @!method initialize(approved_at:, approved_by:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::ACHTransfer::Approval} for more details.
        #
        #   If your account requires approvals for transfers and the transfer was approved,
        #   this will contain details of the approval.
        #
        #   @param approved_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
        #
        #   @param approved_by [String, nil] If the Transfer was approved by a user in the dashboard, the email address of th
      end

      # @see Increase::Models::ACHTransfer#cancellation
      class Cancellation < Increase::Internal::Type::BaseModel
        # @!attribute canceled_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   the Transfer was canceled.
        #
        #   @return [Time]
        required :canceled_at, Time

        # @!attribute canceled_by
        #   If the Transfer was canceled by a user in the dashboard, the email address of
        #   that user.
        #
        #   @return [String, nil]
        required :canceled_by, String, nil?: true

        # @!method initialize(canceled_at:, canceled_by:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::ACHTransfer::Cancellation} for more details.
        #
        #   If your account requires approvals for transfers and the transfer was not
        #   approved, this will contain details of the cancellation.
        #
        #   @param canceled_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
        #
        #   @param canceled_by [String, nil] If the Transfer was canceled by a user in the dashboard, the email address of th
      end

      # @see Increase::Models::ACHTransfer#created_by
      class CreatedBy < Increase::Internal::Type::BaseModel
        # @!attribute category
        #   The type of object that created this transfer.
        #
        #   @return [Symbol, Increase::Models::ACHTransfer::CreatedBy::Category]
        required :category, enum: -> { Increase::ACHTransfer::CreatedBy::Category }

        # @!attribute api_key
        #   If present, details about the API key that created the transfer.
        #
        #   @return [Increase::Models::ACHTransfer::CreatedBy::APIKey, nil]
        optional :api_key, -> { Increase::ACHTransfer::CreatedBy::APIKey }, nil?: true

        # @!attribute oauth_application
        #   If present, details about the OAuth Application that created the transfer.
        #
        #   @return [Increase::Models::ACHTransfer::CreatedBy::OAuthApplication, nil]
        optional :oauth_application, -> { Increase::ACHTransfer::CreatedBy::OAuthApplication }, nil?: true

        # @!attribute user
        #   If present, details about the User that created the transfer.
        #
        #   @return [Increase::Models::ACHTransfer::CreatedBy::User, nil]
        optional :user, -> { Increase::ACHTransfer::CreatedBy::User }, nil?: true

        # @!method initialize(category:, api_key: nil, oauth_application: nil, user: nil)
        #   What object created the transfer, either via the API or the dashboard.
        #
        #   @param category [Symbol, Increase::Models::ACHTransfer::CreatedBy::Category] The type of object that created this transfer.
        #
        #   @param api_key [Increase::Models::ACHTransfer::CreatedBy::APIKey, nil] If present, details about the API key that created the transfer.
        #
        #   @param oauth_application [Increase::Models::ACHTransfer::CreatedBy::OAuthApplication, nil] If present, details about the OAuth Application that created the transfer.
        #
        #   @param user [Increase::Models::ACHTransfer::CreatedBy::User, nil] If present, details about the User that created the transfer.

        # The type of object that created this transfer.
        #
        # @see Increase::Models::ACHTransfer::CreatedBy#category
        module Category
          extend Increase::Internal::Type::Enum

          # An API key. Details will be under the `api_key` object.
          API_KEY = :api_key

          # An OAuth application you connected to Increase. Details will be under the `oauth_application` object.
          OAUTH_APPLICATION = :oauth_application

          # A User in the Increase dashboard. Details will be under the `user` object.
          USER = :user

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Increase::Models::ACHTransfer::CreatedBy#api_key
        class APIKey < Increase::Internal::Type::BaseModel
          # @!attribute description
          #   The description set for the API key when it was created.
          #
          #   @return [String, nil]
          required :description, String, nil?: true

          # @!method initialize(description:)
          #   If present, details about the API key that created the transfer.
          #
          #   @param description [String, nil] The description set for the API key when it was created.
        end

        # @see Increase::Models::ACHTransfer::CreatedBy#oauth_application
        class OAuthApplication < Increase::Internal::Type::BaseModel
          # @!attribute name
          #   The name of the OAuth Application.
          #
          #   @return [String]
          required :name, String

          # @!method initialize(name:)
          #   If present, details about the OAuth Application that created the transfer.
          #
          #   @param name [String] The name of the OAuth Application.
        end

        # @see Increase::Models::ACHTransfer::CreatedBy#user
        class User < Increase::Internal::Type::BaseModel
          # @!attribute email
          #   The email address of the User.
          #
          #   @return [String]
          required :email, String

          # @!method initialize(email:)
          #   If present, details about the User that created the transfer.
          #
          #   @param email [String] The email address of the User.
        end
      end

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's
      # currency. For ACH transfers this is always equal to `usd`.
      #
      # @see Increase::Models::ACHTransfer#currency
      module Currency
        extend Increase::Internal::Type::Enum

        # US Dollar (USD)
        USD = :USD

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # The type of entity that owns the account to which the ACH Transfer is being
      # sent.
      #
      # @see Increase::Models::ACHTransfer#destination_account_holder
      module DestinationAccountHolder
        extend Increase::Internal::Type::Enum

        # The External Account is owned by a business.
        BUSINESS = :business

        # The External Account is owned by an individual.
        INDIVIDUAL = :individual

        # It's unknown what kind of entity owns the External Account.
        UNKNOWN = :unknown

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # The type of the account to which the transfer will be sent.
      #
      # @see Increase::Models::ACHTransfer#funding
      module Funding
        extend Increase::Internal::Type::Enum

        # A checking account.
        CHECKING = :checking

        # A savings account.
        SAVINGS = :savings

        # A bank's general ledger. Uncommon.
        GENERAL_LEDGER = :general_ledger

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Increase::Models::ACHTransfer#inbound_funds_hold
      class InboundFundsHold < Increase::Internal::Type::BaseModel
        # @!attribute amount
        #   The held amount in the minor unit of the account's currency. For dollars, for
        #   example, this is cents.
        #
        #   @return [Integer]
        required :amount, Integer

        # @!attribute automatically_releases_at
        #   When the hold will be released automatically. Certain conditions may cause it to
        #   be released before this time.
        #
        #   @return [Time]
        required :automatically_releases_at, Time

        # @!attribute created_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the hold
        #   was created.
        #
        #   @return [Time]
        required :created_at, Time

        # @!attribute currency
        #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the hold's
        #   currency.
        #
        #   @return [Symbol, Increase::Models::ACHTransfer::InboundFundsHold::Currency]
        required :currency, enum: -> { Increase::ACHTransfer::InboundFundsHold::Currency }

        # @!attribute held_transaction_id
        #   The ID of the Transaction for which funds were held.
        #
        #   @return [String, nil]
        required :held_transaction_id, String, nil?: true

        # @!attribute pending_transaction_id
        #   The ID of the Pending Transaction representing the held funds.
        #
        #   @return [String, nil]
        required :pending_transaction_id, String, nil?: true

        # @!attribute released_at
        #   When the hold was released (if it has been released).
        #
        #   @return [Time, nil]
        required :released_at, Time, nil?: true

        # @!attribute status
        #   The status of the hold.
        #
        #   @return [Symbol, Increase::Models::ACHTransfer::InboundFundsHold::Status]
        required :status, enum: -> { Increase::ACHTransfer::InboundFundsHold::Status }

        # @!attribute type
        #   A constant representing the object's type. For this resource it will always be
        #   `inbound_funds_hold`.
        #
        #   @return [Symbol, Increase::Models::ACHTransfer::InboundFundsHold::Type]
        required :type, enum: -> { Increase::ACHTransfer::InboundFundsHold::Type }

        # @!method initialize(amount:, automatically_releases_at:, created_at:, currency:, held_transaction_id:, pending_transaction_id:, released_at:, status:, type:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::ACHTransfer::InboundFundsHold} for more details.
        #
        #   Increase will sometimes hold the funds for ACH debit transfers. If funds are
        #   held, this sub-object will contain details of the hold.
        #
        #   @param amount [Integer] The held amount in the minor unit of the account's currency. For dollars, for ex
        #
        #   @param automatically_releases_at [Time] When the hold will be released automatically. Certain conditions may cause it to
        #
        #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) time at which the hold wa
        #
        #   @param currency [Symbol, Increase::Models::ACHTransfer::InboundFundsHold::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the hold's curre
        #
        #   @param held_transaction_id [String, nil] The ID of the Transaction for which funds were held.
        #
        #   @param pending_transaction_id [String, nil] The ID of the Pending Transaction representing the held funds.
        #
        #   @param released_at [Time, nil] When the hold was released (if it has been released).
        #
        #   @param status [Symbol, Increase::Models::ACHTransfer::InboundFundsHold::Status] The status of the hold.
        #
        #   @param type [Symbol, Increase::Models::ACHTransfer::InboundFundsHold::Type] A constant representing the object's type. For this resource it will always be `

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the hold's
        # currency.
        #
        # @see Increase::Models::ACHTransfer::InboundFundsHold#currency
        module Currency
          extend Increase::Internal::Type::Enum

          # US Dollar (USD)
          USD = :USD

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # The status of the hold.
        #
        # @see Increase::Models::ACHTransfer::InboundFundsHold#status
        module Status
          extend Increase::Internal::Type::Enum

          # Funds are still being held.
          HELD = :held

          # Funds have been released.
          COMPLETE = :complete

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # A constant representing the object's type. For this resource it will always be
        # `inbound_funds_hold`.
        #
        # @see Increase::Models::ACHTransfer::InboundFundsHold#type
        module Type
          extend Increase::Internal::Type::Enum

          INBOUND_FUNDS_HOLD = :inbound_funds_hold

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # The transfer's network.
      #
      # @see Increase::Models::ACHTransfer#network
      module Network
        extend Increase::Internal::Type::Enum

        ACH = :ach

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class NotificationsOfChange < Increase::Internal::Type::BaseModel
        # @!attribute change_code
        #   The required type of change that is being signaled by the receiving financial
        #   institution.
        #
        #   @return [Symbol, Increase::Models::ACHTransfer::NotificationsOfChange::ChangeCode]
        required :change_code, enum: -> { Increase::ACHTransfer::NotificationsOfChange::ChangeCode }

        # @!attribute corrected_data
        #   The corrected data that should be used in future ACHs to this account. This may
        #   contain the suggested new account number or routing number. When the
        #   `change_code` is `incorrect_transaction_code`, this field contains an integer.
        #   Numbers starting with a 2 encourage changing the `funding` parameter to
        #   checking; numbers starting with a 3 encourage changing to savings.
        #
        #   @return [String]
        required :corrected_data, String

        # @!attribute created_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   the notification occurred.
        #
        #   @return [Time]
        required :created_at, Time

        # @!method initialize(change_code:, corrected_data:, created_at:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::ACHTransfer::NotificationsOfChange} for more details.
        #
        #   @param change_code [Symbol, Increase::Models::ACHTransfer::NotificationsOfChange::ChangeCode] The required type of change that is being signaled by the receiving financial in
        #
        #   @param corrected_data [String] The corrected data that should be used in future ACHs to this account. This may
        #
        #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th

        # The required type of change that is being signaled by the receiving financial
        # institution.
        #
        # @see Increase::Models::ACHTransfer::NotificationsOfChange#change_code
        module ChangeCode
          extend Increase::Internal::Type::Enum

          # The account number was incorrect.
          INCORRECT_ACCOUNT_NUMBER = :incorrect_account_number

          # The routing number was incorrect.
          INCORRECT_ROUTING_NUMBER = :incorrect_routing_number

          # Both the routing number and the account number were incorrect.
          INCORRECT_ROUTING_NUMBER_AND_ACCOUNT_NUMBER = :incorrect_routing_number_and_account_number

          # The transaction code was incorrect. Try changing the `funding` parameter from checking to savings or vice-versa.
          INCORRECT_TRANSACTION_CODE = :incorrect_transaction_code

          # The account number and the transaction code were incorrect.
          INCORRECT_ACCOUNT_NUMBER_AND_TRANSACTION_CODE = :incorrect_account_number_and_transaction_code

          # The routing number, account number, and transaction code were incorrect.
          INCORRECT_ROUTING_NUMBER_ACCOUNT_NUMBER_AND_TRANSACTION_CODE =
            :incorrect_routing_number_account_number_and_transaction_code

          # The receiving depository financial institution identification was incorrect.
          INCORRECT_RECEIVING_DEPOSITORY_FINANCIAL_INSTITUTION_IDENTIFICATION =
            :incorrect_receiving_depository_financial_institution_identification

          # The individual identification number was incorrect.
          INCORRECT_INDIVIDUAL_IDENTIFICATION_NUMBER = :incorrect_individual_identification_number

          # The addenda had an incorrect format.
          ADDENDA_FORMAT_ERROR = :addenda_format_error

          # The standard entry class code was incorrect for an outbound international payment.
          INCORRECT_STANDARD_ENTRY_CLASS_CODE_FOR_OUTBOUND_INTERNATIONAL_PAYMENT =
            :incorrect_standard_entry_class_code_for_outbound_international_payment

          # The notification of change was misrouted.
          MISROUTED_NOTIFICATION_OF_CHANGE = :misrouted_notification_of_change

          # The trace number was incorrect.
          INCORRECT_TRACE_NUMBER = :incorrect_trace_number

          # The company identification number was incorrect.
          INCORRECT_COMPANY_IDENTIFICATION_NUMBER = :incorrect_company_identification_number

          # The individual identification number or identification number was incorrect.
          INCORRECT_IDENTIFICATION_NUMBER = :incorrect_identification_number

          # The corrected data was incorrectly formatted.
          INCORRECTLY_FORMATTED_CORRECTED_DATA = :incorrectly_formatted_corrected_data

          # The discretionary data was incorrect.
          INCORRECT_DISCRETIONARY_DATA = :incorrect_discretionary_data

          # The routing number was not from the original entry detail record.
          ROUTING_NUMBER_NOT_FROM_ORIGINAL_ENTRY_DETAIL_RECORD =
            :routing_number_not_from_original_entry_detail_record

          # The depository financial institution account number was not from the original entry detail record.
          DEPOSITORY_FINANCIAL_INSTITUTION_ACCOUNT_NUMBER_NOT_FROM_ORIGINAL_ENTRY_DETAIL_RECORD =
            :depository_financial_institution_account_number_not_from_original_entry_detail_record

          # The transaction code was incorrect, initiated by the originating depository financial institution.
          INCORRECT_TRANSACTION_CODE_BY_ORIGINATING_DEPOSITORY_FINANCIAL_INSTITUTION =
            :incorrect_transaction_code_by_originating_depository_financial_institution

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see Increase::Models::ACHTransfer#preferred_effective_date
      class PreferredEffectiveDate < Increase::Internal::Type::BaseModel
        # @!attribute date
        #   A specific date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format to
        #   use as the effective date when submitting this transfer.
        #
        #   @return [Date, nil]
        required :date, Date, nil?: true

        # @!attribute settlement_schedule
        #   A schedule by which Increase will choose an effective date for the transfer.
        #
        #   @return [Symbol, Increase::Models::ACHTransfer::PreferredEffectiveDate::SettlementSchedule, nil]
        required :settlement_schedule,
                 enum: -> { Increase::ACHTransfer::PreferredEffectiveDate::SettlementSchedule },
                 nil?: true

        # @!method initialize(date:, settlement_schedule:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::ACHTransfer::PreferredEffectiveDate} for more details.
        #
        #   Configuration for how the effective date of the transfer will be set. This
        #   determines same-day vs future-dated settlement timing. If not set, defaults to a
        #   `settlement_schedule` of `same_day`. If set, exactly one of the child attributes
        #   must be set.
        #
        #   @param date [Date, nil] A specific date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format to
        #
        #   @param settlement_schedule [Symbol, Increase::Models::ACHTransfer::PreferredEffectiveDate::SettlementSchedule, nil] A schedule by which Increase will choose an effective date for the transfer.

        # A schedule by which Increase will choose an effective date for the transfer.
        #
        # @see Increase::Models::ACHTransfer::PreferredEffectiveDate#settlement_schedule
        module SettlementSchedule
          extend Increase::Internal::Type::Enum

          # The chosen effective date will be the same as the ACH processing date on which the transfer is submitted.
          # This is necessary, but not sufficient for the transfer to be settled same-day:
          # it must also be submitted before the last same-day cutoff
          # and be less than or equal to $1,000.000.00.
          SAME_DAY = :same_day

          # The chosen effective date will be the business day following the ACH processing date on which the transfer is submitted. The transfer will be settled on that future day.
          FUTURE_DATED = :future_dated

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see Increase::Models::ACHTransfer#return_
      class Return < Increase::Internal::Type::BaseModel
        # @!attribute created_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   the transfer was created.
        #
        #   @return [Time]
        required :created_at, Time

        # @!attribute raw_return_reason_code
        #   The three character ACH return code, in the range R01 to R85.
        #
        #   @return [String]
        required :raw_return_reason_code, String

        # @!attribute return_reason_code
        #   Why the ACH Transfer was returned. This reason code is sent by the receiving
        #   bank back to Increase.
        #
        #   @return [Symbol, Increase::Models::ACHTransfer::Return::ReturnReasonCode]
        required :return_reason_code, enum: -> { Increase::ACHTransfer::Return::ReturnReasonCode }

        # @!attribute trace_number
        #   A 15 digit number that was generated by the bank that initiated the return. The
        #   trace number of the return is different than that of the original transfer. ACH
        #   trace numbers are not unique, but along with the amount and date this number can
        #   be used to identify the ACH return at the bank that initiated it.
        #
        #   @return [String]
        required :trace_number, String

        # @!attribute transaction_id
        #   The identifier of the Transaction associated with this return.
        #
        #   @return [String]
        required :transaction_id, String

        # @!attribute transfer_id
        #   The identifier of the ACH Transfer associated with this return.
        #
        #   @return [String]
        required :transfer_id, String

        # @!method initialize(created_at:, raw_return_reason_code:, return_reason_code:, trace_number:, transaction_id:, transfer_id:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::ACHTransfer::Return} for more details.
        #
        #   If your transfer is returned, this will contain details of the return.
        #
        #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
        #
        #   @param raw_return_reason_code [String] The three character ACH return code, in the range R01 to R85.
        #
        #   @param return_reason_code [Symbol, Increase::Models::ACHTransfer::Return::ReturnReasonCode] Why the ACH Transfer was returned. This reason code is sent by the receiving ban
        #
        #   @param trace_number [String] A 15 digit number that was generated by the bank that initiated the return. The
        #
        #   @param transaction_id [String] The identifier of the Transaction associated with this return.
        #
        #   @param transfer_id [String] The identifier of the ACH Transfer associated with this return.

        # Why the ACH Transfer was returned. This reason code is sent by the receiving
        # bank back to Increase.
        #
        # @see Increase::Models::ACHTransfer::Return#return_reason_code
        module ReturnReasonCode
          extend Increase::Internal::Type::Enum

          # Code R01. Insufficient funds in the receiving account. Sometimes abbreviated to NSF.
          INSUFFICIENT_FUND = :insufficient_fund

          # Code R03. The account does not exist or the receiving bank was unable to locate it.
          NO_ACCOUNT = :no_account

          # Code R02. The account is closed at the receiving bank.
          ACCOUNT_CLOSED = :account_closed

          # Code R04. The account number is invalid at the receiving bank.
          INVALID_ACCOUNT_NUMBER_STRUCTURE = :invalid_account_number_structure

          # Code R16. The account at the receiving bank was frozen per the Office of Foreign Assets Control.
          ACCOUNT_FROZEN_ENTRY_RETURNED_PER_OFAC_INSTRUCTION = :account_frozen_entry_returned_per_ofac_instruction

          # Code R23. The receiving bank account refused a credit transfer.
          CREDIT_ENTRY_REFUSED_BY_RECEIVER = :credit_entry_refused_by_receiver

          # Code R05. The receiving bank rejected because of an incorrect Standard Entry Class code.
          UNAUTHORIZED_DEBIT_TO_CONSUMER_ACCOUNT_USING_CORPORATE_SEC_CODE =
            :unauthorized_debit_to_consumer_account_using_corporate_sec_code

          # Code R29. The corporate customer at the receiving bank reversed the transfer.
          CORPORATE_CUSTOMER_ADVISED_NOT_AUTHORIZED = :corporate_customer_advised_not_authorized

          # Code R08. The receiving bank stopped payment on this transfer.
          PAYMENT_STOPPED = :payment_stopped

          # Code R20. The receiving bank account does not perform transfers.
          NON_TRANSACTION_ACCOUNT = :non_transaction_account

          # Code R09. The receiving bank account does not have enough available balance for the transfer.
          UNCOLLECTED_FUNDS = :uncollected_funds

          # Code R28. The routing number is incorrect.
          ROUTING_NUMBER_CHECK_DIGIT_ERROR = :routing_number_check_digit_error

          # Code R10. The customer at the receiving bank reversed the transfer.
          CUSTOMER_ADVISED_UNAUTHORIZED_IMPROPER_INELIGIBLE_OR_INCOMPLETE =
            :customer_advised_unauthorized_improper_ineligible_or_incomplete

          # Code R19. The amount field is incorrect or too large.
          AMOUNT_FIELD_ERROR = :amount_field_error

          # Code R07. The customer at the receiving institution informed their bank that they have revoked authorization for a previously authorized transfer.
          AUTHORIZATION_REVOKED_BY_CUSTOMER = :authorization_revoked_by_customer

          # Code R13. The routing number is invalid.
          INVALID_ACH_ROUTING_NUMBER = :invalid_ach_routing_number

          # Code R17. The receiving bank is unable to process a field in the transfer.
          FILE_RECORD_EDIT_CRITERIA = :file_record_edit_criteria

          # Code R45. The individual name field was invalid.
          ENR_INVALID_INDIVIDUAL_NAME = :enr_invalid_individual_name

          # Code R06. The originating financial institution asked for this transfer to be returned. The receiving bank is complying with the request.
          RETURNED_PER_ODFI_REQUEST = :returned_per_odfi_request

          # Code R34. The receiving bank's regulatory supervisor has limited their participation in the ACH network.
          LIMITED_PARTICIPATION_DFI = :limited_participation_dfi

          # Code R85. The outbound international ACH transfer was incorrect.
          INCORRECTLY_CODED_OUTBOUND_INTERNATIONAL_PAYMENT = :incorrectly_coded_outbound_international_payment

          # Code R12. A rare return reason. The account was sold to another bank.
          ACCOUNT_SOLD_TO_ANOTHER_DFI = :account_sold_to_another_dfi

          # Code R25. The addenda record is incorrect or missing.
          ADDENDA_ERROR = :addenda_error

          # Code R15. A rare return reason. The account holder is deceased.
          BENEFICIARY_OR_ACCOUNT_HOLDER_DECEASED = :beneficiary_or_account_holder_deceased

          # Code R11. A rare return reason. The customer authorized some payment to the sender, but this payment was not in error.
          CUSTOMER_ADVISED_NOT_WITHIN_AUTHORIZATION_TERMS = :customer_advised_not_within_authorization_terms

          # Code R74. A rare return reason. Sent in response to a return that was returned with code `field_error`. The latest return should include the corrected field(s).
          CORRECTED_RETURN = :corrected_return

          # Code R24. A rare return reason. The receiving bank received an exact duplicate entry with the same trace number and amount.
          DUPLICATE_ENTRY = :duplicate_entry

          # Code R67. A rare return reason. The return this message refers to was a duplicate.
          DUPLICATE_RETURN = :duplicate_return

          # Code R47. A rare return reason. Only used for US Government agency non-monetary automatic enrollment messages.
          ENR_DUPLICATE_ENROLLMENT = :enr_duplicate_enrollment

          # Code R43. A rare return reason. Only used for US Government agency non-monetary automatic enrollment messages.
          ENR_INVALID_DFI_ACCOUNT_NUMBER = :enr_invalid_dfi_account_number

          # Code R44. A rare return reason. Only used for US Government agency non-monetary automatic enrollment messages.
          ENR_INVALID_INDIVIDUAL_ID_NUMBER = :enr_invalid_individual_id_number

          # Code R46. A rare return reason. Only used for US Government agency non-monetary automatic enrollment messages.
          ENR_INVALID_REPRESENTATIVE_PAYEE_INDICATOR = :enr_invalid_representative_payee_indicator

          # Code R41. A rare return reason. Only used for US Government agency non-monetary automatic enrollment messages.
          ENR_INVALID_TRANSACTION_CODE = :enr_invalid_transaction_code

          # Code R40. A rare return reason. Only used for US Government agency non-monetary automatic enrollment messages.
          ENR_RETURN_OF_ENR_ENTRY = :enr_return_of_enr_entry

          # Code R42. A rare return reason. Only used for US Government agency non-monetary automatic enrollment messages.
          ENR_ROUTING_NUMBER_CHECK_DIGIT_ERROR = :enr_routing_number_check_digit_error

          # Code R84. A rare return reason. The International ACH Transfer cannot be processed by the gateway.
          ENTRY_NOT_PROCESSED_BY_GATEWAY = :entry_not_processed_by_gateway

          # Code R69. A rare return reason. One or more of the fields in the ACH were malformed.
          FIELD_ERROR = :field_error

          # Code R83. A rare return reason. The Foreign receiving bank was unable to settle this ACH transfer.
          FOREIGN_RECEIVING_DFI_UNABLE_TO_SETTLE = :foreign_receiving_dfi_unable_to_settle

          # Code R80. A rare return reason. The International ACH Transfer is malformed.
          IAT_ENTRY_CODING_ERROR = :iat_entry_coding_error

          # Code R18. A rare return reason. The ACH has an improper effective entry date field.
          IMPROPER_EFFECTIVE_ENTRY_DATE = :improper_effective_entry_date

          # Code R39. A rare return reason. The source document related to this ACH, usually an ACH check conversion, was presented to the bank.
          IMPROPER_SOURCE_DOCUMENT_SOURCE_DOCUMENT_PRESENTED = :improper_source_document_source_document_presented

          # Code R21. A rare return reason. The Company ID field of the ACH was invalid.
          INVALID_COMPANY_ID = :invalid_company_id

          # Code R82. A rare return reason. The foreign receiving bank identifier for an International ACH Transfer was invalid.
          INVALID_FOREIGN_RECEIVING_DFI_IDENTIFICATION = :invalid_foreign_receiving_dfi_identification

          # Code R22. A rare return reason. The Individual ID number field of the ACH was invalid.
          INVALID_INDIVIDUAL_ID_NUMBER = :invalid_individual_id_number

          # Code R53. A rare return reason. Both the Represented Check ("RCK") entry and the original check were presented to the bank.
          ITEM_AND_RCK_ENTRY_PRESENTED_FOR_PAYMENT = :item_and_rck_entry_presented_for_payment

          # Code R51. A rare return reason. The Represented Check ("RCK") entry is ineligible.
          ITEM_RELATED_TO_RCK_ENTRY_IS_INELIGIBLE = :item_related_to_rck_entry_is_ineligible

          # Code R26. A rare return reason. The ACH is missing a required field.
          MANDATORY_FIELD_ERROR = :mandatory_field_error

          # Code R71. A rare return reason. The receiving bank does not recognize the routing number in a dishonored return entry.
          MISROUTED_DISHONORED_RETURN = :misrouted_dishonored_return

          # Code R61. A rare return reason. The receiving bank does not recognize the routing number in a return entry.
          MISROUTED_RETURN = :misrouted_return

          # Code R76. A rare return reason. Sent in response to a return, the bank does not find the errors alleged by the returning bank.
          NO_ERRORS_FOUND = :no_errors_found

          # Code R77. A rare return reason. The receiving bank does not accept the return of the erroneous debit. The funds are not available at the receiving bank.
          NON_ACCEPTANCE_OF_R62_DISHONORED_RETURN = :non_acceptance_of_r62_dishonored_return

          # Code R81. A rare return reason. The receiving bank does not accept International ACH Transfers.
          NON_PARTICIPANT_IN_IAT_PROGRAM = :non_participant_in_iat_program

          # Code R31. A rare return reason. A return that has been agreed to be accepted by the receiving bank, despite falling outside of the usual return timeframe.
          PERMISSIBLE_RETURN_ENTRY = :permissible_return_entry

          # Code R70. A rare return reason. The receiving bank had not approved this return.
          PERMISSIBLE_RETURN_ENTRY_NOT_ACCEPTED = :permissible_return_entry_not_accepted

          # Code R32. A rare return reason. The receiving bank could not settle this transaction.
          RDFI_NON_SETTLEMENT = :rdfi_non_settlement

          # Code R30. A rare return reason. The receiving bank does not accept Check Truncation ACH transfers.
          RDFI_PARTICIPANT_IN_CHECK_TRUNCATION_PROGRAM = :rdfi_participant_in_check_truncation_program

          # Code R14. A rare return reason. The payee is deceased.
          REPRESENTATIVE_PAYEE_DECEASED_OR_UNABLE_TO_CONTINUE_IN_THAT_CAPACITY =
            :representative_payee_deceased_or_unable_to_continue_in_that_capacity

          # Code R75. A rare return reason. The originating bank disputes that an earlier `duplicate_entry` return was actually a duplicate.
          RETURN_NOT_A_DUPLICATE = :return_not_a_duplicate

          # Code R62. A rare return reason. The originating financial institution made a mistake and this return corrects it.
          RETURN_OF_ERRONEOUS_OR_REVERSING_DEBIT = :return_of_erroneous_or_reversing_debit

          # Code R36. A rare return reason. Return of a malformed credit entry.
          RETURN_OF_IMPROPER_CREDIT_ENTRY = :return_of_improper_credit_entry

          # Code R35. A rare return reason. Return of a malformed debit entry.
          RETURN_OF_IMPROPER_DEBIT_ENTRY = :return_of_improper_debit_entry

          # Code R33. A rare return reason. Return of a Destroyed Check ("XKC") entry.
          RETURN_OF_XCK_ENTRY = :return_of_xck_entry

          # Code R37. A rare return reason. The source document related to this ACH, usually an ACH check conversion, was presented to the bank.
          SOURCE_DOCUMENT_PRESENTED_FOR_PAYMENT = :source_document_presented_for_payment

          # Code R50. A rare return reason. State law prevents the bank from accepting the Represented Check ("RCK") entry.
          STATE_LAW_AFFECTING_RCK_ACCEPTANCE = :state_law_affecting_rck_acceptance

          # Code R52. A rare return reason. A stop payment was issued on a Represented Check ("RCK") entry.
          STOP_PAYMENT_ON_ITEM_RELATED_TO_RCK_ENTRY = :stop_payment_on_item_related_to_rck_entry

          # Code R38. A rare return reason. The source attached to the ACH, usually an ACH check conversion, includes a stop payment.
          STOP_PAYMENT_ON_SOURCE_DOCUMENT = :stop_payment_on_source_document

          # Code R73. A rare return reason. The bank receiving an `untimely_return` believes it was on time.
          TIMELY_ORIGINAL_RETURN = :timely_original_return

          # Code R27. A rare return reason. An ACH return's trace number does not match an originated ACH.
          TRACE_NUMBER_ERROR = :trace_number_error

          # Code R72. A rare return reason. The dishonored return was sent too late.
          UNTIMELY_DISHONORED_RETURN = :untimely_dishonored_return

          # Code R68. A rare return reason. The return was sent too late.
          UNTIMELY_RETURN = :untimely_return

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see Increase::Models::ACHTransfer#settlement
      class Settlement < Increase::Internal::Type::BaseModel
        # @!attribute settled_at
        #   When the funds for this transfer have settled at the destination bank at the
        #   Federal Reserve.
        #
        #   @return [Time]
        required :settled_at, Time

        # @!method initialize(settled_at:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::ACHTransfer::Settlement} for more details.
        #
        #   A subhash containing information about when and how the transfer settled at the
        #   Federal Reserve.
        #
        #   @param settled_at [Time] When the funds for this transfer have settled at the destination bank at the Fed
      end

      # The
      # [Standard Entry Class (SEC) code](/documentation/ach-standard-entry-class-codes)
      # to use for the transfer.
      #
      # @see Increase::Models::ACHTransfer#standard_entry_class_code
      module StandardEntryClassCode
        extend Increase::Internal::Type::Enum

        # Corporate Credit and Debit (CCD) is used for business-to-business payments.
        CORPORATE_CREDIT_OR_DEBIT = :corporate_credit_or_debit

        # Corporate Trade Exchange (CTX) allows for including extensive remittance information with business-to-business payments.
        CORPORATE_TRADE_EXCHANGE = :corporate_trade_exchange

        # Prearranged Payments and Deposits (PPD) is used for credits or debits originated by an organization to a consumer, such as payroll direct deposits.
        PREARRANGED_PAYMENTS_AND_DEPOSIT = :prearranged_payments_and_deposit

        # Internet Initiated (WEB) is used for consumer payments initiated or authorized via the Internet. Debits can only be initiated by non-consumers to debit a consumer’s account. Credits can only be used for consumer to consumer transactions.
        INTERNET_INITIATED = :internet_initiated

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # The lifecycle status of the transfer.
      #
      # @see Increase::Models::ACHTransfer#status
      module Status
        extend Increase::Internal::Type::Enum

        # The transfer is pending approval.
        PENDING_APPROVAL = :pending_approval

        # The transfer belongs to a Transfer Session that is pending confirmation.
        PENDING_TRANSFER_SESSION_CONFIRMATION = :pending_transfer_session_confirmation

        # The transfer has been canceled.
        CANCELED = :canceled

        # The transfer is pending submission to the Federal Reserve.
        PENDING_SUBMISSION = :pending_submission

        # The transfer is pending review by Increase.
        PENDING_REVIEWING = :pending_reviewing

        # The transfer requires attention from an Increase operator.
        REQUIRES_ATTENTION = :requires_attention

        # The transfer has been rejected.
        REJECTED = :rejected

        # The transfer is complete.
        SUBMITTED = :submitted

        # The transfer has been returned.
        RETURNED = :returned

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Increase::Models::ACHTransfer#submission
      class Submission < Increase::Internal::Type::BaseModel
        # @!attribute administrative_returns_expected_by
        #   The timestamp by which any administrative returns are expected to be received
        #   by. This follows the NACHA guidelines for return windows, which are: "In
        #   general, return entries must be received by the RDFI’s ACH Operator by its
        #   deposit deadline for the return entry to be made available to the ODFI no later
        #   than the opening of business on the second banking day following the Settlement
        #   Date of the original entry.".
        #
        #   @return [Time]
        required :administrative_returns_expected_by, Time

        # @!attribute effective_date
        #   The ACH transfer's effective date as sent to the Federal Reserve. If a specific
        #   date was configured using `preferred_effective_date`, this will match that
        #   value. Otherwise, it will be the date selected (following the specified
        #   settlement schedule) at the time the transfer was submitted.
        #
        #   @return [Date]
        required :effective_date, Date

        # @!attribute expected_funds_settlement_at
        #   When the transfer is expected to settle in the recipient's account. Credits may
        #   be available sooner, at the receiving banks discretion. The FedACH schedule is
        #   published
        #   [here](https://www.frbservices.org/resources/resource-centers/same-day-ach/fedach-processing-schedule.html).
        #
        #   @return [Time]
        required :expected_funds_settlement_at, Time

        # @!attribute expected_settlement_schedule
        #   The settlement schedule the transfer is expected to follow. This expectation
        #   takes into account the `effective_date`, `submitted_at`, and the amount of the
        #   transfer.
        #
        #   @return [Symbol, Increase::Models::ACHTransfer::Submission::ExpectedSettlementSchedule]
        required :expected_settlement_schedule,
                 enum: -> { Increase::ACHTransfer::Submission::ExpectedSettlementSchedule }

        # @!attribute submitted_at
        #   When the ACH transfer was sent to FedACH.
        #
        #   @return [Time]
        required :submitted_at, Time

        # @!attribute trace_number
        #   A 15 digit number recorded in the Nacha file and transmitted to the receiving
        #   bank. Along with the amount, date, and originating routing number, this can be
        #   used to identify the ACH transfer at the receiving bank. ACH trace numbers are
        #   not unique, but are
        #   [used to correlate returns](https://increase.com/documentation/ach-returns#ach-returns).
        #
        #   @return [String]
        required :trace_number, String

        # @!method initialize(administrative_returns_expected_by:, effective_date:, expected_funds_settlement_at:, expected_settlement_schedule:, submitted_at:, trace_number:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::ACHTransfer::Submission} for more details.
        #
        #   After the transfer is submitted to FedACH, this will contain supplemental
        #   details. Increase batches transfers and submits a file to the Federal Reserve
        #   roughly every 30 minutes. The Federal Reserve processes ACH transfers during
        #   weekdays according to their
        #   [posted schedule](https://www.frbservices.org/resources/resource-centers/same-day-ach/fedach-processing-schedule.html).
        #
        #   @param administrative_returns_expected_by [Time] The timestamp by which any administrative returns are expected to be received by
        #
        #   @param effective_date [Date] The ACH transfer's effective date as sent to the Federal Reserve. If a specific
        #
        #   @param expected_funds_settlement_at [Time] When the transfer is expected to settle in the recipient's account. Credits may
        #
        #   @param expected_settlement_schedule [Symbol, Increase::Models::ACHTransfer::Submission::ExpectedSettlementSchedule] The settlement schedule the transfer is expected to follow. This expectation tak
        #
        #   @param submitted_at [Time] When the ACH transfer was sent to FedACH.
        #
        #   @param trace_number [String] A 15 digit number recorded in the Nacha file and transmitted to the receiving ba

        # The settlement schedule the transfer is expected to follow. This expectation
        # takes into account the `effective_date`, `submitted_at`, and the amount of the
        # transfer.
        #
        # @see Increase::Models::ACHTransfer::Submission#expected_settlement_schedule
        module ExpectedSettlementSchedule
          extend Increase::Internal::Type::Enum

          # The transfer is expected to settle same-day.
          SAME_DAY = :same_day

          # The transfer is expected to settle on a future date.
          FUTURE_DATED = :future_dated

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `ach_transfer`.
      #
      # @see Increase::Models::ACHTransfer#type
      module Type
        extend Increase::Internal::Type::Enum

        ACH_TRANSFER = :ach_transfer

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
