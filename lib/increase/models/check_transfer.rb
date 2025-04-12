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
      #   @return [Increase::Models::CheckTransfer::Approval, nil]
      required :approval, -> { Increase::Models::CheckTransfer::Approval }, nil?: true

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
      #   @return [Increase::Models::CheckTransfer::Cancellation, nil]
      required :cancellation, -> { Increase::Models::CheckTransfer::Cancellation }, nil?: true

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
      #   @return [Increase::Models::CheckTransfer::CreatedBy, nil]
      required :created_by, -> { Increase::Models::CheckTransfer::CreatedBy }, nil?: true

      # @!attribute currency
      #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the check's
      #   currency.
      #
      #   @return [Symbol, Increase::Models::CheckTransfer::Currency]
      required :currency, enum: -> { Increase::Models::CheckTransfer::Currency }

      # @!attribute fulfillment_method
      #   Whether Increase will print and mail the check or if you will do it yourself.
      #
      #   @return [Symbol, Increase::Models::CheckTransfer::FulfillmentMethod]
      required :fulfillment_method, enum: -> { Increase::Models::CheckTransfer::FulfillmentMethod }

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
      #   @return [Increase::Models::CheckTransfer::Mailing, nil]
      required :mailing, -> { Increase::Models::CheckTransfer::Mailing }, nil?: true

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
      #   @return [Increase::Models::CheckTransfer::PhysicalCheck, nil]
      required :physical_check, -> { Increase::Models::CheckTransfer::PhysicalCheck }, nil?: true

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
      #   @return [Symbol, Increase::Models::CheckTransfer::Status]
      required :status, enum: -> { Increase::Models::CheckTransfer::Status }

      # @!attribute stop_payment_request
      #   After a stop-payment is requested on the check, this will contain supplemental
      #   details.
      #
      #   @return [Increase::Models::CheckTransfer::StopPaymentRequest, nil]
      required :stop_payment_request, -> { Increase::Models::CheckTransfer::StopPaymentRequest }, nil?: true

      # @!attribute submission
      #   After the transfer is submitted, this will contain supplemental details.
      #
      #   @return [Increase::Models::CheckTransfer::Submission, nil]
      required :submission, -> { Increase::Models::CheckTransfer::Submission }, nil?: true

      # @!attribute third_party
      #   Details relating to the custom fulfillment you will perform. Will be present if
      #   and only if `fulfillment_method` is equal to `third_party`.
      #
      #   @return [Increase::Models::CheckTransfer::ThirdParty, nil]
      required :third_party, -> { Increase::Models::CheckTransfer::ThirdParty }, nil?: true

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `check_transfer`.
      #
      #   @return [Symbol, Increase::Models::CheckTransfer::Type]
      required :type, enum: -> { Increase::Models::CheckTransfer::Type }

      # @!parse
      #   # Check Transfers move funds from your Increase account by mailing a physical
      #   # check.
      #   #
      #   # @param id [String]
      #   # @param account_id [String]
      #   # @param account_number [String]
      #   # @param amount [Integer]
      #   # @param approval [Increase::Models::CheckTransfer::Approval, nil]
      #   # @param approved_inbound_check_deposit_id [String, nil]
      #   # @param cancellation [Increase::Models::CheckTransfer::Cancellation, nil]
      #   # @param check_number [String]
      #   # @param created_at [Time]
      #   # @param created_by [Increase::Models::CheckTransfer::CreatedBy, nil]
      #   # @param currency [Symbol, Increase::Models::CheckTransfer::Currency]
      #   # @param fulfillment_method [Symbol, Increase::Models::CheckTransfer::FulfillmentMethod]
      #   # @param idempotency_key [String, nil]
      #   # @param mailing [Increase::Models::CheckTransfer::Mailing, nil]
      #   # @param pending_transaction_id [String, nil]
      #   # @param physical_check [Increase::Models::CheckTransfer::PhysicalCheck, nil]
      #   # @param routing_number [String]
      #   # @param source_account_number_id [String, nil]
      #   # @param status [Symbol, Increase::Models::CheckTransfer::Status]
      #   # @param stop_payment_request [Increase::Models::CheckTransfer::StopPaymentRequest, nil]
      #   # @param submission [Increase::Models::CheckTransfer::Submission, nil]
      #   # @param third_party [Increase::Models::CheckTransfer::ThirdParty, nil]
      #   # @param type [Symbol, Increase::Models::CheckTransfer::Type]
      #   #
      #   def initialize(
      #     id:,
      #     account_id:,
      #     account_number:,
      #     amount:,
      #     approval:,
      #     approved_inbound_check_deposit_id:,
      #     cancellation:,
      #     check_number:,
      #     created_at:,
      #     created_by:,
      #     currency:,
      #     fulfillment_method:,
      #     idempotency_key:,
      #     mailing:,
      #     pending_transaction_id:,
      #     physical_check:,
      #     routing_number:,
      #     source_account_number_id:,
      #     status:,
      #     stop_payment_request:,
      #     submission:,
      #     third_party:,
      #     type:,
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

      # @see Increase::Models::CheckTransfer#approval
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

        # @!parse
        #   # If your account requires approvals for transfers and the transfer was approved,
        #   # this will contain details of the approval.
        #   #
        #   # @param approved_at [Time]
        #   # @param approved_by [String, nil]
        #   #
        #   def initialize(approved_at:, approved_by:, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
      end

      # @see Increase::Models::CheckTransfer#cancellation
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

        # @!parse
        #   # If your account requires approvals for transfers and the transfer was not
        #   # approved, this will contain details of the cancellation.
        #   #
        #   # @param canceled_at [Time]
        #   # @param canceled_by [String, nil]
        #   #
        #   def initialize(canceled_at:, canceled_by:, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
      end

      # @see Increase::Models::CheckTransfer#created_by
      class CreatedBy < Increase::Internal::Type::BaseModel
        # @!attribute api_key
        #   If present, details about the API key that created the transfer.
        #
        #   @return [Increase::Models::CheckTransfer::CreatedBy::APIKey, nil]
        required :api_key, -> { Increase::Models::CheckTransfer::CreatedBy::APIKey }, nil?: true

        # @!attribute category
        #   The type of object that created this transfer.
        #
        #   @return [Symbol, Increase::Models::CheckTransfer::CreatedBy::Category]
        required :category, enum: -> { Increase::Models::CheckTransfer::CreatedBy::Category }

        # @!attribute oauth_application
        #   If present, details about the OAuth Application that created the transfer.
        #
        #   @return [Increase::Models::CheckTransfer::CreatedBy::OAuthApplication, nil]
        required :oauth_application,
                 -> { Increase::Models::CheckTransfer::CreatedBy::OAuthApplication },
                 nil?: true

        # @!attribute user
        #   If present, details about the User that created the transfer.
        #
        #   @return [Increase::Models::CheckTransfer::CreatedBy::User, nil]
        required :user, -> { Increase::Models::CheckTransfer::CreatedBy::User }, nil?: true

        # @!parse
        #   # What object created the transfer, either via the API or the dashboard.
        #   #
        #   # @param api_key [Increase::Models::CheckTransfer::CreatedBy::APIKey, nil]
        #   # @param category [Symbol, Increase::Models::CheckTransfer::CreatedBy::Category]
        #   # @param oauth_application [Increase::Models::CheckTransfer::CreatedBy::OAuthApplication, nil]
        #   # @param user [Increase::Models::CheckTransfer::CreatedBy::User, nil]
        #   #
        #   def initialize(api_key:, category:, oauth_application:, user:, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

        # @see Increase::Models::CheckTransfer::CreatedBy#api_key
        class APIKey < Increase::Internal::Type::BaseModel
          # @!attribute description
          #   The description set for the API key when it was created.
          #
          #   @return [String, nil]
          required :description, String, nil?: true

          # @!parse
          #   # If present, details about the API key that created the transfer.
          #   #
          #   # @param description [String, nil]
          #   #
          #   def initialize(description:, **) = super

          # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
        end

        # The type of object that created this transfer.
        #
        # @see Increase::Models::CheckTransfer::CreatedBy#category
        module Category
          extend Increase::Internal::Type::Enum

          # An API key. Details will be under the `api_key` object.
          API_KEY = :api_key

          # An OAuth application you connected to Increase. Details will be under the `oauth_application` object.
          OAUTH_APPLICATION = :oauth_application

          # A User in the Increase dashboard. Details will be under the `user` object.
          USER = :user

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end

        # @see Increase::Models::CheckTransfer::CreatedBy#oauth_application
        class OAuthApplication < Increase::Internal::Type::BaseModel
          # @!attribute name
          #   The name of the OAuth Application.
          #
          #   @return [String]
          required :name, String

          # @!parse
          #   # If present, details about the OAuth Application that created the transfer.
          #   #
          #   # @param name [String]
          #   #
          #   def initialize(name:, **) = super

          # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
        end

        # @see Increase::Models::CheckTransfer::CreatedBy#user
        class User < Increase::Internal::Type::BaseModel
          # @!attribute email
          #   The email address of the User.
          #
          #   @return [String]
          required :email, String

          # @!parse
          #   # If present, details about the User that created the transfer.
          #   #
          #   # @param email [String]
          #   #
          #   def initialize(email:, **) = super

          # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
        end
      end

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the check's
      # currency.
      #
      # @see Increase::Models::CheckTransfer#currency
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

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end

      # Whether Increase will print and mail the check or if you will do it yourself.
      #
      # @see Increase::Models::CheckTransfer#fulfillment_method
      module FulfillmentMethod
        extend Increase::Internal::Type::Enum

        # Increase will print and mail a physical check.
        PHYSICAL_CHECK = :physical_check

        # Increase will not print a check; you are responsible for printing and mailing a check with the provided account number, routing number, check number, and amount.
        THIRD_PARTY = :third_party

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end

      # @see Increase::Models::CheckTransfer#mailing
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

        # @!parse
        #   # If the check has been mailed by Increase, this will contain details of the
        #   # shipment.
        #   #
        #   # @param image_id [String, nil]
        #   # @param mailed_at [Time]
        #   # @param tracking_number [String, nil]
        #   #
        #   def initialize(image_id:, mailed_at:, tracking_number:, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
      end

      # @see Increase::Models::CheckTransfer#physical_check
      class PhysicalCheck < Increase::Internal::Type::BaseModel
        # @!attribute mailing_address
        #   Details for where Increase will mail the check.
        #
        #   @return [Increase::Models::CheckTransfer::PhysicalCheck::MailingAddress]
        required :mailing_address, -> { Increase::Models::CheckTransfer::PhysicalCheck::MailingAddress }

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
        #   @return [Increase::Models::CheckTransfer::PhysicalCheck::ReturnAddress, nil]
        required :return_address, -> { Increase::Models::CheckTransfer::PhysicalCheck::ReturnAddress }, nil?: true

        # @!attribute shipping_method
        #   The shipping method for the check.
        #
        #   @return [Symbol, Increase::Models::CheckTransfer::PhysicalCheck::ShippingMethod, nil]
        required :shipping_method,
                 enum: -> { Increase::Models::CheckTransfer::PhysicalCheck::ShippingMethod },
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
        #   @return [Array<Increase::Models::CheckTransfer::PhysicalCheck::TrackingUpdate>]
        required :tracking_updates,
                 -> { Increase::Internal::Type::ArrayOf[Increase::Models::CheckTransfer::PhysicalCheck::TrackingUpdate] }

        # @!parse
        #   # Details relating to the physical check that Increase will print and mail. Will
        #   # be present if and only if `fulfillment_method` is equal to `physical_check`.
        #   #
        #   # @param mailing_address [Increase::Models::CheckTransfer::PhysicalCheck::MailingAddress]
        #   # @param memo [String, nil]
        #   # @param note [String, nil]
        #   # @param recipient_name [String]
        #   # @param return_address [Increase::Models::CheckTransfer::PhysicalCheck::ReturnAddress, nil]
        #   # @param shipping_method [Symbol, Increase::Models::CheckTransfer::PhysicalCheck::ShippingMethod, nil]
        #   # @param signature_text [String, nil]
        #   # @param tracking_updates [Array<Increase::Models::CheckTransfer::PhysicalCheck::TrackingUpdate>]
        #   #
        #   def initialize(
        #     mailing_address:,
        #     memo:,
        #     note:,
        #     recipient_name:,
        #     return_address:,
        #     shipping_method:,
        #     signature_text:,
        #     tracking_updates:,
        #     **
        #   )
        #     super
        #   end

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

        # @see Increase::Models::CheckTransfer::PhysicalCheck#mailing_address
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

          # @!parse
          #   # Details for where Increase will mail the check.
          #   #
          #   # @param city [String, nil]
          #   # @param line1 [String, nil]
          #   # @param line2 [String, nil]
          #   # @param name [String, nil]
          #   # @param postal_code [String, nil]
          #   # @param state [String, nil]
          #   #
          #   def initialize(city:, line1:, line2:, name:, postal_code:, state:, **) = super

          # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
        end

        # @see Increase::Models::CheckTransfer::PhysicalCheck#return_address
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

          # @!parse
          #   # The return address to be printed on the check.
          #   #
          #   # @param city [String, nil]
          #   # @param line1 [String, nil]
          #   # @param line2 [String, nil]
          #   # @param name [String, nil]
          #   # @param postal_code [String, nil]
          #   # @param state [String, nil]
          #   #
          #   def initialize(city:, line1:, line2:, name:, postal_code:, state:, **) = super

          # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
        end

        # The shipping method for the check.
        #
        # @see Increase::Models::CheckTransfer::PhysicalCheck#shipping_method
        module ShippingMethod
          extend Increase::Internal::Type::Enum

          # USPS First Class
          USPS_FIRST_CLASS = :usps_first_class

          # FedEx Overnight
          FEDEX_OVERNIGHT = :fedex_overnight

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end

        class TrackingUpdate < Increase::Internal::Type::BaseModel
          # @!attribute category
          #   The type of tracking event.
          #
          #   @return [Symbol, Increase::Models::CheckTransfer::PhysicalCheck::TrackingUpdate::Category]
          required :category, enum: -> { Increase::Models::CheckTransfer::PhysicalCheck::TrackingUpdate::Category }

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

          # @!parse
          #   # @param category [Symbol, Increase::Models::CheckTransfer::PhysicalCheck::TrackingUpdate::Category]
          #   # @param created_at [Time]
          #   # @param postal_code [String]
          #   #
          #   def initialize(category:, created_at:, postal_code:, **) = super

          # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

          # The type of tracking event.
          #
          # @see Increase::Models::CheckTransfer::PhysicalCheck::TrackingUpdate#category
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

            finalize!

            # @!parse
            #   # @return [Array<Symbol>]
            #   def self.values; end
          end
        end
      end

      # The lifecycle status of the transfer.
      #
      # @see Increase::Models::CheckTransfer#status
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

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end

      # @see Increase::Models::CheckTransfer#stop_payment_request
      class StopPaymentRequest < Increase::Internal::Type::BaseModel
        # @!attribute reason
        #   The reason why this transfer was stopped.
        #
        #   @return [Symbol, Increase::Models::CheckTransfer::StopPaymentRequest::Reason]
        required :reason, enum: -> { Increase::Models::CheckTransfer::StopPaymentRequest::Reason }

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
        #   @return [Symbol, Increase::Models::CheckTransfer::StopPaymentRequest::Type]
        required :type, enum: -> { Increase::Models::CheckTransfer::StopPaymentRequest::Type }

        # @!parse
        #   # After a stop-payment is requested on the check, this will contain supplemental
        #   # details.
        #   #
        #   # @param reason [Symbol, Increase::Models::CheckTransfer::StopPaymentRequest::Reason]
        #   # @param requested_at [Time]
        #   # @param transfer_id [String]
        #   # @param type [Symbol, Increase::Models::CheckTransfer::StopPaymentRequest::Type]
        #   #
        #   def initialize(reason:, requested_at:, transfer_id:, type:, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

        # The reason why this transfer was stopped.
        #
        # @see Increase::Models::CheckTransfer::StopPaymentRequest#reason
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

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end

        # A constant representing the object's type. For this resource it will always be
        # `check_transfer_stop_payment_request`.
        #
        # @see Increase::Models::CheckTransfer::StopPaymentRequest#type
        module Type
          extend Increase::Internal::Type::Enum

          CHECK_TRANSFER_STOP_PAYMENT_REQUEST = :check_transfer_stop_payment_request

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end
      end

      # @see Increase::Models::CheckTransfer#submission
      class Submission < Increase::Internal::Type::BaseModel
        # @!attribute address_correction_action
        #   Per USPS requirements, Increase will standardize the address to USPS standards
        #   and check it against the USPS National Change of Address (NCOA) database before
        #   mailing it. This indicates what modifications, if any, were made to the address
        #   before printing and mailing the check.
        #
        #   @return [Symbol, Increase::Models::CheckTransfer::Submission::AddressCorrectionAction]
        required :address_correction_action,
                 enum: -> { Increase::Models::CheckTransfer::Submission::AddressCorrectionAction }

        # @!attribute submitted_address
        #   The address we submitted to the printer. This is what is physically printed on
        #   the check.
        #
        #   @return [Increase::Models::CheckTransfer::Submission::SubmittedAddress]
        required :submitted_address, -> { Increase::Models::CheckTransfer::Submission::SubmittedAddress }

        # @!attribute submitted_at
        #   When this check transfer was submitted to our check printer.
        #
        #   @return [Time]
        required :submitted_at, Time

        # @!parse
        #   # After the transfer is submitted, this will contain supplemental details.
        #   #
        #   # @param address_correction_action [Symbol, Increase::Models::CheckTransfer::Submission::AddressCorrectionAction]
        #   # @param submitted_address [Increase::Models::CheckTransfer::Submission::SubmittedAddress]
        #   # @param submitted_at [Time]
        #   #
        #   def initialize(address_correction_action:, submitted_address:, submitted_at:, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

        # Per USPS requirements, Increase will standardize the address to USPS standards
        # and check it against the USPS National Change of Address (NCOA) database before
        # mailing it. This indicates what modifications, if any, were made to the address
        # before printing and mailing the check.
        #
        # @see Increase::Models::CheckTransfer::Submission#address_correction_action
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

          finalize!

          # @!parse
          #   # @return [Array<Symbol>]
          #   def self.values; end
        end

        # @see Increase::Models::CheckTransfer::Submission#submitted_address
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

          # @!parse
          #   # The address we submitted to the printer. This is what is physically printed on
          #   # the check.
          #   #
          #   # @param city [String]
          #   # @param line1 [String]
          #   # @param line2 [String, nil]
          #   # @param recipient_name [String]
          #   # @param state [String]
          #   # @param zip [String]
          #   #
          #   def initialize(city:, line1:, line2:, recipient_name:, state:, zip:, **) = super

          # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
        end
      end

      # @see Increase::Models::CheckTransfer#third_party
      class ThirdParty < Increase::Internal::Type::BaseModel
        # @!attribute recipient_name
        #   The name that you will print on the check.
        #
        #   @return [String, nil]
        required :recipient_name, String, nil?: true

        # @!parse
        #   # Details relating to the custom fulfillment you will perform. Will be present if
        #   # and only if `fulfillment_method` is equal to `third_party`.
        #   #
        #   # @param recipient_name [String, nil]
        #   #
        #   def initialize(recipient_name:, **) = super

        # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
      end

      # A constant representing the object's type. For this resource it will always be
      # `check_transfer`.
      #
      # @see Increase::Models::CheckTransfer#type
      module Type
        extend Increase::Internal::Type::Enum

        CHECK_TRANSFER = :check_transfer

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end
    end
  end
end
