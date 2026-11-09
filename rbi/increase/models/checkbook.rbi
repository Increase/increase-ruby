# typed: strong

module Increase
  module Models
    class Checkbook < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Increase::Checkbook, Increase::Internal::AnyHash) }

      # The Checkbook's identifier.
      sig { returns(String) }
      attr_accessor :id

      # The identifier of the Account Number the Checkbook is attached to.
      sig { returns(String) }
      attr_accessor :account_number_id

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      # the Checkbook was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The idempotency key you chose for this object. This value is unique across
      # Increase and is used to ensure that a request is only processed once. Learn more
      # about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # The destination address that the Checkbook will be mailed to.
      sig { returns(Increase::Checkbook::MailingAddress) }
      attr_reader :mailing_address

      sig do
        params(
          mailing_address: Increase::Checkbook::MailingAddress::OrHash
        ).void
      end
      attr_writer :mailing_address

      # The payer information printed on the top-left corner of each check.
      sig { returns(T::Array[Increase::Checkbook::Payer]) }
      attr_accessor :payer

      # The address the Checkbook will return to if there is a delivery issue.
      sig { returns(Increase::Checkbook::ReturnAddress) }
      attr_reader :return_address

      sig do
        params(return_address: Increase::Checkbook::ReturnAddress::OrHash).void
      end
      attr_writer :return_address

      # The lifecycle status of the Checkbook.
      sig { returns(Increase::Checkbook::Status::TaggedSymbol) }
      attr_accessor :status

      # The physical format of the Checkbook.
      sig { returns(Increase::Checkbook::Style::TaggedSymbol) }
      attr_accessor :style

      # Tracking updates relating to the Checkbook's delivery.
      sig { returns(T::Array[Increase::Checkbook::TrackingUpdate]) }
      attr_accessor :tracking_updates

      # A constant representing the object's type. For this resource it will always be
      # `checkbook`.
      sig { returns(Increase::Checkbook::Type::TaggedSymbol) }
      attr_accessor :type

      # Checkbooks are sets of blank checks that Increase prints and mails on your
      # behalf.
      sig do
        params(
          id: String,
          account_number_id: String,
          created_at: Time,
          idempotency_key: T.nilable(String),
          mailing_address: Increase::Checkbook::MailingAddress::OrHash,
          payer: T::Array[Increase::Checkbook::Payer::OrHash],
          return_address: Increase::Checkbook::ReturnAddress::OrHash,
          status: Increase::Checkbook::Status::OrSymbol,
          style: Increase::Checkbook::Style::OrSymbol,
          tracking_updates:
            T::Array[Increase::Checkbook::TrackingUpdate::OrHash],
          type: Increase::Checkbook::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The Checkbook's identifier.
        id:,
        # The identifier of the Account Number the Checkbook is attached to.
        account_number_id:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the Checkbook was created.
        created_at:,
        # The idempotency key you chose for this object. This value is unique across
        # Increase and is used to ensure that a request is only processed once. Learn more
        # about [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key:,
        # The destination address that the Checkbook will be mailed to.
        mailing_address:,
        # The payer information printed on the top-left corner of each check.
        payer:,
        # The address the Checkbook will return to if there is a delivery issue.
        return_address:,
        # The lifecycle status of the Checkbook.
        status:,
        # The physical format of the Checkbook.
        style:,
        # Tracking updates relating to the Checkbook's delivery.
        tracking_updates:,
        # A constant representing the object's type. For this resource it will always be
        # `checkbook`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            account_number_id: String,
            created_at: Time,
            idempotency_key: T.nilable(String),
            mailing_address: Increase::Checkbook::MailingAddress,
            payer: T::Array[Increase::Checkbook::Payer],
            return_address: Increase::Checkbook::ReturnAddress,
            status: Increase::Checkbook::Status::TaggedSymbol,
            style: Increase::Checkbook::Style::TaggedSymbol,
            tracking_updates: T::Array[Increase::Checkbook::TrackingUpdate],
            type: Increase::Checkbook::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class MailingAddress < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::Checkbook::MailingAddress,
              Increase::Internal::AnyHash
            )
          end

        # The city of the destination address.
        sig { returns(String) }
        attr_accessor :city

        # The first line of the destination address.
        sig { returns(String) }
        attr_accessor :line1

        # The second line of the destination address.
        sig { returns(T.nilable(String)) }
        attr_accessor :line2

        # The recipient at the destination address.
        sig { returns(String) }
        attr_accessor :name

        # The postal code of the destination address.
        sig { returns(String) }
        attr_accessor :postal_code

        # The state of the destination address.
        sig { returns(String) }
        attr_accessor :state

        # The destination address that the Checkbook will be mailed to.
        sig do
          params(
            city: String,
            line1: String,
            line2: T.nilable(String),
            name: String,
            postal_code: String,
            state: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The city of the destination address.
          city:,
          # The first line of the destination address.
          line1:,
          # The second line of the destination address.
          line2:,
          # The recipient at the destination address.
          name:,
          # The postal code of the destination address.
          postal_code:,
          # The state of the destination address.
          state:
        )
        end

        sig do
          override.returns(
            {
              city: String,
              line1: String,
              line2: T.nilable(String),
              name: String,
              postal_code: String,
              state: String
            }
          )
        end
        def to_hash
        end
      end

      class Payer < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Increase::Checkbook::Payer, Increase::Internal::AnyHash)
          end

        # The contents of the line.
        sig { returns(String) }
        attr_accessor :contents

        sig { params(contents: String).returns(T.attached_class) }
        def self.new(
          # The contents of the line.
          contents:
        )
        end

        sig { override.returns({ contents: String }) }
        def to_hash
        end
      end

      class ReturnAddress < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::Checkbook::ReturnAddress,
              Increase::Internal::AnyHash
            )
          end

        # The city of the return address.
        sig { returns(String) }
        attr_accessor :city

        # The first line of the return address.
        sig { returns(String) }
        attr_accessor :line1

        # The second line of the return address.
        sig { returns(T.nilable(String)) }
        attr_accessor :line2

        # The recipient at the return address.
        sig { returns(String) }
        attr_accessor :name

        # The postal code of the return address.
        sig { returns(String) }
        attr_accessor :postal_code

        # The state of the return address.
        sig { returns(String) }
        attr_accessor :state

        # The address the Checkbook will return to if there is a delivery issue.
        sig do
          params(
            city: String,
            line1: String,
            line2: T.nilable(String),
            name: String,
            postal_code: String,
            state: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The city of the return address.
          city:,
          # The first line of the return address.
          line1:,
          # The second line of the return address.
          line2:,
          # The recipient at the return address.
          name:,
          # The postal code of the return address.
          postal_code:,
          # The state of the return address.
          state:
        )
        end

        sig do
          override.returns(
            {
              city: String,
              line1: String,
              line2: T.nilable(String),
              name: String,
              postal_code: String,
              state: String
            }
          )
        end
        def to_hash
        end
      end

      # The lifecycle status of the Checkbook.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::Checkbook::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The Checkbook is pending submission to the printer.
        PENDING_SUBMISSION =
          T.let(:pending_submission, Increase::Checkbook::Status::TaggedSymbol)

        # The Checkbook has been submitted to the printer and is pending mailing.
        PENDING_MAILING =
          T.let(:pending_mailing, Increase::Checkbook::Status::TaggedSymbol)

        # The Checkbook has been mailed.
        MAILED = T.let(:mailed, Increase::Checkbook::Status::TaggedSymbol)

        # The Checkbook has been stopped and its checks can no longer be deposited.
        STOPPED = T.let(:stopped, Increase::Checkbook::Status::TaggedSymbol)

        sig do
          override.returns(T::Array[Increase::Checkbook::Status::TaggedSymbol])
        end
        def self.values
        end
      end

      # The physical format of the Checkbook.
      module Style
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::Checkbook::Style) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # A half-inch three-ring binder holding 75 pages of checks with 3 checks per page.
        THREE_RING_BINDER =
          T.let(:three_ring_binder, Increase::Checkbook::Style::TaggedSymbol)

        # A folder holding 15 pages of checks with 3 checks per page.
        FOLDER = T.let(:folder, Increase::Checkbook::Style::TaggedSymbol)

        sig do
          override.returns(T::Array[Increase::Checkbook::Style::TaggedSymbol])
        end
        def self.values
        end
      end

      class TrackingUpdate < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::Checkbook::TrackingUpdate,
              Increase::Internal::AnyHash
            )
          end

        # The type of tracking event.
        sig do
          returns(Increase::Checkbook::TrackingUpdate::Category::TaggedSymbol)
        end
        attr_accessor :category

        # The ISO 3166-1 alpha-2 country code for the country where the event took place.
        sig { returns(String) }
        attr_accessor :country

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the tracking event took place.
        sig { returns(Time) }
        attr_accessor :created_at

        # The postal code where the event took place.
        sig { returns(String) }
        attr_accessor :postal_code

        sig do
          params(
            category: Increase::Checkbook::TrackingUpdate::Category::OrSymbol,
            country: String,
            created_at: Time,
            postal_code: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The type of tracking event.
          category:,
          # The ISO 3166-1 alpha-2 country code for the country where the event took place.
          country:,
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the tracking event took place.
          created_at:,
          # The postal code where the event took place.
          postal_code:
        )
        end

        sig do
          override.returns(
            {
              category:
                Increase::Checkbook::TrackingUpdate::Category::TaggedSymbol,
              country: String,
              created_at: Time,
              postal_code: String
            }
          )
        end
        def to_hash
        end

        # The type of tracking event.
        module Category
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::Checkbook::TrackingUpdate::Category)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The checkbook is in transit.
          IN_TRANSIT =
            T.let(
              :in_transit,
              Increase::Checkbook::TrackingUpdate::Category::TaggedSymbol
            )

          # The checkbook has been processed for delivery.
          PROCESSED_FOR_DELIVERY =
            T.let(
              :processed_for_delivery,
              Increase::Checkbook::TrackingUpdate::Category::TaggedSymbol
            )

          # The checkbook has been delivered. Note that some couriers track delivery status based on driver location data rather than an explicit scan. While uncommon, a single checkbook may have more than one delivered event.
          DELIVERED =
            T.let(
              :delivered,
              Increase::Checkbook::TrackingUpdate::Category::TaggedSymbol
            )

          # There is an issue preventing delivery. The delivery will be attempted again if possible. If the issue cannot be resolved, the checkbook will be rerouted to the return address.
          DELIVERY_ISSUE =
            T.let(
              :delivery_issue,
              Increase::Checkbook::TrackingUpdate::Category::TaggedSymbol
            )

          # The checkbook has been rerouted to the return address.
          RETURNING_TO_SENDER =
            T.let(
              :returning_to_sender,
              Increase::Checkbook::TrackingUpdate::Category::TaggedSymbol
            )

          # The checkbook has been delivered to the return address.
          RETURNED_TO_SENDER =
            T.let(
              :returned_to_sender,
              Increase::Checkbook::TrackingUpdate::Category::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::Checkbook::TrackingUpdate::Category::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `checkbook`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Checkbook::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        CHECKBOOK = T.let(:checkbook, Increase::Checkbook::Type::TaggedSymbol)

        sig do
          override.returns(T::Array[Increase::Checkbook::Type::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
