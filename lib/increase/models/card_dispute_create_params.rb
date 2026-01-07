# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CardDisputes#create
    class CardDisputeCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute disputed_transaction_id
      #   The Transaction you wish to dispute. This Transaction must have a `source_type`
      #   of `card_settlement`.
      #
      #   @return [String]
      required :disputed_transaction_id, String

      # @!attribute network
      #   The network of the disputed transaction. Details specific to the network are
      #   required under the sub-object with the same identifier as the network.
      #
      #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Network]
      required :network, enum: -> { Increase::CardDisputeCreateParams::Network }

      # @!attribute amount
      #   The monetary amount of the part of the transaction that is being disputed. This
      #   is optional and will default to the full amount of the transaction if not
      #   provided. If provided, the amount must be less than or equal to the amount of
      #   the transaction.
      #
      #   @return [Integer, nil]
      optional :amount, Integer

      # @!attribute attachment_files
      #   The files to be attached to the initial dispute submission.
      #
      #   @return [Array<Increase::Models::CardDisputeCreateParams::AttachmentFile>, nil]
      optional :attachment_files,
               -> { Increase::Internal::Type::ArrayOf[Increase::CardDisputeCreateParams::AttachmentFile] }

      # @!attribute explanation
      #   The free-form explanation provided to Increase to provide more context for the
      #   user submission. This field is not sent directly to the card networks.
      #
      #   @return [String, nil]
      optional :explanation, String

      # @!attribute visa
      #   The Visa-specific parameters for the dispute. Required if and only if `network`
      #   is `visa`.
      #
      #   @return [Increase::Models::CardDisputeCreateParams::Visa, nil]
      optional :visa, -> { Increase::CardDisputeCreateParams::Visa }

      # @!method initialize(disputed_transaction_id:, network:, amount: nil, attachment_files: nil, explanation: nil, visa: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::CardDisputeCreateParams} for more details.
      #
      #   @param disputed_transaction_id [String] The Transaction you wish to dispute. This Transaction must have a `source_type`
      #
      #   @param network [Symbol, Increase::Models::CardDisputeCreateParams::Network] The network of the disputed transaction. Details specific to the network are req
      #
      #   @param amount [Integer] The monetary amount of the part of the transaction that is being disputed. This
      #
      #   @param attachment_files [Array<Increase::Models::CardDisputeCreateParams::AttachmentFile>] The files to be attached to the initial dispute submission.
      #
      #   @param explanation [String] The free-form explanation provided to Increase to provide more context for the u
      #
      #   @param visa [Increase::Models::CardDisputeCreateParams::Visa] The Visa-specific parameters for the dispute. Required if and only if `network`
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      # The network of the disputed transaction. Details specific to the network are
      # required under the sub-object with the same identifier as the network.
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
        #   {Increase::Models::CardDisputeCreateParams::AttachmentFile} for more details.
        #
        #   @param file_id [String] The ID of the file to be attached. The file must have a `purpose` of `card_dispu
      end

      class Visa < Increase::Internal::Type::BaseModel
        # @!attribute category
        #   Category.
        #
        #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::Category]
        required :category, enum: -> { Increase::CardDisputeCreateParams::Visa::Category }

        # @!attribute authorization
        #   Authorization. Required if and only if `category` is `authorization`.
        #
        #   @return [Increase::Models::CardDisputeCreateParams::Visa::Authorization, nil]
        optional :authorization, -> { Increase::CardDisputeCreateParams::Visa::Authorization }

        # @!attribute consumer_canceled_merchandise
        #   Canceled merchandise. Required if and only if `category` is
        #   `consumer_canceled_merchandise`.
        #
        #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise, nil]
        optional :consumer_canceled_merchandise,
                 -> { Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise }

        # @!attribute consumer_canceled_recurring_transaction
        #   Canceled recurring transaction. Required if and only if `category` is
        #   `consumer_canceled_recurring_transaction`.
        #
        #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledRecurringTransaction, nil]
        optional :consumer_canceled_recurring_transaction,
                 -> { Increase::CardDisputeCreateParams::Visa::ConsumerCanceledRecurringTransaction }

        # @!attribute consumer_canceled_services
        #   Canceled services. Required if and only if `category` is
        #   `consumer_canceled_services`.
        #
        #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledServices, nil]
        optional :consumer_canceled_services,
                 -> { Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices }

        # @!attribute consumer_counterfeit_merchandise
        #   Counterfeit merchandise. Required if and only if `category` is
        #   `consumer_counterfeit_merchandise`.
        #
        #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerCounterfeitMerchandise, nil]
        optional :consumer_counterfeit_merchandise,
                 -> { Increase::CardDisputeCreateParams::Visa::ConsumerCounterfeitMerchandise }

        # @!attribute consumer_credit_not_processed
        #   Credit not processed. Required if and only if `category` is
        #   `consumer_credit_not_processed`.
        #
        #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerCreditNotProcessed, nil]
        optional :consumer_credit_not_processed,
                 -> { Increase::CardDisputeCreateParams::Visa::ConsumerCreditNotProcessed }

        # @!attribute consumer_damaged_or_defective_merchandise
        #   Damaged or defective merchandise. Required if and only if `category` is
        #   `consumer_damaged_or_defective_merchandise`.
        #
        #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise, nil]
        optional :consumer_damaged_or_defective_merchandise,
                 -> { Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise }

        # @!attribute consumer_merchandise_misrepresentation
        #   Merchandise misrepresentation. Required if and only if `category` is
        #   `consumer_merchandise_misrepresentation`.
        #
        #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation, nil]
        optional :consumer_merchandise_misrepresentation,
                 -> { Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation }

        # @!attribute consumer_merchandise_not_as_described
        #   Merchandise not as described. Required if and only if `category` is
        #   `consumer_merchandise_not_as_described`.
        #
        #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed, nil]
        optional :consumer_merchandise_not_as_described,
                 -> { Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed }

        # @!attribute consumer_merchandise_not_received
        #   Merchandise not received. Required if and only if `category` is
        #   `consumer_merchandise_not_received`.
        #
        #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived, nil]
        optional :consumer_merchandise_not_received,
                 -> { Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived }

        # @!attribute consumer_non_receipt_of_cash
        #   Non-receipt of cash. Required if and only if `category` is
        #   `consumer_non_receipt_of_cash`.
        #
        #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerNonReceiptOfCash, nil]
        optional :consumer_non_receipt_of_cash,
                 -> { Increase::CardDisputeCreateParams::Visa::ConsumerNonReceiptOfCash }

        # @!attribute consumer_original_credit_transaction_not_accepted
        #   Original Credit Transaction (OCT) not accepted. Required if and only if
        #   `category` is `consumer_original_credit_transaction_not_accepted`.
        #
        #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerOriginalCreditTransactionNotAccepted, nil]
        optional :consumer_original_credit_transaction_not_accepted,
                 -> { Increase::CardDisputeCreateParams::Visa::ConsumerOriginalCreditTransactionNotAccepted }

        # @!attribute consumer_quality_merchandise
        #   Merchandise quality issue. Required if and only if `category` is
        #   `consumer_quality_merchandise`.
        #
        #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise, nil]
        optional :consumer_quality_merchandise,
                 -> { Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise }

        # @!attribute consumer_quality_services
        #   Services quality issue. Required if and only if `category` is
        #   `consumer_quality_services`.
        #
        #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityServices, nil]
        optional :consumer_quality_services,
                 -> { Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices }

        # @!attribute consumer_services_misrepresentation
        #   Services misrepresentation. Required if and only if `category` is
        #   `consumer_services_misrepresentation`.
        #
        #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesMisrepresentation, nil]
        optional :consumer_services_misrepresentation,
                 -> { Increase::CardDisputeCreateParams::Visa::ConsumerServicesMisrepresentation }

        # @!attribute consumer_services_not_as_described
        #   Services not as described. Required if and only if `category` is
        #   `consumer_services_not_as_described`.
        #
        #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesNotAsDescribed, nil]
        optional :consumer_services_not_as_described,
                 -> { Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotAsDescribed }

        # @!attribute consumer_services_not_received
        #   Services not received. Required if and only if `category` is
        #   `consumer_services_not_received`.
        #
        #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived, nil]
        optional :consumer_services_not_received,
                 -> { Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived }

        # @!attribute fraud
        #   Fraud. Required if and only if `category` is `fraud`.
        #
        #   @return [Increase::Models::CardDisputeCreateParams::Visa::Fraud, nil]
        optional :fraud, -> { Increase::CardDisputeCreateParams::Visa::Fraud }

        # @!attribute processing_error
        #   Processing error. Required if and only if `category` is `processing_error`.
        #
        #   @return [Increase::Models::CardDisputeCreateParams::Visa::ProcessingError, nil]
        optional :processing_error, -> { Increase::CardDisputeCreateParams::Visa::ProcessingError }

        # @!method initialize(category:, authorization: nil, consumer_canceled_merchandise: nil, consumer_canceled_recurring_transaction: nil, consumer_canceled_services: nil, consumer_counterfeit_merchandise: nil, consumer_credit_not_processed: nil, consumer_damaged_or_defective_merchandise: nil, consumer_merchandise_misrepresentation: nil, consumer_merchandise_not_as_described: nil, consumer_merchandise_not_received: nil, consumer_non_receipt_of_cash: nil, consumer_original_credit_transaction_not_accepted: nil, consumer_quality_merchandise: nil, consumer_quality_services: nil, consumer_services_misrepresentation: nil, consumer_services_not_as_described: nil, consumer_services_not_received: nil, fraud: nil, processing_error: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::CardDisputeCreateParams::Visa} for more details.
        #
        #   The Visa-specific parameters for the dispute. Required if and only if `network`
        #   is `visa`.
        #
        #   @param category [Symbol, Increase::Models::CardDisputeCreateParams::Visa::Category] Category.
        #
        #   @param authorization [Increase::Models::CardDisputeCreateParams::Visa::Authorization] Authorization. Required if and only if `category` is `authorization`.
        #
        #   @param consumer_canceled_merchandise [Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise] Canceled merchandise. Required if and only if `category` is `consumer_canceled_m
        #
        #   @param consumer_canceled_recurring_transaction [Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledRecurringTransaction] Canceled recurring transaction. Required if and only if `category` is
        #   `consumer\_
        #
        #   @param consumer_canceled_services [Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledServices] Canceled services. Required if and only if `category` is `consumer_canceled_serv
        #
        #   @param consumer_counterfeit_merchandise [Increase::Models::CardDisputeCreateParams::Visa::ConsumerCounterfeitMerchandise] Counterfeit merchandise. Required if and only if `category` is `consumer_counter
        #
        #   @param consumer_credit_not_processed [Increase::Models::CardDisputeCreateParams::Visa::ConsumerCreditNotProcessed] Credit not processed. Required if and only if `category` is `consumer_credit_not
        #
        #   @param consumer_damaged_or_defective_merchandise [Increase::Models::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise] Damaged or defective merchandise. Required if and only if `category` is `consume
        #
        #   @param consumer_merchandise_misrepresentation [Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation] Merchandise misrepresentation. Required if and only if `category` is `consumer_m
        #
        #   @param consumer_merchandise_not_as_described [Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed] Merchandise not as described. Required if and only if `category` is `consumer_me
        #
        #   @param consumer_merchandise_not_received [Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived] Merchandise not received. Required if and only if `category` is `consumer_mercha
        #
        #   @param consumer_non_receipt_of_cash [Increase::Models::CardDisputeCreateParams::Visa::ConsumerNonReceiptOfCash] Non-receipt of cash. Required if and only if `category` is `consumer_non_receipt
        #
        #   @param consumer_original_credit_transaction_not_accepted [Increase::Models::CardDisputeCreateParams::Visa::ConsumerOriginalCreditTransactionNotAccepted] Original Credit Transaction (OCT) not accepted. Required if and only if `categor
        #
        #   @param consumer_quality_merchandise [Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise] Merchandise quality issue. Required if and only if `category` is `consumer_quali
        #
        #   @param consumer_quality_services [Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityServices] Services quality issue. Required if and only if `category` is `consumer*quality*
        #
        #   @param consumer_services_misrepresentation [Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesMisrepresentation] Services misrepresentation. Required if and only if `category` is `consumer_serv
        #
        #   @param consumer_services_not_as_described [Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesNotAsDescribed] Services not as described. Required if and only if `category` is `consumer_servi
        #
        #   @param consumer_services_not_received [Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived] Services not received. Required if and only if `category` is `consumer*services*
        #
        #   @param fraud [Increase::Models::CardDisputeCreateParams::Visa::Fraud] Fraud. Required if and only if `category` is `fraud`.
        #
        #   @param processing_error [Increase::Models::CardDisputeCreateParams::Visa::ProcessingError] Processing error. Required if and only if `category` is `processing_error`.

        # Category.
        #
        # @see Increase::Models::CardDisputeCreateParams::Visa#category
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

        # @see Increase::Models::CardDisputeCreateParams::Visa#authorization
        class Authorization < Increase::Internal::Type::BaseModel
          # @!attribute account_status
          #   Account status.
          #
          #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::Authorization::AccountStatus]
          required :account_status,
                   enum: -> { Increase::CardDisputeCreateParams::Visa::Authorization::AccountStatus }

          # @!method initialize(account_status:)
          #   Authorization. Required if and only if `category` is `authorization`.
          #
          #   @param account_status [Symbol, Increase::Models::CardDisputeCreateParams::Visa::Authorization::AccountStatus] Account status.

          # Account status.
          #
          # @see Increase::Models::CardDisputeCreateParams::Visa::Authorization#account_status
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

        # @see Increase::Models::CardDisputeCreateParams::Visa#consumer_canceled_merchandise
        class ConsumerCanceledMerchandise < Increase::Internal::Type::BaseModel
          # @!attribute merchant_resolution_attempted
          #   Merchant resolution attempted.
          #
          #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::MerchantResolutionAttempted]
          required :merchant_resolution_attempted,
                   enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::MerchantResolutionAttempted }

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
          #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::ReturnOutcome]
          required :return_outcome,
                   enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::ReturnOutcome }

          # @!attribute cardholder_cancellation
          #   Cardholder cancellation.
          #
          #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::CardholderCancellation, nil]
          optional :cardholder_cancellation,
                   -> { Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::CardholderCancellation }

          # @!attribute not_returned
          #   Not returned. Required if and only if `return_outcome` is `not_returned`.
          #
          #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::NotReturned, nil]
          optional :not_returned,
                   -> { Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::NotReturned }

          # @!attribute return_attempted
          #   Return attempted. Required if and only if `return_outcome` is
          #   `return_attempted`.
          #
          #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::ReturnAttempted, nil]
          optional :return_attempted,
                   -> { Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::ReturnAttempted }

          # @!attribute returned
          #   Returned. Required if and only if `return_outcome` is `returned`.
          #
          #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::Returned, nil]
          optional :returned, -> { Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::Returned }

          # @!method initialize(merchant_resolution_attempted:, purchase_explanation:, received_or_expected_at:, return_outcome:, cardholder_cancellation: nil, not_returned: nil, return_attempted: nil, returned: nil)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise}
          #   for more details.
          #
          #   Canceled merchandise. Required if and only if `category` is
          #   `consumer_canceled_merchandise`.
          #
          #   @param merchant_resolution_attempted [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::MerchantResolutionAttempted] Merchant resolution attempted.
          #
          #   @param purchase_explanation [String] Purchase explanation.
          #
          #   @param received_or_expected_at [Date] Received or expected at.
          #
          #   @param return_outcome [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::ReturnOutcome] Return outcome.
          #
          #   @param cardholder_cancellation [Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::CardholderCancellation] Cardholder cancellation.
          #
          #   @param not_returned [Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::NotReturned] Not returned. Required if and only if `return_outcome` is `not_returned`.
          #
          #   @param return_attempted [Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::ReturnAttempted] Return attempted. Required if and only if `return_outcome` is `return_attempted`
          #
          #   @param returned [Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::Returned] Returned. Required if and only if `return_outcome` is `returned`.

          # Merchant resolution attempted.
          #
          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise#merchant_resolution_attempted
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
          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise#return_outcome
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

          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise#cardholder_cancellation
          class CardholderCancellation < Increase::Internal::Type::BaseModel
            # @!attribute canceled_at
            #   Canceled at.
            #
            #   @return [Date]
            required :canceled_at, Date

            # @!attribute canceled_prior_to_ship_date
            #   Canceled prior to ship date.
            #
            #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::CardholderCancellation::CanceledPriorToShipDate]
            required :canceled_prior_to_ship_date,
                     enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::CardholderCancellation::CanceledPriorToShipDate }

            # @!attribute cancellation_policy_provided
            #   Cancellation policy provided.
            #
            #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::CardholderCancellation::CancellationPolicyProvided]
            required :cancellation_policy_provided,
                     enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::CardholderCancellation::CancellationPolicyProvided }

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
            #   @param canceled_prior_to_ship_date [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::CardholderCancellation::CanceledPriorToShipDate] Canceled prior to ship date.
            #
            #   @param cancellation_policy_provided [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::CardholderCancellation::CancellationPolicyProvided] Cancellation policy provided.
            #
            #   @param reason [String] Reason.

            # Canceled prior to ship date.
            #
            # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::CardholderCancellation#canceled_prior_to_ship_date
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
            # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::CardholderCancellation#cancellation_policy_provided
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

          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise#not_returned
          class NotReturned < Increase::Internal::Type::BaseModel
            # @!method initialize
            #   Not returned. Required if and only if `return_outcome` is `not_returned`.
          end

          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise#return_attempted
          class ReturnAttempted < Increase::Internal::Type::BaseModel
            # @!attribute attempt_explanation
            #   Attempt explanation.
            #
            #   @return [String]
            required :attempt_explanation, String

            # @!attribute attempt_reason
            #   Attempt reason.
            #
            #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::ReturnAttempted::AttemptReason]
            required :attempt_reason,
                     enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::ReturnAttempted::AttemptReason }

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
            #   @param attempt_reason [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::ReturnAttempted::AttemptReason] Attempt reason.
            #
            #   @param attempted_at [Date] Attempted at.
            #
            #   @param merchandise_disposition [String] Merchandise disposition.

            # Attempt reason.
            #
            # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::ReturnAttempted#attempt_reason
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

          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise#returned
          class Returned < Increase::Internal::Type::BaseModel
            # @!attribute return_method
            #   Return method.
            #
            #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::Returned::ReturnMethod]
            required :return_method,
                     enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::Returned::ReturnMethod }

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
            #   @param return_method [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::Returned::ReturnMethod] Return method.
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
            # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::Returned#return_method
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

        # @see Increase::Models::CardDisputeCreateParams::Visa#consumer_canceled_recurring_transaction
        class ConsumerCanceledRecurringTransaction < Increase::Internal::Type::BaseModel
          # @!attribute cancellation_target
          #   Cancellation target.
          #
          #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledRecurringTransaction::CancellationTarget]
          required :cancellation_target,
                   enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerCanceledRecurringTransaction::CancellationTarget }

          # @!attribute merchant_contact_methods
          #   Merchant contact methods.
          #
          #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledRecurringTransaction::MerchantContactMethods]
          required :merchant_contact_methods,
                   -> { Increase::CardDisputeCreateParams::Visa::ConsumerCanceledRecurringTransaction::MerchantContactMethods }

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
          #   @param cancellation_target [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledRecurringTransaction::CancellationTarget] Cancellation target.
          #
          #   @param merchant_contact_methods [Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledRecurringTransaction::MerchantContactMethods] Merchant contact methods.
          #
          #   @param transaction_or_account_canceled_at [Date] Transaction or account canceled at.
          #
          #   @param other_form_of_payment_explanation [String] Other form of payment explanation.

          # Cancellation target.
          #
          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledRecurringTransaction#cancellation_target
          module CancellationTarget
            extend Increase::Internal::Type::Enum

            # Account.
            ACCOUNT = :account

            # Transaction.
            TRANSACTION = :transaction

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledRecurringTransaction#merchant_contact_methods
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

        # @see Increase::Models::CardDisputeCreateParams::Visa#consumer_canceled_services
        class ConsumerCanceledServices < Increase::Internal::Type::BaseModel
          # @!attribute cardholder_cancellation
          #   Cardholder cancellation.
          #
          #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledServices::CardholderCancellation]
          required :cardholder_cancellation,
                   -> { Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::CardholderCancellation }

          # @!attribute contracted_at
          #   Contracted at.
          #
          #   @return [Date]
          required :contracted_at, Date

          # @!attribute merchant_resolution_attempted
          #   Merchant resolution attempted.
          #
          #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledServices::MerchantResolutionAttempted]
          required :merchant_resolution_attempted,
                   enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::MerchantResolutionAttempted }

          # @!attribute purchase_explanation
          #   Purchase explanation.
          #
          #   @return [String]
          required :purchase_explanation, String

          # @!attribute service_type
          #   Service type.
          #
          #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledServices::ServiceType]
          required :service_type,
                   enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::ServiceType }

          # @!attribute guaranteed_reservation
          #   Guaranteed reservation explanation. Required if and only if `service_type` is
          #   `guaranteed_reservation`.
          #
          #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledServices::GuaranteedReservation, nil]
          optional :guaranteed_reservation,
                   -> { Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::GuaranteedReservation }

          # @!attribute other
          #   Other service type explanation. Required if and only if `service_type` is
          #   `other`.
          #
          #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledServices::Other, nil]
          optional :other, -> { Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::Other }

          # @!attribute timeshare
          #   Timeshare explanation. Required if and only if `service_type` is `timeshare`.
          #
          #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledServices::Timeshare, nil]
          optional :timeshare, -> { Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::Timeshare }

          # @!method initialize(cardholder_cancellation:, contracted_at:, merchant_resolution_attempted:, purchase_explanation:, service_type:, guaranteed_reservation: nil, other: nil, timeshare: nil)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledServices} for
          #   more details.
          #
          #   Canceled services. Required if and only if `category` is
          #   `consumer_canceled_services`.
          #
          #   @param cardholder_cancellation [Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledServices::CardholderCancellation] Cardholder cancellation.
          #
          #   @param contracted_at [Date] Contracted at.
          #
          #   @param merchant_resolution_attempted [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledServices::MerchantResolutionAttempted] Merchant resolution attempted.
          #
          #   @param purchase_explanation [String] Purchase explanation.
          #
          #   @param service_type [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledServices::ServiceType] Service type.
          #
          #   @param guaranteed_reservation [Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledServices::GuaranteedReservation] Guaranteed reservation explanation. Required if and only if `service_type` is `g
          #
          #   @param other [Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledServices::Other] Other service type explanation. Required if and only if `service_type` is `other
          #
          #   @param timeshare [Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledServices::Timeshare] Timeshare explanation. Required if and only if `service_type` is `timeshare`.

          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledServices#cardholder_cancellation
          class CardholderCancellation < Increase::Internal::Type::BaseModel
            # @!attribute canceled_at
            #   Canceled at.
            #
            #   @return [Date]
            required :canceled_at, Date

            # @!attribute cancellation_policy_provided
            #   Cancellation policy provided.
            #
            #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledServices::CardholderCancellation::CancellationPolicyProvided]
            required :cancellation_policy_provided,
                     enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::CardholderCancellation::CancellationPolicyProvided }

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
            #   @param cancellation_policy_provided [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledServices::CardholderCancellation::CancellationPolicyProvided] Cancellation policy provided.
            #
            #   @param reason [String] Reason.

            # Cancellation policy provided.
            #
            # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledServices::CardholderCancellation#cancellation_policy_provided
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
          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledServices#merchant_resolution_attempted
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
          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledServices#service_type
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

          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledServices#guaranteed_reservation
          class GuaranteedReservation < Increase::Internal::Type::BaseModel
            # @!attribute explanation
            #   Explanation.
            #
            #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledServices::GuaranteedReservation::Explanation]
            required :explanation,
                     enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::GuaranteedReservation::Explanation }

            # @!method initialize(explanation:)
            #   Guaranteed reservation explanation. Required if and only if `service_type` is
            #   `guaranteed_reservation`.
            #
            #   @param explanation [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledServices::GuaranteedReservation::Explanation] Explanation.

            # Explanation.
            #
            # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledServices::GuaranteedReservation#explanation
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

          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledServices#other
          class Other < Increase::Internal::Type::BaseModel
            # @!method initialize
            #   Other service type explanation. Required if and only if `service_type` is
            #   `other`.
          end

          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerCanceledServices#timeshare
          class Timeshare < Increase::Internal::Type::BaseModel
            # @!method initialize
            #   Timeshare explanation. Required if and only if `service_type` is `timeshare`.
          end
        end

        # @see Increase::Models::CardDisputeCreateParams::Visa#consumer_counterfeit_merchandise
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

        # @see Increase::Models::CardDisputeCreateParams::Visa#consumer_credit_not_processed
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

        # @see Increase::Models::CardDisputeCreateParams::Visa#consumer_damaged_or_defective_merchandise
        class ConsumerDamagedOrDefectiveMerchandise < Increase::Internal::Type::BaseModel
          # @!attribute merchant_resolution_attempted
          #   Merchant resolution attempted.
          #
          #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::MerchantResolutionAttempted]
          required :merchant_resolution_attempted,
                   enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::MerchantResolutionAttempted }

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
          #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::ReturnOutcome]
          required :return_outcome,
                   enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::ReturnOutcome }

          # @!attribute not_returned
          #   Not returned. Required if and only if `return_outcome` is `not_returned`.
          #
          #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::NotReturned, nil]
          optional :not_returned,
                   -> { Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::NotReturned }

          # @!attribute return_attempted
          #   Return attempted. Required if and only if `return_outcome` is
          #   `return_attempted`.
          #
          #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted, nil]
          optional :return_attempted,
                   -> { Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted }

          # @!attribute returned
          #   Returned. Required if and only if `return_outcome` is `returned`.
          #
          #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::Returned, nil]
          optional :returned,
                   -> { Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::Returned }

          # @!method initialize(merchant_resolution_attempted:, order_and_issue_explanation:, received_at:, return_outcome:, not_returned: nil, return_attempted: nil, returned: nil)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise}
          #   for more details.
          #
          #   Damaged or defective merchandise. Required if and only if `category` is
          #   `consumer_damaged_or_defective_merchandise`.
          #
          #   @param merchant_resolution_attempted [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::MerchantResolutionAttempted] Merchant resolution attempted.
          #
          #   @param order_and_issue_explanation [String] Order and issue explanation.
          #
          #   @param received_at [Date] Received at.
          #
          #   @param return_outcome [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::ReturnOutcome] Return outcome.
          #
          #   @param not_returned [Increase::Models::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::NotReturned] Not returned. Required if and only if `return_outcome` is `not_returned`.
          #
          #   @param return_attempted [Increase::Models::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted] Return attempted. Required if and only if `return_outcome` is `return_attempted`
          #
          #   @param returned [Increase::Models::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::Returned] Returned. Required if and only if `return_outcome` is `returned`.

          # Merchant resolution attempted.
          #
          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise#merchant_resolution_attempted
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
          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise#return_outcome
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

          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise#not_returned
          class NotReturned < Increase::Internal::Type::BaseModel
            # @!method initialize
            #   Not returned. Required if and only if `return_outcome` is `not_returned`.
          end

          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise#return_attempted
          class ReturnAttempted < Increase::Internal::Type::BaseModel
            # @!attribute attempt_explanation
            #   Attempt explanation.
            #
            #   @return [String]
            required :attempt_explanation, String

            # @!attribute attempt_reason
            #   Attempt reason.
            #
            #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::AttemptReason]
            required :attempt_reason,
                     enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::AttemptReason }

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
            #   @param attempt_reason [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::AttemptReason] Attempt reason.
            #
            #   @param attempted_at [Date] Attempted at.
            #
            #   @param merchandise_disposition [String] Merchandise disposition.

            # Attempt reason.
            #
            # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted#attempt_reason
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

          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise#returned
          class Returned < Increase::Internal::Type::BaseModel
            # @!attribute return_method
            #   Return method.
            #
            #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod]
            required :return_method,
                     enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod }

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
            #   @param return_method [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod] Return method.
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
            # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::Returned#return_method
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

        # @see Increase::Models::CardDisputeCreateParams::Visa#consumer_merchandise_misrepresentation
        class ConsumerMerchandiseMisrepresentation < Increase::Internal::Type::BaseModel
          # @!attribute merchant_resolution_attempted
          #   Merchant resolution attempted.
          #
          #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::MerchantResolutionAttempted]
          required :merchant_resolution_attempted,
                   enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::MerchantResolutionAttempted }

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
          #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::ReturnOutcome]
          required :return_outcome,
                   enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::ReturnOutcome }

          # @!attribute not_returned
          #   Not returned. Required if and only if `return_outcome` is `not_returned`.
          #
          #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::NotReturned, nil]
          optional :not_returned,
                   -> { Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::NotReturned }

          # @!attribute return_attempted
          #   Return attempted. Required if and only if `return_outcome` is
          #   `return_attempted`.
          #
          #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::ReturnAttempted, nil]
          optional :return_attempted,
                   -> { Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::ReturnAttempted }

          # @!attribute returned
          #   Returned. Required if and only if `return_outcome` is `returned`.
          #
          #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::Returned, nil]
          optional :returned,
                   -> { Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::Returned }

          # @!method initialize(merchant_resolution_attempted:, misrepresentation_explanation:, purchase_explanation:, received_at:, return_outcome:, not_returned: nil, return_attempted: nil, returned: nil)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation}
          #   for more details.
          #
          #   Merchandise misrepresentation. Required if and only if `category` is
          #   `consumer_merchandise_misrepresentation`.
          #
          #   @param merchant_resolution_attempted [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::MerchantResolutionAttempted] Merchant resolution attempted.
          #
          #   @param misrepresentation_explanation [String] Misrepresentation explanation.
          #
          #   @param purchase_explanation [String] Purchase explanation.
          #
          #   @param received_at [Date] Received at.
          #
          #   @param return_outcome [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::ReturnOutcome] Return outcome.
          #
          #   @param not_returned [Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::NotReturned] Not returned. Required if and only if `return_outcome` is `not_returned`.
          #
          #   @param return_attempted [Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::ReturnAttempted] Return attempted. Required if and only if `return_outcome` is `return_attempted`
          #
          #   @param returned [Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::Returned] Returned. Required if and only if `return_outcome` is `returned`.

          # Merchant resolution attempted.
          #
          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation#merchant_resolution_attempted
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
          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation#return_outcome
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

          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation#not_returned
          class NotReturned < Increase::Internal::Type::BaseModel
            # @!method initialize
            #   Not returned. Required if and only if `return_outcome` is `not_returned`.
          end

          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation#return_attempted
          class ReturnAttempted < Increase::Internal::Type::BaseModel
            # @!attribute attempt_explanation
            #   Attempt explanation.
            #
            #   @return [String]
            required :attempt_explanation, String

            # @!attribute attempt_reason
            #   Attempt reason.
            #
            #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::ReturnAttempted::AttemptReason]
            required :attempt_reason,
                     enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::ReturnAttempted::AttemptReason }

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
            #   @param attempt_reason [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::ReturnAttempted::AttemptReason] Attempt reason.
            #
            #   @param attempted_at [Date] Attempted at.
            #
            #   @param merchandise_disposition [String] Merchandise disposition.

            # Attempt reason.
            #
            # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::ReturnAttempted#attempt_reason
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

          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation#returned
          class Returned < Increase::Internal::Type::BaseModel
            # @!attribute return_method
            #   Return method.
            #
            #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod]
            required :return_method,
                     enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod }

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
            #   @param return_method [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod] Return method.
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
            # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::Returned#return_method
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

        # @see Increase::Models::CardDisputeCreateParams::Visa#consumer_merchandise_not_as_described
        class ConsumerMerchandiseNotAsDescribed < Increase::Internal::Type::BaseModel
          # @!attribute merchant_resolution_attempted
          #   Merchant resolution attempted.
          #
          #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::MerchantResolutionAttempted]
          required :merchant_resolution_attempted,
                   enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::MerchantResolutionAttempted }

          # @!attribute received_at
          #   Received at.
          #
          #   @return [Date]
          required :received_at, Date

          # @!attribute return_outcome
          #   Return outcome.
          #
          #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::ReturnOutcome]
          required :return_outcome,
                   enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::ReturnOutcome }

          # @!attribute return_attempted
          #   Return attempted. Required if and only if `return_outcome` is
          #   `return_attempted`.
          #
          #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::ReturnAttempted, nil]
          optional :return_attempted,
                   -> { Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::ReturnAttempted }

          # @!attribute returned
          #   Returned. Required if and only if `return_outcome` is `returned`.
          #
          #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::Returned, nil]
          optional :returned,
                   -> { Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::Returned }

          # @!method initialize(merchant_resolution_attempted:, received_at:, return_outcome:, return_attempted: nil, returned: nil)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed}
          #   for more details.
          #
          #   Merchandise not as described. Required if and only if `category` is
          #   `consumer_merchandise_not_as_described`.
          #
          #   @param merchant_resolution_attempted [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::MerchantResolutionAttempted] Merchant resolution attempted.
          #
          #   @param received_at [Date] Received at.
          #
          #   @param return_outcome [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::ReturnOutcome] Return outcome.
          #
          #   @param return_attempted [Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::ReturnAttempted] Return attempted. Required if and only if `return_outcome` is `return_attempted`
          #
          #   @param returned [Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::Returned] Returned. Required if and only if `return_outcome` is `returned`.

          # Merchant resolution attempted.
          #
          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed#merchant_resolution_attempted
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
          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed#return_outcome
          module ReturnOutcome
            extend Increase::Internal::Type::Enum

            # Returned.
            RETURNED = :returned

            # Return attempted.
            RETURN_ATTEMPTED = :return_attempted

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed#return_attempted
          class ReturnAttempted < Increase::Internal::Type::BaseModel
            # @!attribute attempt_explanation
            #   Attempt explanation.
            #
            #   @return [String]
            required :attempt_explanation, String

            # @!attribute attempt_reason
            #   Attempt reason.
            #
            #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::AttemptReason]
            required :attempt_reason,
                     enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::AttemptReason }

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
            #   @param attempt_reason [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::AttemptReason] Attempt reason.
            #
            #   @param attempted_at [Date] Attempted at.
            #
            #   @param merchandise_disposition [String] Merchandise disposition.

            # Attempt reason.
            #
            # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::ReturnAttempted#attempt_reason
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

          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed#returned
          class Returned < Increase::Internal::Type::BaseModel
            # @!attribute return_method
            #   Return method.
            #
            #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod]
            required :return_method,
                     enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod }

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
            #   @param return_method [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod] Return method.
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
            # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::Returned#return_method
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

        # @see Increase::Models::CardDisputeCreateParams::Visa#consumer_merchandise_not_received
        class ConsumerMerchandiseNotReceived < Increase::Internal::Type::BaseModel
          # @!attribute cancellation_outcome
          #   Cancellation outcome.
          #
          #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::CancellationOutcome]
          required :cancellation_outcome,
                   enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::CancellationOutcome }

          # @!attribute delivery_issue
          #   Delivery issue.
          #
          #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::DeliveryIssue]
          required :delivery_issue,
                   enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::DeliveryIssue }

          # @!attribute last_expected_receipt_at
          #   Last expected receipt at.
          #
          #   @return [Date]
          required :last_expected_receipt_at, Date

          # @!attribute merchant_resolution_attempted
          #   Merchant resolution attempted.
          #
          #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::MerchantResolutionAttempted]
          required :merchant_resolution_attempted,
                   enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::MerchantResolutionAttempted }

          # @!attribute purchase_info_and_explanation
          #   Purchase information and explanation.
          #
          #   @return [String]
          required :purchase_info_and_explanation, String

          # @!attribute cardholder_cancellation_prior_to_expected_receipt
          #   Cardholder cancellation prior to expected receipt. Required if and only if
          #   `cancellation_outcome` is `cardholder_cancellation_prior_to_expected_receipt`.
          #
          #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::CardholderCancellationPriorToExpectedReceipt, nil]
          optional :cardholder_cancellation_prior_to_expected_receipt,
                   -> { Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::CardholderCancellationPriorToExpectedReceipt }

          # @!attribute delayed
          #   Delayed. Required if and only if `delivery_issue` is `delayed`.
          #
          #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed, nil]
          optional :delayed, -> { Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed }

          # @!attribute delivered_to_wrong_location
          #   Delivered to wrong location. Required if and only if `delivery_issue` is
          #   `delivered_to_wrong_location`.
          #
          #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::DeliveredToWrongLocation, nil]
          optional :delivered_to_wrong_location,
                   -> { Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::DeliveredToWrongLocation }

          # @!attribute merchant_cancellation
          #   Merchant cancellation. Required if and only if `cancellation_outcome` is
          #   `merchant_cancellation`.
          #
          #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::MerchantCancellation, nil]
          optional :merchant_cancellation,
                   -> { Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::MerchantCancellation }

          # @!attribute no_cancellation
          #   No cancellation. Required if and only if `cancellation_outcome` is
          #   `no_cancellation`.
          #
          #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::NoCancellation, nil]
          optional :no_cancellation,
                   -> { Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::NoCancellation }

          # @!method initialize(cancellation_outcome:, delivery_issue:, last_expected_receipt_at:, merchant_resolution_attempted:, purchase_info_and_explanation:, cardholder_cancellation_prior_to_expected_receipt: nil, delayed: nil, delivered_to_wrong_location: nil, merchant_cancellation: nil, no_cancellation: nil)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived}
          #   for more details.
          #
          #   Merchandise not received. Required if and only if `category` is
          #   `consumer_merchandise_not_received`.
          #
          #   @param cancellation_outcome [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::CancellationOutcome] Cancellation outcome.
          #
          #   @param delivery_issue [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::DeliveryIssue] Delivery issue.
          #
          #   @param last_expected_receipt_at [Date] Last expected receipt at.
          #
          #   @param merchant_resolution_attempted [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::MerchantResolutionAttempted] Merchant resolution attempted.
          #
          #   @param purchase_info_and_explanation [String] Purchase information and explanation.
          #
          #   @param cardholder_cancellation_prior_to_expected_receipt [Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::CardholderCancellationPriorToExpectedReceipt] Cardholder cancellation prior to expected receipt. Required if and only if `canc
          #
          #   @param delayed [Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed] Delayed. Required if and only if `delivery_issue` is `delayed`.
          #
          #   @param delivered_to_wrong_location [Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::DeliveredToWrongLocation] Delivered to wrong location. Required if and only if `delivery_issue` is `delive
          #
          #   @param merchant_cancellation [Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::MerchantCancellation] Merchant cancellation. Required if and only if `cancellation_outcome` is `mercha
          #
          #   @param no_cancellation [Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::NoCancellation] No cancellation. Required if and only if `cancellation_outcome` is `no_cancellat

          # Cancellation outcome.
          #
          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived#cancellation_outcome
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
          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived#delivery_issue
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
          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived#merchant_resolution_attempted
          module MerchantResolutionAttempted
            extend Increase::Internal::Type::Enum

            # Attempted.
            ATTEMPTED = :attempted

            # Prohibited by local law.
            PROHIBITED_BY_LOCAL_LAW = :prohibited_by_local_law

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived#cardholder_cancellation_prior_to_expected_receipt
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

          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived#delayed
          class Delayed < Increase::Internal::Type::BaseModel
            # @!attribute explanation
            #   Explanation.
            #
            #   @return [String]
            required :explanation, String

            # @!attribute return_outcome
            #   Return outcome.
            #
            #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed::ReturnOutcome]
            required :return_outcome,
                     enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed::ReturnOutcome }

            # @!attribute not_returned
            #   Not returned. Required if and only if `return_outcome` is `not_returned`.
            #
            #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed::NotReturned, nil]
            optional :not_returned,
                     -> { Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed::NotReturned }

            # @!attribute return_attempted
            #   Return attempted. Required if and only if `return_outcome` is
            #   `return_attempted`.
            #
            #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed::ReturnAttempted, nil]
            optional :return_attempted,
                     -> { Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed::ReturnAttempted }

            # @!attribute returned
            #   Returned. Required if and only if `return_outcome` is `returned`.
            #
            #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed::Returned, nil]
            optional :returned,
                     -> { Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed::Returned }

            # @!method initialize(explanation:, return_outcome:, not_returned: nil, return_attempted: nil, returned: nil)
            #   Some parameter documentations has been truncated, see
            #   {Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed}
            #   for more details.
            #
            #   Delayed. Required if and only if `delivery_issue` is `delayed`.
            #
            #   @param explanation [String] Explanation.
            #
            #   @param return_outcome [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed::ReturnOutcome] Return outcome.
            #
            #   @param not_returned [Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed::NotReturned] Not returned. Required if and only if `return_outcome` is `not_returned`.
            #
            #   @param return_attempted [Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed::ReturnAttempted] Return attempted. Required if and only if `return_outcome` is `return_attempted`
            #
            #   @param returned [Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed::Returned] Returned. Required if and only if `return_outcome` is `returned`.

            # Return outcome.
            #
            # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed#return_outcome
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

            # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed#not_returned
            class NotReturned < Increase::Internal::Type::BaseModel
              # @!method initialize
              #   Not returned. Required if and only if `return_outcome` is `not_returned`.
            end

            # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed#return_attempted
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

            # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed#returned
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

          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived#delivered_to_wrong_location
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

          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived#merchant_cancellation
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

          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived#no_cancellation
          class NoCancellation < Increase::Internal::Type::BaseModel
            # @!method initialize
            #   No cancellation. Required if and only if `cancellation_outcome` is
            #   `no_cancellation`.
          end
        end

        # @see Increase::Models::CardDisputeCreateParams::Visa#consumer_non_receipt_of_cash
        class ConsumerNonReceiptOfCash < Increase::Internal::Type::BaseModel
          # @!method initialize
          #   Non-receipt of cash. Required if and only if `category` is
          #   `consumer_non_receipt_of_cash`.
        end

        # @see Increase::Models::CardDisputeCreateParams::Visa#consumer_original_credit_transaction_not_accepted
        class ConsumerOriginalCreditTransactionNotAccepted < Increase::Internal::Type::BaseModel
          # @!attribute explanation
          #   Explanation.
          #
          #   @return [String]
          required :explanation, String

          # @!attribute reason
          #   Reason.
          #
          #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerOriginalCreditTransactionNotAccepted::Reason]
          required :reason,
                   enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerOriginalCreditTransactionNotAccepted::Reason }

          # @!method initialize(explanation:, reason:)
          #   Original Credit Transaction (OCT) not accepted. Required if and only if
          #   `category` is `consumer_original_credit_transaction_not_accepted`.
          #
          #   @param explanation [String] Explanation.
          #
          #   @param reason [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerOriginalCreditTransactionNotAccepted::Reason] Reason.

          # Reason.
          #
          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerOriginalCreditTransactionNotAccepted#reason
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

        # @see Increase::Models::CardDisputeCreateParams::Visa#consumer_quality_merchandise
        class ConsumerQualityMerchandise < Increase::Internal::Type::BaseModel
          # @!attribute expected_at
          #   Expected at.
          #
          #   @return [Date]
          required :expected_at, Date

          # @!attribute merchant_resolution_attempted
          #   Merchant resolution attempted.
          #
          #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::MerchantResolutionAttempted]
          required :merchant_resolution_attempted,
                   enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::MerchantResolutionAttempted }

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
          #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::ReturnOutcome]
          required :return_outcome,
                   enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::ReturnOutcome }

          # @!attribute not_returned
          #   Not returned. Required if and only if `return_outcome` is `not_returned`.
          #
          #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::NotReturned, nil]
          optional :not_returned,
                   -> { Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::NotReturned }

          # @!attribute ongoing_negotiations
          #   Ongoing negotiations. Exclude if there is no evidence of ongoing negotiations.
          #
          #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::OngoingNegotiations, nil]
          optional :ongoing_negotiations,
                   -> { Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::OngoingNegotiations }

          # @!attribute return_attempted
          #   Return attempted. Required if and only if `return_outcome` is
          #   `return_attempted`.
          #
          #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::ReturnAttempted, nil]
          optional :return_attempted,
                   -> { Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::ReturnAttempted }

          # @!attribute returned
          #   Returned. Required if and only if `return_outcome` is `returned`.
          #
          #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::Returned, nil]
          optional :returned, -> { Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::Returned }

          # @!method initialize(expected_at:, merchant_resolution_attempted:, purchase_info_and_quality_issue:, received_at:, return_outcome:, not_returned: nil, ongoing_negotiations: nil, return_attempted: nil, returned: nil)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise}
          #   for more details.
          #
          #   Merchandise quality issue. Required if and only if `category` is
          #   `consumer_quality_merchandise`.
          #
          #   @param expected_at [Date] Expected at.
          #
          #   @param merchant_resolution_attempted [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::MerchantResolutionAttempted] Merchant resolution attempted.
          #
          #   @param purchase_info_and_quality_issue [String] Purchase information and quality issue.
          #
          #   @param received_at [Date] Received at.
          #
          #   @param return_outcome [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::ReturnOutcome] Return outcome.
          #
          #   @param not_returned [Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::NotReturned] Not returned. Required if and only if `return_outcome` is `not_returned`.
          #
          #   @param ongoing_negotiations [Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::OngoingNegotiations] Ongoing negotiations. Exclude if there is no evidence of ongoing negotiations.
          #
          #   @param return_attempted [Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::ReturnAttempted] Return attempted. Required if and only if `return_outcome` is `return_attempted`
          #
          #   @param returned [Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::Returned] Returned. Required if and only if `return_outcome` is `returned`.

          # Merchant resolution attempted.
          #
          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise#merchant_resolution_attempted
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
          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise#return_outcome
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

          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise#not_returned
          class NotReturned < Increase::Internal::Type::BaseModel
            # @!method initialize
            #   Not returned. Required if and only if `return_outcome` is `not_returned`.
          end

          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise#ongoing_negotiations
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
            #   {Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::OngoingNegotiations}
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

          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise#return_attempted
          class ReturnAttempted < Increase::Internal::Type::BaseModel
            # @!attribute attempt_explanation
            #   Attempt explanation.
            #
            #   @return [String]
            required :attempt_explanation, String

            # @!attribute attempt_reason
            #   Attempt reason.
            #
            #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::ReturnAttempted::AttemptReason]
            required :attempt_reason,
                     enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::ReturnAttempted::AttemptReason }

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
            #   @param attempt_reason [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::ReturnAttempted::AttemptReason] Attempt reason.
            #
            #   @param attempted_at [Date] Attempted at.
            #
            #   @param merchandise_disposition [String] Merchandise disposition.

            # Attempt reason.
            #
            # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::ReturnAttempted#attempt_reason
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

          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise#returned
          class Returned < Increase::Internal::Type::BaseModel
            # @!attribute return_method
            #   Return method.
            #
            #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::Returned::ReturnMethod]
            required :return_method,
                     enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::Returned::ReturnMethod }

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
            #   @param return_method [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::Returned::ReturnMethod] Return method.
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
            # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::Returned#return_method
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

        # @see Increase::Models::CardDisputeCreateParams::Visa#consumer_quality_services
        class ConsumerQualityServices < Increase::Internal::Type::BaseModel
          # @!attribute cardholder_cancellation
          #   Cardholder cancellation.
          #
          #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityServices::CardholderCancellation]
          required :cardholder_cancellation,
                   -> { Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::CardholderCancellation }

          # @!attribute non_fiat_currency_or_non_fungible_token_related_and_not_matching_description
          #   Non-fiat currency or non-fungible token related and not matching description.
          #
          #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityServices::NonFiatCurrencyOrNonFungibleTokenRelatedAndNotMatchingDescription]
          required :non_fiat_currency_or_non_fungible_token_related_and_not_matching_description,
                   enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::NonFiatCurrencyOrNonFungibleTokenRelatedAndNotMatchingDescription }

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
          #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityServices::CardholderPaidToHaveWorkRedone, nil]
          optional :cardholder_paid_to_have_work_redone,
                   enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::CardholderPaidToHaveWorkRedone }

          # @!attribute ongoing_negotiations
          #   Ongoing negotiations. Exclude if there is no evidence of ongoing negotiations.
          #
          #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityServices::OngoingNegotiations, nil]
          optional :ongoing_negotiations,
                   -> { Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::OngoingNegotiations }

          # @!attribute restaurant_food_related
          #   Whether the dispute is related to the quality of food from an eating place or
          #   restaurant. Must be provided when Merchant Category Code (MCC) is 5812, 5813
          #   or 5814.
          #
          #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityServices::RestaurantFoodRelated, nil]
          optional :restaurant_food_related,
                   enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::RestaurantFoodRelated }

          # @!method initialize(cardholder_cancellation:, non_fiat_currency_or_non_fungible_token_related_and_not_matching_description:, purchase_info_and_quality_issue:, services_received_at:, cardholder_paid_to_have_work_redone: nil, ongoing_negotiations: nil, restaurant_food_related: nil)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityServices} for
          #   more details.
          #
          #   Services quality issue. Required if and only if `category` is
          #   `consumer_quality_services`.
          #
          #   @param cardholder_cancellation [Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityServices::CardholderCancellation] Cardholder cancellation.
          #
          #   @param non_fiat_currency_or_non_fungible_token_related_and_not_matching_description [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityServices::NonFiatCurrencyOrNonFungibleTokenRelatedAndNotMatchingDescription] Non-fiat currency or non-fungible token related and not matching description.
          #
          #   @param purchase_info_and_quality_issue [String] Purchase information and quality issue.
          #
          #   @param services_received_at [Date] Services received at.
          #
          #   @param cardholder_paid_to_have_work_redone [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityServices::CardholderPaidToHaveWorkRedone] Cardholder paid to have work redone.
          #
          #   @param ongoing_negotiations [Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityServices::OngoingNegotiations] Ongoing negotiations. Exclude if there is no evidence of ongoing negotiations.
          #
          #   @param restaurant_food_related [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityServices::RestaurantFoodRelated] Whether the dispute is related to the quality of food from an eating place or re

          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityServices#cardholder_cancellation
          class CardholderCancellation < Increase::Internal::Type::BaseModel
            # @!attribute accepted_by_merchant
            #   Accepted by merchant.
            #
            #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityServices::CardholderCancellation::AcceptedByMerchant]
            required :accepted_by_merchant,
                     enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::CardholderCancellation::AcceptedByMerchant }

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
            #   @param accepted_by_merchant [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityServices::CardholderCancellation::AcceptedByMerchant] Accepted by merchant.
            #
            #   @param canceled_at [Date] Canceled at.
            #
            #   @param reason [String] Reason.

            # Accepted by merchant.
            #
            # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityServices::CardholderCancellation#accepted_by_merchant
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
          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityServices#non_fiat_currency_or_non_fungible_token_related_and_not_matching_description
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
          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityServices#cardholder_paid_to_have_work_redone
          module CardholderPaidToHaveWorkRedone
            extend Increase::Internal::Type::Enum

            # Cardholder did not pay to have work redone.
            DID_NOT_PAY_TO_HAVE_WORK_REDONE = :did_not_pay_to_have_work_redone

            # Cardholder paid to have work redone.
            PAID_TO_HAVE_WORK_REDONE = :paid_to_have_work_redone

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityServices#ongoing_negotiations
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
            #   {Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityServices::OngoingNegotiations}
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
          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerQualityServices#restaurant_food_related
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

        # @see Increase::Models::CardDisputeCreateParams::Visa#consumer_services_misrepresentation
        class ConsumerServicesMisrepresentation < Increase::Internal::Type::BaseModel
          # @!attribute cardholder_cancellation
          #   Cardholder cancellation.
          #
          #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesMisrepresentation::CardholderCancellation]
          required :cardholder_cancellation,
                   -> { Increase::CardDisputeCreateParams::Visa::ConsumerServicesMisrepresentation::CardholderCancellation }

          # @!attribute merchant_resolution_attempted
          #   Merchant resolution attempted.
          #
          #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesMisrepresentation::MerchantResolutionAttempted]
          required :merchant_resolution_attempted,
                   enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerServicesMisrepresentation::MerchantResolutionAttempted }

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
          #   @param cardholder_cancellation [Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesMisrepresentation::CardholderCancellation] Cardholder cancellation.
          #
          #   @param merchant_resolution_attempted [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesMisrepresentation::MerchantResolutionAttempted] Merchant resolution attempted.
          #
          #   @param misrepresentation_explanation [String] Misrepresentation explanation.
          #
          #   @param purchase_explanation [String] Purchase explanation.
          #
          #   @param received_at [Date] Received at.

          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesMisrepresentation#cardholder_cancellation
          class CardholderCancellation < Increase::Internal::Type::BaseModel
            # @!attribute accepted_by_merchant
            #   Accepted by merchant.
            #
            #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesMisrepresentation::CardholderCancellation::AcceptedByMerchant]
            required :accepted_by_merchant,
                     enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerServicesMisrepresentation::CardholderCancellation::AcceptedByMerchant }

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
            #   @param accepted_by_merchant [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesMisrepresentation::CardholderCancellation::AcceptedByMerchant] Accepted by merchant.
            #
            #   @param canceled_at [Date] Canceled at.
            #
            #   @param reason [String] Reason.

            # Accepted by merchant.
            #
            # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesMisrepresentation::CardholderCancellation#accepted_by_merchant
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
          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesMisrepresentation#merchant_resolution_attempted
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

        # @see Increase::Models::CardDisputeCreateParams::Visa#consumer_services_not_as_described
        class ConsumerServicesNotAsDescribed < Increase::Internal::Type::BaseModel
          # @!attribute cardholder_cancellation
          #   Cardholder cancellation.
          #
          #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesNotAsDescribed::CardholderCancellation]
          required :cardholder_cancellation,
                   -> { Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotAsDescribed::CardholderCancellation }

          # @!attribute explanation
          #   Explanation of what was ordered and was not as described.
          #
          #   @return [String]
          required :explanation, String

          # @!attribute merchant_resolution_attempted
          #   Merchant resolution attempted.
          #
          #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesNotAsDescribed::MerchantResolutionAttempted]
          required :merchant_resolution_attempted,
                   enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotAsDescribed::MerchantResolutionAttempted }

          # @!attribute received_at
          #   Received at.
          #
          #   @return [Date]
          required :received_at, Date

          # @!method initialize(cardholder_cancellation:, explanation:, merchant_resolution_attempted:, received_at:)
          #   Services not as described. Required if and only if `category` is
          #   `consumer_services_not_as_described`.
          #
          #   @param cardholder_cancellation [Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesNotAsDescribed::CardholderCancellation] Cardholder cancellation.
          #
          #   @param explanation [String] Explanation of what was ordered and was not as described.
          #
          #   @param merchant_resolution_attempted [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesNotAsDescribed::MerchantResolutionAttempted] Merchant resolution attempted.
          #
          #   @param received_at [Date] Received at.

          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesNotAsDescribed#cardholder_cancellation
          class CardholderCancellation < Increase::Internal::Type::BaseModel
            # @!attribute accepted_by_merchant
            #   Accepted by merchant.
            #
            #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesNotAsDescribed::CardholderCancellation::AcceptedByMerchant]
            required :accepted_by_merchant,
                     enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotAsDescribed::CardholderCancellation::AcceptedByMerchant }

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
            #   @param accepted_by_merchant [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesNotAsDescribed::CardholderCancellation::AcceptedByMerchant] Accepted by merchant.
            #
            #   @param canceled_at [Date] Canceled at.
            #
            #   @param reason [String] Reason.

            # Accepted by merchant.
            #
            # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesNotAsDescribed::CardholderCancellation#accepted_by_merchant
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
          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesNotAsDescribed#merchant_resolution_attempted
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

        # @see Increase::Models::CardDisputeCreateParams::Visa#consumer_services_not_received
        class ConsumerServicesNotReceived < Increase::Internal::Type::BaseModel
          # @!attribute cancellation_outcome
          #   Cancellation outcome.
          #
          #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::CancellationOutcome]
          required :cancellation_outcome,
                   enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::CancellationOutcome }

          # @!attribute last_expected_receipt_at
          #   Last expected receipt at.
          #
          #   @return [Date]
          required :last_expected_receipt_at, Date

          # @!attribute merchant_resolution_attempted
          #   Merchant resolution attempted.
          #
          #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::MerchantResolutionAttempted]
          required :merchant_resolution_attempted,
                   enum: -> { Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::MerchantResolutionAttempted }

          # @!attribute purchase_info_and_explanation
          #   Purchase information and explanation.
          #
          #   @return [String]
          required :purchase_info_and_explanation, String

          # @!attribute cardholder_cancellation_prior_to_expected_receipt
          #   Cardholder cancellation prior to expected receipt. Required if and only if
          #   `cancellation_outcome` is `cardholder_cancellation_prior_to_expected_receipt`.
          #
          #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::CardholderCancellationPriorToExpectedReceipt, nil]
          optional :cardholder_cancellation_prior_to_expected_receipt,
                   -> { Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::CardholderCancellationPriorToExpectedReceipt }

          # @!attribute merchant_cancellation
          #   Merchant cancellation. Required if and only if `cancellation_outcome` is
          #   `merchant_cancellation`.
          #
          #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::MerchantCancellation, nil]
          optional :merchant_cancellation,
                   -> { Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::MerchantCancellation }

          # @!attribute no_cancellation
          #   No cancellation. Required if and only if `cancellation_outcome` is
          #   `no_cancellation`.
          #
          #   @return [Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::NoCancellation, nil]
          optional :no_cancellation,
                   -> { Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::NoCancellation }

          # @!method initialize(cancellation_outcome:, last_expected_receipt_at:, merchant_resolution_attempted:, purchase_info_and_explanation:, cardholder_cancellation_prior_to_expected_receipt: nil, merchant_cancellation: nil, no_cancellation: nil)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived}
          #   for more details.
          #
          #   Services not received. Required if and only if `category` is
          #   `consumer_services_not_received`.
          #
          #   @param cancellation_outcome [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::CancellationOutcome] Cancellation outcome.
          #
          #   @param last_expected_receipt_at [Date] Last expected receipt at.
          #
          #   @param merchant_resolution_attempted [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::MerchantResolutionAttempted] Merchant resolution attempted.
          #
          #   @param purchase_info_and_explanation [String] Purchase information and explanation.
          #
          #   @param cardholder_cancellation_prior_to_expected_receipt [Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::CardholderCancellationPriorToExpectedReceipt] Cardholder cancellation prior to expected receipt. Required if and only if `canc
          #
          #   @param merchant_cancellation [Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::MerchantCancellation] Merchant cancellation. Required if and only if `cancellation_outcome` is `mercha
          #
          #   @param no_cancellation [Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::NoCancellation] No cancellation. Required if and only if `cancellation_outcome` is `no_cancellat

          # Cancellation outcome.
          #
          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived#cancellation_outcome
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
          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived#merchant_resolution_attempted
          module MerchantResolutionAttempted
            extend Increase::Internal::Type::Enum

            # Attempted.
            ATTEMPTED = :attempted

            # Prohibited by local law.
            PROHIBITED_BY_LOCAL_LAW = :prohibited_by_local_law

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived#cardholder_cancellation_prior_to_expected_receipt
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

          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived#merchant_cancellation
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

          # @see Increase::Models::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived#no_cancellation
          class NoCancellation < Increase::Internal::Type::BaseModel
            # @!method initialize
            #   No cancellation. Required if and only if `cancellation_outcome` is
            #   `no_cancellation`.
          end
        end

        # @see Increase::Models::CardDisputeCreateParams::Visa#fraud
        class Fraud < Increase::Internal::Type::BaseModel
          # @!attribute fraud_type
          #   Fraud type.
          #
          #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::Fraud::FraudType]
          required :fraud_type, enum: -> { Increase::CardDisputeCreateParams::Visa::Fraud::FraudType }

          # @!method initialize(fraud_type:)
          #   Fraud. Required if and only if `category` is `fraud`.
          #
          #   @param fraud_type [Symbol, Increase::Models::CardDisputeCreateParams::Visa::Fraud::FraudType] Fraud type.

          # Fraud type.
          #
          # @see Increase::Models::CardDisputeCreateParams::Visa::Fraud#fraud_type
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

        # @see Increase::Models::CardDisputeCreateParams::Visa#processing_error
        class ProcessingError < Increase::Internal::Type::BaseModel
          # @!attribute error_reason
          #   Error reason.
          #
          #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ProcessingError::ErrorReason]
          required :error_reason, enum: -> { Increase::CardDisputeCreateParams::Visa::ProcessingError::ErrorReason }

          # @!attribute merchant_resolution_attempted
          #   Merchant resolution attempted.
          #
          #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ProcessingError::MerchantResolutionAttempted]
          required :merchant_resolution_attempted,
                   enum: -> { Increase::CardDisputeCreateParams::Visa::ProcessingError::MerchantResolutionAttempted }

          # @!attribute duplicate_transaction
          #   Duplicate transaction. Required if and only if `error_reason` is
          #   `duplicate_transaction`.
          #
          #   @return [Increase::Models::CardDisputeCreateParams::Visa::ProcessingError::DuplicateTransaction, nil]
          optional :duplicate_transaction,
                   -> { Increase::CardDisputeCreateParams::Visa::ProcessingError::DuplicateTransaction }

          # @!attribute incorrect_amount
          #   Incorrect amount. Required if and only if `error_reason` is `incorrect_amount`.
          #
          #   @return [Increase::Models::CardDisputeCreateParams::Visa::ProcessingError::IncorrectAmount, nil]
          optional :incorrect_amount,
                   -> { Increase::CardDisputeCreateParams::Visa::ProcessingError::IncorrectAmount }

          # @!attribute paid_by_other_means
          #   Paid by other means. Required if and only if `error_reason` is
          #   `paid_by_other_means`.
          #
          #   @return [Increase::Models::CardDisputeCreateParams::Visa::ProcessingError::PaidByOtherMeans, nil]
          optional :paid_by_other_means,
                   -> { Increase::CardDisputeCreateParams::Visa::ProcessingError::PaidByOtherMeans }

          # @!method initialize(error_reason:, merchant_resolution_attempted:, duplicate_transaction: nil, incorrect_amount: nil, paid_by_other_means: nil)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::CardDisputeCreateParams::Visa::ProcessingError} for more
          #   details.
          #
          #   Processing error. Required if and only if `category` is `processing_error`.
          #
          #   @param error_reason [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ProcessingError::ErrorReason] Error reason.
          #
          #   @param merchant_resolution_attempted [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ProcessingError::MerchantResolutionAttempted] Merchant resolution attempted.
          #
          #   @param duplicate_transaction [Increase::Models::CardDisputeCreateParams::Visa::ProcessingError::DuplicateTransaction] Duplicate transaction. Required if and only if `error_reason` is `duplicate_tran
          #
          #   @param incorrect_amount [Increase::Models::CardDisputeCreateParams::Visa::ProcessingError::IncorrectAmount] Incorrect amount. Required if and only if `error_reason` is `incorrect_amount`.
          #
          #   @param paid_by_other_means [Increase::Models::CardDisputeCreateParams::Visa::ProcessingError::PaidByOtherMeans] Paid by other means. Required if and only if `error_reason` is `paid_by_other_me

          # Error reason.
          #
          # @see Increase::Models::CardDisputeCreateParams::Visa::ProcessingError#error_reason
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
          # @see Increase::Models::CardDisputeCreateParams::Visa::ProcessingError#merchant_resolution_attempted
          module MerchantResolutionAttempted
            extend Increase::Internal::Type::Enum

            # Attempted.
            ATTEMPTED = :attempted

            # Prohibited by local law.
            PROHIBITED_BY_LOCAL_LAW = :prohibited_by_local_law

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Increase::Models::CardDisputeCreateParams::Visa::ProcessingError#duplicate_transaction
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

          # @see Increase::Models::CardDisputeCreateParams::Visa::ProcessingError#incorrect_amount
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

          # @see Increase::Models::CardDisputeCreateParams::Visa::ProcessingError#paid_by_other_means
          class PaidByOtherMeans < Increase::Internal::Type::BaseModel
            # @!attribute other_form_of_payment_evidence
            #   Other form of payment evidence.
            #
            #   @return [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence]
            required :other_form_of_payment_evidence,
                     enum: -> { Increase::CardDisputeCreateParams::Visa::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence }

            # @!attribute other_transaction_id
            #   Other transaction ID.
            #
            #   @return [String, nil]
            optional :other_transaction_id, String

            # @!method initialize(other_form_of_payment_evidence:, other_transaction_id: nil)
            #   Paid by other means. Required if and only if `error_reason` is
            #   `paid_by_other_means`.
            #
            #   @param other_form_of_payment_evidence [Symbol, Increase::Models::CardDisputeCreateParams::Visa::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence] Other form of payment evidence.
            #
            #   @param other_transaction_id [String] Other transaction ID.

            # Other form of payment evidence.
            #
            # @see Increase::Models::CardDisputeCreateParams::Visa::ProcessingError::PaidByOtherMeans#other_form_of_payment_evidence
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
    end
  end
end
