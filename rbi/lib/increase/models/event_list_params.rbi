# typed: strong

module Increase
  module Models
    class EventListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # Filter Events to those belonging to the object with the provided identifier.
      sig { returns(T.nilable(String)) }
      attr_reader :associated_object_id

      sig { params(associated_object_id: String).void }
      attr_writer :associated_object_id

      sig { returns(T.nilable(Increase::Models::EventListParams::Category)) }
      attr_reader :category

      sig { params(category: T.any(Increase::Models::EventListParams::Category, Increase::Internal::AnyHash)).void }
      attr_writer :category

      sig { returns(T.nilable(Increase::Models::EventListParams::CreatedAt)) }
      attr_reader :created_at

      sig { params(created_at: T.any(Increase::Models::EventListParams::CreatedAt, Increase::Internal::AnyHash)).void }
      attr_writer :created_at

      # Return the page of entries after this one.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Limit the size of the list that is returned. The default (and maximum) is 100
      #   objects.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      sig do
        params(
          associated_object_id: String,
          category: T.any(Increase::Models::EventListParams::Category, Increase::Internal::AnyHash),
          created_at: T.any(Increase::Models::EventListParams::CreatedAt, Increase::Internal::AnyHash),
          cursor: String,
          limit: Integer,
          request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
        associated_object_id: nil,
        category: nil,
        created_at: nil,
        cursor: nil,
        limit: nil,
        request_options: {}
      )
      end

      sig do
        override
          .returns(
            {
              associated_object_id: String,
              category: Increase::Models::EventListParams::Category,
              created_at: Increase::Models::EventListParams::CreatedAt,
              cursor: String,
              limit: Integer,
              request_options: Increase::RequestOptions
            }
          )
      end
      def to_hash
      end

      class Category < Increase::Internal::Type::BaseModel
        # Filter Events for those with the specified category or categories. For GET
        #   requests, this should be encoded as a comma-delimited string, such as
        #   `?in=one,two,three`.
        sig { returns(T.nilable(T::Array[Increase::Models::EventListParams::Category::In::OrSymbol])) }
        attr_reader :in_

        sig { params(in_: T::Array[Increase::Models::EventListParams::Category::In::OrSymbol]).void }
        attr_writer :in_

        sig { params(in_: T::Array[Increase::Models::EventListParams::Category::In::OrSymbol]).returns(T.attached_class) }
        def self.new(in_: nil)
        end

        sig { override.returns({in_: T::Array[Increase::Models::EventListParams::Category::In::OrSymbol]}) }
        def to_hash
        end

        module In
          extend Increase::Internal::Type::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::EventListParams::Category::In) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::EventListParams::Category::In::TaggedSymbol) }

          # Occurs whenever an Account is created.
          ACCOUNT_CREATED =
            T.let(:"account.created", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever an Account is updated.
          ACCOUNT_UPDATED =
            T.let(:"account.updated", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever an Account Number is created.
          ACCOUNT_NUMBER_CREATED =
            T.let(:"account_number.created", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever an Account Number is updated.
          ACCOUNT_NUMBER_UPDATED =
            T.let(:"account_number.updated", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever an Account Statement is created.
          ACCOUNT_STATEMENT_CREATED =
            T.let(:"account_statement.created", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever an Account Transfer is created.
          ACCOUNT_TRANSFER_CREATED =
            T.let(:"account_transfer.created", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever an Account Transfer is updated.
          ACCOUNT_TRANSFER_UPDATED =
            T.let(:"account_transfer.updated", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever an ACH Prenotification is created.
          ACH_PRENOTIFICATION_CREATED =
            T.let(:"ach_prenotification.created", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever an ACH Prenotification is updated.
          ACH_PRENOTIFICATION_UPDATED =
            T.let(:"ach_prenotification.updated", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever an ACH Transfer is created.
          ACH_TRANSFER_CREATED =
            T.let(:"ach_transfer.created", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever an ACH Transfer is updated.
          ACH_TRANSFER_UPDATED =
            T.let(:"ach_transfer.updated", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever a Bookkeeping Account is created.
          BOOKKEEPING_ACCOUNT_CREATED =
            T.let(:"bookkeeping_account.created", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever a Bookkeeping Account is updated.
          BOOKKEEPING_ACCOUNT_UPDATED =
            T.let(:"bookkeeping_account.updated", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever a Bookkeeping Entry Set is created.
          BOOKKEEPING_ENTRY_SET_UPDATED =
            T.let(:"bookkeeping_entry_set.updated", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever a Card is created.
          CARD_CREATED = T.let(:"card.created", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever a Card is updated.
          CARD_UPDATED = T.let(:"card.updated", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever a Card Payment is created.
          CARD_PAYMENT_CREATED =
            T.let(:"card_payment.created", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever a Card Payment is updated.
          CARD_PAYMENT_UPDATED =
            T.let(:"card_payment.updated", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever a Card Profile is created.
          CARD_PROFILE_CREATED =
            T.let(:"card_profile.created", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever a Card Profile is updated.
          CARD_PROFILE_UPDATED =
            T.let(:"card_profile.updated", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever a Card Dispute is created.
          CARD_DISPUTE_CREATED =
            T.let(:"card_dispute.created", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever a Card Dispute is updated.
          CARD_DISPUTE_UPDATED =
            T.let(:"card_dispute.updated", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever a Check Deposit is created.
          CHECK_DEPOSIT_CREATED =
            T.let(:"check_deposit.created", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever a Check Deposit is updated.
          CHECK_DEPOSIT_UPDATED =
            T.let(:"check_deposit.updated", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever a Check Transfer is created.
          CHECK_TRANSFER_CREATED =
            T.let(:"check_transfer.created", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever a Check Transfer is updated.
          CHECK_TRANSFER_UPDATED =
            T.let(:"check_transfer.updated", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever a Declined Transaction is created.
          DECLINED_TRANSACTION_CREATED =
            T.let(:"declined_transaction.created", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever a Digital Card Profile is created.
          DIGITAL_CARD_PROFILE_CREATED =
            T.let(:"digital_card_profile.created", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever a Digital Card Profile is updated.
          DIGITAL_CARD_PROFILE_UPDATED =
            T.let(:"digital_card_profile.updated", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever a Digital Wallet Token is created.
          DIGITAL_WALLET_TOKEN_CREATED =
            T.let(:"digital_wallet_token.created", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever a Digital Wallet Token is updated.
          DIGITAL_WALLET_TOKEN_UPDATED =
            T.let(:"digital_wallet_token.updated", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever a Document is created.
          DOCUMENT_CREATED =
            T.let(:"document.created", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever an Entity is created.
          ENTITY_CREATED = T.let(:"entity.created", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever an Entity is updated.
          ENTITY_UPDATED = T.let(:"entity.updated", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever an Event Subscription is created.
          EVENT_SUBSCRIPTION_CREATED =
            T.let(:"event_subscription.created", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever an Event Subscription is updated.
          EVENT_SUBSCRIPTION_UPDATED =
            T.let(:"event_subscription.updated", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever an Export is created.
          EXPORT_CREATED = T.let(:"export.created", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever an Export is updated.
          EXPORT_UPDATED = T.let(:"export.updated", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever an External Account is created.
          EXTERNAL_ACCOUNT_CREATED =
            T.let(:"external_account.created", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever an External Account is updated.
          EXTERNAL_ACCOUNT_UPDATED =
            T.let(:"external_account.updated", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever a File is created.
          FILE_CREATED = T.let(:"file.created", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever a Group is updated.
          GROUP_UPDATED = T.let(:"group.updated", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Increase may send webhooks with this category to see if a webhook endpoint is working properly.
          GROUP_HEARTBEAT =
            T.let(:"group.heartbeat", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever an Inbound ACH Transfer is created.
          INBOUND_ACH_TRANSFER_CREATED =
            T.let(:"inbound_ach_transfer.created", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever an Inbound ACH Transfer is updated.
          INBOUND_ACH_TRANSFER_UPDATED =
            T.let(:"inbound_ach_transfer.updated", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever an Inbound ACH Transfer Return is created.
          INBOUND_ACH_TRANSFER_RETURN_CREATED =
            T.let(
              :"inbound_ach_transfer_return.created",
              Increase::Models::EventListParams::Category::In::TaggedSymbol
            )

          # Occurs whenever an Inbound ACH Transfer Return is updated.
          INBOUND_ACH_TRANSFER_RETURN_UPDATED =
            T.let(
              :"inbound_ach_transfer_return.updated",
              Increase::Models::EventListParams::Category::In::TaggedSymbol
            )

          # Occurs whenever an Inbound Check Deposit is created.
          INBOUND_CHECK_DEPOSIT_CREATED =
            T.let(:"inbound_check_deposit.created", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever an Inbound Check Deposit is updated.
          INBOUND_CHECK_DEPOSIT_UPDATED =
            T.let(:"inbound_check_deposit.updated", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever an Inbound Mail Item is created.
          INBOUND_MAIL_ITEM_CREATED =
            T.let(:"inbound_mail_item.created", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever an Inbound Mail Item is updated.
          INBOUND_MAIL_ITEM_UPDATED =
            T.let(:"inbound_mail_item.updated", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever an Inbound Real-Time Payments Transfer is created.
          INBOUND_REAL_TIME_PAYMENTS_TRANSFER_CREATED =
            T.let(
              :"inbound_real_time_payments_transfer.created",
              Increase::Models::EventListParams::Category::In::TaggedSymbol
            )

          # Occurs whenever an Inbound Real-Time Payments Transfer is updated.
          INBOUND_REAL_TIME_PAYMENTS_TRANSFER_UPDATED =
            T.let(
              :"inbound_real_time_payments_transfer.updated",
              Increase::Models::EventListParams::Category::In::TaggedSymbol
            )

          # Occurs whenever an Inbound Wire Drawdown Request is created.
          INBOUND_WIRE_DRAWDOWN_REQUEST_CREATED =
            T.let(
              :"inbound_wire_drawdown_request.created",
              Increase::Models::EventListParams::Category::In::TaggedSymbol
            )

          # Occurs whenever an Inbound Wire Transfer is created.
          INBOUND_WIRE_TRANSFER_CREATED =
            T.let(:"inbound_wire_transfer.created", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever an Inbound Wire Transfer is updated.
          INBOUND_WIRE_TRANSFER_UPDATED =
            T.let(:"inbound_wire_transfer.updated", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever an IntraFi Account Enrollment is created.
          INTRAFI_ACCOUNT_ENROLLMENT_CREATED =
            T.let(
              :"intrafi_account_enrollment.created",
              Increase::Models::EventListParams::Category::In::TaggedSymbol
            )

          # Occurs whenever an IntraFi Account Enrollment is updated.
          INTRAFI_ACCOUNT_ENROLLMENT_UPDATED =
            T.let(
              :"intrafi_account_enrollment.updated",
              Increase::Models::EventListParams::Category::In::TaggedSymbol
            )

          # Occurs whenever an IntraFi Exclusion is created.
          INTRAFI_EXCLUSION_CREATED =
            T.let(:"intrafi_exclusion.created", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever an IntraFi Exclusion is updated.
          INTRAFI_EXCLUSION_UPDATED =
            T.let(:"intrafi_exclusion.updated", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever a Lockbox is created.
          LOCKBOX_CREATED =
            T.let(:"lockbox.created", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever a Lockbox is updated.
          LOCKBOX_UPDATED =
            T.let(:"lockbox.updated", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever an OAuth Connection is created.
          OAUTH_CONNECTION_CREATED =
            T.let(:"oauth_connection.created", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever an OAuth Connection is deactivated.
          OAUTH_CONNECTION_DEACTIVATED =
            T.let(:"oauth_connection.deactivated", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever a Pending Transaction is created.
          PENDING_TRANSACTION_CREATED =
            T.let(:"pending_transaction.created", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever a Pending Transaction is updated.
          PENDING_TRANSACTION_UPDATED =
            T.let(:"pending_transaction.updated", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever a Physical Card is created.
          PHYSICAL_CARD_CREATED =
            T.let(:"physical_card.created", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever a Physical Card is updated.
          PHYSICAL_CARD_UPDATED =
            T.let(:"physical_card.updated", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever a Physical Card Profile is created.
          PHYSICAL_CARD_PROFILE_CREATED =
            T.let(:"physical_card_profile.created", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever a Physical Card Profile is updated.
          PHYSICAL_CARD_PROFILE_UPDATED =
            T.let(:"physical_card_profile.updated", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever a Proof of Authorization Request is created.
          PROOF_OF_AUTHORIZATION_REQUEST_CREATED =
            T.let(
              :"proof_of_authorization_request.created",
              Increase::Models::EventListParams::Category::In::TaggedSymbol
            )

          # Occurs whenever a Proof of Authorization Request is updated.
          PROOF_OF_AUTHORIZATION_REQUEST_UPDATED =
            T.let(
              :"proof_of_authorization_request.updated",
              Increase::Models::EventListParams::Category::In::TaggedSymbol
            )

          # Occurs whenever a Proof of Authorization Request Submission is created.
          PROOF_OF_AUTHORIZATION_REQUEST_SUBMISSION_CREATED =
            T.let(
              :"proof_of_authorization_request_submission.created",
              Increase::Models::EventListParams::Category::In::TaggedSymbol
            )

          # Occurs whenever a Proof of Authorization Request Submission is updated.
          PROOF_OF_AUTHORIZATION_REQUEST_SUBMISSION_UPDATED =
            T.let(
              :"proof_of_authorization_request_submission.updated",
              Increase::Models::EventListParams::Category::In::TaggedSymbol
            )

          # Occurs whenever a Real-Time Decision is created in response to a card authorization.
          REAL_TIME_DECISION_CARD_AUTHORIZATION_REQUESTED =
            T.let(
              :"real_time_decision.card_authorization_requested",
              Increase::Models::EventListParams::Category::In::TaggedSymbol
            )

          # Occurs whenever a Real-Time Decision is created in response to a digital wallet provisioning attempt.
          REAL_TIME_DECISION_DIGITAL_WALLET_TOKEN_REQUESTED =
            T.let(
              :"real_time_decision.digital_wallet_token_requested",
              Increase::Models::EventListParams::Category::In::TaggedSymbol
            )

          # Occurs whenever a Real-Time Decision is created in response to a digital wallet requiring two-factor authentication.
          REAL_TIME_DECISION_DIGITAL_WALLET_AUTHENTICATION_REQUESTED =
            T.let(
              :"real_time_decision.digital_wallet_authentication_requested",
              Increase::Models::EventListParams::Category::In::TaggedSymbol
            )

          # Occurs whenever a Real-Time Decision is created in response to 3DS authentication.
          REAL_TIME_DECISION_CARD_AUTHENTICATION_REQUESTED =
            T.let(
              :"real_time_decision.card_authentication_requested",
              Increase::Models::EventListParams::Category::In::TaggedSymbol
            )

          # Occurs whenever a Real-Time Decision is created in response to 3DS authentication challenges.
          REAL_TIME_DECISION_CARD_AUTHENTICATION_CHALLENGE_REQUESTED =
            T.let(
              :"real_time_decision.card_authentication_challenge_requested",
              Increase::Models::EventListParams::Category::In::TaggedSymbol
            )

          # Occurs whenever a Real-Time Payments Transfer is created.
          REAL_TIME_PAYMENTS_TRANSFER_CREATED =
            T.let(
              :"real_time_payments_transfer.created",
              Increase::Models::EventListParams::Category::In::TaggedSymbol
            )

          # Occurs whenever a Real-Time Payments Transfer is updated.
          REAL_TIME_PAYMENTS_TRANSFER_UPDATED =
            T.let(
              :"real_time_payments_transfer.updated",
              Increase::Models::EventListParams::Category::In::TaggedSymbol
            )

          # Occurs whenever a Real-Time Payments Request for Payment is created.
          REAL_TIME_PAYMENTS_REQUEST_FOR_PAYMENT_CREATED =
            T.let(
              :"real_time_payments_request_for_payment.created",
              Increase::Models::EventListParams::Category::In::TaggedSymbol
            )

          # Occurs whenever a Real-Time Payments Request for Payment is updated.
          REAL_TIME_PAYMENTS_REQUEST_FOR_PAYMENT_UPDATED =
            T.let(
              :"real_time_payments_request_for_payment.updated",
              Increase::Models::EventListParams::Category::In::TaggedSymbol
            )

          # Occurs whenever a Transaction is created.
          TRANSACTION_CREATED =
            T.let(:"transaction.created", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever a Wire Drawdown Request is created.
          WIRE_DRAWDOWN_REQUEST_CREATED =
            T.let(:"wire_drawdown_request.created", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever a Wire Drawdown Request is updated.
          WIRE_DRAWDOWN_REQUEST_UPDATED =
            T.let(:"wire_drawdown_request.updated", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever a Wire Transfer is created.
          WIRE_TRANSFER_CREATED =
            T.let(:"wire_transfer.created", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          # Occurs whenever a Wire Transfer is updated.
          WIRE_TRANSFER_UPDATED =
            T.let(:"wire_transfer.updated", Increase::Models::EventListParams::Category::In::TaggedSymbol)

          sig { override.returns(T::Array[Increase::Models::EventListParams::Category::In::TaggedSymbol]) }
          def self.values
          end
        end
      end

      class CreatedAt < Increase::Internal::Type::BaseModel
        # Return results after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
        #   timestamp.
        sig { returns(T.nilable(Time)) }
        attr_reader :after

        sig { params(after: Time).void }
        attr_writer :after

        # Return results before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
        #   timestamp.
        sig { returns(T.nilable(Time)) }
        attr_reader :before

        sig { params(before: Time).void }
        attr_writer :before

        # Return results on or after this
        #   [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
        sig { returns(T.nilable(Time)) }
        attr_reader :on_or_after

        sig { params(on_or_after: Time).void }
        attr_writer :on_or_after

        # Return results on or before this
        #   [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
        sig { returns(T.nilable(Time)) }
        attr_reader :on_or_before

        sig { params(on_or_before: Time).void }
        attr_writer :on_or_before

        sig do
          params(after: Time, before: Time, on_or_after: Time, on_or_before: Time).returns(T.attached_class)
        end
        def self.new(after: nil, before: nil, on_or_after: nil, on_or_before: nil)
        end

        sig { override.returns({after: Time, before: Time, on_or_after: Time, on_or_before: Time}) }
        def to_hash
        end
      end
    end
  end
end
