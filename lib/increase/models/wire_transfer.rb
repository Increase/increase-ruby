# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::WireTransfers#create
    class WireTransfer < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The wire transfer's identifier.
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

      # @!attribute amount
      #   The transfer amount in USD cents.
      #
      #   @return [Integer]
      required :amount, Integer

      # @!attribute approval
      #   If your account requires approvals for transfers and the transfer was approved,
      #   this will contain details of the approval.
      #
      #   @return [Increase::WireTransfer::Approval, nil]
      required :approval, -> { Increase::WireTransfer::Approval }, nil?: true

      # @!attribute beneficiary_address_line1
      #   The beneficiary's address line 1.
      #
      #   @return [String, nil]
      required :beneficiary_address_line1, String, nil?: true

      # @!attribute beneficiary_address_line2
      #   The beneficiary's address line 2.
      #
      #   @return [String, nil]
      required :beneficiary_address_line2, String, nil?: true

      # @!attribute beneficiary_address_line3
      #   The beneficiary's address line 3.
      #
      #   @return [String, nil]
      required :beneficiary_address_line3, String, nil?: true

      # @!attribute beneficiary_name
      #   The beneficiary's name.
      #
      #   @return [String, nil]
      required :beneficiary_name, String, nil?: true

      # @!attribute cancellation
      #   If your account requires approvals for transfers and the transfer was not
      #   approved, this will contain details of the cancellation.
      #
      #   @return [Increase::WireTransfer::Cancellation, nil]
      required :cancellation, -> { Increase::WireTransfer::Cancellation }, nil?: true

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the transfer was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute created_by
      #   What object created the transfer, either via the API or the dashboard.
      #
      #   @return [Increase::WireTransfer::CreatedBy, nil]
      required :created_by, -> { Increase::WireTransfer::CreatedBy }, nil?: true

      # @!attribute currency
      #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's
      #   currency. For wire transfers this is always equal to `usd`.
      #
      #   @return [Symbol, Increase::WireTransfer::Currency]
      required :currency, enum: -> { Increase::WireTransfer::Currency }

      # @!attribute external_account_id
      #   The identifier of the External Account the transfer was made to, if any.
      #
      #   @return [String, nil]
      required :external_account_id, String, nil?: true

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String, nil?: true

      # @!attribute message_to_recipient
      #   The message that will show on the recipient's bank statement.
      #
      #   @return [String, nil]
      required :message_to_recipient, String, nil?: true

      # @!attribute network
      #   The transfer's network.
      #
      #   @return [Symbol, Increase::WireTransfer::Network]
      required :network, enum: -> { Increase::WireTransfer::Network }

      # @!attribute originator_address_line1
      #   The originator's address line 1.
      #
      #   @return [String, nil]
      required :originator_address_line1, String, nil?: true

      # @!attribute originator_address_line2
      #   The originator's address line 2.
      #
      #   @return [String, nil]
      required :originator_address_line2, String, nil?: true

      # @!attribute originator_address_line3
      #   The originator's address line 3.
      #
      #   @return [String, nil]
      required :originator_address_line3, String, nil?: true

      # @!attribute originator_name
      #   The originator's name.
      #
      #   @return [String, nil]
      required :originator_name, String, nil?: true

      # @!attribute pending_transaction_id
      #   The ID for the pending transaction representing the transfer. A pending
      #   transaction is created when the transfer
      #   [requires approval](https://increase.com/documentation/transfer-approvals#transfer-approvals)
      #   by someone else in your organization.
      #
      #   @return [String, nil]
      required :pending_transaction_id, String, nil?: true

      # @!attribute reversal
      #   If your transfer is reversed, this will contain details of the reversal.
      #
      #   @return [Increase::WireTransfer::Reversal, nil]
      required :reversal, -> { Increase::WireTransfer::Reversal }, nil?: true

      # @!attribute routing_number
      #   The American Bankers' Association (ABA) Routing Transit Number (RTN).
      #
      #   @return [String]
      required :routing_number, String

      # @!attribute source_account_number_id
      #   The Account Number that was passed to the wire's recipient.
      #
      #   @return [String, nil]
      required :source_account_number_id, String, nil?: true

      # @!attribute status
      #   The lifecycle status of the transfer.
      #
      #   @return [Symbol, Increase::WireTransfer::Status]
      required :status, enum: -> { Increase::WireTransfer::Status }

      # @!attribute submission
      #   After the transfer is submitted to Fedwire, this will contain supplemental
      #   details.
      #
      #   @return [Increase::WireTransfer::Submission, nil]
      required :submission, -> { Increase::WireTransfer::Submission }, nil?: true

      # @!attribute transaction_id
      #   The ID for the transaction funding the transfer.
      #
      #   @return [String, nil]
      required :transaction_id, String, nil?: true

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `wire_transfer`.
      #
      #   @return [Symbol, Increase::WireTransfer::Type]
      required :type, enum: -> { Increase::WireTransfer::Type }

      # @!method initialize(id:, account_id:, account_number:, amount:, approval:, beneficiary_address_line1:, beneficiary_address_line2:, beneficiary_address_line3:, beneficiary_name:, cancellation:, created_at:, created_by:, currency:, external_account_id:, idempotency_key:, message_to_recipient:, network:, originator_address_line1:, originator_address_line2:, originator_address_line3:, originator_name:, pending_transaction_id:, reversal:, routing_number:, source_account_number_id:, status:, submission:, transaction_id:, type:)
      #   Some parameter documentations has been truncated, see {Increase::WireTransfer}
      #   for more details.
      #
      #   Wire transfers move funds between your Increase account and any other account
      #   accessible by Fedwire.
      #
      #   @param id [String] The wire transfer's identifier.
      #
      #   @param account_id [String] The Account to which the transfer belongs.
      #
      #   @param account_number [String] The destination account number.
      #
      #   @param amount [Integer] The transfer amount in USD cents.
      #
      #   @param approval [Increase::WireTransfer::Approval, nil] If your account requires approvals for transfers and the transfer was approved,
      #
      #   @param beneficiary_address_line1 [String, nil] The beneficiary's address line 1.
      #
      #   @param beneficiary_address_line2 [String, nil] The beneficiary's address line 2.
      #
      #   @param beneficiary_address_line3 [String, nil] The beneficiary's address line 3.
      #
      #   @param beneficiary_name [String, nil] The beneficiary's name.
      #
      #   @param cancellation [Increase::WireTransfer::Cancellation, nil] If your account requires approvals for transfers and the transfer was not approv
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
      #
      #   @param created_by [Increase::WireTransfer::CreatedBy, nil] What object created the transfer, either via the API or the dashboard.
      #
      #   @param currency [Symbol, Increase::WireTransfer::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the transfer's c
      #
      #   @param external_account_id [String, nil] The identifier of the External Account the transfer was made to, if any.
      #
      #   @param idempotency_key [String, nil] The idempotency key you chose for this object. This value is unique across Incre
      #
      #   @param message_to_recipient [String, nil] The message that will show on the recipient's bank statement.
      #
      #   @param network [Symbol, Increase::WireTransfer::Network] The transfer's network.
      #
      #   @param originator_address_line1 [String, nil] The originator's address line 1.
      #
      #   @param originator_address_line2 [String, nil] The originator's address line 2.
      #
      #   @param originator_address_line3 [String, nil] The originator's address line 3.
      #
      #   @param originator_name [String, nil] The originator's name.
      #
      #   @param pending_transaction_id [String, nil] The ID for the pending transaction representing the transfer. A pending transact
      #
      #   @param reversal [Increase::WireTransfer::Reversal, nil] If your transfer is reversed, this will contain details of the reversal.
      #
      #   @param routing_number [String] The American Bankers' Association (ABA) Routing Transit Number (RTN).
      #
      #   @param source_account_number_id [String, nil] The Account Number that was passed to the wire's recipient.
      #
      #   @param status [Symbol, Increase::WireTransfer::Status] The lifecycle status of the transfer.
      #
      #   @param submission [Increase::WireTransfer::Submission, nil] After the transfer is submitted to Fedwire, this will contain supplemental detai
      #
      #   @param transaction_id [String, nil] The ID for the transaction funding the transfer.
      #
      #   @param type [Symbol, Increase::WireTransfer::Type] A constant representing the object's type. For this resource it will always be `

      # @see Increase::WireTransfer#approval
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
        #   {Increase::WireTransfer::Approval} for more details.
        #
        #   If your account requires approvals for transfers and the transfer was approved,
        #   this will contain details of the approval.
        #
        #   @param approved_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
        #
        #   @param approved_by [String, nil] If the Transfer was approved by a user in the dashboard, the email address of th
      end

      # @see Increase::WireTransfer#cancellation
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
        #   {Increase::WireTransfer::Cancellation} for more details.
        #
        #   If your account requires approvals for transfers and the transfer was not
        #   approved, this will contain details of the cancellation.
        #
        #   @param canceled_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
        #
        #   @param canceled_by [String, nil] If the Transfer was canceled by a user in the dashboard, the email address of th
      end

      # @see Increase::WireTransfer#created_by
      class CreatedBy < Increase::Internal::Type::BaseModel
        # @!attribute api_key
        #   If present, details about the API key that created the transfer.
        #
        #   @return [Increase::WireTransfer::CreatedBy::APIKey, nil]
        required :api_key, -> { Increase::WireTransfer::CreatedBy::APIKey }, nil?: true

        # @!attribute category
        #   The type of object that created this transfer.
        #
        #   @return [Symbol, Increase::WireTransfer::CreatedBy::Category]
        required :category, enum: -> { Increase::WireTransfer::CreatedBy::Category }

        # @!attribute oauth_application
        #   If present, details about the OAuth Application that created the transfer.
        #
        #   @return [Increase::WireTransfer::CreatedBy::OAuthApplication, nil]
        required :oauth_application, -> { Increase::WireTransfer::CreatedBy::OAuthApplication }, nil?: true

        # @!attribute user
        #   If present, details about the User that created the transfer.
        #
        #   @return [Increase::WireTransfer::CreatedBy::User, nil]
        required :user, -> { Increase::WireTransfer::CreatedBy::User }, nil?: true

        # @!method initialize(api_key:, category:, oauth_application:, user:)
        #   What object created the transfer, either via the API or the dashboard.
        #
        #   @param api_key [Increase::WireTransfer::CreatedBy::APIKey, nil] If present, details about the API key that created the transfer.
        #
        #   @param category [Symbol, Increase::WireTransfer::CreatedBy::Category] The type of object that created this transfer.
        #
        #   @param oauth_application [Increase::WireTransfer::CreatedBy::OAuthApplication, nil] If present, details about the OAuth Application that created the transfer.
        #
        #   @param user [Increase::WireTransfer::CreatedBy::User, nil] If present, details about the User that created the transfer.

        # @see Increase::WireTransfer::CreatedBy#api_key
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

        # The type of object that created this transfer.
        #
        # @see Increase::WireTransfer::CreatedBy#category
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

        # @see Increase::WireTransfer::CreatedBy#oauth_application
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

        # @see Increase::WireTransfer::CreatedBy#user
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
      # currency. For wire transfers this is always equal to `usd`.
      #
      # @see Increase::WireTransfer#currency
      module Currency
        extend Increase::Internal::Type::Enum

        # Canadian Dollar (CAD)
        CAD = :CAD

        # Swiss Franc (CHF)
        CHF = :CHF

        # Euro (EUR)
        EUR = :EUR

        # British Pound (GBP)
        GBP = :GBP

        # Japanese Yen (JPY)
        JPY = :JPY

        # US Dollar (USD)
        USD = :USD

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # The transfer's network.
      #
      # @see Increase::WireTransfer#network
      module Network
        extend Increase::Internal::Type::Enum

        WIRE = :wire

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Increase::WireTransfer#reversal
      class Reversal < Increase::Internal::Type::BaseModel
        # @!attribute amount
        #   The amount that was reversed in USD cents.
        #
        #   @return [Integer]
        required :amount, Integer

        # @!attribute created_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   the reversal was created.
        #
        #   @return [Time]
        required :created_at, Time

        # @!attribute description
        #   The description on the reversal message from Fedwire, set by the reversing bank.
        #
        #   @return [String]
        required :description, String

        # @!attribute financial_institution_to_financial_institution_information
        #   Additional financial institution information included in the wire reversal.
        #
        #   @return [String, nil]
        required :financial_institution_to_financial_institution_information, String, nil?: true

        # @!attribute input_cycle_date
        #   The Fedwire cycle date for the wire reversal. The "Fedwire day" begins at 9:00
        #   PM Eastern Time on the evening before the `cycle date`.
        #
        #   @return [Date]
        required :input_cycle_date, Date

        # @!attribute input_message_accountability_data
        #   The Fedwire transaction identifier.
        #
        #   @return [String]
        required :input_message_accountability_data, String

        # @!attribute input_sequence_number
        #   The Fedwire sequence number.
        #
        #   @return [String]
        required :input_sequence_number, String

        # @!attribute input_source
        #   The Fedwire input source identifier.
        #
        #   @return [String]
        required :input_source, String

        # @!attribute originator_routing_number
        #   The American Banking Association (ABA) routing number of the bank originating
        #   the transfer.
        #
        #   @return [String, nil]
        required :originator_routing_number, String, nil?: true

        # @!attribute previous_message_input_cycle_date
        #   The Fedwire cycle date for the wire transfer that is being reversed by this
        #   message.
        #
        #   @return [Date]
        required :previous_message_input_cycle_date, Date

        # @!attribute previous_message_input_message_accountability_data
        #   The Fedwire transaction identifier for the wire transfer that was reversed.
        #
        #   @return [String]
        required :previous_message_input_message_accountability_data, String

        # @!attribute previous_message_input_sequence_number
        #   The Fedwire sequence number for the wire transfer that was reversed.
        #
        #   @return [String]
        required :previous_message_input_sequence_number, String

        # @!attribute previous_message_input_source
        #   The Fedwire input source identifier for the wire transfer that was reversed.
        #
        #   @return [String]
        required :previous_message_input_source, String

        # @!attribute receiver_financial_institution_information
        #   Information included in the wire reversal for the receiving financial
        #   institution.
        #
        #   @return [String, nil]
        required :receiver_financial_institution_information, String, nil?: true

        # @!attribute sender_reference
        #   The sending bank's reference number for the wire reversal.
        #
        #   @return [String, nil]
        required :sender_reference, String, nil?: true

        # @!attribute transaction_id
        #   The ID for the Transaction associated with the transfer reversal.
        #
        #   @return [String]
        required :transaction_id, String

        # @!attribute wire_transfer_id
        #   The ID for the Wire Transfer that is being reversed.
        #
        #   @return [String]
        required :wire_transfer_id, String

        # @!method initialize(amount:, created_at:, description:, financial_institution_to_financial_institution_information:, input_cycle_date:, input_message_accountability_data:, input_sequence_number:, input_source:, originator_routing_number:, previous_message_input_cycle_date:, previous_message_input_message_accountability_data:, previous_message_input_sequence_number:, previous_message_input_source:, receiver_financial_institution_information:, sender_reference:, transaction_id:, wire_transfer_id:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::WireTransfer::Reversal} for more details.
        #
        #   If your transfer is reversed, this will contain details of the reversal.
        #
        #   @param amount [Integer] The amount that was reversed in USD cents.
        #
        #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
        #
        #   @param description [String] The description on the reversal message from Fedwire, set by the reversing bank.
        #
        #   @param financial_institution_to_financial_institution_information [String, nil] Additional financial institution information included in the wire reversal.
        #
        #   @param input_cycle_date [Date] The Fedwire cycle date for the wire reversal. The "Fedwire day" begins at 9:00 P
        #
        #   @param input_message_accountability_data [String] The Fedwire transaction identifier.
        #
        #   @param input_sequence_number [String] The Fedwire sequence number.
        #
        #   @param input_source [String] The Fedwire input source identifier.
        #
        #   @param originator_routing_number [String, nil] The American Banking Association (ABA) routing number of the bank originating th
        #
        #   @param previous_message_input_cycle_date [Date] The Fedwire cycle date for the wire transfer that is being reversed by this mess
        #
        #   @param previous_message_input_message_accountability_data [String] The Fedwire transaction identifier for the wire transfer that was reversed.
        #
        #   @param previous_message_input_sequence_number [String] The Fedwire sequence number for the wire transfer that was reversed.
        #
        #   @param previous_message_input_source [String] The Fedwire input source identifier for the wire transfer that was reversed.
        #
        #   @param receiver_financial_institution_information [String, nil] Information included in the wire reversal for the receiving financial institutio
        #
        #   @param sender_reference [String, nil] The sending bank's reference number for the wire reversal.
        #
        #   @param transaction_id [String] The ID for the Transaction associated with the transfer reversal.
        #
        #   @param wire_transfer_id [String] The ID for the Wire Transfer that is being reversed.
      end

      # The lifecycle status of the transfer.
      #
      # @see Increase::WireTransfer#status
      module Status
        extend Increase::Internal::Type::Enum

        # The transfer is pending approval.
        PENDING_APPROVAL = :pending_approval

        # The transfer has been canceled.
        CANCELED = :canceled

        # The transfer is pending review by Increase.
        PENDING_REVIEWING = :pending_reviewing

        # The transfer has been rejected by Increase.
        REJECTED = :rejected

        # The transfer requires attention from an Increase operator.
        REQUIRES_ATTENTION = :requires_attention

        # The transfer is pending creation.
        PENDING_CREATING = :pending_creating

        # The transfer has been reversed.
        REVERSED = :reversed

        # The transfer has been submitted to Fedwire.
        SUBMITTED = :submitted

        # The transfer has been acknowledged by Fedwire and can be considered complete.
        COMPLETE = :complete

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Increase::WireTransfer#submission
      class Submission < Increase::Internal::Type::BaseModel
        # @!attribute input_message_accountability_data
        #   The accountability data for the submission.
        #
        #   @return [String]
        required :input_message_accountability_data, String

        # @!attribute submitted_at
        #   When this wire transfer was submitted to Fedwire.
        #
        #   @return [Time]
        required :submitted_at, Time

        # @!method initialize(input_message_accountability_data:, submitted_at:)
        #   After the transfer is submitted to Fedwire, this will contain supplemental
        #   details.
        #
        #   @param input_message_accountability_data [String] The accountability data for the submission.
        #
        #   @param submitted_at [Time] When this wire transfer was submitted to Fedwire.
      end

      # A constant representing the object's type. For this resource it will always be
      # `wire_transfer`.
      #
      # @see Increase::WireTransfer#type
      module Type
        extend Increase::Internal::Type::Enum

        WIRE_TRANSFER = :wire_transfer

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
