# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CardDisputes#submit_user_submission
    class CardDisputeSubmitUserSubmissionParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute network
      #   The network of the Card Dispute. Details specific to the network are required
      #   under the sub-object with the same identifier as the network.
      #
      #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Network]
      required :network, enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Network }

      # @!attribute amount
      #   The adjusted monetary amount of the part of the transaction that is being
      #   disputed. This is optional and will default to the most recent amount provided.
      #   If provided, the amount must be less than or equal to the amount of the
      #   transaction.
      #
      #   @return [Integer, nil]
      optional :amount, Integer

      # @!attribute attachment_files
      #   The files to be attached to the user submission.
      #
      #   @return [Array<Increase::Models::CardDisputeSubmitUserSubmissionParams::AttachmentFile>, nil]
      optional :attachment_files,
               -> { Increase::Internal::Type::ArrayOf[Increase::CardDisputeSubmitUserSubmissionParams::AttachmentFile] }

      # @!attribute visa
      #   The Visa-specific parameters for the dispute. Required if and only if `network`
      #   is `visa`.
      #
      #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa, nil]
      optional :visa, -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa }

      # @!method initialize(network:, amount: nil, attachment_files: nil, visa: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::CardDisputeSubmitUserSubmissionParams} for more details.
      #
      #   @param network [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Network] The network of the Card Dispute. Details specific to the network are required un
      #
      #   @param amount [Integer] The adjusted monetary amount of the part of the transaction that is being disput
      #
      #   @param attachment_files [Array<Increase::Models::CardDisputeSubmitUserSubmissionParams::AttachmentFile>] The files to be attached to the user submission.
      #
      #   @param visa [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa] The Visa-specific parameters for the dispute. Required if and only if `network`
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      # The network of the Card Dispute. Details specific to the network are required
      # under the sub-object with the same identifier as the network.
      module Network
        extend Increase::Internal::Type::Enum

        # Visa
        VISA = :visa

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class AttachmentFile < Increase::Internal::Type::BaseModel
        # @!attribute file_id
        #   The ID of the file to be attached. The file must have a `purpose` of
        #   `card_dispute_attachment`.
        #
        #   @return [String]
        required :file_id, String

        # @!method initialize(file_id:)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::CardDisputeSubmitUserSubmissionParams::AttachmentFile} for
        #   more details.
        #
        #   @param file_id [String] The ID of the file to be attached. The file must have a `purpose` of `card_dispu
      end

      class Visa < Increase::Internal::Type::BaseModel
        # @!attribute category
        #   The category of the user submission. Details specific to the category are
        #   required under the sub-object with the same identifier as the category.
        #
        #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Category]
        required :category, enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Category }

        # @!attribute chargeback
        #   The chargeback details for the user submission. Required if and only if
        #   `category` is `chargeback`.
        #
        #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback, nil]
        optional :chargeback, -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback }

        # @!attribute merchant_prearbitration_decline
        #   The merchant pre-arbitration decline details for the user submission. Required
        #   if and only if `category` is `merchant_prearbitration_decline`.
        #
        #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::MerchantPrearbitrationDecline, nil]
        optional :merchant_prearbitration_decline,
                 -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::MerchantPrearbitrationDecline }

        # @!attribute user_prearbitration
        #   The user pre-arbitration details for the user submission. Required if and only
        #   if `category` is `user_prearbitration`.
        #
        #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration, nil]
        optional :user_prearbitration,
                 -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration }

        # @!method initialize(category:, chargeback: nil, merchant_prearbitration_decline: nil, user_prearbitration: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa} for more
        #   details.
        #
        #   The Visa-specific parameters for the dispute. Required if and only if `network`
        #   is `visa`.
        #
        #   @param category [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Category] The category of the user submission. Details specific to the category are requir
        #
        #   @param chargeback [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback] The chargeback details for the user submission. Required if and only if `categor
        #
        #   @param merchant_prearbitration_decline [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::MerchantPrearbitrationDecline] The merchant pre-arbitration decline details for the user submission. Required i
        #
        #   @param user_prearbitration [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration] The user pre-arbitration details for the user submission. Required if and only i

        # The category of the user submission. Details specific to the category are
        # required under the sub-object with the same identifier as the category.
        #
        # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa#category
        module Category
          extend Increase::Internal::Type::Enum

          # Chargeback.
          CHARGEBACK = :chargeback

          # Merchant pre-arbitration decline.
          MERCHANT_PREARBITRATION_DECLINE = :merchant_prearbitration_decline

          # User pre-arbitration.
          USER_PREARBITRATION = :user_prearbitration

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa#chargeback
        class Chargeback < Increase::Internal::Type::BaseModel
          # @!attribute category
          #   Category.
          #
          #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Category]
          required :category,
                   enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Category }

          # @!attribute authorization
          #   Authorization. Required if and only if `category` is `authorization`.
          #
          #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Authorization, nil]
          optional :authorization,
                   -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Authorization }

          # @!attribute consumer_canceled_merchandise
          #   Canceled merchandise. Required if and only if `category` is
          #   `consumer_canceled_merchandise`.
          #
          #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise, nil]
          optional :consumer_canceled_merchandise,
                   -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise }

          # @!attribute consumer_canceled_recurring_transaction
          #   Canceled recurring transaction. Required if and only if `category` is
          #   `consumer_canceled_recurring_transaction`.
          #
          #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledRecurringTransaction, nil]
          optional :consumer_canceled_recurring_transaction,
                   -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledRecurringTransaction }

          # @!attribute consumer_canceled_services
          #   Canceled services. Required if and only if `category` is
          #   `consumer_canceled_services`.
          #
          #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices, nil]
          optional :consumer_canceled_services,
                   -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices }

          # @!attribute consumer_counterfeit_merchandise
          #   Counterfeit merchandise. Required if and only if `category` is
          #   `consumer_counterfeit_merchandise`.
          #
          #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCounterfeitMerchandise, nil]
          optional :consumer_counterfeit_merchandise,
                   -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCounterfeitMerchandise }

          # @!attribute consumer_credit_not_processed
          #   Credit not processed. Required if and only if `category` is
          #   `consumer_credit_not_processed`.
          #
          #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCreditNotProcessed, nil]
          optional :consumer_credit_not_processed,
                   -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCreditNotProcessed }

          # @!attribute consumer_damaged_or_defective_merchandise
          #   Damaged or defective merchandise. Required if and only if `category` is
          #   `consumer_damaged_or_defective_merchandise`.
          #
          #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise, nil]
          optional :consumer_damaged_or_defective_merchandise,
                   -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise }

          # @!attribute consumer_merchandise_misrepresentation
          #   Merchandise misrepresentation. Required if and only if `category` is
          #   `consumer_merchandise_misrepresentation`.
          #
          #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation, nil]
          optional :consumer_merchandise_misrepresentation,
                   -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation }

          # @!attribute consumer_merchandise_not_as_described
          #   Merchandise not as described. Required if and only if `category` is
          #   `consumer_merchandise_not_as_described`.
          #
          #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed, nil]
          optional :consumer_merchandise_not_as_described,
                   -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed }

          # @!attribute consumer_merchandise_not_received
          #   Merchandise not received. Required if and only if `category` is
          #   `consumer_merchandise_not_received`.
          #
          #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived, nil]
          optional :consumer_merchandise_not_received,
                   -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived }

          # @!attribute consumer_non_receipt_of_cash
          #   Non-receipt of cash. Required if and only if `category` is
          #   `consumer_non_receipt_of_cash`.
          #
          #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerNonReceiptOfCash, nil]
          optional :consumer_non_receipt_of_cash,
                   -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerNonReceiptOfCash }

          # @!attribute consumer_original_credit_transaction_not_accepted
          #   Original Credit Transaction (OCT) not accepted. Required if and only if
          #   `category` is `consumer_original_credit_transaction_not_accepted`.
          #
          #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerOriginalCreditTransactionNotAccepted, nil]
          optional :consumer_original_credit_transaction_not_accepted,
                   -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerOriginalCreditTransactionNotAccepted }

          # @!attribute consumer_quality_merchandise
          #   Merchandise quality issue. Required if and only if `category` is
          #   `consumer_quality_merchandise`.
          #
          #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise, nil]
          optional :consumer_quality_merchandise,
                   -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise }

          # @!attribute consumer_quality_services
          #   Services quality issue. Required if and only if `category` is
          #   `consumer_quality_services`.
          #
          #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices, nil]
          optional :consumer_quality_services,
                   -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices }

          # @!attribute consumer_services_misrepresentation
          #   Services misrepresentation. Required if and only if `category` is
          #   `consumer_services_misrepresentation`.
          #
          #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesMisrepresentation, nil]
          optional :consumer_services_misrepresentation,
                   -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesMisrepresentation }

          # @!attribute consumer_services_not_as_described
          #   Services not as described. Required if and only if `category` is
          #   `consumer_services_not_as_described`.
          #
          #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotAsDescribed, nil]
          optional :consumer_services_not_as_described,
                   -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotAsDescribed }

          # @!attribute consumer_services_not_received
          #   Services not received. Required if and only if `category` is
          #   `consumer_services_not_received`.
          #
          #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived, nil]
          optional :consumer_services_not_received,
                   -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived }

          # @!attribute fraud
          #   Fraud. Required if and only if `category` is `fraud`.
          #
          #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Fraud, nil]
          optional :fraud, -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Fraud }

          # @!attribute processing_error
          #   Processing error. Required if and only if `category` is `processing_error`.
          #
          #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError, nil]
          optional :processing_error,
                   -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError }

          # @!method initialize(category:, authorization: nil, consumer_canceled_merchandise: nil, consumer_canceled_recurring_transaction: nil, consumer_canceled_services: nil, consumer_counterfeit_merchandise: nil, consumer_credit_not_processed: nil, consumer_damaged_or_defective_merchandise: nil, consumer_merchandise_misrepresentation: nil, consumer_merchandise_not_as_described: nil, consumer_merchandise_not_received: nil, consumer_non_receipt_of_cash: nil, consumer_original_credit_transaction_not_accepted: nil, consumer_quality_merchandise: nil, consumer_quality_services: nil, consumer_services_misrepresentation: nil, consumer_services_not_as_described: nil, consumer_services_not_received: nil, fraud: nil, processing_error: nil)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback} for
          #   more details.
          #
          #   The chargeback details for the user submission. Required if and only if
          #   `category` is `chargeback`.
          #
          #   @param category [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Category] Category.
          #
          #   @param authorization [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Authorization] Authorization. Required if and only if `category` is `authorization`.
          #
          #   @param consumer_canceled_merchandise [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise] Canceled merchandise. Required if and only if `category` is `consumer_canceled_m
          #
          #   @param consumer_canceled_recurring_transaction [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledRecurringTransaction] Canceled recurring transaction. Required if and only if `category` is
          #   `consumer\_
          #
          #   @param consumer_canceled_services [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices] Canceled services. Required if and only if `category` is `consumer_canceled_serv
          #
          #   @param consumer_counterfeit_merchandise [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCounterfeitMerchandise] Counterfeit merchandise. Required if and only if `category` is `consumer_counter
          #
          #   @param consumer_credit_not_processed [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCreditNotProcessed] Credit not processed. Required if and only if `category` is `consumer_credit_not
          #
          #   @param consumer_damaged_or_defective_merchandise [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise] Damaged or defective merchandise. Required if and only if `category` is `consume
          #
          #   @param consumer_merchandise_misrepresentation [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation] Merchandise misrepresentation. Required if and only if `category` is `consumer_m
          #
          #   @param consumer_merchandise_not_as_described [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed] Merchandise not as described. Required if and only if `category` is `consumer_me
          #
          #   @param consumer_merchandise_not_received [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived] Merchandise not received. Required if and only if `category` is `consumer_mercha
          #
          #   @param consumer_non_receipt_of_cash [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerNonReceiptOfCash] Non-receipt of cash. Required if and only if `category` is `consumer_non_receipt
          #
          #   @param consumer_original_credit_transaction_not_accepted [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerOriginalCreditTransactionNotAccepted] Original Credit Transaction (OCT) not accepted. Required if and only if `categor
          #
          #   @param consumer_quality_merchandise [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise] Merchandise quality issue. Required if and only if `category` is `consumer_quali
          #
          #   @param consumer_quality_services [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices] Services quality issue. Required if and only if `category` is `consumer*quality*
          #
          #   @param consumer_services_misrepresentation [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesMisrepresentation] Services misrepresentation. Required if and only if `category` is `consumer_serv
          #
          #   @param consumer_services_not_as_described [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotAsDescribed] Services not as described. Required if and only if `category` is `consumer_servi
          #
          #   @param consumer_services_not_received [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived] Services not received. Required if and only if `category` is `consumer*services*
          #
          #   @param fraud [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Fraud] Fraud. Required if and only if `category` is `fraud`.
          #
          #   @param processing_error [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError] Processing error. Required if and only if `category` is `processing_error`.

          # Category.
          #
          # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback#category
          module Category
            extend Increase::Internal::Type::Enum

            # Authorization.
            AUTHORIZATION = :authorization

            # Consumer: canceled merchandise.
            CONSUMER_CANCELED_MERCHANDISE = :consumer_canceled_merchandise

            # Consumer: canceled recurring transaction.
            CONSUMER_CANCELED_RECURRING_TRANSACTION = :consumer_canceled_recurring_transaction

            # Consumer: canceled services.
            CONSUMER_CANCELED_SERVICES = :consumer_canceled_services

            # Consumer: counterfeit merchandise.
            CONSUMER_COUNTERFEIT_MERCHANDISE = :consumer_counterfeit_merchandise

            # Consumer: credit not processed.
            CONSUMER_CREDIT_NOT_PROCESSED = :consumer_credit_not_processed

            # Consumer: damaged or defective merchandise.
            CONSUMER_DAMAGED_OR_DEFECTIVE_MERCHANDISE = :consumer_damaged_or_defective_merchandise

            # Consumer: merchandise misrepresentation.
            CONSUMER_MERCHANDISE_MISREPRESENTATION = :consumer_merchandise_misrepresentation

            # Consumer: merchandise not as described.
            CONSUMER_MERCHANDISE_NOT_AS_DESCRIBED = :consumer_merchandise_not_as_described

            # Consumer: merchandise not received.
            CONSUMER_MERCHANDISE_NOT_RECEIVED = :consumer_merchandise_not_received

            # Consumer: non-receipt of cash.
            CONSUMER_NON_RECEIPT_OF_CASH = :consumer_non_receipt_of_cash

            # Consumer: Original Credit Transaction (OCT) not accepted.
            CONSUMER_ORIGINAL_CREDIT_TRANSACTION_NOT_ACCEPTED = :consumer_original_credit_transaction_not_accepted

            # Consumer: merchandise quality issue.
            CONSUMER_QUALITY_MERCHANDISE = :consumer_quality_merchandise

            # Consumer: services quality issue.
            CONSUMER_QUALITY_SERVICES = :consumer_quality_services

            # Consumer: services misrepresentation.
            CONSUMER_SERVICES_MISREPRESENTATION = :consumer_services_misrepresentation

            # Consumer: services not as described.
            CONSUMER_SERVICES_NOT_AS_DESCRIBED = :consumer_services_not_as_described

            # Consumer: services not received.
            CONSUMER_SERVICES_NOT_RECEIVED = :consumer_services_not_received

            # Fraud.
            FRAUD = :fraud

            # Processing error.
            PROCESSING_ERROR = :processing_error

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback#authorization
          class Authorization < Increase::Internal::Type::BaseModel
            # @!attribute account_status
            #   Account status.
            #
            #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Authorization::AccountStatus]
            required :account_status,
                     enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Authorization::AccountStatus }

            # @!method initialize(account_status:)
            #   Authorization. Required if and only if `category` is `authorization`.
            #
            #   @param account_status [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Authorization::AccountStatus] Account status.

            # Account status.
            #
            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Authorization#account_status
            module AccountStatus
              extend Increase::Internal::Type::Enum

              # Account closed.
              ACCOUNT_CLOSED = :account_closed

              # Credit problem.
              CREDIT_PROBLEM = :credit_problem

              # Fraud.
              FRAUD = :fraud

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback#consumer_canceled_merchandise
          class ConsumerCanceledMerchandise < Increase::Internal::Type::BaseModel
            # @!attribute merchant_resolution_attempted
            #   Merchant resolution attempted.
            #
            #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::MerchantResolutionAttempted]
            required :merchant_resolution_attempted,
                     enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::MerchantResolutionAttempted }

            # @!attribute purchase_explanation
            #   Purchase explanation.
            #
            #   @return [String]
            required :purchase_explanation, String

            # @!attribute received_or_expected_at
            #   Received or expected at.
            #
            #   @return [Date]
            required :received_or_expected_at, Date

            # @!attribute return_outcome
            #   Return outcome.
            #
            #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::ReturnOutcome]
            required :return_outcome,
                     enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::ReturnOutcome }

            # @!attribute cardholder_cancellation
            #   Cardholder cancellation.
            #
            #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation, nil]
            optional :cardholder_cancellation,
                     -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation }

            # @!attribute not_returned
            #   Not returned. Required if and only if `return_outcome` is `not_returned`.
            #
            #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::NotReturned, nil]
            optional :not_returned,
                     -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::NotReturned }

            # @!attribute return_attempted
            #   Return attempted. Required if and only if `return_outcome` is
            #   `return_attempted`.
            #
            #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted, nil]
            optional :return_attempted,
                     -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted }

            # @!attribute returned
            #   Returned. Required if and only if `return_outcome` is `returned`.
            #
            #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::Returned, nil]
            optional :returned,
                     -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::Returned }

            # @!method initialize(merchant_resolution_attempted:, purchase_explanation:, received_or_expected_at:, return_outcome:, cardholder_cancellation: nil, not_returned: nil, return_attempted: nil, returned: nil)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise}
            #   for more details.
            #
            #   Canceled merchandise. Required if and only if `category` is
            #   `consumer_canceled_merchandise`.
            #
            #   @param merchant_resolution_attempted [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::MerchantResolutionAttempted] Merchant resolution attempted.
            #
            #   @param purchase_explanation [String] Purchase explanation.
            #
            #   @param received_or_expected_at [Date] Received or expected at.
            #
            #   @param return_outcome [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::ReturnOutcome] Return outcome.
            #
            #   @param cardholder_cancellation [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation] Cardholder cancellation.
            #
            #   @param not_returned [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::NotReturned] Not returned. Required if and only if `return_outcome` is `not_returned`.
            #
            #   @param return_attempted [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted] Return attempted. Required if and only if `return_outcome` is `return_attempted`
            #
            #   @param returned [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::Returned] Returned. Required if and only if `return_outcome` is `returned`.

            # Merchant resolution attempted.
            #
            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise#merchant_resolution_attempted
            module MerchantResolutionAttempted
              extend Increase::Internal::Type::Enum

              # Attempted.
              ATTEMPTED = :attempted

              # Prohibited by local law.
              PROHIBITED_BY_LOCAL_LAW = :prohibited_by_local_law

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # Return outcome.
            #
            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise#return_outcome
            module ReturnOutcome
              extend Increase::Internal::Type::Enum

              # Not returned.
              NOT_RETURNED = :not_returned

              # Returned.
              RETURNED = :returned

              # Return attempted.
              RETURN_ATTEMPTED = :return_attempted

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise#cardholder_cancellation
            class CardholderCancellation < Increase::Internal::Type::BaseModel
              # @!attribute canceled_at
              #   Canceled at.
              #
              #   @return [Date]
              required :canceled_at, Date

              # @!attribute canceled_prior_to_ship_date
              #   Canceled prior to ship date.
              #
              #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CanceledPriorToShipDate]
              required :canceled_prior_to_ship_date,
                       enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CanceledPriorToShipDate }

              # @!attribute cancellation_policy_provided
              #   Cancellation policy provided.
              #
              #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CancellationPolicyProvided]
              required :cancellation_policy_provided,
                       enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CancellationPolicyProvided }

              # @!attribute reason
              #   Reason.
              #
              #   @return [String]
              required :reason, String

              # @!method initialize(canceled_at:, canceled_prior_to_ship_date:, cancellation_policy_provided:, reason:)
              #   Cardholder cancellation.
              #
              #   @param canceled_at [Date] Canceled at.
              #
              #   @param canceled_prior_to_ship_date [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CanceledPriorToShipDate] Canceled prior to ship date.
              #
              #   @param cancellation_policy_provided [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CancellationPolicyProvided] Cancellation policy provided.
              #
              #   @param reason [String] Reason.

              # Canceled prior to ship date.
              #
              # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation#canceled_prior_to_ship_date
              module CanceledPriorToShipDate
                extend Increase::Internal::Type::Enum

                # Canceled prior to ship date.
                CANCELED_PRIOR_TO_SHIP_DATE = :canceled_prior_to_ship_date

                # Not canceled prior to ship date.
                NOT_CANCELED_PRIOR_TO_SHIP_DATE = :not_canceled_prior_to_ship_date

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # Cancellation policy provided.
              #
              # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation#cancellation_policy_provided
              module CancellationPolicyProvided
                extend Increase::Internal::Type::Enum

                # Not provided.
                NOT_PROVIDED = :not_provided

                # Provided.
                PROVIDED = :provided

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise#not_returned
            class NotReturned < Increase::Internal::Type::BaseModel
              # @!method initialize
              #   Not returned. Required if and only if `return_outcome` is `not_returned`.
            end

            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise#return_attempted
            class ReturnAttempted < Increase::Internal::Type::BaseModel
              # @!attribute attempt_explanation
              #   Attempt explanation.
              #
              #   @return [String]
              required :attempt_explanation, String

              # @!attribute attempt_reason
              #   Attempt reason.
              #
              #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted::AttemptReason]
              required :attempt_reason,
                       enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted::AttemptReason }

              # @!attribute attempted_at
              #   Attempted at.
              #
              #   @return [Date]
              required :attempted_at, Date

              # @!attribute merchandise_disposition
              #   Merchandise disposition.
              #
              #   @return [String]
              required :merchandise_disposition, String

              # @!method initialize(attempt_explanation:, attempt_reason:, attempted_at:, merchandise_disposition:)
              #   Return attempted. Required if and only if `return_outcome` is
              #   `return_attempted`.
              #
              #   @param attempt_explanation [String] Attempt explanation.
              #
              #   @param attempt_reason [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted::AttemptReason] Attempt reason.
              #
              #   @param attempted_at [Date] Attempted at.
              #
              #   @param merchandise_disposition [String] Merchandise disposition.

              # Attempt reason.
              #
              # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted#attempt_reason
              module AttemptReason
                extend Increase::Internal::Type::Enum

                # Merchant not responding.
                MERCHANT_NOT_RESPONDING = :merchant_not_responding

                # No return authorization provided.
                NO_RETURN_AUTHORIZATION_PROVIDED = :no_return_authorization_provided

                # No return instructions.
                NO_RETURN_INSTRUCTIONS = :no_return_instructions

                # Requested not to return.
                REQUESTED_NOT_TO_RETURN = :requested_not_to_return

                # Return not accepted.
                RETURN_NOT_ACCEPTED = :return_not_accepted

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise#returned
            class Returned < Increase::Internal::Type::BaseModel
              # @!attribute return_method
              #   Return method.
              #
              #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::Returned::ReturnMethod]
              required :return_method,
                       enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::Returned::ReturnMethod }

              # @!attribute returned_at
              #   Returned at.
              #
              #   @return [Date]
              required :returned_at, Date

              # @!attribute merchant_received_return_at
              #   Merchant received return at.
              #
              #   @return [Date, nil]
              optional :merchant_received_return_at, Date

              # @!attribute other_explanation
              #   Other explanation. Required if and only if the return method is `other`.
              #
              #   @return [String, nil]
              optional :other_explanation, String

              # @!attribute tracking_number
              #   Tracking number.
              #
              #   @return [String, nil]
              optional :tracking_number, String

              # @!method initialize(return_method:, returned_at:, merchant_received_return_at: nil, other_explanation: nil, tracking_number: nil)
              #   Returned. Required if and only if `return_outcome` is `returned`.
              #
              #   @param return_method [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::Returned::ReturnMethod] Return method.
              #
              #   @param returned_at [Date] Returned at.
              #
              #   @param merchant_received_return_at [Date] Merchant received return at.
              #
              #   @param other_explanation [String] Other explanation. Required if and only if the return method is `other`.
              #
              #   @param tracking_number [String] Tracking number.

              # Return method.
              #
              # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::Returned#return_method
              module ReturnMethod
                extend Increase::Internal::Type::Enum

                # DHL.
                DHL = :dhl

                # Face-to-face.
                FACE_TO_FACE = :face_to_face

                # FedEx.
                FEDEX = :fedex

                # Other.
                OTHER = :other

                # Postal service.
                POSTAL_SERVICE = :postal_service

                # UPS.
                UPS = :ups

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end
          end

          # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback#consumer_canceled_recurring_transaction
          class ConsumerCanceledRecurringTransaction < Increase::Internal::Type::BaseModel
            # @!attribute cancellation_target
            #   Cancellation target.
            #
            #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledRecurringTransaction::CancellationTarget]
            required :cancellation_target,
                     enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledRecurringTransaction::CancellationTarget }

            # @!attribute merchant_contact_methods
            #   Merchant contact methods.
            #
            #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledRecurringTransaction::MerchantContactMethods]
            required :merchant_contact_methods,
                     -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledRecurringTransaction::MerchantContactMethods }

            # @!attribute transaction_or_account_canceled_at
            #   Transaction or account canceled at.
            #
            #   @return [Date]
            required :transaction_or_account_canceled_at, Date

            # @!attribute other_form_of_payment_explanation
            #   Other form of payment explanation.
            #
            #   @return [String, nil]
            optional :other_form_of_payment_explanation, String

            # @!method initialize(cancellation_target:, merchant_contact_methods:, transaction_or_account_canceled_at:, other_form_of_payment_explanation: nil)
            #   Canceled recurring transaction. Required if and only if `category` is
            #   `consumer_canceled_recurring_transaction`.
            #
            #   @param cancellation_target [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledRecurringTransaction::CancellationTarget] Cancellation target.
            #
            #   @param merchant_contact_methods [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledRecurringTransaction::MerchantContactMethods] Merchant contact methods.
            #
            #   @param transaction_or_account_canceled_at [Date] Transaction or account canceled at.
            #
            #   @param other_form_of_payment_explanation [String] Other form of payment explanation.

            # Cancellation target.
            #
            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledRecurringTransaction#cancellation_target
            module CancellationTarget
              extend Increase::Internal::Type::Enum

              # Account.
              ACCOUNT = :account

              # Transaction.
              TRANSACTION = :transaction

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledRecurringTransaction#merchant_contact_methods
            class MerchantContactMethods < Increase::Internal::Type::BaseModel
              # @!attribute application_name
              #   Application name.
              #
              #   @return [String, nil]
              optional :application_name, String

              # @!attribute call_center_phone_number
              #   Call center phone number.
              #
              #   @return [String, nil]
              optional :call_center_phone_number, String

              # @!attribute email_address
              #   Email address.
              #
              #   @return [String, nil]
              optional :email_address, String

              # @!attribute in_person_address
              #   In person address.
              #
              #   @return [String, nil]
              optional :in_person_address, String

              # @!attribute mailing_address
              #   Mailing address.
              #
              #   @return [String, nil]
              optional :mailing_address, String

              # @!attribute text_phone_number
              #   Text phone number.
              #
              #   @return [String, nil]
              optional :text_phone_number, String

              # @!method initialize(application_name: nil, call_center_phone_number: nil, email_address: nil, in_person_address: nil, mailing_address: nil, text_phone_number: nil)
              #   Merchant contact methods.
              #
              #   @param application_name [String] Application name.
              #
              #   @param call_center_phone_number [String] Call center phone number.
              #
              #   @param email_address [String] Email address.
              #
              #   @param in_person_address [String] In person address.
              #
              #   @param mailing_address [String] Mailing address.
              #
              #   @param text_phone_number [String] Text phone number.
            end
          end

          # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback#consumer_canceled_services
          class ConsumerCanceledServices < Increase::Internal::Type::BaseModel
            # @!attribute cardholder_cancellation
            #   Cardholder cancellation.
            #
            #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::CardholderCancellation]
            required :cardholder_cancellation,
                     -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::CardholderCancellation }

            # @!attribute contracted_at
            #   Contracted at.
            #
            #   @return [Date]
            required :contracted_at, Date

            # @!attribute merchant_resolution_attempted
            #   Merchant resolution attempted.
            #
            #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::MerchantResolutionAttempted]
            required :merchant_resolution_attempted,
                     enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::MerchantResolutionAttempted }

            # @!attribute purchase_explanation
            #   Purchase explanation.
            #
            #   @return [String]
            required :purchase_explanation, String

            # @!attribute service_type
            #   Service type.
            #
            #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::ServiceType]
            required :service_type,
                     enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::ServiceType }

            # @!attribute guaranteed_reservation
            #   Guaranteed reservation explanation. Required if and only if `service_type` is
            #   `guaranteed_reservation`.
            #
            #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::GuaranteedReservation, nil]
            optional :guaranteed_reservation,
                     -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::GuaranteedReservation }

            # @!attribute other
            #   Other service type explanation. Required if and only if `service_type` is
            #   `other`.
            #
            #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::Other, nil]
            optional :other,
                     -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::Other }

            # @!attribute timeshare
            #   Timeshare explanation. Required if and only if `service_type` is `timeshare`.
            #
            #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::Timeshare, nil]
            optional :timeshare,
                     -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::Timeshare }

            # @!method initialize(cardholder_cancellation:, contracted_at:, merchant_resolution_attempted:, purchase_explanation:, service_type:, guaranteed_reservation: nil, other: nil, timeshare: nil)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices}
            #   for more details.
            #
            #   Canceled services. Required if and only if `category` is
            #   `consumer_canceled_services`.
            #
            #   @param cardholder_cancellation [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::CardholderCancellation] Cardholder cancellation.
            #
            #   @param contracted_at [Date] Contracted at.
            #
            #   @param merchant_resolution_attempted [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::MerchantResolutionAttempted] Merchant resolution attempted.
            #
            #   @param purchase_explanation [String] Purchase explanation.
            #
            #   @param service_type [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::ServiceType] Service type.
            #
            #   @param guaranteed_reservation [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::GuaranteedReservation] Guaranteed reservation explanation. Required if and only if `service_type` is `g
            #
            #   @param other [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::Other] Other service type explanation. Required if and only if `service_type` is `other
            #
            #   @param timeshare [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::Timeshare] Timeshare explanation. Required if and only if `service_type` is `timeshare`.

            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices#cardholder_cancellation
            class CardholderCancellation < Increase::Internal::Type::BaseModel
              # @!attribute canceled_at
              #   Canceled at.
              #
              #   @return [Date]
              required :canceled_at, Date

              # @!attribute cancellation_policy_provided
              #   Cancellation policy provided.
              #
              #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::CardholderCancellation::CancellationPolicyProvided]
              required :cancellation_policy_provided,
                       enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::CardholderCancellation::CancellationPolicyProvided }

              # @!attribute reason
              #   Reason.
              #
              #   @return [String]
              required :reason, String

              # @!method initialize(canceled_at:, cancellation_policy_provided:, reason:)
              #   Cardholder cancellation.
              #
              #   @param canceled_at [Date] Canceled at.
              #
              #   @param cancellation_policy_provided [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::CardholderCancellation::CancellationPolicyProvided] Cancellation policy provided.
              #
              #   @param reason [String] Reason.

              # Cancellation policy provided.
              #
              # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::CardholderCancellation#cancellation_policy_provided
              module CancellationPolicyProvided
                extend Increase::Internal::Type::Enum

                # Not provided.
                NOT_PROVIDED = :not_provided

                # Provided.
                PROVIDED = :provided

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # Merchant resolution attempted.
            #
            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices#merchant_resolution_attempted
            module MerchantResolutionAttempted
              extend Increase::Internal::Type::Enum

              # Attempted.
              ATTEMPTED = :attempted

              # Prohibited by local law.
              PROHIBITED_BY_LOCAL_LAW = :prohibited_by_local_law

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # Service type.
            #
            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices#service_type
            module ServiceType
              extend Increase::Internal::Type::Enum

              # Guaranteed reservation.
              GUARANTEED_RESERVATION = :guaranteed_reservation

              # Other.
              OTHER = :other

              # Timeshare.
              TIMESHARE = :timeshare

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices#guaranteed_reservation
            class GuaranteedReservation < Increase::Internal::Type::BaseModel
              # @!attribute explanation
              #   Explanation.
              #
              #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::GuaranteedReservation::Explanation]
              required :explanation,
                       enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::GuaranteedReservation::Explanation }

              # @!method initialize(explanation:)
              #   Guaranteed reservation explanation. Required if and only if `service_type` is
              #   `guaranteed_reservation`.
              #
              #   @param explanation [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::GuaranteedReservation::Explanation] Explanation.

              # Explanation.
              #
              # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::GuaranteedReservation#explanation
              module Explanation
                extend Increase::Internal::Type::Enum

                # Cardholder canceled prior to service.
                CARDHOLDER_CANCELED_PRIOR_TO_SERVICE = :cardholder_canceled_prior_to_service

                # Cardholder cancellation attempt within 24 hours of confirmation.
                CARDHOLDER_CANCELLATION_ATTEMPT_WITHIN_24_HOURS_OF_CONFIRMATION =
                  :cardholder_cancellation_attempt_within_24_hours_of_confirmation

                # Merchant billed for no-show.
                MERCHANT_BILLED_NO_SHOW = :merchant_billed_no_show

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices#other
            class Other < Increase::Internal::Type::BaseModel
              # @!method initialize
              #   Other service type explanation. Required if and only if `service_type` is
              #   `other`.
            end

            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices#timeshare
            class Timeshare < Increase::Internal::Type::BaseModel
              # @!method initialize
              #   Timeshare explanation. Required if and only if `service_type` is `timeshare`.
            end
          end

          # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback#consumer_counterfeit_merchandise
          class ConsumerCounterfeitMerchandise < Increase::Internal::Type::BaseModel
            # @!attribute counterfeit_explanation
            #   Counterfeit explanation.
            #
            #   @return [String]
            required :counterfeit_explanation, String

            # @!attribute disposition_explanation
            #   Disposition explanation.
            #
            #   @return [String]
            required :disposition_explanation, String

            # @!attribute order_explanation
            #   Order explanation.
            #
            #   @return [String]
            required :order_explanation, String

            # @!attribute received_at
            #   Received at.
            #
            #   @return [Date]
            required :received_at, Date

            # @!method initialize(counterfeit_explanation:, disposition_explanation:, order_explanation:, received_at:)
            #   Counterfeit merchandise. Required if and only if `category` is
            #   `consumer_counterfeit_merchandise`.
            #
            #   @param counterfeit_explanation [String] Counterfeit explanation.
            #
            #   @param disposition_explanation [String] Disposition explanation.
            #
            #   @param order_explanation [String] Order explanation.
            #
            #   @param received_at [Date] Received at.
          end

          # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback#consumer_credit_not_processed
          class ConsumerCreditNotProcessed < Increase::Internal::Type::BaseModel
            # @!attribute canceled_or_returned_at
            #   Canceled or returned at.
            #
            #   @return [Date, nil]
            optional :canceled_or_returned_at, Date

            # @!attribute credit_expected_at
            #   Credit expected at.
            #
            #   @return [Date, nil]
            optional :credit_expected_at, Date

            # @!method initialize(canceled_or_returned_at: nil, credit_expected_at: nil)
            #   Credit not processed. Required if and only if `category` is
            #   `consumer_credit_not_processed`.
            #
            #   @param canceled_or_returned_at [Date] Canceled or returned at.
            #
            #   @param credit_expected_at [Date] Credit expected at.
          end

          # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback#consumer_damaged_or_defective_merchandise
          class ConsumerDamagedOrDefectiveMerchandise < Increase::Internal::Type::BaseModel
            # @!attribute merchant_resolution_attempted
            #   Merchant resolution attempted.
            #
            #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::MerchantResolutionAttempted]
            required :merchant_resolution_attempted,
                     enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::MerchantResolutionAttempted }

            # @!attribute order_and_issue_explanation
            #   Order and issue explanation.
            #
            #   @return [String]
            required :order_and_issue_explanation, String

            # @!attribute received_at
            #   Received at.
            #
            #   @return [Date]
            required :received_at, Date

            # @!attribute return_outcome
            #   Return outcome.
            #
            #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnOutcome]
            required :return_outcome,
                     enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnOutcome }

            # @!attribute not_returned
            #   Not returned. Required if and only if `return_outcome` is `not_returned`.
            #
            #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::NotReturned, nil]
            optional :not_returned,
                     -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::NotReturned }

            # @!attribute return_attempted
            #   Return attempted. Required if and only if `return_outcome` is
            #   `return_attempted`.
            #
            #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted, nil]
            optional :return_attempted,
                     -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted }

            # @!attribute returned
            #   Returned. Required if and only if `return_outcome` is `returned`.
            #
            #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned, nil]
            optional :returned,
                     -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned }

            # @!method initialize(merchant_resolution_attempted:, order_and_issue_explanation:, received_at:, return_outcome:, not_returned: nil, return_attempted: nil, returned: nil)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise}
            #   for more details.
            #
            #   Damaged or defective merchandise. Required if and only if `category` is
            #   `consumer_damaged_or_defective_merchandise`.
            #
            #   @param merchant_resolution_attempted [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::MerchantResolutionAttempted] Merchant resolution attempted.
            #
            #   @param order_and_issue_explanation [String] Order and issue explanation.
            #
            #   @param received_at [Date] Received at.
            #
            #   @param return_outcome [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnOutcome] Return outcome.
            #
            #   @param not_returned [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::NotReturned] Not returned. Required if and only if `return_outcome` is `not_returned`.
            #
            #   @param return_attempted [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted] Return attempted. Required if and only if `return_outcome` is `return_attempted`
            #
            #   @param returned [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned] Returned. Required if and only if `return_outcome` is `returned`.

            # Merchant resolution attempted.
            #
            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise#merchant_resolution_attempted
            module MerchantResolutionAttempted
              extend Increase::Internal::Type::Enum

              # Attempted.
              ATTEMPTED = :attempted

              # Prohibited by local law.
              PROHIBITED_BY_LOCAL_LAW = :prohibited_by_local_law

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # Return outcome.
            #
            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise#return_outcome
            module ReturnOutcome
              extend Increase::Internal::Type::Enum

              # Not returned.
              NOT_RETURNED = :not_returned

              # Returned.
              RETURNED = :returned

              # Return attempted.
              RETURN_ATTEMPTED = :return_attempted

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise#not_returned
            class NotReturned < Increase::Internal::Type::BaseModel
              # @!method initialize
              #   Not returned. Required if and only if `return_outcome` is `not_returned`.
            end

            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise#return_attempted
            class ReturnAttempted < Increase::Internal::Type::BaseModel
              # @!attribute attempt_explanation
              #   Attempt explanation.
              #
              #   @return [String]
              required :attempt_explanation, String

              # @!attribute attempt_reason
              #   Attempt reason.
              #
              #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::AttemptReason]
              required :attempt_reason,
                       enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::AttemptReason }

              # @!attribute attempted_at
              #   Attempted at.
              #
              #   @return [Date]
              required :attempted_at, Date

              # @!attribute merchandise_disposition
              #   Merchandise disposition.
              #
              #   @return [String]
              required :merchandise_disposition, String

              # @!method initialize(attempt_explanation:, attempt_reason:, attempted_at:, merchandise_disposition:)
              #   Return attempted. Required if and only if `return_outcome` is
              #   `return_attempted`.
              #
              #   @param attempt_explanation [String] Attempt explanation.
              #
              #   @param attempt_reason [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::AttemptReason] Attempt reason.
              #
              #   @param attempted_at [Date] Attempted at.
              #
              #   @param merchandise_disposition [String] Merchandise disposition.

              # Attempt reason.
              #
              # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted#attempt_reason
              module AttemptReason
                extend Increase::Internal::Type::Enum

                # Merchant not responding.
                MERCHANT_NOT_RESPONDING = :merchant_not_responding

                # No return authorization provided.
                NO_RETURN_AUTHORIZATION_PROVIDED = :no_return_authorization_provided

                # No return instructions.
                NO_RETURN_INSTRUCTIONS = :no_return_instructions

                # Requested not to return.
                REQUESTED_NOT_TO_RETURN = :requested_not_to_return

                # Return not accepted.
                RETURN_NOT_ACCEPTED = :return_not_accepted

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise#returned
            class Returned < Increase::Internal::Type::BaseModel
              # @!attribute return_method
              #   Return method.
              #
              #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod]
              required :return_method,
                       enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod }

              # @!attribute returned_at
              #   Returned at.
              #
              #   @return [Date]
              required :returned_at, Date

              # @!attribute merchant_received_return_at
              #   Merchant received return at.
              #
              #   @return [Date, nil]
              optional :merchant_received_return_at, Date

              # @!attribute other_explanation
              #   Other explanation. Required if and only if the return method is `other`.
              #
              #   @return [String, nil]
              optional :other_explanation, String

              # @!attribute tracking_number
              #   Tracking number.
              #
              #   @return [String, nil]
              optional :tracking_number, String

              # @!method initialize(return_method:, returned_at:, merchant_received_return_at: nil, other_explanation: nil, tracking_number: nil)
              #   Returned. Required if and only if `return_outcome` is `returned`.
              #
              #   @param return_method [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod] Return method.
              #
              #   @param returned_at [Date] Returned at.
              #
              #   @param merchant_received_return_at [Date] Merchant received return at.
              #
              #   @param other_explanation [String] Other explanation. Required if and only if the return method is `other`.
              #
              #   @param tracking_number [String] Tracking number.

              # Return method.
              #
              # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned#return_method
              module ReturnMethod
                extend Increase::Internal::Type::Enum

                # DHL.
                DHL = :dhl

                # Face-to-face.
                FACE_TO_FACE = :face_to_face

                # FedEx.
                FEDEX = :fedex

                # Other.
                OTHER = :other

                # Postal service.
                POSTAL_SERVICE = :postal_service

                # UPS.
                UPS = :ups

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end
          end

          # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback#consumer_merchandise_misrepresentation
          class ConsumerMerchandiseMisrepresentation < Increase::Internal::Type::BaseModel
            # @!attribute merchant_resolution_attempted
            #   Merchant resolution attempted.
            #
            #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::MerchantResolutionAttempted]
            required :merchant_resolution_attempted,
                     enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::MerchantResolutionAttempted }

            # @!attribute misrepresentation_explanation
            #   Misrepresentation explanation.
            #
            #   @return [String]
            required :misrepresentation_explanation, String

            # @!attribute purchase_explanation
            #   Purchase explanation.
            #
            #   @return [String]
            required :purchase_explanation, String

            # @!attribute received_at
            #   Received at.
            #
            #   @return [Date]
            required :received_at, Date

            # @!attribute return_outcome
            #   Return outcome.
            #
            #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnOutcome]
            required :return_outcome,
                     enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnOutcome }

            # @!attribute not_returned
            #   Not returned. Required if and only if `return_outcome` is `not_returned`.
            #
            #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::NotReturned, nil]
            optional :not_returned,
                     -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::NotReturned }

            # @!attribute return_attempted
            #   Return attempted. Required if and only if `return_outcome` is
            #   `return_attempted`.
            #
            #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted, nil]
            optional :return_attempted,
                     -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted }

            # @!attribute returned
            #   Returned. Required if and only if `return_outcome` is `returned`.
            #
            #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::Returned, nil]
            optional :returned,
                     -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::Returned }

            # @!method initialize(merchant_resolution_attempted:, misrepresentation_explanation:, purchase_explanation:, received_at:, return_outcome:, not_returned: nil, return_attempted: nil, returned: nil)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation}
            #   for more details.
            #
            #   Merchandise misrepresentation. Required if and only if `category` is
            #   `consumer_merchandise_misrepresentation`.
            #
            #   @param merchant_resolution_attempted [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::MerchantResolutionAttempted] Merchant resolution attempted.
            #
            #   @param misrepresentation_explanation [String] Misrepresentation explanation.
            #
            #   @param purchase_explanation [String] Purchase explanation.
            #
            #   @param received_at [Date] Received at.
            #
            #   @param return_outcome [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnOutcome] Return outcome.
            #
            #   @param not_returned [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::NotReturned] Not returned. Required if and only if `return_outcome` is `not_returned`.
            #
            #   @param return_attempted [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted] Return attempted. Required if and only if `return_outcome` is `return_attempted`
            #
            #   @param returned [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::Returned] Returned. Required if and only if `return_outcome` is `returned`.

            # Merchant resolution attempted.
            #
            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation#merchant_resolution_attempted
            module MerchantResolutionAttempted
              extend Increase::Internal::Type::Enum

              # Attempted.
              ATTEMPTED = :attempted

              # Prohibited by local law.
              PROHIBITED_BY_LOCAL_LAW = :prohibited_by_local_law

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # Return outcome.
            #
            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation#return_outcome
            module ReturnOutcome
              extend Increase::Internal::Type::Enum

              # Not returned.
              NOT_RETURNED = :not_returned

              # Returned.
              RETURNED = :returned

              # Return attempted.
              RETURN_ATTEMPTED = :return_attempted

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation#not_returned
            class NotReturned < Increase::Internal::Type::BaseModel
              # @!method initialize
              #   Not returned. Required if and only if `return_outcome` is `not_returned`.
            end

            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation#return_attempted
            class ReturnAttempted < Increase::Internal::Type::BaseModel
              # @!attribute attempt_explanation
              #   Attempt explanation.
              #
              #   @return [String]
              required :attempt_explanation, String

              # @!attribute attempt_reason
              #   Attempt reason.
              #
              #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted::AttemptReason]
              required :attempt_reason,
                       enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted::AttemptReason }

              # @!attribute attempted_at
              #   Attempted at.
              #
              #   @return [Date]
              required :attempted_at, Date

              # @!attribute merchandise_disposition
              #   Merchandise disposition.
              #
              #   @return [String]
              required :merchandise_disposition, String

              # @!method initialize(attempt_explanation:, attempt_reason:, attempted_at:, merchandise_disposition:)
              #   Return attempted. Required if and only if `return_outcome` is
              #   `return_attempted`.
              #
              #   @param attempt_explanation [String] Attempt explanation.
              #
              #   @param attempt_reason [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted::AttemptReason] Attempt reason.
              #
              #   @param attempted_at [Date] Attempted at.
              #
              #   @param merchandise_disposition [String] Merchandise disposition.

              # Attempt reason.
              #
              # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted#attempt_reason
              module AttemptReason
                extend Increase::Internal::Type::Enum

                # Merchant not responding.
                MERCHANT_NOT_RESPONDING = :merchant_not_responding

                # No return authorization provided.
                NO_RETURN_AUTHORIZATION_PROVIDED = :no_return_authorization_provided

                # No return instructions.
                NO_RETURN_INSTRUCTIONS = :no_return_instructions

                # Requested not to return.
                REQUESTED_NOT_TO_RETURN = :requested_not_to_return

                # Return not accepted.
                RETURN_NOT_ACCEPTED = :return_not_accepted

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation#returned
            class Returned < Increase::Internal::Type::BaseModel
              # @!attribute return_method
              #   Return method.
              #
              #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod]
              required :return_method,
                       enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod }

              # @!attribute returned_at
              #   Returned at.
              #
              #   @return [Date]
              required :returned_at, Date

              # @!attribute merchant_received_return_at
              #   Merchant received return at.
              #
              #   @return [Date, nil]
              optional :merchant_received_return_at, Date

              # @!attribute other_explanation
              #   Other explanation. Required if and only if the return method is `other`.
              #
              #   @return [String, nil]
              optional :other_explanation, String

              # @!attribute tracking_number
              #   Tracking number.
              #
              #   @return [String, nil]
              optional :tracking_number, String

              # @!method initialize(return_method:, returned_at:, merchant_received_return_at: nil, other_explanation: nil, tracking_number: nil)
              #   Returned. Required if and only if `return_outcome` is `returned`.
              #
              #   @param return_method [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod] Return method.
              #
              #   @param returned_at [Date] Returned at.
              #
              #   @param merchant_received_return_at [Date] Merchant received return at.
              #
              #   @param other_explanation [String] Other explanation. Required if and only if the return method is `other`.
              #
              #   @param tracking_number [String] Tracking number.

              # Return method.
              #
              # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::Returned#return_method
              module ReturnMethod
                extend Increase::Internal::Type::Enum

                # DHL.
                DHL = :dhl

                # Face-to-face.
                FACE_TO_FACE = :face_to_face

                # FedEx.
                FEDEX = :fedex

                # Other.
                OTHER = :other

                # Postal service.
                POSTAL_SERVICE = :postal_service

                # UPS.
                UPS = :ups

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end
          end

          # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback#consumer_merchandise_not_as_described
          class ConsumerMerchandiseNotAsDescribed < Increase::Internal::Type::BaseModel
            # @!attribute merchant_resolution_attempted
            #   Merchant resolution attempted.
            #
            #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::MerchantResolutionAttempted]
            required :merchant_resolution_attempted,
                     enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::MerchantResolutionAttempted }

            # @!attribute received_at
            #   Received at.
            #
            #   @return [Date]
            required :received_at, Date

            # @!attribute return_outcome
            #   Return outcome.
            #
            #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnOutcome]
            required :return_outcome,
                     enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnOutcome }

            # @!attribute return_attempted
            #   Return attempted. Required if and only if `return_outcome` is
            #   `return_attempted`.
            #
            #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted, nil]
            optional :return_attempted,
                     -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted }

            # @!attribute returned
            #   Returned. Required if and only if `return_outcome` is `returned`.
            #
            #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned, nil]
            optional :returned,
                     -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned }

            # @!method initialize(merchant_resolution_attempted:, received_at:, return_outcome:, return_attempted: nil, returned: nil)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed}
            #   for more details.
            #
            #   Merchandise not as described. Required if and only if `category` is
            #   `consumer_merchandise_not_as_described`.
            #
            #   @param merchant_resolution_attempted [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::MerchantResolutionAttempted] Merchant resolution attempted.
            #
            #   @param received_at [Date] Received at.
            #
            #   @param return_outcome [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnOutcome] Return outcome.
            #
            #   @param return_attempted [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted] Return attempted. Required if and only if `return_outcome` is `return_attempted`
            #
            #   @param returned [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned] Returned. Required if and only if `return_outcome` is `returned`.

            # Merchant resolution attempted.
            #
            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed#merchant_resolution_attempted
            module MerchantResolutionAttempted
              extend Increase::Internal::Type::Enum

              # Attempted.
              ATTEMPTED = :attempted

              # Prohibited by local law.
              PROHIBITED_BY_LOCAL_LAW = :prohibited_by_local_law

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # Return outcome.
            #
            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed#return_outcome
            module ReturnOutcome
              extend Increase::Internal::Type::Enum

              # Returned.
              RETURNED = :returned

              # Return attempted.
              RETURN_ATTEMPTED = :return_attempted

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed#return_attempted
            class ReturnAttempted < Increase::Internal::Type::BaseModel
              # @!attribute attempt_explanation
              #   Attempt explanation.
              #
              #   @return [String]
              required :attempt_explanation, String

              # @!attribute attempt_reason
              #   Attempt reason.
              #
              #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::AttemptReason]
              required :attempt_reason,
                       enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::AttemptReason }

              # @!attribute attempted_at
              #   Attempted at.
              #
              #   @return [Date]
              required :attempted_at, Date

              # @!attribute merchandise_disposition
              #   Merchandise disposition.
              #
              #   @return [String]
              required :merchandise_disposition, String

              # @!method initialize(attempt_explanation:, attempt_reason:, attempted_at:, merchandise_disposition:)
              #   Return attempted. Required if and only if `return_outcome` is
              #   `return_attempted`.
              #
              #   @param attempt_explanation [String] Attempt explanation.
              #
              #   @param attempt_reason [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::AttemptReason] Attempt reason.
              #
              #   @param attempted_at [Date] Attempted at.
              #
              #   @param merchandise_disposition [String] Merchandise disposition.

              # Attempt reason.
              #
              # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted#attempt_reason
              module AttemptReason
                extend Increase::Internal::Type::Enum

                # Merchant not responding.
                MERCHANT_NOT_RESPONDING = :merchant_not_responding

                # No return authorization provided.
                NO_RETURN_AUTHORIZATION_PROVIDED = :no_return_authorization_provided

                # No return instructions.
                NO_RETURN_INSTRUCTIONS = :no_return_instructions

                # Requested not to return.
                REQUESTED_NOT_TO_RETURN = :requested_not_to_return

                # Return not accepted.
                RETURN_NOT_ACCEPTED = :return_not_accepted

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed#returned
            class Returned < Increase::Internal::Type::BaseModel
              # @!attribute return_method
              #   Return method.
              #
              #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod]
              required :return_method,
                       enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod }

              # @!attribute returned_at
              #   Returned at.
              #
              #   @return [Date]
              required :returned_at, Date

              # @!attribute merchant_received_return_at
              #   Merchant received return at.
              #
              #   @return [Date, nil]
              optional :merchant_received_return_at, Date

              # @!attribute other_explanation
              #   Other explanation. Required if and only if the return method is `other`.
              #
              #   @return [String, nil]
              optional :other_explanation, String

              # @!attribute tracking_number
              #   Tracking number.
              #
              #   @return [String, nil]
              optional :tracking_number, String

              # @!method initialize(return_method:, returned_at:, merchant_received_return_at: nil, other_explanation: nil, tracking_number: nil)
              #   Returned. Required if and only if `return_outcome` is `returned`.
              #
              #   @param return_method [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod] Return method.
              #
              #   @param returned_at [Date] Returned at.
              #
              #   @param merchant_received_return_at [Date] Merchant received return at.
              #
              #   @param other_explanation [String] Other explanation. Required if and only if the return method is `other`.
              #
              #   @param tracking_number [String] Tracking number.

              # Return method.
              #
              # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned#return_method
              module ReturnMethod
                extend Increase::Internal::Type::Enum

                # DHL.
                DHL = :dhl

                # Face-to-face.
                FACE_TO_FACE = :face_to_face

                # FedEx.
                FEDEX = :fedex

                # Other.
                OTHER = :other

                # Postal service.
                POSTAL_SERVICE = :postal_service

                # UPS.
                UPS = :ups

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end
          end

          # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback#consumer_merchandise_not_received
          class ConsumerMerchandiseNotReceived < Increase::Internal::Type::BaseModel
            # @!attribute cancellation_outcome
            #   Cancellation outcome.
            #
            #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::CancellationOutcome]
            required :cancellation_outcome,
                     enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::CancellationOutcome }

            # @!attribute delivery_issue
            #   Delivery issue.
            #
            #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::DeliveryIssue]
            required :delivery_issue,
                     enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::DeliveryIssue }

            # @!attribute last_expected_receipt_at
            #   Last expected receipt at.
            #
            #   @return [Date]
            required :last_expected_receipt_at, Date

            # @!attribute merchant_resolution_attempted
            #   Merchant resolution attempted.
            #
            #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::MerchantResolutionAttempted]
            required :merchant_resolution_attempted,
                     enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::MerchantResolutionAttempted }

            # @!attribute purchase_info_and_explanation
            #   Purchase information and explanation.
            #
            #   @return [String]
            required :purchase_info_and_explanation, String

            # @!attribute cardholder_cancellation_prior_to_expected_receipt
            #   Cardholder cancellation prior to expected receipt. Required if and only if
            #   `cancellation_outcome` is `cardholder_cancellation_prior_to_expected_receipt`.
            #
            #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::CardholderCancellationPriorToExpectedReceipt, nil]
            optional :cardholder_cancellation_prior_to_expected_receipt,
                     -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::CardholderCancellationPriorToExpectedReceipt }

            # @!attribute delayed
            #   Delayed. Required if and only if `delivery_issue` is `delayed`.
            #
            #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed, nil]
            optional :delayed,
                     -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed }

            # @!attribute delivered_to_wrong_location
            #   Delivered to wrong location. Required if and only if `delivery_issue` is
            #   `delivered_to_wrong_location`.
            #
            #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::DeliveredToWrongLocation, nil]
            optional :delivered_to_wrong_location,
                     -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::DeliveredToWrongLocation }

            # @!attribute merchant_cancellation
            #   Merchant cancellation. Required if and only if `cancellation_outcome` is
            #   `merchant_cancellation`.
            #
            #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::MerchantCancellation, nil]
            optional :merchant_cancellation,
                     -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::MerchantCancellation }

            # @!attribute no_cancellation
            #   No cancellation. Required if and only if `cancellation_outcome` is
            #   `no_cancellation`.
            #
            #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::NoCancellation, nil]
            optional :no_cancellation,
                     -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::NoCancellation }

            # @!method initialize(cancellation_outcome:, delivery_issue:, last_expected_receipt_at:, merchant_resolution_attempted:, purchase_info_and_explanation:, cardholder_cancellation_prior_to_expected_receipt: nil, delayed: nil, delivered_to_wrong_location: nil, merchant_cancellation: nil, no_cancellation: nil)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived}
            #   for more details.
            #
            #   Merchandise not received. Required if and only if `category` is
            #   `consumer_merchandise_not_received`.
            #
            #   @param cancellation_outcome [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::CancellationOutcome] Cancellation outcome.
            #
            #   @param delivery_issue [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::DeliveryIssue] Delivery issue.
            #
            #   @param last_expected_receipt_at [Date] Last expected receipt at.
            #
            #   @param merchant_resolution_attempted [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::MerchantResolutionAttempted] Merchant resolution attempted.
            #
            #   @param purchase_info_and_explanation [String] Purchase information and explanation.
            #
            #   @param cardholder_cancellation_prior_to_expected_receipt [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::CardholderCancellationPriorToExpectedReceipt] Cardholder cancellation prior to expected receipt. Required if and only if `canc
            #
            #   @param delayed [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed] Delayed. Required if and only if `delivery_issue` is `delayed`.
            #
            #   @param delivered_to_wrong_location [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::DeliveredToWrongLocation] Delivered to wrong location. Required if and only if `delivery_issue` is `delive
            #
            #   @param merchant_cancellation [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::MerchantCancellation] Merchant cancellation. Required if and only if `cancellation_outcome` is `mercha
            #
            #   @param no_cancellation [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::NoCancellation] No cancellation. Required if and only if `cancellation_outcome` is `no_cancellat

            # Cancellation outcome.
            #
            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived#cancellation_outcome
            module CancellationOutcome
              extend Increase::Internal::Type::Enum

              # Cardholder cancellation prior to expected receipt.
              CARDHOLDER_CANCELLATION_PRIOR_TO_EXPECTED_RECEIPT = :cardholder_cancellation_prior_to_expected_receipt

              # Merchant cancellation.
              MERCHANT_CANCELLATION = :merchant_cancellation

              # No cancellation.
              NO_CANCELLATION = :no_cancellation

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # Delivery issue.
            #
            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived#delivery_issue
            module DeliveryIssue
              extend Increase::Internal::Type::Enum

              # Delayed.
              DELAYED = :delayed

              # Delivered to wrong location.
              DELIVERED_TO_WRONG_LOCATION = :delivered_to_wrong_location

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # Merchant resolution attempted.
            #
            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived#merchant_resolution_attempted
            module MerchantResolutionAttempted
              extend Increase::Internal::Type::Enum

              # Attempted.
              ATTEMPTED = :attempted

              # Prohibited by local law.
              PROHIBITED_BY_LOCAL_LAW = :prohibited_by_local_law

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived#cardholder_cancellation_prior_to_expected_receipt
            class CardholderCancellationPriorToExpectedReceipt < Increase::Internal::Type::BaseModel
              # @!attribute canceled_at
              #   Canceled at.
              #
              #   @return [Date]
              required :canceled_at, Date

              # @!attribute reason
              #   Reason.
              #
              #   @return [String, nil]
              optional :reason, String

              # @!method initialize(canceled_at:, reason: nil)
              #   Cardholder cancellation prior to expected receipt. Required if and only if
              #   `cancellation_outcome` is `cardholder_cancellation_prior_to_expected_receipt`.
              #
              #   @param canceled_at [Date] Canceled at.
              #
              #   @param reason [String] Reason.
            end

            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived#delayed
            class Delayed < Increase::Internal::Type::BaseModel
              # @!attribute explanation
              #   Explanation.
              #
              #   @return [String]
              required :explanation, String

              # @!attribute return_outcome
              #   Return outcome.
              #
              #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed::ReturnOutcome]
              required :return_outcome,
                       enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed::ReturnOutcome }

              # @!attribute not_returned
              #   Not returned. Required if and only if `return_outcome` is `not_returned`.
              #
              #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed::NotReturned, nil]
              optional :not_returned,
                       -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed::NotReturned }

              # @!attribute return_attempted
              #   Return attempted. Required if and only if `return_outcome` is
              #   `return_attempted`.
              #
              #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed::ReturnAttempted, nil]
              optional :return_attempted,
                       -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed::ReturnAttempted }

              # @!attribute returned
              #   Returned. Required if and only if `return_outcome` is `returned`.
              #
              #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed::Returned, nil]
              optional :returned,
                       -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed::Returned }

              # @!method initialize(explanation:, return_outcome:, not_returned: nil, return_attempted: nil, returned: nil)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed}
              #   for more details.
              #
              #   Delayed. Required if and only if `delivery_issue` is `delayed`.
              #
              #   @param explanation [String] Explanation.
              #
              #   @param return_outcome [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed::ReturnOutcome] Return outcome.
              #
              #   @param not_returned [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed::NotReturned] Not returned. Required if and only if `return_outcome` is `not_returned`.
              #
              #   @param return_attempted [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed::ReturnAttempted] Return attempted. Required if and only if `return_outcome` is `return_attempted`
              #
              #   @param returned [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed::Returned] Returned. Required if and only if `return_outcome` is `returned`.

              # Return outcome.
              #
              # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed#return_outcome
              module ReturnOutcome
                extend Increase::Internal::Type::Enum

                # Not returned.
                NOT_RETURNED = :not_returned

                # Returned.
                RETURNED = :returned

                # Return attempted.
                RETURN_ATTEMPTED = :return_attempted

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed#not_returned
              class NotReturned < Increase::Internal::Type::BaseModel
                # @!method initialize
                #   Not returned. Required if and only if `return_outcome` is `not_returned`.
              end

              # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed#return_attempted
              class ReturnAttempted < Increase::Internal::Type::BaseModel
                # @!attribute attempted_at
                #   Attempted at.
                #
                #   @return [Date]
                required :attempted_at, Date

                # @!method initialize(attempted_at:)
                #   Return attempted. Required if and only if `return_outcome` is
                #   `return_attempted`.
                #
                #   @param attempted_at [Date] Attempted at.
              end

              # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed#returned
              class Returned < Increase::Internal::Type::BaseModel
                # @!attribute merchant_received_return_at
                #   Merchant received return at.
                #
                #   @return [Date]
                required :merchant_received_return_at, Date

                # @!attribute returned_at
                #   Returned at.
                #
                #   @return [Date]
                required :returned_at, Date

                # @!method initialize(merchant_received_return_at:, returned_at:)
                #   Returned. Required if and only if `return_outcome` is `returned`.
                #
                #   @param merchant_received_return_at [Date] Merchant received return at.
                #
                #   @param returned_at [Date] Returned at.
              end
            end

            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived#delivered_to_wrong_location
            class DeliveredToWrongLocation < Increase::Internal::Type::BaseModel
              # @!attribute agreed_location
              #   Agreed location.
              #
              #   @return [String]
              required :agreed_location, String

              # @!method initialize(agreed_location:)
              #   Delivered to wrong location. Required if and only if `delivery_issue` is
              #   `delivered_to_wrong_location`.
              #
              #   @param agreed_location [String] Agreed location.
            end

            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived#merchant_cancellation
            class MerchantCancellation < Increase::Internal::Type::BaseModel
              # @!attribute canceled_at
              #   Canceled at.
              #
              #   @return [Date]
              required :canceled_at, Date

              # @!method initialize(canceled_at:)
              #   Merchant cancellation. Required if and only if `cancellation_outcome` is
              #   `merchant_cancellation`.
              #
              #   @param canceled_at [Date] Canceled at.
            end

            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived#no_cancellation
            class NoCancellation < Increase::Internal::Type::BaseModel
              # @!method initialize
              #   No cancellation. Required if and only if `cancellation_outcome` is
              #   `no_cancellation`.
            end
          end

          # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback#consumer_non_receipt_of_cash
          class ConsumerNonReceiptOfCash < Increase::Internal::Type::BaseModel
            # @!method initialize
            #   Non-receipt of cash. Required if and only if `category` is
            #   `consumer_non_receipt_of_cash`.
          end

          # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback#consumer_original_credit_transaction_not_accepted
          class ConsumerOriginalCreditTransactionNotAccepted < Increase::Internal::Type::BaseModel
            # @!attribute explanation
            #   Explanation.
            #
            #   @return [String]
            required :explanation, String

            # @!attribute reason
            #   Reason.
            #
            #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerOriginalCreditTransactionNotAccepted::Reason]
            required :reason,
                     enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerOriginalCreditTransactionNotAccepted::Reason }

            # @!method initialize(explanation:, reason:)
            #   Original Credit Transaction (OCT) not accepted. Required if and only if
            #   `category` is `consumer_original_credit_transaction_not_accepted`.
            #
            #   @param explanation [String] Explanation.
            #
            #   @param reason [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerOriginalCreditTransactionNotAccepted::Reason] Reason.

            # Reason.
            #
            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerOriginalCreditTransactionNotAccepted#reason
            module Reason
              extend Increase::Internal::Type::Enum

              # Prohibited by local laws or regulation.
              PROHIBITED_BY_LOCAL_LAWS_OR_REGULATION = :prohibited_by_local_laws_or_regulation

              # Recipient refused.
              RECIPIENT_REFUSED = :recipient_refused

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback#consumer_quality_merchandise
          class ConsumerQualityMerchandise < Increase::Internal::Type::BaseModel
            # @!attribute expected_at
            #   Expected at.
            #
            #   @return [Date]
            required :expected_at, Date

            # @!attribute merchant_resolution_attempted
            #   Merchant resolution attempted.
            #
            #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::MerchantResolutionAttempted]
            required :merchant_resolution_attempted,
                     enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::MerchantResolutionAttempted }

            # @!attribute purchase_info_and_quality_issue
            #   Purchase information and quality issue.
            #
            #   @return [String]
            required :purchase_info_and_quality_issue, String

            # @!attribute received_at
            #   Received at.
            #
            #   @return [Date]
            required :received_at, Date

            # @!attribute return_outcome
            #   Return outcome.
            #
            #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::ReturnOutcome]
            required :return_outcome,
                     enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::ReturnOutcome }

            # @!attribute not_returned
            #   Not returned. Required if and only if `return_outcome` is `not_returned`.
            #
            #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::NotReturned, nil]
            optional :not_returned,
                     -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::NotReturned }

            # @!attribute ongoing_negotiations
            #   Ongoing negotiations. Exclude if there is no evidence of ongoing negotiations.
            #
            #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::OngoingNegotiations, nil]
            optional :ongoing_negotiations,
                     -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::OngoingNegotiations }

            # @!attribute return_attempted
            #   Return attempted. Required if and only if `return_outcome` is
            #   `return_attempted`.
            #
            #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::ReturnAttempted, nil]
            optional :return_attempted,
                     -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::ReturnAttempted }

            # @!attribute returned
            #   Returned. Required if and only if `return_outcome` is `returned`.
            #
            #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::Returned, nil]
            optional :returned,
                     -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::Returned }

            # @!method initialize(expected_at:, merchant_resolution_attempted:, purchase_info_and_quality_issue:, received_at:, return_outcome:, not_returned: nil, ongoing_negotiations: nil, return_attempted: nil, returned: nil)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise}
            #   for more details.
            #
            #   Merchandise quality issue. Required if and only if `category` is
            #   `consumer_quality_merchandise`.
            #
            #   @param expected_at [Date] Expected at.
            #
            #   @param merchant_resolution_attempted [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::MerchantResolutionAttempted] Merchant resolution attempted.
            #
            #   @param purchase_info_and_quality_issue [String] Purchase information and quality issue.
            #
            #   @param received_at [Date] Received at.
            #
            #   @param return_outcome [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::ReturnOutcome] Return outcome.
            #
            #   @param not_returned [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::NotReturned] Not returned. Required if and only if `return_outcome` is `not_returned`.
            #
            #   @param ongoing_negotiations [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::OngoingNegotiations] Ongoing negotiations. Exclude if there is no evidence of ongoing negotiations.
            #
            #   @param return_attempted [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::ReturnAttempted] Return attempted. Required if and only if `return_outcome` is `return_attempted`
            #
            #   @param returned [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::Returned] Returned. Required if and only if `return_outcome` is `returned`.

            # Merchant resolution attempted.
            #
            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise#merchant_resolution_attempted
            module MerchantResolutionAttempted
              extend Increase::Internal::Type::Enum

              # Attempted.
              ATTEMPTED = :attempted

              # Prohibited by local law.
              PROHIBITED_BY_LOCAL_LAW = :prohibited_by_local_law

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # Return outcome.
            #
            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise#return_outcome
            module ReturnOutcome
              extend Increase::Internal::Type::Enum

              # Not returned.
              NOT_RETURNED = :not_returned

              # Returned.
              RETURNED = :returned

              # Return attempted.
              RETURN_ATTEMPTED = :return_attempted

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise#not_returned
            class NotReturned < Increase::Internal::Type::BaseModel
              # @!method initialize
              #   Not returned. Required if and only if `return_outcome` is `not_returned`.
            end

            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise#ongoing_negotiations
            class OngoingNegotiations < Increase::Internal::Type::BaseModel
              # @!attribute explanation
              #   Explanation of the previous ongoing negotiations between the cardholder and
              #   merchant.
              #
              #   @return [String]
              required :explanation, String

              # @!attribute issuer_first_notified_at
              #   Date the cardholder first notified the issuer of the dispute.
              #
              #   @return [Date]
              required :issuer_first_notified_at, Date

              # @!attribute started_at
              #   Started at.
              #
              #   @return [Date]
              required :started_at, Date

              # @!method initialize(explanation:, issuer_first_notified_at:, started_at:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::OngoingNegotiations}
              #   for more details.
              #
              #   Ongoing negotiations. Exclude if there is no evidence of ongoing negotiations.
              #
              #   @param explanation [String] Explanation of the previous ongoing negotiations between the cardholder and merc
              #
              #   @param issuer_first_notified_at [Date] Date the cardholder first notified the issuer of the dispute.
              #
              #   @param started_at [Date] Started at.
            end

            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise#return_attempted
            class ReturnAttempted < Increase::Internal::Type::BaseModel
              # @!attribute attempt_explanation
              #   Attempt explanation.
              #
              #   @return [String]
              required :attempt_explanation, String

              # @!attribute attempt_reason
              #   Attempt reason.
              #
              #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::ReturnAttempted::AttemptReason]
              required :attempt_reason,
                       enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::ReturnAttempted::AttemptReason }

              # @!attribute attempted_at
              #   Attempted at.
              #
              #   @return [Date]
              required :attempted_at, Date

              # @!attribute merchandise_disposition
              #   Merchandise disposition.
              #
              #   @return [String]
              required :merchandise_disposition, String

              # @!method initialize(attempt_explanation:, attempt_reason:, attempted_at:, merchandise_disposition:)
              #   Return attempted. Required if and only if `return_outcome` is
              #   `return_attempted`.
              #
              #   @param attempt_explanation [String] Attempt explanation.
              #
              #   @param attempt_reason [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::ReturnAttempted::AttemptReason] Attempt reason.
              #
              #   @param attempted_at [Date] Attempted at.
              #
              #   @param merchandise_disposition [String] Merchandise disposition.

              # Attempt reason.
              #
              # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::ReturnAttempted#attempt_reason
              module AttemptReason
                extend Increase::Internal::Type::Enum

                # Merchant not responding.
                MERCHANT_NOT_RESPONDING = :merchant_not_responding

                # No return authorization provided.
                NO_RETURN_AUTHORIZATION_PROVIDED = :no_return_authorization_provided

                # No return instructions.
                NO_RETURN_INSTRUCTIONS = :no_return_instructions

                # Requested not to return.
                REQUESTED_NOT_TO_RETURN = :requested_not_to_return

                # Return not accepted.
                RETURN_NOT_ACCEPTED = :return_not_accepted

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise#returned
            class Returned < Increase::Internal::Type::BaseModel
              # @!attribute return_method
              #   Return method.
              #
              #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::Returned::ReturnMethod]
              required :return_method,
                       enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::Returned::ReturnMethod }

              # @!attribute returned_at
              #   Returned at.
              #
              #   @return [Date]
              required :returned_at, Date

              # @!attribute merchant_received_return_at
              #   Merchant received return at.
              #
              #   @return [Date, nil]
              optional :merchant_received_return_at, Date

              # @!attribute other_explanation
              #   Other explanation. Required if and only if the return method is `other`.
              #
              #   @return [String, nil]
              optional :other_explanation, String

              # @!attribute tracking_number
              #   Tracking number.
              #
              #   @return [String, nil]
              optional :tracking_number, String

              # @!method initialize(return_method:, returned_at:, merchant_received_return_at: nil, other_explanation: nil, tracking_number: nil)
              #   Returned. Required if and only if `return_outcome` is `returned`.
              #
              #   @param return_method [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::Returned::ReturnMethod] Return method.
              #
              #   @param returned_at [Date] Returned at.
              #
              #   @param merchant_received_return_at [Date] Merchant received return at.
              #
              #   @param other_explanation [String] Other explanation. Required if and only if the return method is `other`.
              #
              #   @param tracking_number [String] Tracking number.

              # Return method.
              #
              # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::Returned#return_method
              module ReturnMethod
                extend Increase::Internal::Type::Enum

                # DHL.
                DHL = :dhl

                # Face-to-face.
                FACE_TO_FACE = :face_to_face

                # FedEx.
                FEDEX = :fedex

                # Other.
                OTHER = :other

                # Postal service.
                POSTAL_SERVICE = :postal_service

                # UPS.
                UPS = :ups

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end
          end

          # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback#consumer_quality_services
          class ConsumerQualityServices < Increase::Internal::Type::BaseModel
            # @!attribute cardholder_cancellation
            #   Cardholder cancellation.
            #
            #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::CardholderCancellation]
            required :cardholder_cancellation,
                     -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::CardholderCancellation }

            # @!attribute non_fiat_currency_or_non_fungible_token_related_and_not_matching_description
            #   Non-fiat currency or non-fungible token related and not matching description.
            #
            #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::NonFiatCurrencyOrNonFungibleTokenRelatedAndNotMatchingDescription]
            required :non_fiat_currency_or_non_fungible_token_related_and_not_matching_description,
                     enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::NonFiatCurrencyOrNonFungibleTokenRelatedAndNotMatchingDescription }

            # @!attribute purchase_info_and_quality_issue
            #   Purchase information and quality issue.
            #
            #   @return [String]
            required :purchase_info_and_quality_issue, String

            # @!attribute services_received_at
            #   Services received at.
            #
            #   @return [Date]
            required :services_received_at, Date

            # @!attribute cardholder_paid_to_have_work_redone
            #   Cardholder paid to have work redone.
            #
            #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::CardholderPaidToHaveWorkRedone, nil]
            optional :cardholder_paid_to_have_work_redone,
                     enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::CardholderPaidToHaveWorkRedone }

            # @!attribute ongoing_negotiations
            #   Ongoing negotiations. Exclude if there is no evidence of ongoing negotiations.
            #
            #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::OngoingNegotiations, nil]
            optional :ongoing_negotiations,
                     -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::OngoingNegotiations }

            # @!attribute restaurant_food_related
            #   Whether the dispute is related to the quality of food from an eating place or
            #   restaurant. Must be provided when Merchant Category Code (MCC) is 5812, 5813
            #   or 5814.
            #
            #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::RestaurantFoodRelated, nil]
            optional :restaurant_food_related,
                     enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::RestaurantFoodRelated }

            # @!method initialize(cardholder_cancellation:, non_fiat_currency_or_non_fungible_token_related_and_not_matching_description:, purchase_info_and_quality_issue:, services_received_at:, cardholder_paid_to_have_work_redone: nil, ongoing_negotiations: nil, restaurant_food_related: nil)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices}
            #   for more details.
            #
            #   Services quality issue. Required if and only if `category` is
            #   `consumer_quality_services`.
            #
            #   @param cardholder_cancellation [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::CardholderCancellation] Cardholder cancellation.
            #
            #   @param non_fiat_currency_or_non_fungible_token_related_and_not_matching_description [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::NonFiatCurrencyOrNonFungibleTokenRelatedAndNotMatchingDescription] Non-fiat currency or non-fungible token related and not matching description.
            #
            #   @param purchase_info_and_quality_issue [String] Purchase information and quality issue.
            #
            #   @param services_received_at [Date] Services received at.
            #
            #   @param cardholder_paid_to_have_work_redone [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::CardholderPaidToHaveWorkRedone] Cardholder paid to have work redone.
            #
            #   @param ongoing_negotiations [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::OngoingNegotiations] Ongoing negotiations. Exclude if there is no evidence of ongoing negotiations.
            #
            #   @param restaurant_food_related [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::RestaurantFoodRelated] Whether the dispute is related to the quality of food from an eating place or re

            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices#cardholder_cancellation
            class CardholderCancellation < Increase::Internal::Type::BaseModel
              # @!attribute accepted_by_merchant
              #   Accepted by merchant.
              #
              #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::CardholderCancellation::AcceptedByMerchant]
              required :accepted_by_merchant,
                       enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::CardholderCancellation::AcceptedByMerchant }

              # @!attribute canceled_at
              #   Canceled at.
              #
              #   @return [Date]
              required :canceled_at, Date

              # @!attribute reason
              #   Reason.
              #
              #   @return [String]
              required :reason, String

              # @!method initialize(accepted_by_merchant:, canceled_at:, reason:)
              #   Cardholder cancellation.
              #
              #   @param accepted_by_merchant [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::CardholderCancellation::AcceptedByMerchant] Accepted by merchant.
              #
              #   @param canceled_at [Date] Canceled at.
              #
              #   @param reason [String] Reason.

              # Accepted by merchant.
              #
              # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::CardholderCancellation#accepted_by_merchant
              module AcceptedByMerchant
                extend Increase::Internal::Type::Enum

                # Accepted.
                ACCEPTED = :accepted

                # Not accepted.
                NOT_ACCEPTED = :not_accepted

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # Non-fiat currency or non-fungible token related and not matching description.
            #
            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices#non_fiat_currency_or_non_fungible_token_related_and_not_matching_description
            module NonFiatCurrencyOrNonFungibleTokenRelatedAndNotMatchingDescription
              extend Increase::Internal::Type::Enum

              # Not related.
              NOT_RELATED = :not_related

              # Related.
              RELATED = :related

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # Cardholder paid to have work redone.
            #
            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices#cardholder_paid_to_have_work_redone
            module CardholderPaidToHaveWorkRedone
              extend Increase::Internal::Type::Enum

              # Cardholder did not pay to have work redone.
              DID_NOT_PAY_TO_HAVE_WORK_REDONE = :did_not_pay_to_have_work_redone

              # Cardholder paid to have work redone.
              PAID_TO_HAVE_WORK_REDONE = :paid_to_have_work_redone

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices#ongoing_negotiations
            class OngoingNegotiations < Increase::Internal::Type::BaseModel
              # @!attribute explanation
              #   Explanation of the previous ongoing negotiations between the cardholder and
              #   merchant.
              #
              #   @return [String]
              required :explanation, String

              # @!attribute issuer_first_notified_at
              #   Date the cardholder first notified the issuer of the dispute.
              #
              #   @return [Date]
              required :issuer_first_notified_at, Date

              # @!attribute started_at
              #   Started at.
              #
              #   @return [Date]
              required :started_at, Date

              # @!method initialize(explanation:, issuer_first_notified_at:, started_at:)
              #   Some parameter documentations has been truncated, see
              #   {Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::OngoingNegotiations}
              #   for more details.
              #
              #   Ongoing negotiations. Exclude if there is no evidence of ongoing negotiations.
              #
              #   @param explanation [String] Explanation of the previous ongoing negotiations between the cardholder and merc
              #
              #   @param issuer_first_notified_at [Date] Date the cardholder first notified the issuer of the dispute.
              #
              #   @param started_at [Date] Started at.
            end

            # Whether the dispute is related to the quality of food from an eating place or
            # restaurant. Must be provided when Merchant Category Code (MCC) is 5812, 5813
            # or 5814.
            #
            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices#restaurant_food_related
            module RestaurantFoodRelated
              extend Increase::Internal::Type::Enum

              # Not related.
              NOT_RELATED = :not_related

              # Related.
              RELATED = :related

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback#consumer_services_misrepresentation
          class ConsumerServicesMisrepresentation < Increase::Internal::Type::BaseModel
            # @!attribute cardholder_cancellation
            #   Cardholder cancellation.
            #
            #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesMisrepresentation::CardholderCancellation]
            required :cardholder_cancellation,
                     -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesMisrepresentation::CardholderCancellation }

            # @!attribute merchant_resolution_attempted
            #   Merchant resolution attempted.
            #
            #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesMisrepresentation::MerchantResolutionAttempted]
            required :merchant_resolution_attempted,
                     enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesMisrepresentation::MerchantResolutionAttempted }

            # @!attribute misrepresentation_explanation
            #   Misrepresentation explanation.
            #
            #   @return [String]
            required :misrepresentation_explanation, String

            # @!attribute purchase_explanation
            #   Purchase explanation.
            #
            #   @return [String]
            required :purchase_explanation, String

            # @!attribute received_at
            #   Received at.
            #
            #   @return [Date]
            required :received_at, Date

            # @!method initialize(cardholder_cancellation:, merchant_resolution_attempted:, misrepresentation_explanation:, purchase_explanation:, received_at:)
            #   Services misrepresentation. Required if and only if `category` is
            #   `consumer_services_misrepresentation`.
            #
            #   @param cardholder_cancellation [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesMisrepresentation::CardholderCancellation] Cardholder cancellation.
            #
            #   @param merchant_resolution_attempted [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesMisrepresentation::MerchantResolutionAttempted] Merchant resolution attempted.
            #
            #   @param misrepresentation_explanation [String] Misrepresentation explanation.
            #
            #   @param purchase_explanation [String] Purchase explanation.
            #
            #   @param received_at [Date] Received at.

            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesMisrepresentation#cardholder_cancellation
            class CardholderCancellation < Increase::Internal::Type::BaseModel
              # @!attribute accepted_by_merchant
              #   Accepted by merchant.
              #
              #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesMisrepresentation::CardholderCancellation::AcceptedByMerchant]
              required :accepted_by_merchant,
                       enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesMisrepresentation::CardholderCancellation::AcceptedByMerchant }

              # @!attribute canceled_at
              #   Canceled at.
              #
              #   @return [Date]
              required :canceled_at, Date

              # @!attribute reason
              #   Reason.
              #
              #   @return [String]
              required :reason, String

              # @!method initialize(accepted_by_merchant:, canceled_at:, reason:)
              #   Cardholder cancellation.
              #
              #   @param accepted_by_merchant [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesMisrepresentation::CardholderCancellation::AcceptedByMerchant] Accepted by merchant.
              #
              #   @param canceled_at [Date] Canceled at.
              #
              #   @param reason [String] Reason.

              # Accepted by merchant.
              #
              # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesMisrepresentation::CardholderCancellation#accepted_by_merchant
              module AcceptedByMerchant
                extend Increase::Internal::Type::Enum

                # Accepted.
                ACCEPTED = :accepted

                # Not accepted.
                NOT_ACCEPTED = :not_accepted

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # Merchant resolution attempted.
            #
            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesMisrepresentation#merchant_resolution_attempted
            module MerchantResolutionAttempted
              extend Increase::Internal::Type::Enum

              # Attempted.
              ATTEMPTED = :attempted

              # Prohibited by local law.
              PROHIBITED_BY_LOCAL_LAW = :prohibited_by_local_law

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback#consumer_services_not_as_described
          class ConsumerServicesNotAsDescribed < Increase::Internal::Type::BaseModel
            # @!attribute cardholder_cancellation
            #   Cardholder cancellation.
            #
            #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotAsDescribed::CardholderCancellation]
            required :cardholder_cancellation,
                     -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotAsDescribed::CardholderCancellation }

            # @!attribute merchant_resolution_attempted
            #   Merchant resolution attempted.
            #
            #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotAsDescribed::MerchantResolutionAttempted]
            required :merchant_resolution_attempted,
                     enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotAsDescribed::MerchantResolutionAttempted }

            # @!attribute received_at
            #   Received at.
            #
            #   @return [Date]
            required :received_at, Date

            # @!method initialize(cardholder_cancellation:, merchant_resolution_attempted:, received_at:)
            #   Services not as described. Required if and only if `category` is
            #   `consumer_services_not_as_described`.
            #
            #   @param cardholder_cancellation [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotAsDescribed::CardholderCancellation] Cardholder cancellation.
            #
            #   @param merchant_resolution_attempted [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotAsDescribed::MerchantResolutionAttempted] Merchant resolution attempted.
            #
            #   @param received_at [Date] Received at.

            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotAsDescribed#cardholder_cancellation
            class CardholderCancellation < Increase::Internal::Type::BaseModel
              # @!attribute accepted_by_merchant
              #   Accepted by merchant.
              #
              #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotAsDescribed::CardholderCancellation::AcceptedByMerchant]
              required :accepted_by_merchant,
                       enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotAsDescribed::CardholderCancellation::AcceptedByMerchant }

              # @!attribute canceled_at
              #   Canceled at.
              #
              #   @return [Date]
              required :canceled_at, Date

              # @!attribute reason
              #   Reason.
              #
              #   @return [String]
              required :reason, String

              # @!method initialize(accepted_by_merchant:, canceled_at:, reason:)
              #   Cardholder cancellation.
              #
              #   @param accepted_by_merchant [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotAsDescribed::CardholderCancellation::AcceptedByMerchant] Accepted by merchant.
              #
              #   @param canceled_at [Date] Canceled at.
              #
              #   @param reason [String] Reason.

              # Accepted by merchant.
              #
              # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotAsDescribed::CardholderCancellation#accepted_by_merchant
              module AcceptedByMerchant
                extend Increase::Internal::Type::Enum

                # Accepted.
                ACCEPTED = :accepted

                # Not accepted.
                NOT_ACCEPTED = :not_accepted

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end

            # Merchant resolution attempted.
            #
            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotAsDescribed#merchant_resolution_attempted
            module MerchantResolutionAttempted
              extend Increase::Internal::Type::Enum

              # Attempted.
              ATTEMPTED = :attempted

              # Prohibited by local law.
              PROHIBITED_BY_LOCAL_LAW = :prohibited_by_local_law

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback#consumer_services_not_received
          class ConsumerServicesNotReceived < Increase::Internal::Type::BaseModel
            # @!attribute cancellation_outcome
            #   Cancellation outcome.
            #
            #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::CancellationOutcome]
            required :cancellation_outcome,
                     enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::CancellationOutcome }

            # @!attribute last_expected_receipt_at
            #   Last expected receipt at.
            #
            #   @return [Date]
            required :last_expected_receipt_at, Date

            # @!attribute merchant_resolution_attempted
            #   Merchant resolution attempted.
            #
            #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::MerchantResolutionAttempted]
            required :merchant_resolution_attempted,
                     enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::MerchantResolutionAttempted }

            # @!attribute purchase_info_and_explanation
            #   Purchase information and explanation.
            #
            #   @return [String]
            required :purchase_info_and_explanation, String

            # @!attribute cardholder_cancellation_prior_to_expected_receipt
            #   Cardholder cancellation prior to expected receipt. Required if and only if
            #   `cancellation_outcome` is `cardholder_cancellation_prior_to_expected_receipt`.
            #
            #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::CardholderCancellationPriorToExpectedReceipt, nil]
            optional :cardholder_cancellation_prior_to_expected_receipt,
                     -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::CardholderCancellationPriorToExpectedReceipt }

            # @!attribute merchant_cancellation
            #   Merchant cancellation. Required if and only if `cancellation_outcome` is
            #   `merchant_cancellation`.
            #
            #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::MerchantCancellation, nil]
            optional :merchant_cancellation,
                     -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::MerchantCancellation }

            # @!attribute no_cancellation
            #   No cancellation. Required if and only if `cancellation_outcome` is
            #   `no_cancellation`.
            #
            #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::NoCancellation, nil]
            optional :no_cancellation,
                     -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::NoCancellation }

            # @!method initialize(cancellation_outcome:, last_expected_receipt_at:, merchant_resolution_attempted:, purchase_info_and_explanation:, cardholder_cancellation_prior_to_expected_receipt: nil, merchant_cancellation: nil, no_cancellation: nil)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived}
            #   for more details.
            #
            #   Services not received. Required if and only if `category` is
            #   `consumer_services_not_received`.
            #
            #   @param cancellation_outcome [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::CancellationOutcome] Cancellation outcome.
            #
            #   @param last_expected_receipt_at [Date] Last expected receipt at.
            #
            #   @param merchant_resolution_attempted [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::MerchantResolutionAttempted] Merchant resolution attempted.
            #
            #   @param purchase_info_and_explanation [String] Purchase information and explanation.
            #
            #   @param cardholder_cancellation_prior_to_expected_receipt [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::CardholderCancellationPriorToExpectedReceipt] Cardholder cancellation prior to expected receipt. Required if and only if `canc
            #
            #   @param merchant_cancellation [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::MerchantCancellation] Merchant cancellation. Required if and only if `cancellation_outcome` is `mercha
            #
            #   @param no_cancellation [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::NoCancellation] No cancellation. Required if and only if `cancellation_outcome` is `no_cancellat

            # Cancellation outcome.
            #
            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived#cancellation_outcome
            module CancellationOutcome
              extend Increase::Internal::Type::Enum

              # Cardholder cancellation prior to expected receipt.
              CARDHOLDER_CANCELLATION_PRIOR_TO_EXPECTED_RECEIPT = :cardholder_cancellation_prior_to_expected_receipt

              # Merchant cancellation.
              MERCHANT_CANCELLATION = :merchant_cancellation

              # No cancellation.
              NO_CANCELLATION = :no_cancellation

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # Merchant resolution attempted.
            #
            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived#merchant_resolution_attempted
            module MerchantResolutionAttempted
              extend Increase::Internal::Type::Enum

              # Attempted.
              ATTEMPTED = :attempted

              # Prohibited by local law.
              PROHIBITED_BY_LOCAL_LAW = :prohibited_by_local_law

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived#cardholder_cancellation_prior_to_expected_receipt
            class CardholderCancellationPriorToExpectedReceipt < Increase::Internal::Type::BaseModel
              # @!attribute canceled_at
              #   Canceled at.
              #
              #   @return [Date]
              required :canceled_at, Date

              # @!attribute reason
              #   Reason.
              #
              #   @return [String, nil]
              optional :reason, String

              # @!method initialize(canceled_at:, reason: nil)
              #   Cardholder cancellation prior to expected receipt. Required if and only if
              #   `cancellation_outcome` is `cardholder_cancellation_prior_to_expected_receipt`.
              #
              #   @param canceled_at [Date] Canceled at.
              #
              #   @param reason [String] Reason.
            end

            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived#merchant_cancellation
            class MerchantCancellation < Increase::Internal::Type::BaseModel
              # @!attribute canceled_at
              #   Canceled at.
              #
              #   @return [Date]
              required :canceled_at, Date

              # @!method initialize(canceled_at:)
              #   Merchant cancellation. Required if and only if `cancellation_outcome` is
              #   `merchant_cancellation`.
              #
              #   @param canceled_at [Date] Canceled at.
            end

            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived#no_cancellation
            class NoCancellation < Increase::Internal::Type::BaseModel
              # @!method initialize
              #   No cancellation. Required if and only if `cancellation_outcome` is
              #   `no_cancellation`.
            end
          end

          # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback#fraud
          class Fraud < Increase::Internal::Type::BaseModel
            # @!attribute fraud_type
            #   Fraud type.
            #
            #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Fraud::FraudType]
            required :fraud_type,
                     enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Fraud::FraudType }

            # @!method initialize(fraud_type:)
            #   Fraud. Required if and only if `category` is `fraud`.
            #
            #   @param fraud_type [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Fraud::FraudType] Fraud type.

            # Fraud type.
            #
            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Fraud#fraud_type
            module FraudType
              extend Increase::Internal::Type::Enum

              # Account or credentials takeover.
              ACCOUNT_OR_CREDENTIALS_TAKEOVER = :account_or_credentials_takeover

              # Card not received as issued.
              CARD_NOT_RECEIVED_AS_ISSUED = :card_not_received_as_issued

              # Fraudulent application.
              FRAUDULENT_APPLICATION = :fraudulent_application

              # Fraudulent use of account number.
              FRAUDULENT_USE_OF_ACCOUNT_NUMBER = :fraudulent_use_of_account_number

              # Incorrect processing.
              INCORRECT_PROCESSING = :incorrect_processing

              # Issuer reported counterfeit.
              ISSUER_REPORTED_COUNTERFEIT = :issuer_reported_counterfeit

              # Lost.
              LOST = :lost

              # Manipulation of account holder.
              MANIPULATION_OF_ACCOUNT_HOLDER = :manipulation_of_account_holder

              # Merchant misrepresentation.
              MERCHANT_MISREPRESENTATION = :merchant_misrepresentation

              # Miscellaneous.
              MISCELLANEOUS = :miscellaneous

              # Stolen.
              STOLEN = :stolen

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end

          # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback#processing_error
          class ProcessingError < Increase::Internal::Type::BaseModel
            # @!attribute error_reason
            #   Error reason.
            #
            #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::ErrorReason]
            required :error_reason,
                     enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::ErrorReason }

            # @!attribute merchant_resolution_attempted
            #   Merchant resolution attempted.
            #
            #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::MerchantResolutionAttempted]
            required :merchant_resolution_attempted,
                     enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::MerchantResolutionAttempted }

            # @!attribute duplicate_transaction
            #   Duplicate transaction. Required if and only if `error_reason` is
            #   `duplicate_transaction`.
            #
            #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::DuplicateTransaction, nil]
            optional :duplicate_transaction,
                     -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::DuplicateTransaction }

            # @!attribute incorrect_amount
            #   Incorrect amount. Required if and only if `error_reason` is `incorrect_amount`.
            #
            #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::IncorrectAmount, nil]
            optional :incorrect_amount,
                     -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::IncorrectAmount }

            # @!attribute paid_by_other_means
            #   Paid by other means. Required if and only if `error_reason` is
            #   `paid_by_other_means`.
            #
            #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::PaidByOtherMeans, nil]
            optional :paid_by_other_means,
                     -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::PaidByOtherMeans }

            # @!method initialize(error_reason:, merchant_resolution_attempted:, duplicate_transaction: nil, incorrect_amount: nil, paid_by_other_means: nil)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError}
            #   for more details.
            #
            #   Processing error. Required if and only if `category` is `processing_error`.
            #
            #   @param error_reason [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::ErrorReason] Error reason.
            #
            #   @param merchant_resolution_attempted [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::MerchantResolutionAttempted] Merchant resolution attempted.
            #
            #   @param duplicate_transaction [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::DuplicateTransaction] Duplicate transaction. Required if and only if `error_reason` is `duplicate_tran
            #
            #   @param incorrect_amount [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::IncorrectAmount] Incorrect amount. Required if and only if `error_reason` is `incorrect_amount`.
            #
            #   @param paid_by_other_means [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::PaidByOtherMeans] Paid by other means. Required if and only if `error_reason` is `paid_by_other_me

            # Error reason.
            #
            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError#error_reason
            module ErrorReason
              extend Increase::Internal::Type::Enum

              # Duplicate transaction.
              DUPLICATE_TRANSACTION = :duplicate_transaction

              # Incorrect amount.
              INCORRECT_AMOUNT = :incorrect_amount

              # Paid by other means.
              PAID_BY_OTHER_MEANS = :paid_by_other_means

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # Merchant resolution attempted.
            #
            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError#merchant_resolution_attempted
            module MerchantResolutionAttempted
              extend Increase::Internal::Type::Enum

              # Attempted.
              ATTEMPTED = :attempted

              # Prohibited by local law.
              PROHIBITED_BY_LOCAL_LAW = :prohibited_by_local_law

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError#duplicate_transaction
            class DuplicateTransaction < Increase::Internal::Type::BaseModel
              # @!attribute other_transaction_id
              #   Other transaction ID.
              #
              #   @return [String]
              required :other_transaction_id, String

              # @!method initialize(other_transaction_id:)
              #   Duplicate transaction. Required if and only if `error_reason` is
              #   `duplicate_transaction`.
              #
              #   @param other_transaction_id [String] Other transaction ID.
            end

            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError#incorrect_amount
            class IncorrectAmount < Increase::Internal::Type::BaseModel
              # @!attribute expected_amount
              #   Expected amount.
              #
              #   @return [Integer]
              required :expected_amount, Integer

              # @!method initialize(expected_amount:)
              #   Incorrect amount. Required if and only if `error_reason` is `incorrect_amount`.
              #
              #   @param expected_amount [Integer] Expected amount.
            end

            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError#paid_by_other_means
            class PaidByOtherMeans < Increase::Internal::Type::BaseModel
              # @!attribute other_form_of_payment_evidence
              #   Other form of payment evidence.
              #
              #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence]
              required :other_form_of_payment_evidence,
                       enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence }

              # @!attribute other_transaction_id
              #   Other transaction ID.
              #
              #   @return [String, nil]
              optional :other_transaction_id, String

              # @!method initialize(other_form_of_payment_evidence:, other_transaction_id: nil)
              #   Paid by other means. Required if and only if `error_reason` is
              #   `paid_by_other_means`.
              #
              #   @param other_form_of_payment_evidence [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence] Other form of payment evidence.
              #
              #   @param other_transaction_id [String] Other transaction ID.

              # Other form of payment evidence.
              #
              # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::PaidByOtherMeans#other_form_of_payment_evidence
              module OtherFormOfPaymentEvidence
                extend Increase::Internal::Type::Enum

                # Canceled check.
                CANCELED_CHECK = :canceled_check

                # Card transaction.
                CARD_TRANSACTION = :card_transaction

                # Cash receipt.
                CASH_RECEIPT = :cash_receipt

                # Other.
                OTHER = :other

                # Statement.
                STATEMENT = :statement

                # Voucher.
                VOUCHER = :voucher

                # @!method self.values
                #   @return [Array<Symbol>]
              end
            end
          end
        end

        # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa#merchant_prearbitration_decline
        class MerchantPrearbitrationDecline < Increase::Internal::Type::BaseModel
          # @!attribute reason
          #   The reason for declining the merchant's pre-arbitration request.
          #
          #   @return [String]
          required :reason, String

          # @!method initialize(reason:)
          #   The merchant pre-arbitration decline details for the user submission. Required
          #   if and only if `category` is `merchant_prearbitration_decline`.
          #
          #   @param reason [String] The reason for declining the merchant's pre-arbitration request.
        end

        # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa#user_prearbitration
        class UserPrearbitration < Increase::Internal::Type::BaseModel
          # @!attribute reason
          #   The reason for the pre-arbitration request.
          #
          #   @return [String]
          required :reason, String

          # @!attribute category_change
          #   Category change details for the pre-arbitration request. Should only be
          #   populated if the category of the dispute is being changed as part of the
          #   pre-arbitration request.
          #
          #   @return [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration::CategoryChange, nil]
          optional :category_change,
                   -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration::CategoryChange }

          # @!method initialize(reason:, category_change: nil)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration}
          #   for more details.
          #
          #   The user pre-arbitration details for the user submission. Required if and only
          #   if `category` is `user_prearbitration`.
          #
          #   @param reason [String] The reason for the pre-arbitration request.
          #
          #   @param category_change [Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration::CategoryChange] Category change details for the pre-arbitration request. Should only be populate

          # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration#category_change
          class CategoryChange < Increase::Internal::Type::BaseModel
            # @!attribute category
            #
            #   @return [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration::CategoryChange::Category]
            required :category,
                     enum: -> { Increase::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration::CategoryChange::Category }

            # @!attribute reason
            #   The reason for the category change.
            #
            #   @return [String]
            required :reason, String

            # @!method initialize(category:, reason:)
            #   Category change details for the pre-arbitration request. Should only be
            #   populated if the category of the dispute is being changed as part of the
            #   pre-arbitration request.
            #
            #   @param category [Symbol, Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration::CategoryChange::Category]
            #
            #   @param reason [String] The reason for the category change.

            # @see Increase::Models::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration::CategoryChange#category
            module Category
              extend Increase::Internal::Type::Enum

              # Authorization.
              AUTHORIZATION = :authorization

              # Consumer: canceled merchandise.
              CONSUMER_CANCELED_MERCHANDISE = :consumer_canceled_merchandise

              # Consumer: canceled recurring transaction.
              CONSUMER_CANCELED_RECURRING_TRANSACTION = :consumer_canceled_recurring_transaction

              # Consumer: canceled services.
              CONSUMER_CANCELED_SERVICES = :consumer_canceled_services

              # Consumer: counterfeit merchandise.
              CONSUMER_COUNTERFEIT_MERCHANDISE = :consumer_counterfeit_merchandise

              # Consumer: credit not processed.
              CONSUMER_CREDIT_NOT_PROCESSED = :consumer_credit_not_processed

              # Consumer: damaged or defective merchandise.
              CONSUMER_DAMAGED_OR_DEFECTIVE_MERCHANDISE = :consumer_damaged_or_defective_merchandise

              # Consumer: merchandise misrepresentation.
              CONSUMER_MERCHANDISE_MISREPRESENTATION = :consumer_merchandise_misrepresentation

              # Consumer: merchandise not as described.
              CONSUMER_MERCHANDISE_NOT_AS_DESCRIBED = :consumer_merchandise_not_as_described

              # Consumer: merchandise not received.
              CONSUMER_MERCHANDISE_NOT_RECEIVED = :consumer_merchandise_not_received

              # Consumer: non-receipt of cash.
              CONSUMER_NON_RECEIPT_OF_CASH = :consumer_non_receipt_of_cash

              # Consumer: Original Credit Transaction (OCT) not accepted.
              CONSUMER_ORIGINAL_CREDIT_TRANSACTION_NOT_ACCEPTED = :consumer_original_credit_transaction_not_accepted

              # Consumer: merchandise quality issue.
              CONSUMER_QUALITY_MERCHANDISE = :consumer_quality_merchandise

              # Consumer: services quality issue.
              CONSUMER_QUALITY_SERVICES = :consumer_quality_services

              # Consumer: services misrepresentation.
              CONSUMER_SERVICES_MISREPRESENTATION = :consumer_services_misrepresentation

              # Consumer: services not as described.
              CONSUMER_SERVICES_NOT_AS_DESCRIBED = :consumer_services_not_as_described

              # Consumer: services not received.
              CONSUMER_SERVICES_NOT_RECEIVED = :consumer_services_not_received

              # Fraud.
              FRAUD = :fraud

              # Processing error.
              PROCESSING_ERROR = :processing_error

              # @!method self.values
              #   @return [Array<Symbol>]
            end
          end
        end
      end
    end
  end
end
