# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CheckTransfers#create
    class CheckTransfer < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The Check transfer's identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute account_id
      #   The identifier of the Account from which funds will be transferred.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute account_number
      #   The account number printed on the check.
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
      #   @return [Increase::CheckTransfer::Approval, nil]
      required :approval, -> { Increase::CheckTransfer::Approval }, nil?: true

      # @!attribute approved_inbound_check_deposit_id
      #   If the Check Transfer was successfully deposited, this will contain the
      #   identifier of the Inbound Check Deposit object with details of the deposit.
      #
      #   @return [String, nil]
      required :approved_inbound_check_deposit_id, String, nil?: true

      # @!attribute cancellation
      #   If your account requires approvals for transfers and the transfer was not
      #   approved, this will contain details of the cancellation.
      #
      #   @return [Increase::CheckTransfer::Cancellation, nil]
      required :cancellation, -> { Increase::CheckTransfer::Cancellation }, nil?: true

      # @!attribute check_number
      #   The check number printed on the check.
      #
      #   @return [String]
      required :check_number, String

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the transfer was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute created_by
      #   What object created the transfer, either via the API or the dashboard.
      #
      #   @return [Increase::CheckTransfer::CreatedBy, nil]
      required :created_by, -> { Increase::CheckTransfer::CreatedBy }, nil?: true

      # @!attribute currency
      #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the check's
      #   currency.
      #
      #   @return [Symbol, Increase::CheckTransfer::Currency]
      required :currency, enum: -> { Increase::CheckTransfer::Currency }

      # @!attribute fulfillment_method
      #   Whether Increase will print and mail the check or if you will do it yourself.
      #
      #   @return [Symbol, Increase::CheckTransfer::FulfillmentMethod]
      required :fulfillment_method, enum: -> { Increase::CheckTransfer::FulfillmentMethod }

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String, nil?: true

      # @!attribute mailing
      #   If the check has been mailed by Increase, this will contain details of the
      #   shipment.
      #
      #   @return [Increase::CheckTransfer::Mailing, nil]
      required :mailing, -> { Increase::CheckTransfer::Mailing }, nil?: true

      # @!attribute pending_transaction_id
      #   The ID for the pending transaction representing the transfer. A pending
      #   transaction is created when the transfer
      #   [requires approval](https://increase.com/documentation/transfer-approvals#transfer-approvals)
      #   by someone else in your organization.
      #
      #   @return [String, nil]
      required :pending_transaction_id, String, nil?: true

      # @!attribute physical_check
      #   Details relating to the physical check that Increase will print and mail. Will
      #   be present if and only if `fulfillment_method` is equal to `physical_check`.
      #
      #   @return [Increase::CheckTransfer::PhysicalCheck, nil]
      required :physical_check, -> { Increase::CheckTransfer::PhysicalCheck }, nil?: true

      # @!attribute routing_number
      #   The routing number printed on the check.
      #
      #   @return [String]
      required :routing_number, String

      # @!attribute source_account_number_id
      #   The identifier of the Account Number from which to send the transfer and print
      #   on the check.
      #
      #   @return [String, nil]
      required :source_account_number_id, String, nil?: true

      # @!attribute status
      #   The lifecycle status of the transfer.
      #
      #   @return [Symbol, Increase::CheckTransfer::Status]
      required :status, enum: -> { Increase::CheckTransfer::Status }

      # @!attribute stop_payment_request
      #   After a stop-payment is requested on the check, this will contain supplemental
      #   details.
      #
      #   @return [Increase::CheckTransfer::StopPaymentRequest, nil]
      required :stop_payment_request, -> { Increase::CheckTransfer::StopPaymentRequest }, nil?: true

      # @!attribute submission
      #   After the transfer is submitted, this will contain supplemental details.
      #
      #   @return [Increase::CheckTransfer::Submission, nil]
      required :submission, -> { Increase::CheckTransfer::Submission }, nil?: true

      # @!attribute third_party
      #   Details relating to the custom fulfillment you will perform. Will be present if
      #   and only if `fulfillment_method` is equal to `third_party`.
      #
      #   @return [Increase::CheckTransfer::ThirdParty, nil]
      required :third_party, -> { Increase::CheckTransfer::ThirdParty }, nil?: true

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `check_transfer`.
      #
      #   @return [Symbol, Increase::CheckTransfer::Type]
      required :type, enum: -> { Increase::CheckTransfer::Type }

      # @!method initialize(id:, account_id:, account_number:, amount:, approval:, approved_inbound_check_deposit_id:, cancellation:, check_number:, created_at:, created_by:, currency:, fulfillment_method:, idempotency_key:, mailing:, pending_transaction_id:, physical_check:, routing_number:, source_account_number_id:, status:, stop_payment_request:, submission:, third_party:, type:)
      #   Some parameter documentations has been truncated, see {Increase::CheckTransfer}
      #   for more details.
      #
      #   Check Transfers move funds from your Increase account by mailing a physical
      #   check.
      #
      #   @param id [String] The Check transfer's identifier.
      #
      #   @param account_id [String] The identifier of the Account from which funds will be transferred.
      #
      #   @param account_number [String] The account number printed on the check.
      #
      #   @param amount [Integer] The transfer amount in USD cents.
      #
      #   @param approval [Increase::CheckTransfer::Approval, nil] If your account requires approvals for transfers and the transfer was approved,
      #
      #   @param approved_inbound_check_deposit_id [String, nil] If the Check Transfer was successfully deposited, this will contain the identifi
      #
      #   @param cancellation [Increase::CheckTransfer::Cancellation, nil] If your account requires approvals for transfers and the transfer was not approv
      #
      #   @param check_number [String] The check number printed on the check.
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
      #
      #   @param created_by [Increase::CheckTransfer::CreatedBy, nil] What object created the transfer, either via the API or the dashboard.
      #
      #   @param currency [Symbol, Increase::CheckTransfer::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the check's curr
      #
      #   @param fulfillment_method [Symbol, Increase::CheckTransfer::FulfillmentMethod] Whether Increase will print and mail the check or if you will do it yourself.
      #
      #   @param idempotency_key [String, nil] The idempotency key you chose for this object. This value is unique across Incre
      #
      #   @param mailing [Increase::CheckTransfer::Mailing, nil] If the check has been mailed by Increase, this will contain details of the shipm
      #
      #   @param pending_transaction_id [String, nil] The ID for the pending transaction representing the transfer. A pending transact
      #
      #   @param physical_check [Increase::CheckTransfer::PhysicalCheck, nil] Details relating to the physical check that Increase will print and mail. Will b
      #
      #   @param routing_number [String] The routing number printed on the check.
      #
      #   @param source_account_number_id [String, nil] The identifier of the Account Number from which to send the transfer and print o
      #
      #   @param status [Symbol, Increase::CheckTransfer::Status] The lifecycle status of the transfer.
      #
      #   @param stop_payment_request [Increase::CheckTransfer::StopPaymentRequest, nil] After a stop-payment is requested on the check, this will contain supplemental d
      #
      #   @param submission [Increase::CheckTransfer::Submission, nil] After the transfer is submitted, this will contain supplemental details.
      #
      #   @param third_party [Increase::CheckTransfer::ThirdParty, nil] Details relating to the custom fulfillment you will perform. Will be present if
      #
      #   @param type [Symbol, Increase::CheckTransfer::Type] A constant representing the object's type. For this resource it will always be `

      # @see Increase::CheckTransfer#approval
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
        #   {Increase::CheckTransfer::Approval} for more details.
        #
        #   If your account requires approvals for transfers and the transfer was approved,
        #   this will contain details of the approval.
        #
        #   @param approved_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
        #
        #   @param approved_by [String, nil] If the Transfer was approved by a user in the dashboard, the email address of th
      end

      # @see Increase::CheckTransfer#cancellation
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
        #   {Increase::CheckTransfer::Cancellation} for more details.
        #
        #   If your account requires approvals for transfers and the transfer was not
        #   approved, this will contain details of the cancellation.
        #
        #   @param canceled_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
        #
        #   @param canceled_by [String, nil] If the Transfer was canceled by a user in the dashboard, the email address of th
      end

      # @see Increase::CheckTransfer#created_by
      class CreatedBy < Increase::Internal::Type::BaseModel
        # @!attribute api_key
        #   If present, details about the API key that created the transfer.
        #
        #   @return [Increase::CheckTransfer::CreatedBy::APIKey, nil]
        required :api_key, -> { Increase::CheckTransfer::CreatedBy::APIKey }, nil?: true

        # @!attribute category
        #   The type of object that created this transfer.
        #
        #   @return [Symbol, Increase::CheckTransfer::CreatedBy::Category]
        required :category, enum: -> { Increase::CheckTransfer::CreatedBy::Category }

        # @!attribute oauth_application
        #   If present, details about the OAuth Application that created the transfer.
        #
        #   @return [Increase::CheckTransfer::CreatedBy::OAuthApplication, nil]
        required :oauth_application, -> { Increase::CheckTransfer::CreatedBy::OAuthApplication }, nil?: true

        # @!attribute user
        #   If present, details about the User that created the transfer.
        #
        #   @return [Increase::CheckTransfer::CreatedBy::User, nil]
        required :user, -> { Increase::CheckTransfer::CreatedBy::User }, nil?: true

        # @!method initialize(api_key:, category:, oauth_application:, user:)
        #   What object created the transfer, either via the API or the dashboard.
        #
        #   @param api_key [Increase::CheckTransfer::CreatedBy::APIKey, nil] If present, details about the API key that created the transfer.
        #
        #   @param category [Symbol, Increase::CheckTransfer::CreatedBy::Category] The type of object that created this transfer.
        #
        #   @param oauth_application [Increase::CheckTransfer::CreatedBy::OAuthApplication, nil] If present, details about the OAuth Application that created the transfer.
        #
        #   @param user [Increase::CheckTransfer::CreatedBy::User, nil] If present, details about the User that created the transfer.

        # @see Increase::CheckTransfer::CreatedBy#api_key
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
        # @see Increase::CheckTransfer::CreatedBy#category
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

        # @see Increase::CheckTransfer::CreatedBy#oauth_application
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

        # @see Increase::CheckTransfer::CreatedBy#user
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

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the check's
      # currency.
      #
      # @see Increase::CheckTransfer#currency
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

      # Whether Increase will print and mail the check or if you will do it yourself.
      #
      # @see Increase::CheckTransfer#fulfillment_method
      module FulfillmentMethod
        extend Increase::Internal::Type::Enum

        # Increase will print and mail a physical check.
        PHYSICAL_CHECK = :physical_check

        # Increase will not print a check; you are responsible for printing and mailing a check with the provided account number, routing number, check number, and amount.
        THIRD_PARTY = :third_party

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Increase::CheckTransfer#mailing
      class Mailing < Increase::Internal::Type::BaseModel
        # @!attribute image_id
        #   The ID of the file corresponding to an image of the check that was mailed, if
        #   available.
        #
        #   @return [String, nil]
        required :image_id, String, nil?: true

        # @!attribute mailed_at
        #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #   the check was mailed.
        #
        #   @return [Time]
        required :mailed_at, Time

        # @!attribute tracking_number
        #   The tracking number of the shipment, if available for the shipping method.
        #
        #   @return [String, nil]
        required :tracking_number, String, nil?: true

        # @!method initialize(image_id:, mailed_at:, tracking_number:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::CheckTransfer::Mailing} for more details.
        #
        #   If the check has been mailed by Increase, this will contain details of the
        #   shipment.
        #
        #   @param image_id [String, nil] The ID of the file corresponding to an image of the check that was mailed, if av
        #
        #   @param mailed_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
        #
        #   @param tracking_number [String, nil] The tracking number of the shipment, if available for the shipping method.
      end

      # @see Increase::CheckTransfer#physical_check
      class PhysicalCheck < Increase::Internal::Type::BaseModel
        # @!attribute attachment_file_id
        #   The ID of the file for the check attachment.
        #
        #   @return [String, nil]
        required :attachment_file_id, String, nil?: true

        # @!attribute mailing_address
        #   Details for where Increase will mail the check.
        #
        #   @return [Increase::CheckTransfer::PhysicalCheck::MailingAddress]
        required :mailing_address, -> { Increase::CheckTransfer::PhysicalCheck::MailingAddress }

        # @!attribute memo
        #   The descriptor that will be printed on the memo field on the check.
        #
        #   @return [String, nil]
        required :memo, String, nil?: true

        # @!attribute note
        #   The descriptor that will be printed on the letter included with the check.
        #
        #   @return [String, nil]
        required :note, String, nil?: true

        # @!attribute recipient_name
        #   The name that will be printed on the check.
        #
        #   @return [String]
        required :recipient_name, String

        # @!attribute return_address
        #   The return address to be printed on the check.
        #
        #   @return [Increase::CheckTransfer::PhysicalCheck::ReturnAddress, nil]
        required :return_address, -> { Increase::CheckTransfer::PhysicalCheck::ReturnAddress }, nil?: true

        # @!attribute shipping_method
        #   The shipping method for the check.
        #
        #   @return [Symbol, Increase::CheckTransfer::PhysicalCheck::ShippingMethod, nil]
        required :shipping_method,
                 enum: -> {
                   Increase::CheckTransfer::PhysicalCheck::ShippingMethod
                 },
                 nil?: true

        # @!attribute signature_text
        #   The text that will appear as the signature on the check in cursive font. If
        #   blank, the check will be printed with 'No signature required'.
        #
        #   @return [String, nil]
        required :signature_text, String, nil?: true

        # @!attribute tracking_updates
        #   Tracking updates relating to the physical check's delivery.
        #
        #   @return [Array<Increase::CheckTransfer::PhysicalCheck::TrackingUpdate>]
        required :tracking_updates,
                 -> {
                   Increase::Internal::Type::ArrayOf[Increase::CheckTransfer::PhysicalCheck::TrackingUpdate]
                 }

        # @!method initialize(attachment_file_id:, mailing_address:, memo:, note:, recipient_name:, return_address:, shipping_method:, signature_text:, tracking_updates:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::CheckTransfer::PhysicalCheck} for more details.
        #
        #   Details relating to the physical check that Increase will print and mail. Will
        #   be present if and only if `fulfillment_method` is equal to `physical_check`.
        #
        #   @param attachment_file_id [String, nil] The ID of the file for the check attachment.
        #
        #   @param mailing_address [Increase::CheckTransfer::PhysicalCheck::MailingAddress] Details for where Increase will mail the check.
        #
        #   @param memo [String, nil] The descriptor that will be printed on the memo field on the check.
        #
        #   @param note [String, nil] The descriptor that will be printed on the letter included with the check.
        #
        #   @param recipient_name [String] The name that will be printed on the check.
        #
        #   @param return_address [Increase::CheckTransfer::PhysicalCheck::ReturnAddress, nil] The return address to be printed on the check.
        #
        #   @param shipping_method [Symbol, Increase::CheckTransfer::PhysicalCheck::ShippingMethod, nil] The shipping method for the check.
        #
        #   @param signature_text [String, nil] The text that will appear as the signature on the check in cursive font. If blan
        #
        #   @param tracking_updates [Array<Increase::CheckTransfer::PhysicalCheck::TrackingUpdate>] Tracking updates relating to the physical check's delivery.

        # @see Increase::CheckTransfer::PhysicalCheck#mailing_address
        class MailingAddress < Increase::Internal::Type::BaseModel
          # @!attribute city
          #   The city of the check's destination.
          #
          #   @return [String, nil]
          required :city, String, nil?: true

          # @!attribute line1
          #   The street address of the check's destination.
          #
          #   @return [String, nil]
          required :line1, String, nil?: true

          # @!attribute line2
          #   The second line of the address of the check's destination.
          #
          #   @return [String, nil]
          required :line2, String, nil?: true

          # @!attribute name
          #   The name component of the check's mailing address.
          #
          #   @return [String, nil]
          required :name, String, nil?: true

          # @!attribute postal_code
          #   The postal code of the check's destination.
          #
          #   @return [String, nil]
          required :postal_code, String, nil?: true

          # @!attribute state
          #   The state of the check's destination.
          #
          #   @return [String, nil]
          required :state, String, nil?: true

          # @!method initialize(city:, line1:, line2:, name:, postal_code:, state:)
          #   Details for where Increase will mail the check.
          #
          #   @param city [String, nil] The city of the check's destination.
          #
          #   @param line1 [String, nil] The street address of the check's destination.
          #
          #   @param line2 [String, nil] The second line of the address of the check's destination.
          #
          #   @param name [String, nil] The name component of the check's mailing address.
          #
          #   @param postal_code [String, nil] The postal code of the check's destination.
          #
          #   @param state [String, nil] The state of the check's destination.
        end

        # @see Increase::CheckTransfer::PhysicalCheck#return_address
        class ReturnAddress < Increase::Internal::Type::BaseModel
          # @!attribute city
          #   The city of the check's destination.
          #
          #   @return [String, nil]
          required :city, String, nil?: true

          # @!attribute line1
          #   The street address of the check's destination.
          #
          #   @return [String, nil]
          required :line1, String, nil?: true

          # @!attribute line2
          #   The second line of the address of the check's destination.
          #
          #   @return [String, nil]
          required :line2, String, nil?: true

          # @!attribute name
          #   The name component of the check's return address.
          #
          #   @return [String, nil]
          required :name, String, nil?: true

          # @!attribute postal_code
          #   The postal code of the check's destination.
          #
          #   @return [String, nil]
          required :postal_code, String, nil?: true

          # @!attribute state
          #   The state of the check's destination.
          #
          #   @return [String, nil]
          required :state, String, nil?: true

          # @!method initialize(city:, line1:, line2:, name:, postal_code:, state:)
          #   The return address to be printed on the check.
          #
          #   @param city [String, nil] The city of the check's destination.
          #
          #   @param line1 [String, nil] The street address of the check's destination.
          #
          #   @param line2 [String, nil] The second line of the address of the check's destination.
          #
          #   @param name [String, nil] The name component of the check's return address.
          #
          #   @param postal_code [String, nil] The postal code of the check's destination.
          #
          #   @param state [String, nil] The state of the check's destination.
        end

        # The shipping method for the check.
        #
        # @see Increase::CheckTransfer::PhysicalCheck#shipping_method
        module ShippingMethod
          extend Increase::Internal::Type::Enum

          # USPS First Class
          USPS_FIRST_CLASS = :usps_first_class

          # FedEx Overnight
          FEDEX_OVERNIGHT = :fedex_overnight

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        class TrackingUpdate < Increase::Internal::Type::BaseModel
          # @!attribute category
          #   The type of tracking event.
          #
          #   @return [Symbol, Increase::CheckTransfer::PhysicalCheck::TrackingUpdate::Category]
          required :category, enum: -> { Increase::CheckTransfer::PhysicalCheck::TrackingUpdate::Category }

          # @!attribute created_at
          #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          #   the tracking event took place.
          #
          #   @return [Time]
          required :created_at, Time

          # @!attribute postal_code
          #   The postal code where the event took place.
          #
          #   @return [String]
          required :postal_code, String

          # @!method initialize(category:, created_at:, postal_code:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::CheckTransfer::PhysicalCheck::TrackingUpdate} for more details.
          #
          #   @param category [Symbol, Increase::CheckTransfer::PhysicalCheck::TrackingUpdate::Category] The type of tracking event.
          #
          #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
          #
          #   @param postal_code [String] The postal code where the event took place.

          # The type of tracking event.
          #
          # @see Increase::CheckTransfer::PhysicalCheck::TrackingUpdate#category
          module Category
            extend Increase::Internal::Type::Enum

            # The check is in transit.
            IN_TRANSIT = :in_transit

            # The check has been processed for delivery.
            PROCESSED_FOR_DELIVERY = :processed_for_delivery

            # The check has been delivered.
            DELIVERED = :delivered

            # Delivery failed and the check was returned to sender.
            RETURNED_TO_SENDER = :returned_to_sender

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end

      # The lifecycle status of the transfer.
      #
      # @see Increase::CheckTransfer#status
      module Status
        extend Increase::Internal::Type::Enum

        # The transfer is awaiting approval.
        PENDING_APPROVAL = :pending_approval

        # The transfer has been canceled.
        CANCELED = :canceled

        # The transfer is pending submission.
        PENDING_SUBMISSION = :pending_submission

        # The transfer requires attention from an Increase operator.
        REQUIRES_ATTENTION = :requires_attention

        # The transfer has been rejected.
        REJECTED = :rejected

        # The check is queued for mailing.
        PENDING_MAILING = :pending_mailing

        # The check has been mailed.
        MAILED = :mailed

        # The check has been deposited.
        DEPOSITED = :deposited

        # A stop-payment was requested for this check.
        STOPPED = :stopped

        # The transfer has been returned.
        RETURNED = :returned

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # @see Increase::CheckTransfer#stop_payment_request
      class StopPaymentRequest < Increase::Internal::Type::BaseModel
        # @!attribute reason
        #   The reason why this transfer was stopped.
        #
        #   @return [Symbol, Increase::CheckTransfer::StopPaymentRequest::Reason]
        required :reason, enum: -> { Increase::CheckTransfer::StopPaymentRequest::Reason }

        # @!attribute requested_at
        #   The time the stop-payment was requested.
        #
        #   @return [Time]
        required :requested_at, Time

        # @!attribute transfer_id
        #   The ID of the check transfer that was stopped.
        #
        #   @return [String]
        required :transfer_id, String

        # @!attribute type
        #   A constant representing the object's type. For this resource it will always be
        #   `check_transfer_stop_payment_request`.
        #
        #   @return [Symbol, Increase::CheckTransfer::StopPaymentRequest::Type]
        required :type, enum: -> { Increase::CheckTransfer::StopPaymentRequest::Type }

        # @!method initialize(reason:, requested_at:, transfer_id:, type:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::CheckTransfer::StopPaymentRequest} for more details.
        #
        #   After a stop-payment is requested on the check, this will contain supplemental
        #   details.
        #
        #   @param reason [Symbol, Increase::CheckTransfer::StopPaymentRequest::Reason] The reason why this transfer was stopped.
        #
        #   @param requested_at [Time] The time the stop-payment was requested.
        #
        #   @param transfer_id [String] The ID of the check transfer that was stopped.
        #
        #   @param type [Symbol, Increase::CheckTransfer::StopPaymentRequest::Type] A constant representing the object's type. For this resource it will always be `

        # The reason why this transfer was stopped.
        #
        # @see Increase::CheckTransfer::StopPaymentRequest#reason
        module Reason
          extend Increase::Internal::Type::Enum

          # The check could not be delivered.
          MAIL_DELIVERY_FAILED = :mail_delivery_failed

          # The check was canceled by an Increase operator who will provide details out-of-band.
          REJECTED_BY_INCREASE = :rejected_by_increase

          # The check was not authorized.
          NOT_AUTHORIZED = :not_authorized

          # The check was stopped for another reason.
          UNKNOWN = :unknown

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # A constant representing the object's type. For this resource it will always be
        # `check_transfer_stop_payment_request`.
        #
        # @see Increase::CheckTransfer::StopPaymentRequest#type
        module Type
          extend Increase::Internal::Type::Enum

          CHECK_TRANSFER_STOP_PAYMENT_REQUEST = :check_transfer_stop_payment_request

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # @see Increase::CheckTransfer#submission
      class Submission < Increase::Internal::Type::BaseModel
        # @!attribute address_correction_action
        #   Per USPS requirements, Increase will standardize the address to USPS standards
        #   and check it against the USPS National Change of Address (NCOA) database before
        #   mailing it. This indicates what modifications, if any, were made to the address
        #   before printing and mailing the check.
        #
        #   @return [Symbol, Increase::CheckTransfer::Submission::AddressCorrectionAction]
        required :address_correction_action,
                 enum: -> { Increase::CheckTransfer::Submission::AddressCorrectionAction }

        # @!attribute submitted_address
        #   The address we submitted to the printer. This is what is physically printed on
        #   the check.
        #
        #   @return [Increase::CheckTransfer::Submission::SubmittedAddress]
        required :submitted_address, -> { Increase::CheckTransfer::Submission::SubmittedAddress }

        # @!attribute submitted_at
        #   When this check transfer was submitted to our check printer.
        #
        #   @return [Time]
        required :submitted_at, Time

        # @!method initialize(address_correction_action:, submitted_address:, submitted_at:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::CheckTransfer::Submission} for more details.
        #
        #   After the transfer is submitted, this will contain supplemental details.
        #
        #   @param address_correction_action [Symbol, Increase::CheckTransfer::Submission::AddressCorrectionAction] Per USPS requirements, Increase will standardize the address to USPS standards a
        #
        #   @param submitted_address [Increase::CheckTransfer::Submission::SubmittedAddress] The address we submitted to the printer. This is what is physically printed on t
        #
        #   @param submitted_at [Time] When this check transfer was submitted to our check printer.

        # Per USPS requirements, Increase will standardize the address to USPS standards
        # and check it against the USPS National Change of Address (NCOA) database before
        # mailing it. This indicates what modifications, if any, were made to the address
        # before printing and mailing the check.
        #
        # @see Increase::CheckTransfer::Submission#address_correction_action
        module AddressCorrectionAction
          extend Increase::Internal::Type::Enum

          # No address correction took place.
          NONE = :none

          # The address was standardized.
          STANDARDIZATION = :standardization

          # The address was first standardized and then changed because the recipient moved.
          STANDARDIZATION_WITH_ADDRESS_CHANGE = :standardization_with_address_change

          # An error occurred while correcting the address. This typically means the USPS could not find that address. The address was not changed.
          ERROR = :error

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Increase::CheckTransfer::Submission#submitted_address
        class SubmittedAddress < Increase::Internal::Type::BaseModel
          # @!attribute city
          #   The submitted address city.
          #
          #   @return [String]
          required :city, String

          # @!attribute line1
          #   The submitted address line 1.
          #
          #   @return [String]
          required :line1, String

          # @!attribute line2
          #   The submitted address line 2.
          #
          #   @return [String, nil]
          required :line2, String, nil?: true

          # @!attribute recipient_name
          #   The submitted recipient name.
          #
          #   @return [String]
          required :recipient_name, String

          # @!attribute state
          #   The submitted address state.
          #
          #   @return [String]
          required :state, String

          # @!attribute zip
          #   The submitted address zip.
          #
          #   @return [String]
          required :zip, String

          # @!method initialize(city:, line1:, line2:, recipient_name:, state:, zip:)
          #   The address we submitted to the printer. This is what is physically printed on
          #   the check.
          #
          #   @param city [String] The submitted address city.
          #
          #   @param line1 [String] The submitted address line 1.
          #
          #   @param line2 [String, nil] The submitted address line 2.
          #
          #   @param recipient_name [String] The submitted recipient name.
          #
          #   @param state [String] The submitted address state.
          #
          #   @param zip [String] The submitted address zip.
        end
      end

      # @see Increase::CheckTransfer#third_party
      class ThirdParty < Increase::Internal::Type::BaseModel
        # @!attribute recipient_name
        #   The name that you will print on the check.
        #
        #   @return [String, nil]
        required :recipient_name, String, nil?: true

        # @!method initialize(recipient_name:)
        #   Details relating to the custom fulfillment you will perform. Will be present if
        #   and only if `fulfillment_method` is equal to `third_party`.
        #
        #   @param recipient_name [String, nil] The name that you will print on the check.
      end

      # A constant representing the object's type. For this resource it will always be
      # `check_transfer`.
      #
      # @see Increase::CheckTransfer#type
      module Type
        extend Increase::Internal::Type::Enum

        CHECK_TRANSFER = :check_transfer

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
