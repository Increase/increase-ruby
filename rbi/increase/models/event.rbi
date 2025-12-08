# typed: strong

module Increase
  module Models
    class Event < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Increase::Event, Increase::Internal::AnyHash) }

      # The Event identifier.
      sig { returns(String) }
      attr_accessor :id

      # The identifier of the object that generated this Event.
      sig { returns(String) }
      attr_accessor :associated_object_id

      # The type of the object that generated this Event.
      sig { returns(String) }
      attr_accessor :associated_object_type

      # The category of the Event. We may add additional possible values for this enum
      # over time; your application should be able to handle such additions gracefully.
      sig { returns(Increase::Event::Category::TaggedSymbol) }
      attr_accessor :category

      # The time the Event was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # A constant representing the object's type. For this resource it will always be
      # `event`.
      sig { returns(Increase::Event::Type::TaggedSymbol) }
      attr_accessor :type

      # Events are records of things that happened to objects at Increase. Events are
      # accessible via the List Events endpoint and can be delivered to your application
      # via webhooks. For more information, see our
      # [webhooks guide](https://increase.com/documentation/webhooks).
      sig do
        params(
          id: String,
          associated_object_id: String,
          associated_object_type: String,
          category: Increase::Event::Category::OrSymbol,
          created_at: Time,
          type: Increase::Event::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The Event identifier.
        id:,
        # The identifier of the object that generated this Event.
        associated_object_id:,
        # The type of the object that generated this Event.
        associated_object_type:,
        # The category of the Event. We may add additional possible values for this enum
        # over time; your application should be able to handle such additions gracefully.
        category:,
        # The time the Event was created.
        created_at:,
        # A constant representing the object's type. For this resource it will always be
        # `event`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            associated_object_id: String,
            associated_object_type: String,
            category: Increase::Event::Category::TaggedSymbol,
            created_at: Time,
            type: Increase::Event::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      # The category of the Event. We may add additional possible values for this enum
      # over time; your application should be able to handle such additions gracefully.
      module Category
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Event::Category) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # Occurs whenever an Account is created.
        ACCOUNT_CREATED =
          T.let(:"account.created", Increase::Event::Category::TaggedSymbol)

        # Occurs whenever an Account is updated.
        ACCOUNT_UPDATED =
          T.let(:"account.updated", Increase::Event::Category::TaggedSymbol)

        # Occurs whenever an Account Number is created.
        ACCOUNT_NUMBER_CREATED =
          T.let(
            :"account_number.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever an Account Number is updated.
        ACCOUNT_NUMBER_UPDATED =
          T.let(
            :"account_number.updated",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever an Account Statement is created.
        ACCOUNT_STATEMENT_CREATED =
          T.let(
            :"account_statement.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever an Account Transfer is created.
        ACCOUNT_TRANSFER_CREATED =
          T.let(
            :"account_transfer.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever an Account Transfer is updated.
        ACCOUNT_TRANSFER_UPDATED =
          T.let(
            :"account_transfer.updated",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever an ACH Prenotification is created.
        ACH_PRENOTIFICATION_CREATED =
          T.let(
            :"ach_prenotification.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever an ACH Prenotification is updated.
        ACH_PRENOTIFICATION_UPDATED =
          T.let(
            :"ach_prenotification.updated",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever an ACH Transfer is created.
        ACH_TRANSFER_CREATED =
          T.let(
            :"ach_transfer.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever an ACH Transfer is updated.
        ACH_TRANSFER_UPDATED =
          T.let(
            :"ach_transfer.updated",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Bookkeeping Account is created.
        BOOKKEEPING_ACCOUNT_CREATED =
          T.let(
            :"bookkeeping_account.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Bookkeeping Account is updated.
        BOOKKEEPING_ACCOUNT_UPDATED =
          T.let(
            :"bookkeeping_account.updated",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Bookkeeping Entry Set is created.
        BOOKKEEPING_ENTRY_SET_UPDATED =
          T.let(
            :"bookkeeping_entry_set.updated",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Card is created.
        CARD_CREATED =
          T.let(:"card.created", Increase::Event::Category::TaggedSymbol)

        # Occurs whenever a Card is updated.
        CARD_UPDATED =
          T.let(:"card.updated", Increase::Event::Category::TaggedSymbol)

        # Occurs whenever a Card Payment is created.
        CARD_PAYMENT_CREATED =
          T.let(
            :"card_payment.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Card Payment is updated.
        CARD_PAYMENT_UPDATED =
          T.let(
            :"card_payment.updated",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Card Profile is created.
        CARD_PROFILE_CREATED =
          T.let(
            :"card_profile.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Card Profile is updated.
        CARD_PROFILE_UPDATED =
          T.let(
            :"card_profile.updated",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Card Dispute is created.
        CARD_DISPUTE_CREATED =
          T.let(
            :"card_dispute.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Card Dispute is updated.
        CARD_DISPUTE_UPDATED =
          T.let(
            :"card_dispute.updated",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Check Deposit is created.
        CHECK_DEPOSIT_CREATED =
          T.let(
            :"check_deposit.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Check Deposit is updated.
        CHECK_DEPOSIT_UPDATED =
          T.let(
            :"check_deposit.updated",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Check Transfer is created.
        CHECK_TRANSFER_CREATED =
          T.let(
            :"check_transfer.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Check Transfer is updated.
        CHECK_TRANSFER_UPDATED =
          T.let(
            :"check_transfer.updated",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Declined Transaction is created.
        DECLINED_TRANSACTION_CREATED =
          T.let(
            :"declined_transaction.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Digital Card Profile is created.
        DIGITAL_CARD_PROFILE_CREATED =
          T.let(
            :"digital_card_profile.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Digital Card Profile is updated.
        DIGITAL_CARD_PROFILE_UPDATED =
          T.let(
            :"digital_card_profile.updated",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Digital Wallet Token is created.
        DIGITAL_WALLET_TOKEN_CREATED =
          T.let(
            :"digital_wallet_token.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Digital Wallet Token is updated.
        DIGITAL_WALLET_TOKEN_UPDATED =
          T.let(
            :"digital_wallet_token.updated",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Document is created.
        DOCUMENT_CREATED =
          T.let(:"document.created", Increase::Event::Category::TaggedSymbol)

        # Occurs whenever an Entity is created.
        ENTITY_CREATED =
          T.let(:"entity.created", Increase::Event::Category::TaggedSymbol)

        # Occurs whenever an Entity is updated.
        ENTITY_UPDATED =
          T.let(:"entity.updated", Increase::Event::Category::TaggedSymbol)

        # Occurs whenever an Event Subscription is created.
        EVENT_SUBSCRIPTION_CREATED =
          T.let(
            :"event_subscription.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever an Event Subscription is updated.
        EVENT_SUBSCRIPTION_UPDATED =
          T.let(
            :"event_subscription.updated",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever an Export is created.
        EXPORT_CREATED =
          T.let(:"export.created", Increase::Event::Category::TaggedSymbol)

        # Occurs whenever an Export is updated.
        EXPORT_UPDATED =
          T.let(:"export.updated", Increase::Event::Category::TaggedSymbol)

        # Occurs whenever an External Account is created.
        EXTERNAL_ACCOUNT_CREATED =
          T.let(
            :"external_account.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever an External Account is updated.
        EXTERNAL_ACCOUNT_UPDATED =
          T.let(
            :"external_account.updated",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a FedNow Transfer is created.
        FEDNOW_TRANSFER_CREATED =
          T.let(
            :"fednow_transfer.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a FedNow Transfer is updated.
        FEDNOW_TRANSFER_UPDATED =
          T.let(
            :"fednow_transfer.updated",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a File is created.
        FILE_CREATED =
          T.let(:"file.created", Increase::Event::Category::TaggedSymbol)

        # Occurs whenever a Group is updated.
        GROUP_UPDATED =
          T.let(:"group.updated", Increase::Event::Category::TaggedSymbol)

        # Increase may send webhooks with this category to see if a webhook endpoint is working properly.
        GROUP_HEARTBEAT =
          T.let(:"group.heartbeat", Increase::Event::Category::TaggedSymbol)

        # Occurs whenever an Inbound ACH Transfer is created.
        INBOUND_ACH_TRANSFER_CREATED =
          T.let(
            :"inbound_ach_transfer.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever an Inbound ACH Transfer is updated.
        INBOUND_ACH_TRANSFER_UPDATED =
          T.let(
            :"inbound_ach_transfer.updated",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever an Inbound ACH Transfer Return is created.
        INBOUND_ACH_TRANSFER_RETURN_CREATED =
          T.let(
            :"inbound_ach_transfer_return.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever an Inbound ACH Transfer Return is updated.
        INBOUND_ACH_TRANSFER_RETURN_UPDATED =
          T.let(
            :"inbound_ach_transfer_return.updated",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever an Inbound Check Deposit is created.
        INBOUND_CHECK_DEPOSIT_CREATED =
          T.let(
            :"inbound_check_deposit.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever an Inbound Check Deposit is updated.
        INBOUND_CHECK_DEPOSIT_UPDATED =
          T.let(
            :"inbound_check_deposit.updated",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever an Inbound FedNow Transfer is created.
        INBOUND_FEDNOW_TRANSFER_CREATED =
          T.let(
            :"inbound_fednow_transfer.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever an Inbound FedNow Transfer is updated.
        INBOUND_FEDNOW_TRANSFER_UPDATED =
          T.let(
            :"inbound_fednow_transfer.updated",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever an Inbound Mail Item is created.
        INBOUND_MAIL_ITEM_CREATED =
          T.let(
            :"inbound_mail_item.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever an Inbound Mail Item is updated.
        INBOUND_MAIL_ITEM_UPDATED =
          T.let(
            :"inbound_mail_item.updated",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever an Inbound Real-Time Payments Transfer is created.
        INBOUND_REAL_TIME_PAYMENTS_TRANSFER_CREATED =
          T.let(
            :"inbound_real_time_payments_transfer.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever an Inbound Real-Time Payments Transfer is updated.
        INBOUND_REAL_TIME_PAYMENTS_TRANSFER_UPDATED =
          T.let(
            :"inbound_real_time_payments_transfer.updated",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever an Inbound Wire Drawdown Request is created.
        INBOUND_WIRE_DRAWDOWN_REQUEST_CREATED =
          T.let(
            :"inbound_wire_drawdown_request.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever an Inbound Wire Transfer is created.
        INBOUND_WIRE_TRANSFER_CREATED =
          T.let(
            :"inbound_wire_transfer.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever an Inbound Wire Transfer is updated.
        INBOUND_WIRE_TRANSFER_UPDATED =
          T.let(
            :"inbound_wire_transfer.updated",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever an IntraFi Account Enrollment is created.
        INTRAFI_ACCOUNT_ENROLLMENT_CREATED =
          T.let(
            :"intrafi_account_enrollment.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever an IntraFi Account Enrollment is updated.
        INTRAFI_ACCOUNT_ENROLLMENT_UPDATED =
          T.let(
            :"intrafi_account_enrollment.updated",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever an IntraFi Exclusion is created.
        INTRAFI_EXCLUSION_CREATED =
          T.let(
            :"intrafi_exclusion.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever an IntraFi Exclusion is updated.
        INTRAFI_EXCLUSION_UPDATED =
          T.let(
            :"intrafi_exclusion.updated",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Legacy Card Dispute is created.
        LEGACY_CARD_DISPUTE_CREATED =
          T.let(
            :"legacy_card_dispute.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Legacy Card Dispute is updated.
        LEGACY_CARD_DISPUTE_UPDATED =
          T.let(
            :"legacy_card_dispute.updated",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Lockbox is created.
        LOCKBOX_CREATED =
          T.let(:"lockbox.created", Increase::Event::Category::TaggedSymbol)

        # Occurs whenever a Lockbox is updated.
        LOCKBOX_UPDATED =
          T.let(:"lockbox.updated", Increase::Event::Category::TaggedSymbol)

        # Occurs whenever an OAuth Connection is created.
        OAUTH_CONNECTION_CREATED =
          T.let(
            :"oauth_connection.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever an OAuth Connection is deactivated.
        OAUTH_CONNECTION_DEACTIVATED =
          T.let(
            :"oauth_connection.deactivated",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Card Push Transfer is created.
        CARD_PUSH_TRANSFER_CREATED =
          T.let(
            :"card_push_transfer.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Card Push Transfer is updated.
        CARD_PUSH_TRANSFER_UPDATED =
          T.let(
            :"card_push_transfer.updated",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Card Validation is created.
        CARD_VALIDATION_CREATED =
          T.let(
            :"card_validation.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Card Validation is updated.
        CARD_VALIDATION_UPDATED =
          T.let(
            :"card_validation.updated",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Pending Transaction is created.
        PENDING_TRANSACTION_CREATED =
          T.let(
            :"pending_transaction.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Pending Transaction is updated.
        PENDING_TRANSACTION_UPDATED =
          T.let(
            :"pending_transaction.updated",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Physical Card is created.
        PHYSICAL_CARD_CREATED =
          T.let(
            :"physical_card.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Physical Card is updated.
        PHYSICAL_CARD_UPDATED =
          T.let(
            :"physical_card.updated",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Physical Card Profile is created.
        PHYSICAL_CARD_PROFILE_CREATED =
          T.let(
            :"physical_card_profile.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Physical Card Profile is updated.
        PHYSICAL_CARD_PROFILE_UPDATED =
          T.let(
            :"physical_card_profile.updated",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Program is created.
        PROGRAM_CREATED =
          T.let(:"program.created", Increase::Event::Category::TaggedSymbol)

        # Occurs whenever a Program is updated.
        PROGRAM_UPDATED =
          T.let(:"program.updated", Increase::Event::Category::TaggedSymbol)

        # Occurs whenever a Proof of Authorization Request is created.
        PROOF_OF_AUTHORIZATION_REQUEST_CREATED =
          T.let(
            :"proof_of_authorization_request.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Proof of Authorization Request is updated.
        PROOF_OF_AUTHORIZATION_REQUEST_UPDATED =
          T.let(
            :"proof_of_authorization_request.updated",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Real-Time Decision is created in response to a card authorization.
        REAL_TIME_DECISION_CARD_AUTHORIZATION_REQUESTED =
          T.let(
            :"real_time_decision.card_authorization_requested",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Real-Time Decision is created in response to a card balance inquiry.
        REAL_TIME_DECISION_CARD_BALANCE_INQUIRY_REQUESTED =
          T.let(
            :"real_time_decision.card_balance_inquiry_requested",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Real-Time Decision is created in response to a digital wallet provisioning attempt.
        REAL_TIME_DECISION_DIGITAL_WALLET_TOKEN_REQUESTED =
          T.let(
            :"real_time_decision.digital_wallet_token_requested",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Real-Time Decision is created in response to a digital wallet requiring two-factor authentication.
        REAL_TIME_DECISION_DIGITAL_WALLET_AUTHENTICATION_REQUESTED =
          T.let(
            :"real_time_decision.digital_wallet_authentication_requested",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Real-Time Decision is created in response to 3DS authentication.
        REAL_TIME_DECISION_CARD_AUTHENTICATION_REQUESTED =
          T.let(
            :"real_time_decision.card_authentication_requested",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Real-Time Decision is created in response to 3DS authentication challenges.
        REAL_TIME_DECISION_CARD_AUTHENTICATION_CHALLENGE_REQUESTED =
          T.let(
            :"real_time_decision.card_authentication_challenge_requested",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Real-Time Payments Transfer is created.
        REAL_TIME_PAYMENTS_TRANSFER_CREATED =
          T.let(
            :"real_time_payments_transfer.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Real-Time Payments Transfer is updated.
        REAL_TIME_PAYMENTS_TRANSFER_UPDATED =
          T.let(
            :"real_time_payments_transfer.updated",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Real-Time Payments Request for Payment is created.
        REAL_TIME_PAYMENTS_REQUEST_FOR_PAYMENT_CREATED =
          T.let(
            :"real_time_payments_request_for_payment.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Real-Time Payments Request for Payment is updated.
        REAL_TIME_PAYMENTS_REQUEST_FOR_PAYMENT_UPDATED =
          T.let(
            :"real_time_payments_request_for_payment.updated",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Swift Transfer is created.
        SWIFT_TRANSFER_CREATED =
          T.let(
            :"swift_transfer.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Swift Transfer is updated.
        SWIFT_TRANSFER_UPDATED =
          T.let(
            :"swift_transfer.updated",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Transaction is created.
        TRANSACTION_CREATED =
          T.let(:"transaction.created", Increase::Event::Category::TaggedSymbol)

        # Occurs whenever a Wire Drawdown Request is created.
        WIRE_DRAWDOWN_REQUEST_CREATED =
          T.let(
            :"wire_drawdown_request.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Wire Drawdown Request is updated.
        WIRE_DRAWDOWN_REQUEST_UPDATED =
          T.let(
            :"wire_drawdown_request.updated",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Wire Transfer is created.
        WIRE_TRANSFER_CREATED =
          T.let(
            :"wire_transfer.created",
            Increase::Event::Category::TaggedSymbol
          )

        # Occurs whenever a Wire Transfer is updated.
        WIRE_TRANSFER_UPDATED =
          T.let(
            :"wire_transfer.updated",
            Increase::Event::Category::TaggedSymbol
          )

        sig do
          override.returns(T::Array[Increase::Event::Category::TaggedSymbol])
        end
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `event`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Event::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        EVENT = T.let(:event, Increase::Event::Type::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Event::Type::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
