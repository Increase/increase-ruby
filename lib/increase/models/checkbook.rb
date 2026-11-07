# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Checkbooks#create
    class Checkbook < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The Checkbook's identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute account_number_id
      #   The identifier of the Account Number the Checkbook is attached to.
      #
      #   @return [String]
      required :account_number_id, String

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the Checkbook was created.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute idempotency_key
      #   The idempotency key you chose for this object. This value is unique across
      #   Increase and is used to ensure that a request is only processed once. Learn more
      #   about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @return [String, nil]
      required :idempotency_key, String, nil?: true

      # @!attribute mailing_address
      #   The destination address that the Checkbook will be mailed to.
      #
      #   @return [Increase::Models::Checkbook::MailingAddress]
      required :mailing_address, -> { Increase::Checkbook::MailingAddress }

      # @!attribute payer
      #   The payer information printed on the top-left corner of each check.
      #
      #   @return [Array<Increase::Models::Checkbook::Payer>]
      required :payer, -> { Increase::Internal::Type::ArrayOf[Increase::Checkbook::Payer] }

      # @!attribute return_address
      #   The address the Checkbook will return to if there is a delivery issue.
      #
      #   @return [Increase::Models::Checkbook::ReturnAddress]
      required :return_address, -> { Increase::Checkbook::ReturnAddress }

      # @!attribute status
      #   The lifecycle status of the Checkbook.
      #
      #   @return [Symbol, Increase::Models::Checkbook::Status]
      required :status, enum: -> { Increase::Checkbook::Status }

      # @!attribute style
      #   The physical format of the Checkbook.
      #
      #   @return [Symbol, Increase::Models::Checkbook::Style]
      required :style, enum: -> { Increase::Checkbook::Style }

      # @!attribute tracking_updates
      #   Tracking updates relating to the Checkbook's delivery.
      #
      #   @return [Array<Increase::Models::Checkbook::TrackingUpdate>]
      required :tracking_updates, -> { Increase::Internal::Type::ArrayOf[Increase::Checkbook::TrackingUpdate] }

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `checkbook`.
      #
      #   @return [Symbol, Increase::Models::Checkbook::Type]
      required :type, enum: -> { Increase::Checkbook::Type }

      # @!method initialize(id:, account_number_id:, created_at:, idempotency_key:, mailing_address:, payer:, return_address:, status:, style:, tracking_updates:, type:)
      #   Checkbooks are sets of blank checks that Increase prints and mails on your
      #   behalf.
      #
      #   @param id [String] The Checkbook's identifier.
      #
      #   @param account_number_id [String] The identifier of the Account Number the Checkbook is attached to.
      #
      #   @param created_at [Time]
      #     The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #     the Checkbook was created.
      #
      #   @param idempotency_key [String, nil]
      #     The idempotency key you chose for this object. This value is unique across
      #     Increase and is used to ensure that a request is only processed once. Learn more
      #     about [idempotency](https://increase.com/documentation/idempotency-keys).
      #
      #   @param mailing_address [Increase::Models::Checkbook::MailingAddress]
      #     The destination address that the Checkbook will be mailed to.
      #
      #   @param payer [Array<Increase::Models::Checkbook::Payer>]
      #     The payer information printed on the top-left corner of each check.
      #
      #   @param return_address [Increase::Models::Checkbook::ReturnAddress]
      #     The address the Checkbook will return to if there is a delivery issue.
      #
      #   @param status [Symbol, Increase::Models::Checkbook::Status] The lifecycle status of the Checkbook.
      #
      #   @param style [Symbol, Increase::Models::Checkbook::Style] The physical format of the Checkbook.
      #
      #   @param tracking_updates [Array<Increase::Models::Checkbook::TrackingUpdate>]
      #     Tracking updates relating to the Checkbook's delivery.
      #
      #   @param type [Symbol, Increase::Models::Checkbook::Type]
      #     A constant representing the object's type. For this resource it will always be
      #     `checkbook`.

      # @see Increase::Models::Checkbook#mailing_address
      class MailingAddress < Increase::Internal::Type::BaseModel
        # @!attribute city
        #   The city of the destination address.
        #
        #   @return [String]
        required :city, String

        # @!attribute line1
        #   The first line of the destination address.
        #
        #   @return [String]
        required :line1, String

        # @!attribute line2
        #   The second line of the destination address.
        #
        #   @return [String, nil]
        required :line2, String, nil?: true

        # @!attribute name
        #   The recipient at the destination address.
        #
        #   @return [String]
        required :name, String

        # @!attribute postal_code
        #   The postal code of the destination address.
        #
        #   @return [String]
        required :postal_code, String

        # @!attribute state
        #   The state of the destination address.
        #
        #   @return [String]
        required :state, String

        # @!method initialize(city:, line1:, line2:, name:, postal_code:, state:)
        #   The destination address that the Checkbook will be mailed to.
        #
        #   @param city [String] The city of the destination address.
        #
        #   @param line1 [String] The first line of the destination address.
        #
        #   @param line2 [String, nil] The second line of the destination address.
        #
        #   @param name [String] The recipient at the destination address.
        #
        #   @param postal_code [String] The postal code of the destination address.
        #
        #   @param state [String] The state of the destination address.
      end

      class Payer < Increase::Internal::Type::BaseModel
        # @!attribute contents
        #   The contents of the line.
        #
        #   @return [String]
        required :contents, String

        # @!method initialize(contents:)
        #   @param contents [String] The contents of the line.
      end

      # @see Increase::Models::Checkbook#return_address
      class ReturnAddress < Increase::Internal::Type::BaseModel
        # @!attribute city
        #   The city of the return address.
        #
        #   @return [String]
        required :city, String

        # @!attribute line1
        #   The first line of the return address.
        #
        #   @return [String]
        required :line1, String

        # @!attribute line2
        #   The second line of the return address.
        #
        #   @return [String, nil]
        required :line2, String, nil?: true

        # @!attribute name
        #   The recipient at the return address.
        #
        #   @return [String]
        required :name, String

        # @!attribute postal_code
        #   The postal code of the return address.
        #
        #   @return [String]
        required :postal_code, String

        # @!attribute state
        #   The state of the return address.
        #
        #   @return [String]
        required :state, String

        # @!method initialize(city:, line1:, line2:, name:, postal_code:, state:)
        #   The address the Checkbook will return to if there is a delivery issue.
        #
        #   @param city [String] The city of the return address.
        #
        #   @param line1 [String] The first line of the return address.
        #
        #   @param line2 [String, nil] The second line of the return address.
        #
        #   @param name [String] The recipient at the return address.
        #
        #   @param postal_code [String] The postal code of the return address.
        #
        #   @param state [String] The state of the return address.
      end

      # The lifecycle status of the Checkbook.
      #
      # @see Increase::Models::Checkbook#status
      module Status
        extend Increase::Internal::Type::Enum

        # The Checkbook is pending submission to the printer.
        PENDING_SUBMISSION = :pending_submission

        # The Checkbook has been submitted to the printer and is pending mailing.
        PENDING_MAILING = :pending_mailing

        # The Checkbook has been mailed.
        MAILED = :mailed

        # The Checkbook has been stopped and its checks can no longer be deposited.
        STOPPED = :stopped

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # The physical format of the Checkbook.
      #
      # @see Increase::Models::Checkbook#style
      module Style
        extend Increase::Internal::Type::Enum

        # A half-inch three-ring binder holding 75 pages of checks with 3 checks per page.
        THREE_RING_BINDER = :three_ring_binder

        # A folder holding 15 pages of checks with 3 checks per page.
        FOLDER = :folder

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class TrackingUpdate < Increase::Internal::Type::BaseModel
        # @!attribute category
        #   The type of tracking event.
        #
        #   @return [Symbol, Increase::Models::Checkbook::TrackingUpdate::Category]
        required :category, enum: -> { Increase::Checkbook::TrackingUpdate::Category }

        # @!attribute country
        #   The ISO 3166-1 alpha-2 country code for the country where the event took place.
        #
        #   @return [String]
        required :country, String

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

        # @!method initialize(category:, country:, created_at:, postal_code:)
        #   @param category [Symbol, Increase::Models::Checkbook::TrackingUpdate::Category]
        #     The type of tracking event.
        #
        #   @param country [String] The ISO 3166-1 alpha-2 country code for the country where the event took place.
        #
        #   @param created_at [Time]
        #     The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        #     the tracking event took place.
        #
        #   @param postal_code [String] The postal code where the event took place.

        # The type of tracking event.
        #
        # @see Increase::Models::Checkbook::TrackingUpdate#category
        module Category
          extend Increase::Internal::Type::Enum

          # The checkbook is in transit.
          IN_TRANSIT = :in_transit

          # The checkbook has been processed for delivery.
          PROCESSED_FOR_DELIVERY = :processed_for_delivery

          # The checkbook has been delivered. Note that some couriers track delivery status based on driver location data rather than an explicit scan. While uncommon, a single checkbook may have more than one delivered event.
          DELIVERED = :delivered

          # There is an issue preventing delivery. The delivery will be attempted again if possible. If the issue cannot be resolved, the checkbook will be rerouted to the return address.
          DELIVERY_ISSUE = :delivery_issue

          # The checkbook has been rerouted to the return address.
          RETURNING_TO_SENDER = :returning_to_sender

          # The checkbook has been delivered to the return address.
          RETURNED_TO_SENDER = :returned_to_sender

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `checkbook`.
      #
      # @see Increase::Models::Checkbook#type
      module Type
        extend Increase::Internal::Type::Enum

        CHECKBOOK = :checkbook

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
