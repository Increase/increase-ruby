# typed: strong

module Increase
  module Models
    class CardDisputeCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Increase::CardDisputeCreateParams, Increase::Internal::AnyHash)
        end

      # The Transaction you wish to dispute. This Transaction must have a `source_type`
      # of `card_settlement`.
      sig { returns(String) }
      attr_accessor :disputed_transaction_id

      # The network of the disputed transaction. Details specific to the network are
      # required under the sub-object with the same identifier as the network.
      sig { returns(Increase::CardDisputeCreateParams::Network::OrSymbol) }
      attr_accessor :network

      # The monetary amount of the part of the transaction that is being disputed. This
      # is optional and will default to the full amount of the transaction if not
      # provided. If provided, the amount must be less than or equal to the amount of
      # the transaction.
      sig { returns(T.nilable(Integer)) }
      attr_reader :amount

      sig { params(amount: Integer).void }
      attr_writer :amount

      # The files to be attached to the initial dispute submission.
      sig do
        returns(
          T.nilable(T::Array[Increase::CardDisputeCreateParams::AttachmentFile])
        )
      end
      attr_reader :attachment_files

      sig do
        params(
          attachment_files:
            T::Array[Increase::CardDisputeCreateParams::AttachmentFile::OrHash]
        ).void
      end
      attr_writer :attachment_files

      # The free-form explanation provided to Increase to provide more context for the
      # user submission. This field is not sent directly to the card networks.
      sig { returns(T.nilable(String)) }
      attr_reader :explanation

      sig { params(explanation: String).void }
      attr_writer :explanation

      # The Visa-specific parameters for the dispute. Required if and only if `network`
      # is `visa`.
      sig { returns(T.nilable(Increase::CardDisputeCreateParams::Visa)) }
      attr_reader :visa

      sig { params(visa: Increase::CardDisputeCreateParams::Visa::OrHash).void }
      attr_writer :visa

      sig do
        params(
          disputed_transaction_id: String,
          network: Increase::CardDisputeCreateParams::Network::OrSymbol,
          amount: Integer,
          attachment_files:
            T::Array[Increase::CardDisputeCreateParams::AttachmentFile::OrHash],
          explanation: String,
          visa: Increase::CardDisputeCreateParams::Visa::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The Transaction you wish to dispute. This Transaction must have a `source_type`
        # of `card_settlement`.
        disputed_transaction_id:,
        # The network of the disputed transaction. Details specific to the network are
        # required under the sub-object with the same identifier as the network.
        network:,
        # The monetary amount of the part of the transaction that is being disputed. This
        # is optional and will default to the full amount of the transaction if not
        # provided. If provided, the amount must be less than or equal to the amount of
        # the transaction.
        amount: nil,
        # The files to be attached to the initial dispute submission.
        attachment_files: nil,
        # The free-form explanation provided to Increase to provide more context for the
        # user submission. This field is not sent directly to the card networks.
        explanation: nil,
        # The Visa-specific parameters for the dispute. Required if and only if `network`
        # is `visa`.
        visa: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            disputed_transaction_id: String,
            network: Increase::CardDisputeCreateParams::Network::OrSymbol,
            amount: Integer,
            attachment_files:
              T::Array[Increase::CardDisputeCreateParams::AttachmentFile],
            explanation: String,
            visa: Increase::CardDisputeCreateParams::Visa,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      # The network of the disputed transaction. Details specific to the network are
      # required under the sub-object with the same identifier as the network.
      module Network
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::CardDisputeCreateParams::Network)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # Visa
        VISA =
          T.let(:visa, Increase::CardDisputeCreateParams::Network::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::CardDisputeCreateParams::Network::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class AttachmentFile < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CardDisputeCreateParams::AttachmentFile,
              Increase::Internal::AnyHash
            )
          end

        # The ID of the file to be attached. The file must have a `purpose` of
        # `card_dispute_attachment`.
        sig { returns(String) }
        attr_accessor :file_id

        sig { params(file_id: String).returns(T.attached_class) }
        def self.new(
          # The ID of the file to be attached. The file must have a `purpose` of
          # `card_dispute_attachment`.
          file_id:
        )
        end

        sig { override.returns({ file_id: String }) }
        def to_hash
        end
      end

      class Visa < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CardDisputeCreateParams::Visa,
              Increase::Internal::AnyHash
            )
          end

        # Category.
        sig do
          returns(Increase::CardDisputeCreateParams::Visa::Category::OrSymbol)
        end
        attr_accessor :category

        # Authorization. Required if and only if `category` is `authorization`.
        sig do
          returns(
            T.nilable(Increase::CardDisputeCreateParams::Visa::Authorization)
          )
        end
        attr_reader :authorization

        sig do
          params(
            authorization:
              Increase::CardDisputeCreateParams::Visa::Authorization::OrHash
          ).void
        end
        attr_writer :authorization

        # Canceled merchandise. Required if and only if `category` is
        # `consumer_canceled_merchandise`.
        sig do
          returns(
            T.nilable(
              Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise
            )
          )
        end
        attr_reader :consumer_canceled_merchandise

        sig do
          params(
            consumer_canceled_merchandise:
              Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::OrHash
          ).void
        end
        attr_writer :consumer_canceled_merchandise

        # Canceled recurring transaction. Required if and only if `category` is
        # `consumer_canceled_recurring_transaction`.
        sig do
          returns(
            T.nilable(
              Increase::CardDisputeCreateParams::Visa::ConsumerCanceledRecurringTransaction
            )
          )
        end
        attr_reader :consumer_canceled_recurring_transaction

        sig do
          params(
            consumer_canceled_recurring_transaction:
              Increase::CardDisputeCreateParams::Visa::ConsumerCanceledRecurringTransaction::OrHash
          ).void
        end
        attr_writer :consumer_canceled_recurring_transaction

        # Canceled services. Required if and only if `category` is
        # `consumer_canceled_services`.
        sig do
          returns(
            T.nilable(
              Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices
            )
          )
        end
        attr_reader :consumer_canceled_services

        sig do
          params(
            consumer_canceled_services:
              Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::OrHash
          ).void
        end
        attr_writer :consumer_canceled_services

        # Counterfeit merchandise. Required if and only if `category` is
        # `consumer_counterfeit_merchandise`.
        sig do
          returns(
            T.nilable(
              Increase::CardDisputeCreateParams::Visa::ConsumerCounterfeitMerchandise
            )
          )
        end
        attr_reader :consumer_counterfeit_merchandise

        sig do
          params(
            consumer_counterfeit_merchandise:
              Increase::CardDisputeCreateParams::Visa::ConsumerCounterfeitMerchandise::OrHash
          ).void
        end
        attr_writer :consumer_counterfeit_merchandise

        # Credit not processed. Required if and only if `category` is
        # `consumer_credit_not_processed`.
        sig do
          returns(
            T.nilable(
              Increase::CardDisputeCreateParams::Visa::ConsumerCreditNotProcessed
            )
          )
        end
        attr_reader :consumer_credit_not_processed

        sig do
          params(
            consumer_credit_not_processed:
              Increase::CardDisputeCreateParams::Visa::ConsumerCreditNotProcessed::OrHash
          ).void
        end
        attr_writer :consumer_credit_not_processed

        # Damaged or defective merchandise. Required if and only if `category` is
        # `consumer_damaged_or_defective_merchandise`.
        sig do
          returns(
            T.nilable(
              Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise
            )
          )
        end
        attr_reader :consumer_damaged_or_defective_merchandise

        sig do
          params(
            consumer_damaged_or_defective_merchandise:
              Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::OrHash
          ).void
        end
        attr_writer :consumer_damaged_or_defective_merchandise

        # Merchandise misrepresentation. Required if and only if `category` is
        # `consumer_merchandise_misrepresentation`.
        sig do
          returns(
            T.nilable(
              Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation
            )
          )
        end
        attr_reader :consumer_merchandise_misrepresentation

        sig do
          params(
            consumer_merchandise_misrepresentation:
              Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::OrHash
          ).void
        end
        attr_writer :consumer_merchandise_misrepresentation

        # Merchandise not as described. Required if and only if `category` is
        # `consumer_merchandise_not_as_described`.
        sig do
          returns(
            T.nilable(
              Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed
            )
          )
        end
        attr_reader :consumer_merchandise_not_as_described

        sig do
          params(
            consumer_merchandise_not_as_described:
              Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::OrHash
          ).void
        end
        attr_writer :consumer_merchandise_not_as_described

        # Merchandise not received. Required if and only if `category` is
        # `consumer_merchandise_not_received`.
        sig do
          returns(
            T.nilable(
              Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived
            )
          )
        end
        attr_reader :consumer_merchandise_not_received

        sig do
          params(
            consumer_merchandise_not_received:
              Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::OrHash
          ).void
        end
        attr_writer :consumer_merchandise_not_received

        # Non-receipt of cash. Required if and only if `category` is
        # `consumer_non_receipt_of_cash`.
        sig do
          returns(
            T.nilable(
              Increase::CardDisputeCreateParams::Visa::ConsumerNonReceiptOfCash
            )
          )
        end
        attr_reader :consumer_non_receipt_of_cash

        sig do
          params(
            consumer_non_receipt_of_cash:
              Increase::CardDisputeCreateParams::Visa::ConsumerNonReceiptOfCash::OrHash
          ).void
        end
        attr_writer :consumer_non_receipt_of_cash

        # Original Credit Transaction (OCT) not accepted. Required if and only if
        # `category` is `consumer_original_credit_transaction_not_accepted`.
        sig do
          returns(
            T.nilable(
              Increase::CardDisputeCreateParams::Visa::ConsumerOriginalCreditTransactionNotAccepted
            )
          )
        end
        attr_reader :consumer_original_credit_transaction_not_accepted

        sig do
          params(
            consumer_original_credit_transaction_not_accepted:
              Increase::CardDisputeCreateParams::Visa::ConsumerOriginalCreditTransactionNotAccepted::OrHash
          ).void
        end
        attr_writer :consumer_original_credit_transaction_not_accepted

        # Merchandise quality issue. Required if and only if `category` is
        # `consumer_quality_merchandise`.
        sig do
          returns(
            T.nilable(
              Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise
            )
          )
        end
        attr_reader :consumer_quality_merchandise

        sig do
          params(
            consumer_quality_merchandise:
              Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::OrHash
          ).void
        end
        attr_writer :consumer_quality_merchandise

        # Services quality issue. Required if and only if `category` is
        # `consumer_quality_services`.
        sig do
          returns(
            T.nilable(
              Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices
            )
          )
        end
        attr_reader :consumer_quality_services

        sig do
          params(
            consumer_quality_services:
              Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::OrHash
          ).void
        end
        attr_writer :consumer_quality_services

        # Services misrepresentation. Required if and only if `category` is
        # `consumer_services_misrepresentation`.
        sig do
          returns(
            T.nilable(
              Increase::CardDisputeCreateParams::Visa::ConsumerServicesMisrepresentation
            )
          )
        end
        attr_reader :consumer_services_misrepresentation

        sig do
          params(
            consumer_services_misrepresentation:
              Increase::CardDisputeCreateParams::Visa::ConsumerServicesMisrepresentation::OrHash
          ).void
        end
        attr_writer :consumer_services_misrepresentation

        # Services not as described. Required if and only if `category` is
        # `consumer_services_not_as_described`.
        sig do
          returns(
            T.nilable(
              Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotAsDescribed
            )
          )
        end
        attr_reader :consumer_services_not_as_described

        sig do
          params(
            consumer_services_not_as_described:
              Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotAsDescribed::OrHash
          ).void
        end
        attr_writer :consumer_services_not_as_described

        # Services not received. Required if and only if `category` is
        # `consumer_services_not_received`.
        sig do
          returns(
            T.nilable(
              Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived
            )
          )
        end
        attr_reader :consumer_services_not_received

        sig do
          params(
            consumer_services_not_received:
              Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::OrHash
          ).void
        end
        attr_writer :consumer_services_not_received

        # Fraud. Required if and only if `category` is `fraud`.
        sig do
          returns(T.nilable(Increase::CardDisputeCreateParams::Visa::Fraud))
        end
        attr_reader :fraud

        sig do
          params(
            fraud: Increase::CardDisputeCreateParams::Visa::Fraud::OrHash
          ).void
        end
        attr_writer :fraud

        # Processing error. Required if and only if `category` is `processing_error`.
        sig do
          returns(
            T.nilable(Increase::CardDisputeCreateParams::Visa::ProcessingError)
          )
        end
        attr_reader :processing_error

        sig do
          params(
            processing_error:
              Increase::CardDisputeCreateParams::Visa::ProcessingError::OrHash
          ).void
        end
        attr_writer :processing_error

        # The Visa-specific parameters for the dispute. Required if and only if `network`
        # is `visa`.
        sig do
          params(
            category:
              Increase::CardDisputeCreateParams::Visa::Category::OrSymbol,
            authorization:
              Increase::CardDisputeCreateParams::Visa::Authorization::OrHash,
            consumer_canceled_merchandise:
              Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::OrHash,
            consumer_canceled_recurring_transaction:
              Increase::CardDisputeCreateParams::Visa::ConsumerCanceledRecurringTransaction::OrHash,
            consumer_canceled_services:
              Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::OrHash,
            consumer_counterfeit_merchandise:
              Increase::CardDisputeCreateParams::Visa::ConsumerCounterfeitMerchandise::OrHash,
            consumer_credit_not_processed:
              Increase::CardDisputeCreateParams::Visa::ConsumerCreditNotProcessed::OrHash,
            consumer_damaged_or_defective_merchandise:
              Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::OrHash,
            consumer_merchandise_misrepresentation:
              Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::OrHash,
            consumer_merchandise_not_as_described:
              Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::OrHash,
            consumer_merchandise_not_received:
              Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::OrHash,
            consumer_non_receipt_of_cash:
              Increase::CardDisputeCreateParams::Visa::ConsumerNonReceiptOfCash::OrHash,
            consumer_original_credit_transaction_not_accepted:
              Increase::CardDisputeCreateParams::Visa::ConsumerOriginalCreditTransactionNotAccepted::OrHash,
            consumer_quality_merchandise:
              Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::OrHash,
            consumer_quality_services:
              Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::OrHash,
            consumer_services_misrepresentation:
              Increase::CardDisputeCreateParams::Visa::ConsumerServicesMisrepresentation::OrHash,
            consumer_services_not_as_described:
              Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotAsDescribed::OrHash,
            consumer_services_not_received:
              Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::OrHash,
            fraud: Increase::CardDisputeCreateParams::Visa::Fraud::OrHash,
            processing_error:
              Increase::CardDisputeCreateParams::Visa::ProcessingError::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Category.
          category:,
          # Authorization. Required if and only if `category` is `authorization`.
          authorization: nil,
          # Canceled merchandise. Required if and only if `category` is
          # `consumer_canceled_merchandise`.
          consumer_canceled_merchandise: nil,
          # Canceled recurring transaction. Required if and only if `category` is
          # `consumer_canceled_recurring_transaction`.
          consumer_canceled_recurring_transaction: nil,
          # Canceled services. Required if and only if `category` is
          # `consumer_canceled_services`.
          consumer_canceled_services: nil,
          # Counterfeit merchandise. Required if and only if `category` is
          # `consumer_counterfeit_merchandise`.
          consumer_counterfeit_merchandise: nil,
          # Credit not processed. Required if and only if `category` is
          # `consumer_credit_not_processed`.
          consumer_credit_not_processed: nil,
          # Damaged or defective merchandise. Required if and only if `category` is
          # `consumer_damaged_or_defective_merchandise`.
          consumer_damaged_or_defective_merchandise: nil,
          # Merchandise misrepresentation. Required if and only if `category` is
          # `consumer_merchandise_misrepresentation`.
          consumer_merchandise_misrepresentation: nil,
          # Merchandise not as described. Required if and only if `category` is
          # `consumer_merchandise_not_as_described`.
          consumer_merchandise_not_as_described: nil,
          # Merchandise not received. Required if and only if `category` is
          # `consumer_merchandise_not_received`.
          consumer_merchandise_not_received: nil,
          # Non-receipt of cash. Required if and only if `category` is
          # `consumer_non_receipt_of_cash`.
          consumer_non_receipt_of_cash: nil,
          # Original Credit Transaction (OCT) not accepted. Required if and only if
          # `category` is `consumer_original_credit_transaction_not_accepted`.
          consumer_original_credit_transaction_not_accepted: nil,
          # Merchandise quality issue. Required if and only if `category` is
          # `consumer_quality_merchandise`.
          consumer_quality_merchandise: nil,
          # Services quality issue. Required if and only if `category` is
          # `consumer_quality_services`.
          consumer_quality_services: nil,
          # Services misrepresentation. Required if and only if `category` is
          # `consumer_services_misrepresentation`.
          consumer_services_misrepresentation: nil,
          # Services not as described. Required if and only if `category` is
          # `consumer_services_not_as_described`.
          consumer_services_not_as_described: nil,
          # Services not received. Required if and only if `category` is
          # `consumer_services_not_received`.
          consumer_services_not_received: nil,
          # Fraud. Required if and only if `category` is `fraud`.
          fraud: nil,
          # Processing error. Required if and only if `category` is `processing_error`.
          processing_error: nil
        )
        end

        sig do
          override.returns(
            {
              category:
                Increase::CardDisputeCreateParams::Visa::Category::OrSymbol,
              authorization:
                Increase::CardDisputeCreateParams::Visa::Authorization,
              consumer_canceled_merchandise:
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise,
              consumer_canceled_recurring_transaction:
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledRecurringTransaction,
              consumer_canceled_services:
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices,
              consumer_counterfeit_merchandise:
                Increase::CardDisputeCreateParams::Visa::ConsumerCounterfeitMerchandise,
              consumer_credit_not_processed:
                Increase::CardDisputeCreateParams::Visa::ConsumerCreditNotProcessed,
              consumer_damaged_or_defective_merchandise:
                Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise,
              consumer_merchandise_misrepresentation:
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation,
              consumer_merchandise_not_as_described:
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed,
              consumer_merchandise_not_received:
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived,
              consumer_non_receipt_of_cash:
                Increase::CardDisputeCreateParams::Visa::ConsumerNonReceiptOfCash,
              consumer_original_credit_transaction_not_accepted:
                Increase::CardDisputeCreateParams::Visa::ConsumerOriginalCreditTransactionNotAccepted,
              consumer_quality_merchandise:
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise,
              consumer_quality_services:
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices,
              consumer_services_misrepresentation:
                Increase::CardDisputeCreateParams::Visa::ConsumerServicesMisrepresentation,
              consumer_services_not_as_described:
                Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotAsDescribed,
              consumer_services_not_received:
                Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived,
              fraud: Increase::CardDisputeCreateParams::Visa::Fraud,
              processing_error:
                Increase::CardDisputeCreateParams::Visa::ProcessingError
            }
          )
        end
        def to_hash
        end

        # Category.
        module Category
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::CardDisputeCreateParams::Visa::Category)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Authorization.
          AUTHORIZATION =
            T.let(
              :authorization,
              Increase::CardDisputeCreateParams::Visa::Category::TaggedSymbol
            )

          # Consumer: canceled merchandise.
          CONSUMER_CANCELED_MERCHANDISE =
            T.let(
              :consumer_canceled_merchandise,
              Increase::CardDisputeCreateParams::Visa::Category::TaggedSymbol
            )

          # Consumer: canceled recurring transaction.
          CONSUMER_CANCELED_RECURRING_TRANSACTION =
            T.let(
              :consumer_canceled_recurring_transaction,
              Increase::CardDisputeCreateParams::Visa::Category::TaggedSymbol
            )

          # Consumer: canceled services.
          CONSUMER_CANCELED_SERVICES =
            T.let(
              :consumer_canceled_services,
              Increase::CardDisputeCreateParams::Visa::Category::TaggedSymbol
            )

          # Consumer: counterfeit merchandise.
          CONSUMER_COUNTERFEIT_MERCHANDISE =
            T.let(
              :consumer_counterfeit_merchandise,
              Increase::CardDisputeCreateParams::Visa::Category::TaggedSymbol
            )

          # Consumer: credit not processed.
          CONSUMER_CREDIT_NOT_PROCESSED =
            T.let(
              :consumer_credit_not_processed,
              Increase::CardDisputeCreateParams::Visa::Category::TaggedSymbol
            )

          # Consumer: damaged or defective merchandise.
          CONSUMER_DAMAGED_OR_DEFECTIVE_MERCHANDISE =
            T.let(
              :consumer_damaged_or_defective_merchandise,
              Increase::CardDisputeCreateParams::Visa::Category::TaggedSymbol
            )

          # Consumer: merchandise misrepresentation.
          CONSUMER_MERCHANDISE_MISREPRESENTATION =
            T.let(
              :consumer_merchandise_misrepresentation,
              Increase::CardDisputeCreateParams::Visa::Category::TaggedSymbol
            )

          # Consumer: merchandise not as described.
          CONSUMER_MERCHANDISE_NOT_AS_DESCRIBED =
            T.let(
              :consumer_merchandise_not_as_described,
              Increase::CardDisputeCreateParams::Visa::Category::TaggedSymbol
            )

          # Consumer: merchandise not received.
          CONSUMER_MERCHANDISE_NOT_RECEIVED =
            T.let(
              :consumer_merchandise_not_received,
              Increase::CardDisputeCreateParams::Visa::Category::TaggedSymbol
            )

          # Consumer: non-receipt of cash.
          CONSUMER_NON_RECEIPT_OF_CASH =
            T.let(
              :consumer_non_receipt_of_cash,
              Increase::CardDisputeCreateParams::Visa::Category::TaggedSymbol
            )

          # Consumer: Original Credit Transaction (OCT) not accepted.
          CONSUMER_ORIGINAL_CREDIT_TRANSACTION_NOT_ACCEPTED =
            T.let(
              :consumer_original_credit_transaction_not_accepted,
              Increase::CardDisputeCreateParams::Visa::Category::TaggedSymbol
            )

          # Consumer: merchandise quality issue.
          CONSUMER_QUALITY_MERCHANDISE =
            T.let(
              :consumer_quality_merchandise,
              Increase::CardDisputeCreateParams::Visa::Category::TaggedSymbol
            )

          # Consumer: services quality issue.
          CONSUMER_QUALITY_SERVICES =
            T.let(
              :consumer_quality_services,
              Increase::CardDisputeCreateParams::Visa::Category::TaggedSymbol
            )

          # Consumer: services misrepresentation.
          CONSUMER_SERVICES_MISREPRESENTATION =
            T.let(
              :consumer_services_misrepresentation,
              Increase::CardDisputeCreateParams::Visa::Category::TaggedSymbol
            )

          # Consumer: services not as described.
          CONSUMER_SERVICES_NOT_AS_DESCRIBED =
            T.let(
              :consumer_services_not_as_described,
              Increase::CardDisputeCreateParams::Visa::Category::TaggedSymbol
            )

          # Consumer: services not received.
          CONSUMER_SERVICES_NOT_RECEIVED =
            T.let(
              :consumer_services_not_received,
              Increase::CardDisputeCreateParams::Visa::Category::TaggedSymbol
            )

          # Fraud.
          FRAUD =
            T.let(
              :fraud,
              Increase::CardDisputeCreateParams::Visa::Category::TaggedSymbol
            )

          # Processing error.
          PROCESSING_ERROR =
            T.let(
              :processing_error,
              Increase::CardDisputeCreateParams::Visa::Category::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::CardDisputeCreateParams::Visa::Category::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Authorization < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardDisputeCreateParams::Visa::Authorization,
                Increase::Internal::AnyHash
              )
            end

          # Account status.
          sig do
            returns(
              Increase::CardDisputeCreateParams::Visa::Authorization::AccountStatus::OrSymbol
            )
          end
          attr_accessor :account_status

          # Authorization. Required if and only if `category` is `authorization`.
          sig do
            params(
              account_status:
                Increase::CardDisputeCreateParams::Visa::Authorization::AccountStatus::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Account status.
            account_status:
          )
          end

          sig do
            override.returns(
              {
                account_status:
                  Increase::CardDisputeCreateParams::Visa::Authorization::AccountStatus::OrSymbol
              }
            )
          end
          def to_hash
          end

          # Account status.
          module AccountStatus
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardDisputeCreateParams::Visa::Authorization::AccountStatus
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Account closed.
            ACCOUNT_CLOSED =
              T.let(
                :account_closed,
                Increase::CardDisputeCreateParams::Visa::Authorization::AccountStatus::TaggedSymbol
              )

            # Credit problem.
            CREDIT_PROBLEM =
              T.let(
                :credit_problem,
                Increase::CardDisputeCreateParams::Visa::Authorization::AccountStatus::TaggedSymbol
              )

            # Fraud.
            FRAUD =
              T.let(
                :fraud,
                Increase::CardDisputeCreateParams::Visa::Authorization::AccountStatus::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardDisputeCreateParams::Visa::Authorization::AccountStatus::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class ConsumerCanceledMerchandise < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise,
                Increase::Internal::AnyHash
              )
            end

          # Merchant resolution attempted.
          sig do
            returns(
              Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::MerchantResolutionAttempted::OrSymbol
            )
          end
          attr_accessor :merchant_resolution_attempted

          # Purchase explanation.
          sig { returns(String) }
          attr_accessor :purchase_explanation

          # Received or expected at.
          sig { returns(Date) }
          attr_accessor :received_or_expected_at

          # Return outcome.
          sig do
            returns(
              Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::ReturnOutcome::OrSymbol
            )
          end
          attr_accessor :return_outcome

          # Cardholder cancellation.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::CardholderCancellation
              )
            )
          end
          attr_reader :cardholder_cancellation

          sig do
            params(
              cardholder_cancellation:
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::CardholderCancellation::OrHash
            ).void
          end
          attr_writer :cardholder_cancellation

          # Not returned. Required if and only if `return_outcome` is `not_returned`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::NotReturned
              )
            )
          end
          attr_reader :not_returned

          sig do
            params(
              not_returned:
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::NotReturned::OrHash
            ).void
          end
          attr_writer :not_returned

          # Return attempted. Required if and only if `return_outcome` is
          # `return_attempted`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::ReturnAttempted
              )
            )
          end
          attr_reader :return_attempted

          sig do
            params(
              return_attempted:
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::ReturnAttempted::OrHash
            ).void
          end
          attr_writer :return_attempted

          # Returned. Required if and only if `return_outcome` is `returned`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::Returned
              )
            )
          end
          attr_reader :returned

          sig do
            params(
              returned:
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::Returned::OrHash
            ).void
          end
          attr_writer :returned

          # Canceled merchandise. Required if and only if `category` is
          # `consumer_canceled_merchandise`.
          sig do
            params(
              merchant_resolution_attempted:
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::MerchantResolutionAttempted::OrSymbol,
              purchase_explanation: String,
              received_or_expected_at: Date,
              return_outcome:
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::ReturnOutcome::OrSymbol,
              cardholder_cancellation:
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::CardholderCancellation::OrHash,
              not_returned:
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::NotReturned::OrHash,
              return_attempted:
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::ReturnAttempted::OrHash,
              returned:
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::Returned::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Merchant resolution attempted.
            merchant_resolution_attempted:,
            # Purchase explanation.
            purchase_explanation:,
            # Received or expected at.
            received_or_expected_at:,
            # Return outcome.
            return_outcome:,
            # Cardholder cancellation.
            cardholder_cancellation: nil,
            # Not returned. Required if and only if `return_outcome` is `not_returned`.
            not_returned: nil,
            # Return attempted. Required if and only if `return_outcome` is
            # `return_attempted`.
            return_attempted: nil,
            # Returned. Required if and only if `return_outcome` is `returned`.
            returned: nil
          )
          end

          sig do
            override.returns(
              {
                merchant_resolution_attempted:
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::MerchantResolutionAttempted::OrSymbol,
                purchase_explanation: String,
                received_or_expected_at: Date,
                return_outcome:
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::ReturnOutcome::OrSymbol,
                cardholder_cancellation:
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::CardholderCancellation,
                not_returned:
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::NotReturned,
                return_attempted:
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::ReturnAttempted,
                returned:
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::Returned
              }
            )
          end
          def to_hash
          end

          # Merchant resolution attempted.
          module MerchantResolutionAttempted
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::MerchantResolutionAttempted
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Attempted.
            ATTEMPTED =
              T.let(
                :attempted,
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::MerchantResolutionAttempted::TaggedSymbol
              )

            # Prohibited by local law.
            PROHIBITED_BY_LOCAL_LAW =
              T.let(
                :prohibited_by_local_law,
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::MerchantResolutionAttempted::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::MerchantResolutionAttempted::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # Return outcome.
          module ReturnOutcome
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::ReturnOutcome
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Not returned.
            NOT_RETURNED =
              T.let(
                :not_returned,
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::ReturnOutcome::TaggedSymbol
              )

            # Returned.
            RETURNED =
              T.let(
                :returned,
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::ReturnOutcome::TaggedSymbol
              )

            # Return attempted.
            RETURN_ATTEMPTED =
              T.let(
                :return_attempted,
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::ReturnOutcome::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::ReturnOutcome::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class CardholderCancellation < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::CardholderCancellation,
                  Increase::Internal::AnyHash
                )
              end

            # Canceled at.
            sig { returns(Date) }
            attr_accessor :canceled_at

            # Canceled prior to ship date.
            sig do
              returns(
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::CardholderCancellation::CanceledPriorToShipDate::OrSymbol
              )
            end
            attr_accessor :canceled_prior_to_ship_date

            # Cancellation policy provided.
            sig do
              returns(
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::CardholderCancellation::CancellationPolicyProvided::OrSymbol
              )
            end
            attr_accessor :cancellation_policy_provided

            # Reason.
            sig { returns(String) }
            attr_accessor :reason

            # Cardholder cancellation.
            sig do
              params(
                canceled_at: Date,
                canceled_prior_to_ship_date:
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::CardholderCancellation::CanceledPriorToShipDate::OrSymbol,
                cancellation_policy_provided:
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::CardholderCancellation::CancellationPolicyProvided::OrSymbol,
                reason: String
              ).returns(T.attached_class)
            end
            def self.new(
              # Canceled at.
              canceled_at:,
              # Canceled prior to ship date.
              canceled_prior_to_ship_date:,
              # Cancellation policy provided.
              cancellation_policy_provided:,
              # Reason.
              reason:
            )
            end

            sig do
              override.returns(
                {
                  canceled_at: Date,
                  canceled_prior_to_ship_date:
                    Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::CardholderCancellation::CanceledPriorToShipDate::OrSymbol,
                  cancellation_policy_provided:
                    Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::CardholderCancellation::CancellationPolicyProvided::OrSymbol,
                  reason: String
                }
              )
            end
            def to_hash
            end

            # Canceled prior to ship date.
            module CanceledPriorToShipDate
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::CardholderCancellation::CanceledPriorToShipDate
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Canceled prior to ship date.
              CANCELED_PRIOR_TO_SHIP_DATE =
                T.let(
                  :canceled_prior_to_ship_date,
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::CardholderCancellation::CanceledPriorToShipDate::TaggedSymbol
                )

              # Not canceled prior to ship date.
              NOT_CANCELED_PRIOR_TO_SHIP_DATE =
                T.let(
                  :not_canceled_prior_to_ship_date,
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::CardholderCancellation::CanceledPriorToShipDate::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::CardholderCancellation::CanceledPriorToShipDate::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            # Cancellation policy provided.
            module CancellationPolicyProvided
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::CardholderCancellation::CancellationPolicyProvided
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Not provided.
              NOT_PROVIDED =
                T.let(
                  :not_provided,
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::CardholderCancellation::CancellationPolicyProvided::TaggedSymbol
                )

              # Provided.
              PROVIDED =
                T.let(
                  :provided,
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::CardholderCancellation::CancellationPolicyProvided::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::CardholderCancellation::CancellationPolicyProvided::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class NotReturned < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::NotReturned,
                  Increase::Internal::AnyHash
                )
              end

            # Not returned. Required if and only if `return_outcome` is `not_returned`.
            sig { returns(T.attached_class) }
            def self.new
            end

            sig { override.returns({}) }
            def to_hash
            end
          end

          class ReturnAttempted < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::ReturnAttempted,
                  Increase::Internal::AnyHash
                )
              end

            # Attempt explanation.
            sig { returns(String) }
            attr_accessor :attempt_explanation

            # Attempt reason.
            sig do
              returns(
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::ReturnAttempted::AttemptReason::OrSymbol
              )
            end
            attr_accessor :attempt_reason

            # Attempted at.
            sig { returns(Date) }
            attr_accessor :attempted_at

            # Merchandise disposition.
            sig { returns(String) }
            attr_accessor :merchandise_disposition

            # Return attempted. Required if and only if `return_outcome` is
            # `return_attempted`.
            sig do
              params(
                attempt_explanation: String,
                attempt_reason:
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::ReturnAttempted::AttemptReason::OrSymbol,
                attempted_at: Date,
                merchandise_disposition: String
              ).returns(T.attached_class)
            end
            def self.new(
              # Attempt explanation.
              attempt_explanation:,
              # Attempt reason.
              attempt_reason:,
              # Attempted at.
              attempted_at:,
              # Merchandise disposition.
              merchandise_disposition:
            )
            end

            sig do
              override.returns(
                {
                  attempt_explanation: String,
                  attempt_reason:
                    Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::ReturnAttempted::AttemptReason::OrSymbol,
                  attempted_at: Date,
                  merchandise_disposition: String
                }
              )
            end
            def to_hash
            end

            # Attempt reason.
            module AttemptReason
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::ReturnAttempted::AttemptReason
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Merchant not responding.
              MERCHANT_NOT_RESPONDING =
                T.let(
                  :merchant_not_responding,
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                )

              # No return authorization provided.
              NO_RETURN_AUTHORIZATION_PROVIDED =
                T.let(
                  :no_return_authorization_provided,
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                )

              # No return instructions.
              NO_RETURN_INSTRUCTIONS =
                T.let(
                  :no_return_instructions,
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                )

              # Requested not to return.
              REQUESTED_NOT_TO_RETURN =
                T.let(
                  :requested_not_to_return,
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                )

              # Return not accepted.
              RETURN_NOT_ACCEPTED =
                T.let(
                  :return_not_accepted,
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class Returned < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::Returned,
                  Increase::Internal::AnyHash
                )
              end

            # Return method.
            sig do
              returns(
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::Returned::ReturnMethod::OrSymbol
              )
            end
            attr_accessor :return_method

            # Returned at.
            sig { returns(Date) }
            attr_accessor :returned_at

            # Merchant received return at.
            sig { returns(T.nilable(Date)) }
            attr_reader :merchant_received_return_at

            sig { params(merchant_received_return_at: Date).void }
            attr_writer :merchant_received_return_at

            # Other explanation. Required if and only if the return method is `other`.
            sig { returns(T.nilable(String)) }
            attr_reader :other_explanation

            sig { params(other_explanation: String).void }
            attr_writer :other_explanation

            # Tracking number.
            sig { returns(T.nilable(String)) }
            attr_reader :tracking_number

            sig { params(tracking_number: String).void }
            attr_writer :tracking_number

            # Returned. Required if and only if `return_outcome` is `returned`.
            sig do
              params(
                return_method:
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::Returned::ReturnMethod::OrSymbol,
                returned_at: Date,
                merchant_received_return_at: Date,
                other_explanation: String,
                tracking_number: String
              ).returns(T.attached_class)
            end
            def self.new(
              # Return method.
              return_method:,
              # Returned at.
              returned_at:,
              # Merchant received return at.
              merchant_received_return_at: nil,
              # Other explanation. Required if and only if the return method is `other`.
              other_explanation: nil,
              # Tracking number.
              tracking_number: nil
            )
            end

            sig do
              override.returns(
                {
                  return_method:
                    Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::Returned::ReturnMethod::OrSymbol,
                  returned_at: Date,
                  merchant_received_return_at: Date,
                  other_explanation: String,
                  tracking_number: String
                }
              )
            end
            def to_hash
            end

            # Return method.
            module ReturnMethod
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::Returned::ReturnMethod
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # DHL.
              DHL =
                T.let(
                  :dhl,
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::Returned::ReturnMethod::TaggedSymbol
                )

              # Face-to-face.
              FACE_TO_FACE =
                T.let(
                  :face_to_face,
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::Returned::ReturnMethod::TaggedSymbol
                )

              # FedEx.
              FEDEX =
                T.let(
                  :fedex,
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::Returned::ReturnMethod::TaggedSymbol
                )

              # Other.
              OTHER =
                T.let(
                  :other,
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::Returned::ReturnMethod::TaggedSymbol
                )

              # Postal service.
              POSTAL_SERVICE =
                T.let(
                  :postal_service,
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::Returned::ReturnMethod::TaggedSymbol
                )

              # UPS.
              UPS =
                T.let(
                  :ups,
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::Returned::ReturnMethod::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeCreateParams::Visa::ConsumerCanceledMerchandise::Returned::ReturnMethod::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end

        class ConsumerCanceledRecurringTransaction < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledRecurringTransaction,
                Increase::Internal::AnyHash
              )
            end

          # Cancellation target.
          sig do
            returns(
              Increase::CardDisputeCreateParams::Visa::ConsumerCanceledRecurringTransaction::CancellationTarget::OrSymbol
            )
          end
          attr_accessor :cancellation_target

          # Merchant contact methods.
          sig do
            returns(
              Increase::CardDisputeCreateParams::Visa::ConsumerCanceledRecurringTransaction::MerchantContactMethods
            )
          end
          attr_reader :merchant_contact_methods

          sig do
            params(
              merchant_contact_methods:
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledRecurringTransaction::MerchantContactMethods::OrHash
            ).void
          end
          attr_writer :merchant_contact_methods

          # Transaction or account canceled at.
          sig { returns(Date) }
          attr_accessor :transaction_or_account_canceled_at

          # Other form of payment explanation.
          sig { returns(T.nilable(String)) }
          attr_reader :other_form_of_payment_explanation

          sig { params(other_form_of_payment_explanation: String).void }
          attr_writer :other_form_of_payment_explanation

          # Canceled recurring transaction. Required if and only if `category` is
          # `consumer_canceled_recurring_transaction`.
          sig do
            params(
              cancellation_target:
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledRecurringTransaction::CancellationTarget::OrSymbol,
              merchant_contact_methods:
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledRecurringTransaction::MerchantContactMethods::OrHash,
              transaction_or_account_canceled_at: Date,
              other_form_of_payment_explanation: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Cancellation target.
            cancellation_target:,
            # Merchant contact methods.
            merchant_contact_methods:,
            # Transaction or account canceled at.
            transaction_or_account_canceled_at:,
            # Other form of payment explanation.
            other_form_of_payment_explanation: nil
          )
          end

          sig do
            override.returns(
              {
                cancellation_target:
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledRecurringTransaction::CancellationTarget::OrSymbol,
                merchant_contact_methods:
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledRecurringTransaction::MerchantContactMethods,
                transaction_or_account_canceled_at: Date,
                other_form_of_payment_explanation: String
              }
            )
          end
          def to_hash
          end

          # Cancellation target.
          module CancellationTarget
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledRecurringTransaction::CancellationTarget
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Account.
            ACCOUNT =
              T.let(
                :account,
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledRecurringTransaction::CancellationTarget::TaggedSymbol
              )

            # Transaction.
            TRANSACTION =
              T.let(
                :transaction,
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledRecurringTransaction::CancellationTarget::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledRecurringTransaction::CancellationTarget::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class MerchantContactMethods < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledRecurringTransaction::MerchantContactMethods,
                  Increase::Internal::AnyHash
                )
              end

            # Application name.
            sig { returns(T.nilable(String)) }
            attr_reader :application_name

            sig { params(application_name: String).void }
            attr_writer :application_name

            # Call center phone number.
            sig { returns(T.nilable(String)) }
            attr_reader :call_center_phone_number

            sig { params(call_center_phone_number: String).void }
            attr_writer :call_center_phone_number

            # Email address.
            sig { returns(T.nilable(String)) }
            attr_reader :email_address

            sig { params(email_address: String).void }
            attr_writer :email_address

            # In person address.
            sig { returns(T.nilable(String)) }
            attr_reader :in_person_address

            sig { params(in_person_address: String).void }
            attr_writer :in_person_address

            # Mailing address.
            sig { returns(T.nilable(String)) }
            attr_reader :mailing_address

            sig { params(mailing_address: String).void }
            attr_writer :mailing_address

            # Text phone number.
            sig { returns(T.nilable(String)) }
            attr_reader :text_phone_number

            sig { params(text_phone_number: String).void }
            attr_writer :text_phone_number

            # Merchant contact methods.
            sig do
              params(
                application_name: String,
                call_center_phone_number: String,
                email_address: String,
                in_person_address: String,
                mailing_address: String,
                text_phone_number: String
              ).returns(T.attached_class)
            end
            def self.new(
              # Application name.
              application_name: nil,
              # Call center phone number.
              call_center_phone_number: nil,
              # Email address.
              email_address: nil,
              # In person address.
              in_person_address: nil,
              # Mailing address.
              mailing_address: nil,
              # Text phone number.
              text_phone_number: nil
            )
            end

            sig do
              override.returns(
                {
                  application_name: String,
                  call_center_phone_number: String,
                  email_address: String,
                  in_person_address: String,
                  mailing_address: String,
                  text_phone_number: String
                }
              )
            end
            def to_hash
            end
          end
        end

        class ConsumerCanceledServices < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices,
                Increase::Internal::AnyHash
              )
            end

          # Cardholder cancellation.
          sig do
            returns(
              Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::CardholderCancellation
            )
          end
          attr_reader :cardholder_cancellation

          sig do
            params(
              cardholder_cancellation:
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::CardholderCancellation::OrHash
            ).void
          end
          attr_writer :cardholder_cancellation

          # Contracted at.
          sig { returns(Date) }
          attr_accessor :contracted_at

          # Merchant resolution attempted.
          sig do
            returns(
              Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::MerchantResolutionAttempted::OrSymbol
            )
          end
          attr_accessor :merchant_resolution_attempted

          # Purchase explanation.
          sig { returns(String) }
          attr_accessor :purchase_explanation

          # Service type.
          sig do
            returns(
              Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::ServiceType::OrSymbol
            )
          end
          attr_accessor :service_type

          # Guaranteed reservation explanation. Required if and only if `service_type` is
          # `guaranteed_reservation`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::GuaranteedReservation
              )
            )
          end
          attr_reader :guaranteed_reservation

          sig do
            params(
              guaranteed_reservation:
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::GuaranteedReservation::OrHash
            ).void
          end
          attr_writer :guaranteed_reservation

          # Other service type explanation. Required if and only if `service_type` is
          # `other`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::Other
              )
            )
          end
          attr_reader :other

          sig do
            params(
              other:
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::Other::OrHash
            ).void
          end
          attr_writer :other

          # Timeshare explanation. Required if and only if `service_type` is `timeshare`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::Timeshare
              )
            )
          end
          attr_reader :timeshare

          sig do
            params(
              timeshare:
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::Timeshare::OrHash
            ).void
          end
          attr_writer :timeshare

          # Canceled services. Required if and only if `category` is
          # `consumer_canceled_services`.
          sig do
            params(
              cardholder_cancellation:
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::CardholderCancellation::OrHash,
              contracted_at: Date,
              merchant_resolution_attempted:
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::MerchantResolutionAttempted::OrSymbol,
              purchase_explanation: String,
              service_type:
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::ServiceType::OrSymbol,
              guaranteed_reservation:
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::GuaranteedReservation::OrHash,
              other:
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::Other::OrHash,
              timeshare:
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::Timeshare::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Cardholder cancellation.
            cardholder_cancellation:,
            # Contracted at.
            contracted_at:,
            # Merchant resolution attempted.
            merchant_resolution_attempted:,
            # Purchase explanation.
            purchase_explanation:,
            # Service type.
            service_type:,
            # Guaranteed reservation explanation. Required if and only if `service_type` is
            # `guaranteed_reservation`.
            guaranteed_reservation: nil,
            # Other service type explanation. Required if and only if `service_type` is
            # `other`.
            other: nil,
            # Timeshare explanation. Required if and only if `service_type` is `timeshare`.
            timeshare: nil
          )
          end

          sig do
            override.returns(
              {
                cardholder_cancellation:
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::CardholderCancellation,
                contracted_at: Date,
                merchant_resolution_attempted:
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::MerchantResolutionAttempted::OrSymbol,
                purchase_explanation: String,
                service_type:
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::ServiceType::OrSymbol,
                guaranteed_reservation:
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::GuaranteedReservation,
                other:
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::Other,
                timeshare:
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::Timeshare
              }
            )
          end
          def to_hash
          end

          class CardholderCancellation < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::CardholderCancellation,
                  Increase::Internal::AnyHash
                )
              end

            # Canceled at.
            sig { returns(Date) }
            attr_accessor :canceled_at

            # Cancellation policy provided.
            sig do
              returns(
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::CardholderCancellation::CancellationPolicyProvided::OrSymbol
              )
            end
            attr_accessor :cancellation_policy_provided

            # Reason.
            sig { returns(String) }
            attr_accessor :reason

            # Cardholder cancellation.
            sig do
              params(
                canceled_at: Date,
                cancellation_policy_provided:
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::CardholderCancellation::CancellationPolicyProvided::OrSymbol,
                reason: String
              ).returns(T.attached_class)
            end
            def self.new(
              # Canceled at.
              canceled_at:,
              # Cancellation policy provided.
              cancellation_policy_provided:,
              # Reason.
              reason:
            )
            end

            sig do
              override.returns(
                {
                  canceled_at: Date,
                  cancellation_policy_provided:
                    Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::CardholderCancellation::CancellationPolicyProvided::OrSymbol,
                  reason: String
                }
              )
            end
            def to_hash
            end

            # Cancellation policy provided.
            module CancellationPolicyProvided
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::CardholderCancellation::CancellationPolicyProvided
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Not provided.
              NOT_PROVIDED =
                T.let(
                  :not_provided,
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::CardholderCancellation::CancellationPolicyProvided::TaggedSymbol
                )

              # Provided.
              PROVIDED =
                T.let(
                  :provided,
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::CardholderCancellation::CancellationPolicyProvided::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::CardholderCancellation::CancellationPolicyProvided::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          # Merchant resolution attempted.
          module MerchantResolutionAttempted
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::MerchantResolutionAttempted
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Attempted.
            ATTEMPTED =
              T.let(
                :attempted,
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::MerchantResolutionAttempted::TaggedSymbol
              )

            # Prohibited by local law.
            PROHIBITED_BY_LOCAL_LAW =
              T.let(
                :prohibited_by_local_law,
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::MerchantResolutionAttempted::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::MerchantResolutionAttempted::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # Service type.
          module ServiceType
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::ServiceType
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Guaranteed reservation.
            GUARANTEED_RESERVATION =
              T.let(
                :guaranteed_reservation,
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::ServiceType::TaggedSymbol
              )

            # Other.
            OTHER =
              T.let(
                :other,
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::ServiceType::TaggedSymbol
              )

            # Timeshare.
            TIMESHARE =
              T.let(
                :timeshare,
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::ServiceType::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::ServiceType::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class GuaranteedReservation < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::GuaranteedReservation,
                  Increase::Internal::AnyHash
                )
              end

            # Explanation.
            sig do
              returns(
                Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::GuaranteedReservation::Explanation::OrSymbol
              )
            end
            attr_accessor :explanation

            # Guaranteed reservation explanation. Required if and only if `service_type` is
            # `guaranteed_reservation`.
            sig do
              params(
                explanation:
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::GuaranteedReservation::Explanation::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Explanation.
              explanation:
            )
            end

            sig do
              override.returns(
                {
                  explanation:
                    Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::GuaranteedReservation::Explanation::OrSymbol
                }
              )
            end
            def to_hash
            end

            # Explanation.
            module Explanation
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::GuaranteedReservation::Explanation
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Cardholder canceled prior to service.
              CARDHOLDER_CANCELED_PRIOR_TO_SERVICE =
                T.let(
                  :cardholder_canceled_prior_to_service,
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::GuaranteedReservation::Explanation::TaggedSymbol
                )

              # Cardholder cancellation attempt within 24 hours of confirmation.
              CARDHOLDER_CANCELLATION_ATTEMPT_WITHIN_24_HOURS_OF_CONFIRMATION =
                T.let(
                  :cardholder_cancellation_attempt_within_24_hours_of_confirmation,
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::GuaranteedReservation::Explanation::TaggedSymbol
                )

              # Merchant billed for no-show.
              MERCHANT_BILLED_NO_SHOW =
                T.let(
                  :merchant_billed_no_show,
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::GuaranteedReservation::Explanation::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::GuaranteedReservation::Explanation::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class Other < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::Other,
                  Increase::Internal::AnyHash
                )
              end

            # Other service type explanation. Required if and only if `service_type` is
            # `other`.
            sig { returns(T.attached_class) }
            def self.new
            end

            sig { override.returns({}) }
            def to_hash
            end
          end

          class Timeshare < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDisputeCreateParams::Visa::ConsumerCanceledServices::Timeshare,
                  Increase::Internal::AnyHash
                )
              end

            # Timeshare explanation. Required if and only if `service_type` is `timeshare`.
            sig { returns(T.attached_class) }
            def self.new
            end

            sig { override.returns({}) }
            def to_hash
            end
          end
        end

        class ConsumerCounterfeitMerchandise < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardDisputeCreateParams::Visa::ConsumerCounterfeitMerchandise,
                Increase::Internal::AnyHash
              )
            end

          # Counterfeit explanation.
          sig { returns(String) }
          attr_accessor :counterfeit_explanation

          # Disposition explanation.
          sig { returns(String) }
          attr_accessor :disposition_explanation

          # Order explanation.
          sig { returns(String) }
          attr_accessor :order_explanation

          # Received at.
          sig { returns(Date) }
          attr_accessor :received_at

          # Counterfeit merchandise. Required if and only if `category` is
          # `consumer_counterfeit_merchandise`.
          sig do
            params(
              counterfeit_explanation: String,
              disposition_explanation: String,
              order_explanation: String,
              received_at: Date
            ).returns(T.attached_class)
          end
          def self.new(
            # Counterfeit explanation.
            counterfeit_explanation:,
            # Disposition explanation.
            disposition_explanation:,
            # Order explanation.
            order_explanation:,
            # Received at.
            received_at:
          )
          end

          sig do
            override.returns(
              {
                counterfeit_explanation: String,
                disposition_explanation: String,
                order_explanation: String,
                received_at: Date
              }
            )
          end
          def to_hash
          end
        end

        class ConsumerCreditNotProcessed < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardDisputeCreateParams::Visa::ConsumerCreditNotProcessed,
                Increase::Internal::AnyHash
              )
            end

          # Canceled or returned at.
          sig { returns(T.nilable(Date)) }
          attr_reader :canceled_or_returned_at

          sig { params(canceled_or_returned_at: Date).void }
          attr_writer :canceled_or_returned_at

          # Credit expected at.
          sig { returns(T.nilable(Date)) }
          attr_reader :credit_expected_at

          sig { params(credit_expected_at: Date).void }
          attr_writer :credit_expected_at

          # Credit not processed. Required if and only if `category` is
          # `consumer_credit_not_processed`.
          sig do
            params(
              canceled_or_returned_at: Date,
              credit_expected_at: Date
            ).returns(T.attached_class)
          end
          def self.new(
            # Canceled or returned at.
            canceled_or_returned_at: nil,
            # Credit expected at.
            credit_expected_at: nil
          )
          end

          sig do
            override.returns(
              { canceled_or_returned_at: Date, credit_expected_at: Date }
            )
          end
          def to_hash
          end
        end

        class ConsumerDamagedOrDefectiveMerchandise < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise,
                Increase::Internal::AnyHash
              )
            end

          # Merchant resolution attempted.
          sig do
            returns(
              Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::MerchantResolutionAttempted::OrSymbol
            )
          end
          attr_accessor :merchant_resolution_attempted

          # Order and issue explanation.
          sig { returns(String) }
          attr_accessor :order_and_issue_explanation

          # Received at.
          sig { returns(Date) }
          attr_accessor :received_at

          # Return outcome.
          sig do
            returns(
              Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::ReturnOutcome::OrSymbol
            )
          end
          attr_accessor :return_outcome

          # Not returned. Required if and only if `return_outcome` is `not_returned`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::NotReturned
              )
            )
          end
          attr_reader :not_returned

          sig do
            params(
              not_returned:
                Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::NotReturned::OrHash
            ).void
          end
          attr_writer :not_returned

          # Return attempted. Required if and only if `return_outcome` is
          # `return_attempted`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted
              )
            )
          end
          attr_reader :return_attempted

          sig do
            params(
              return_attempted:
                Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::OrHash
            ).void
          end
          attr_writer :return_attempted

          # Returned. Required if and only if `return_outcome` is `returned`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::Returned
              )
            )
          end
          attr_reader :returned

          sig do
            params(
              returned:
                Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::Returned::OrHash
            ).void
          end
          attr_writer :returned

          # Damaged or defective merchandise. Required if and only if `category` is
          # `consumer_damaged_or_defective_merchandise`.
          sig do
            params(
              merchant_resolution_attempted:
                Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::MerchantResolutionAttempted::OrSymbol,
              order_and_issue_explanation: String,
              received_at: Date,
              return_outcome:
                Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::ReturnOutcome::OrSymbol,
              not_returned:
                Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::NotReturned::OrHash,
              return_attempted:
                Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::OrHash,
              returned:
                Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::Returned::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Merchant resolution attempted.
            merchant_resolution_attempted:,
            # Order and issue explanation.
            order_and_issue_explanation:,
            # Received at.
            received_at:,
            # Return outcome.
            return_outcome:,
            # Not returned. Required if and only if `return_outcome` is `not_returned`.
            not_returned: nil,
            # Return attempted. Required if and only if `return_outcome` is
            # `return_attempted`.
            return_attempted: nil,
            # Returned. Required if and only if `return_outcome` is `returned`.
            returned: nil
          )
          end

          sig do
            override.returns(
              {
                merchant_resolution_attempted:
                  Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::MerchantResolutionAttempted::OrSymbol,
                order_and_issue_explanation: String,
                received_at: Date,
                return_outcome:
                  Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::ReturnOutcome::OrSymbol,
                not_returned:
                  Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::NotReturned,
                return_attempted:
                  Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted,
                returned:
                  Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::Returned
              }
            )
          end
          def to_hash
          end

          # Merchant resolution attempted.
          module MerchantResolutionAttempted
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::MerchantResolutionAttempted
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Attempted.
            ATTEMPTED =
              T.let(
                :attempted,
                Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::MerchantResolutionAttempted::TaggedSymbol
              )

            # Prohibited by local law.
            PROHIBITED_BY_LOCAL_LAW =
              T.let(
                :prohibited_by_local_law,
                Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::MerchantResolutionAttempted::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::MerchantResolutionAttempted::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # Return outcome.
          module ReturnOutcome
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::ReturnOutcome
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Not returned.
            NOT_RETURNED =
              T.let(
                :not_returned,
                Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::ReturnOutcome::TaggedSymbol
              )

            # Returned.
            RETURNED =
              T.let(
                :returned,
                Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::ReturnOutcome::TaggedSymbol
              )

            # Return attempted.
            RETURN_ATTEMPTED =
              T.let(
                :return_attempted,
                Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::ReturnOutcome::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::ReturnOutcome::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class NotReturned < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::NotReturned,
                  Increase::Internal::AnyHash
                )
              end

            # Not returned. Required if and only if `return_outcome` is `not_returned`.
            sig { returns(T.attached_class) }
            def self.new
            end

            sig { override.returns({}) }
            def to_hash
            end
          end

          class ReturnAttempted < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted,
                  Increase::Internal::AnyHash
                )
              end

            # Attempt explanation.
            sig { returns(String) }
            attr_accessor :attempt_explanation

            # Attempt reason.
            sig do
              returns(
                Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::AttemptReason::OrSymbol
              )
            end
            attr_accessor :attempt_reason

            # Attempted at.
            sig { returns(Date) }
            attr_accessor :attempted_at

            # Merchandise disposition.
            sig { returns(String) }
            attr_accessor :merchandise_disposition

            # Return attempted. Required if and only if `return_outcome` is
            # `return_attempted`.
            sig do
              params(
                attempt_explanation: String,
                attempt_reason:
                  Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::AttemptReason::OrSymbol,
                attempted_at: Date,
                merchandise_disposition: String
              ).returns(T.attached_class)
            end
            def self.new(
              # Attempt explanation.
              attempt_explanation:,
              # Attempt reason.
              attempt_reason:,
              # Attempted at.
              attempted_at:,
              # Merchandise disposition.
              merchandise_disposition:
            )
            end

            sig do
              override.returns(
                {
                  attempt_explanation: String,
                  attempt_reason:
                    Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::AttemptReason::OrSymbol,
                  attempted_at: Date,
                  merchandise_disposition: String
                }
              )
            end
            def to_hash
            end

            # Attempt reason.
            module AttemptReason
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::AttemptReason
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Merchant not responding.
              MERCHANT_NOT_RESPONDING =
                T.let(
                  :merchant_not_responding,
                  Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                )

              # No return authorization provided.
              NO_RETURN_AUTHORIZATION_PROVIDED =
                T.let(
                  :no_return_authorization_provided,
                  Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                )

              # No return instructions.
              NO_RETURN_INSTRUCTIONS =
                T.let(
                  :no_return_instructions,
                  Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                )

              # Requested not to return.
              REQUESTED_NOT_TO_RETURN =
                T.let(
                  :requested_not_to_return,
                  Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                )

              # Return not accepted.
              RETURN_NOT_ACCEPTED =
                T.let(
                  :return_not_accepted,
                  Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class Returned < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::Returned,
                  Increase::Internal::AnyHash
                )
              end

            # Return method.
            sig do
              returns(
                Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod::OrSymbol
              )
            end
            attr_accessor :return_method

            # Returned at.
            sig { returns(Date) }
            attr_accessor :returned_at

            # Merchant received return at.
            sig { returns(T.nilable(Date)) }
            attr_reader :merchant_received_return_at

            sig { params(merchant_received_return_at: Date).void }
            attr_writer :merchant_received_return_at

            # Other explanation. Required if and only if the return method is `other`.
            sig { returns(T.nilable(String)) }
            attr_reader :other_explanation

            sig { params(other_explanation: String).void }
            attr_writer :other_explanation

            # Tracking number.
            sig { returns(T.nilable(String)) }
            attr_reader :tracking_number

            sig { params(tracking_number: String).void }
            attr_writer :tracking_number

            # Returned. Required if and only if `return_outcome` is `returned`.
            sig do
              params(
                return_method:
                  Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod::OrSymbol,
                returned_at: Date,
                merchant_received_return_at: Date,
                other_explanation: String,
                tracking_number: String
              ).returns(T.attached_class)
            end
            def self.new(
              # Return method.
              return_method:,
              # Returned at.
              returned_at:,
              # Merchant received return at.
              merchant_received_return_at: nil,
              # Other explanation. Required if and only if the return method is `other`.
              other_explanation: nil,
              # Tracking number.
              tracking_number: nil
            )
            end

            sig do
              override.returns(
                {
                  return_method:
                    Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod::OrSymbol,
                  returned_at: Date,
                  merchant_received_return_at: Date,
                  other_explanation: String,
                  tracking_number: String
                }
              )
            end
            def to_hash
            end

            # Return method.
            module ReturnMethod
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # DHL.
              DHL =
                T.let(
                  :dhl,
                  Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod::TaggedSymbol
                )

              # Face-to-face.
              FACE_TO_FACE =
                T.let(
                  :face_to_face,
                  Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod::TaggedSymbol
                )

              # FedEx.
              FEDEX =
                T.let(
                  :fedex,
                  Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod::TaggedSymbol
                )

              # Other.
              OTHER =
                T.let(
                  :other,
                  Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod::TaggedSymbol
                )

              # Postal service.
              POSTAL_SERVICE =
                T.let(
                  :postal_service,
                  Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod::TaggedSymbol
                )

              # UPS.
              UPS =
                T.let(
                  :ups,
                  Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeCreateParams::Visa::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end

        class ConsumerMerchandiseMisrepresentation < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation,
                Increase::Internal::AnyHash
              )
            end

          # Merchant resolution attempted.
          sig do
            returns(
              Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::MerchantResolutionAttempted::OrSymbol
            )
          end
          attr_accessor :merchant_resolution_attempted

          # Misrepresentation explanation.
          sig { returns(String) }
          attr_accessor :misrepresentation_explanation

          # Purchase explanation.
          sig { returns(String) }
          attr_accessor :purchase_explanation

          # Received at.
          sig { returns(Date) }
          attr_accessor :received_at

          # Return outcome.
          sig do
            returns(
              Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::ReturnOutcome::OrSymbol
            )
          end
          attr_accessor :return_outcome

          # Not returned. Required if and only if `return_outcome` is `not_returned`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::NotReturned
              )
            )
          end
          attr_reader :not_returned

          sig do
            params(
              not_returned:
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::NotReturned::OrHash
            ).void
          end
          attr_writer :not_returned

          # Return attempted. Required if and only if `return_outcome` is
          # `return_attempted`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::ReturnAttempted
              )
            )
          end
          attr_reader :return_attempted

          sig do
            params(
              return_attempted:
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::ReturnAttempted::OrHash
            ).void
          end
          attr_writer :return_attempted

          # Returned. Required if and only if `return_outcome` is `returned`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::Returned
              )
            )
          end
          attr_reader :returned

          sig do
            params(
              returned:
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::Returned::OrHash
            ).void
          end
          attr_writer :returned

          # Merchandise misrepresentation. Required if and only if `category` is
          # `consumer_merchandise_misrepresentation`.
          sig do
            params(
              merchant_resolution_attempted:
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::MerchantResolutionAttempted::OrSymbol,
              misrepresentation_explanation: String,
              purchase_explanation: String,
              received_at: Date,
              return_outcome:
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::ReturnOutcome::OrSymbol,
              not_returned:
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::NotReturned::OrHash,
              return_attempted:
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::ReturnAttempted::OrHash,
              returned:
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::Returned::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Merchant resolution attempted.
            merchant_resolution_attempted:,
            # Misrepresentation explanation.
            misrepresentation_explanation:,
            # Purchase explanation.
            purchase_explanation:,
            # Received at.
            received_at:,
            # Return outcome.
            return_outcome:,
            # Not returned. Required if and only if `return_outcome` is `not_returned`.
            not_returned: nil,
            # Return attempted. Required if and only if `return_outcome` is
            # `return_attempted`.
            return_attempted: nil,
            # Returned. Required if and only if `return_outcome` is `returned`.
            returned: nil
          )
          end

          sig do
            override.returns(
              {
                merchant_resolution_attempted:
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::MerchantResolutionAttempted::OrSymbol,
                misrepresentation_explanation: String,
                purchase_explanation: String,
                received_at: Date,
                return_outcome:
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::ReturnOutcome::OrSymbol,
                not_returned:
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::NotReturned,
                return_attempted:
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::ReturnAttempted,
                returned:
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::Returned
              }
            )
          end
          def to_hash
          end

          # Merchant resolution attempted.
          module MerchantResolutionAttempted
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::MerchantResolutionAttempted
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Attempted.
            ATTEMPTED =
              T.let(
                :attempted,
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::MerchantResolutionAttempted::TaggedSymbol
              )

            # Prohibited by local law.
            PROHIBITED_BY_LOCAL_LAW =
              T.let(
                :prohibited_by_local_law,
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::MerchantResolutionAttempted::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::MerchantResolutionAttempted::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # Return outcome.
          module ReturnOutcome
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::ReturnOutcome
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Not returned.
            NOT_RETURNED =
              T.let(
                :not_returned,
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::ReturnOutcome::TaggedSymbol
              )

            # Returned.
            RETURNED =
              T.let(
                :returned,
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::ReturnOutcome::TaggedSymbol
              )

            # Return attempted.
            RETURN_ATTEMPTED =
              T.let(
                :return_attempted,
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::ReturnOutcome::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::ReturnOutcome::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class NotReturned < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::NotReturned,
                  Increase::Internal::AnyHash
                )
              end

            # Not returned. Required if and only if `return_outcome` is `not_returned`.
            sig { returns(T.attached_class) }
            def self.new
            end

            sig { override.returns({}) }
            def to_hash
            end
          end

          class ReturnAttempted < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::ReturnAttempted,
                  Increase::Internal::AnyHash
                )
              end

            # Attempt explanation.
            sig { returns(String) }
            attr_accessor :attempt_explanation

            # Attempt reason.
            sig do
              returns(
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::ReturnAttempted::AttemptReason::OrSymbol
              )
            end
            attr_accessor :attempt_reason

            # Attempted at.
            sig { returns(Date) }
            attr_accessor :attempted_at

            # Merchandise disposition.
            sig { returns(String) }
            attr_accessor :merchandise_disposition

            # Return attempted. Required if and only if `return_outcome` is
            # `return_attempted`.
            sig do
              params(
                attempt_explanation: String,
                attempt_reason:
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::ReturnAttempted::AttemptReason::OrSymbol,
                attempted_at: Date,
                merchandise_disposition: String
              ).returns(T.attached_class)
            end
            def self.new(
              # Attempt explanation.
              attempt_explanation:,
              # Attempt reason.
              attempt_reason:,
              # Attempted at.
              attempted_at:,
              # Merchandise disposition.
              merchandise_disposition:
            )
            end

            sig do
              override.returns(
                {
                  attempt_explanation: String,
                  attempt_reason:
                    Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::ReturnAttempted::AttemptReason::OrSymbol,
                  attempted_at: Date,
                  merchandise_disposition: String
                }
              )
            end
            def to_hash
            end

            # Attempt reason.
            module AttemptReason
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::ReturnAttempted::AttemptReason
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Merchant not responding.
              MERCHANT_NOT_RESPONDING =
                T.let(
                  :merchant_not_responding,
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::ReturnAttempted::AttemptReason::TaggedSymbol
                )

              # No return authorization provided.
              NO_RETURN_AUTHORIZATION_PROVIDED =
                T.let(
                  :no_return_authorization_provided,
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::ReturnAttempted::AttemptReason::TaggedSymbol
                )

              # No return instructions.
              NO_RETURN_INSTRUCTIONS =
                T.let(
                  :no_return_instructions,
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::ReturnAttempted::AttemptReason::TaggedSymbol
                )

              # Requested not to return.
              REQUESTED_NOT_TO_RETURN =
                T.let(
                  :requested_not_to_return,
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::ReturnAttempted::AttemptReason::TaggedSymbol
                )

              # Return not accepted.
              RETURN_NOT_ACCEPTED =
                T.let(
                  :return_not_accepted,
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::ReturnAttempted::AttemptReason::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::ReturnAttempted::AttemptReason::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class Returned < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::Returned,
                  Increase::Internal::AnyHash
                )
              end

            # Return method.
            sig do
              returns(
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod::OrSymbol
              )
            end
            attr_accessor :return_method

            # Returned at.
            sig { returns(Date) }
            attr_accessor :returned_at

            # Merchant received return at.
            sig { returns(T.nilable(Date)) }
            attr_reader :merchant_received_return_at

            sig { params(merchant_received_return_at: Date).void }
            attr_writer :merchant_received_return_at

            # Other explanation. Required if and only if the return method is `other`.
            sig { returns(T.nilable(String)) }
            attr_reader :other_explanation

            sig { params(other_explanation: String).void }
            attr_writer :other_explanation

            # Tracking number.
            sig { returns(T.nilable(String)) }
            attr_reader :tracking_number

            sig { params(tracking_number: String).void }
            attr_writer :tracking_number

            # Returned. Required if and only if `return_outcome` is `returned`.
            sig do
              params(
                return_method:
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod::OrSymbol,
                returned_at: Date,
                merchant_received_return_at: Date,
                other_explanation: String,
                tracking_number: String
              ).returns(T.attached_class)
            end
            def self.new(
              # Return method.
              return_method:,
              # Returned at.
              returned_at:,
              # Merchant received return at.
              merchant_received_return_at: nil,
              # Other explanation. Required if and only if the return method is `other`.
              other_explanation: nil,
              # Tracking number.
              tracking_number: nil
            )
            end

            sig do
              override.returns(
                {
                  return_method:
                    Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod::OrSymbol,
                  returned_at: Date,
                  merchant_received_return_at: Date,
                  other_explanation: String,
                  tracking_number: String
                }
              )
            end
            def to_hash
            end

            # Return method.
            module ReturnMethod
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # DHL.
              DHL =
                T.let(
                  :dhl,
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod::TaggedSymbol
                )

              # Face-to-face.
              FACE_TO_FACE =
                T.let(
                  :face_to_face,
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod::TaggedSymbol
                )

              # FedEx.
              FEDEX =
                T.let(
                  :fedex,
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod::TaggedSymbol
                )

              # Other.
              OTHER =
                T.let(
                  :other,
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod::TaggedSymbol
                )

              # Postal service.
              POSTAL_SERVICE =
                T.let(
                  :postal_service,
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod::TaggedSymbol
                )

              # UPS.
              UPS =
                T.let(
                  :ups,
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end

        class ConsumerMerchandiseNotAsDescribed < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed,
                Increase::Internal::AnyHash
              )
            end

          # Merchant resolution attempted.
          sig do
            returns(
              Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::MerchantResolutionAttempted::OrSymbol
            )
          end
          attr_accessor :merchant_resolution_attempted

          # Received at.
          sig { returns(Date) }
          attr_accessor :received_at

          # Return outcome.
          sig do
            returns(
              Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::ReturnOutcome::OrSymbol
            )
          end
          attr_accessor :return_outcome

          # Return attempted. Required if and only if `return_outcome` is
          # `return_attempted`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::ReturnAttempted
              )
            )
          end
          attr_reader :return_attempted

          sig do
            params(
              return_attempted:
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::OrHash
            ).void
          end
          attr_writer :return_attempted

          # Returned. Required if and only if `return_outcome` is `returned`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::Returned
              )
            )
          end
          attr_reader :returned

          sig do
            params(
              returned:
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::Returned::OrHash
            ).void
          end
          attr_writer :returned

          # Merchandise not as described. Required if and only if `category` is
          # `consumer_merchandise_not_as_described`.
          sig do
            params(
              merchant_resolution_attempted:
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::MerchantResolutionAttempted::OrSymbol,
              received_at: Date,
              return_outcome:
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::ReturnOutcome::OrSymbol,
              return_attempted:
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::OrHash,
              returned:
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::Returned::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Merchant resolution attempted.
            merchant_resolution_attempted:,
            # Received at.
            received_at:,
            # Return outcome.
            return_outcome:,
            # Return attempted. Required if and only if `return_outcome` is
            # `return_attempted`.
            return_attempted: nil,
            # Returned. Required if and only if `return_outcome` is `returned`.
            returned: nil
          )
          end

          sig do
            override.returns(
              {
                merchant_resolution_attempted:
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::MerchantResolutionAttempted::OrSymbol,
                received_at: Date,
                return_outcome:
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::ReturnOutcome::OrSymbol,
                return_attempted:
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::ReturnAttempted,
                returned:
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::Returned
              }
            )
          end
          def to_hash
          end

          # Merchant resolution attempted.
          module MerchantResolutionAttempted
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::MerchantResolutionAttempted
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Attempted.
            ATTEMPTED =
              T.let(
                :attempted,
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::MerchantResolutionAttempted::TaggedSymbol
              )

            # Prohibited by local law.
            PROHIBITED_BY_LOCAL_LAW =
              T.let(
                :prohibited_by_local_law,
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::MerchantResolutionAttempted::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::MerchantResolutionAttempted::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # Return outcome.
          module ReturnOutcome
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::ReturnOutcome
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Returned.
            RETURNED =
              T.let(
                :returned,
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::ReturnOutcome::TaggedSymbol
              )

            # Return attempted.
            RETURN_ATTEMPTED =
              T.let(
                :return_attempted,
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::ReturnOutcome::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::ReturnOutcome::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class ReturnAttempted < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::ReturnAttempted,
                  Increase::Internal::AnyHash
                )
              end

            # Attempt explanation.
            sig { returns(String) }
            attr_accessor :attempt_explanation

            # Attempt reason.
            sig do
              returns(
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::AttemptReason::OrSymbol
              )
            end
            attr_accessor :attempt_reason

            # Attempted at.
            sig { returns(Date) }
            attr_accessor :attempted_at

            # Merchandise disposition.
            sig { returns(String) }
            attr_accessor :merchandise_disposition

            # Return attempted. Required if and only if `return_outcome` is
            # `return_attempted`.
            sig do
              params(
                attempt_explanation: String,
                attempt_reason:
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::AttemptReason::OrSymbol,
                attempted_at: Date,
                merchandise_disposition: String
              ).returns(T.attached_class)
            end
            def self.new(
              # Attempt explanation.
              attempt_explanation:,
              # Attempt reason.
              attempt_reason:,
              # Attempted at.
              attempted_at:,
              # Merchandise disposition.
              merchandise_disposition:
            )
            end

            sig do
              override.returns(
                {
                  attempt_explanation: String,
                  attempt_reason:
                    Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::AttemptReason::OrSymbol,
                  attempted_at: Date,
                  merchandise_disposition: String
                }
              )
            end
            def to_hash
            end

            # Attempt reason.
            module AttemptReason
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::AttemptReason
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Merchant not responding.
              MERCHANT_NOT_RESPONDING =
                T.let(
                  :merchant_not_responding,
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::AttemptReason::TaggedSymbol
                )

              # No return authorization provided.
              NO_RETURN_AUTHORIZATION_PROVIDED =
                T.let(
                  :no_return_authorization_provided,
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::AttemptReason::TaggedSymbol
                )

              # No return instructions.
              NO_RETURN_INSTRUCTIONS =
                T.let(
                  :no_return_instructions,
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::AttemptReason::TaggedSymbol
                )

              # Requested not to return.
              REQUESTED_NOT_TO_RETURN =
                T.let(
                  :requested_not_to_return,
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::AttemptReason::TaggedSymbol
                )

              # Return not accepted.
              RETURN_NOT_ACCEPTED =
                T.let(
                  :return_not_accepted,
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::AttemptReason::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::AttemptReason::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class Returned < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::Returned,
                  Increase::Internal::AnyHash
                )
              end

            # Return method.
            sig do
              returns(
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod::OrSymbol
              )
            end
            attr_accessor :return_method

            # Returned at.
            sig { returns(Date) }
            attr_accessor :returned_at

            # Merchant received return at.
            sig { returns(T.nilable(Date)) }
            attr_reader :merchant_received_return_at

            sig { params(merchant_received_return_at: Date).void }
            attr_writer :merchant_received_return_at

            # Other explanation. Required if and only if the return method is `other`.
            sig { returns(T.nilable(String)) }
            attr_reader :other_explanation

            sig { params(other_explanation: String).void }
            attr_writer :other_explanation

            # Tracking number.
            sig { returns(T.nilable(String)) }
            attr_reader :tracking_number

            sig { params(tracking_number: String).void }
            attr_writer :tracking_number

            # Returned. Required if and only if `return_outcome` is `returned`.
            sig do
              params(
                return_method:
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod::OrSymbol,
                returned_at: Date,
                merchant_received_return_at: Date,
                other_explanation: String,
                tracking_number: String
              ).returns(T.attached_class)
            end
            def self.new(
              # Return method.
              return_method:,
              # Returned at.
              returned_at:,
              # Merchant received return at.
              merchant_received_return_at: nil,
              # Other explanation. Required if and only if the return method is `other`.
              other_explanation: nil,
              # Tracking number.
              tracking_number: nil
            )
            end

            sig do
              override.returns(
                {
                  return_method:
                    Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod::OrSymbol,
                  returned_at: Date,
                  merchant_received_return_at: Date,
                  other_explanation: String,
                  tracking_number: String
                }
              )
            end
            def to_hash
            end

            # Return method.
            module ReturnMethod
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # DHL.
              DHL =
                T.let(
                  :dhl,
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod::TaggedSymbol
                )

              # Face-to-face.
              FACE_TO_FACE =
                T.let(
                  :face_to_face,
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod::TaggedSymbol
                )

              # FedEx.
              FEDEX =
                T.let(
                  :fedex,
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod::TaggedSymbol
                )

              # Other.
              OTHER =
                T.let(
                  :other,
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod::TaggedSymbol
                )

              # Postal service.
              POSTAL_SERVICE =
                T.let(
                  :postal_service,
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod::TaggedSymbol
                )

              # UPS.
              UPS =
                T.let(
                  :ups,
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end

        class ConsumerMerchandiseNotReceived < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived,
                Increase::Internal::AnyHash
              )
            end

          # Cancellation outcome.
          sig do
            returns(
              Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::CancellationOutcome::OrSymbol
            )
          end
          attr_accessor :cancellation_outcome

          # Delivery issue.
          sig do
            returns(
              Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::DeliveryIssue::OrSymbol
            )
          end
          attr_accessor :delivery_issue

          # Last expected receipt at.
          sig { returns(Date) }
          attr_accessor :last_expected_receipt_at

          # Merchant resolution attempted.
          sig do
            returns(
              Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::MerchantResolutionAttempted::OrSymbol
            )
          end
          attr_accessor :merchant_resolution_attempted

          # Purchase information and explanation.
          sig { returns(String) }
          attr_accessor :purchase_info_and_explanation

          # Cardholder cancellation prior to expected receipt. Required if and only if
          # `cancellation_outcome` is `cardholder_cancellation_prior_to_expected_receipt`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::CardholderCancellationPriorToExpectedReceipt
              )
            )
          end
          attr_reader :cardholder_cancellation_prior_to_expected_receipt

          sig do
            params(
              cardholder_cancellation_prior_to_expected_receipt:
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::CardholderCancellationPriorToExpectedReceipt::OrHash
            ).void
          end
          attr_writer :cardholder_cancellation_prior_to_expected_receipt

          # Delayed. Required if and only if `delivery_issue` is `delayed`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed
              )
            )
          end
          attr_reader :delayed

          sig do
            params(
              delayed:
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed::OrHash
            ).void
          end
          attr_writer :delayed

          # Delivered to wrong location. Required if and only if `delivery_issue` is
          # `delivered_to_wrong_location`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::DeliveredToWrongLocation
              )
            )
          end
          attr_reader :delivered_to_wrong_location

          sig do
            params(
              delivered_to_wrong_location:
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::DeliveredToWrongLocation::OrHash
            ).void
          end
          attr_writer :delivered_to_wrong_location

          # Merchant cancellation. Required if and only if `cancellation_outcome` is
          # `merchant_cancellation`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::MerchantCancellation
              )
            )
          end
          attr_reader :merchant_cancellation

          sig do
            params(
              merchant_cancellation:
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::MerchantCancellation::OrHash
            ).void
          end
          attr_writer :merchant_cancellation

          # No cancellation. Required if and only if `cancellation_outcome` is
          # `no_cancellation`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::NoCancellation
              )
            )
          end
          attr_reader :no_cancellation

          sig do
            params(
              no_cancellation:
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::NoCancellation::OrHash
            ).void
          end
          attr_writer :no_cancellation

          # Merchandise not received. Required if and only if `category` is
          # `consumer_merchandise_not_received`.
          sig do
            params(
              cancellation_outcome:
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::CancellationOutcome::OrSymbol,
              delivery_issue:
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::DeliveryIssue::OrSymbol,
              last_expected_receipt_at: Date,
              merchant_resolution_attempted:
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::MerchantResolutionAttempted::OrSymbol,
              purchase_info_and_explanation: String,
              cardholder_cancellation_prior_to_expected_receipt:
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::CardholderCancellationPriorToExpectedReceipt::OrHash,
              delayed:
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed::OrHash,
              delivered_to_wrong_location:
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::DeliveredToWrongLocation::OrHash,
              merchant_cancellation:
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::MerchantCancellation::OrHash,
              no_cancellation:
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::NoCancellation::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Cancellation outcome.
            cancellation_outcome:,
            # Delivery issue.
            delivery_issue:,
            # Last expected receipt at.
            last_expected_receipt_at:,
            # Merchant resolution attempted.
            merchant_resolution_attempted:,
            # Purchase information and explanation.
            purchase_info_and_explanation:,
            # Cardholder cancellation prior to expected receipt. Required if and only if
            # `cancellation_outcome` is `cardholder_cancellation_prior_to_expected_receipt`.
            cardholder_cancellation_prior_to_expected_receipt: nil,
            # Delayed. Required if and only if `delivery_issue` is `delayed`.
            delayed: nil,
            # Delivered to wrong location. Required if and only if `delivery_issue` is
            # `delivered_to_wrong_location`.
            delivered_to_wrong_location: nil,
            # Merchant cancellation. Required if and only if `cancellation_outcome` is
            # `merchant_cancellation`.
            merchant_cancellation: nil,
            # No cancellation. Required if and only if `cancellation_outcome` is
            # `no_cancellation`.
            no_cancellation: nil
          )
          end

          sig do
            override.returns(
              {
                cancellation_outcome:
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::CancellationOutcome::OrSymbol,
                delivery_issue:
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::DeliveryIssue::OrSymbol,
                last_expected_receipt_at: Date,
                merchant_resolution_attempted:
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::MerchantResolutionAttempted::OrSymbol,
                purchase_info_and_explanation: String,
                cardholder_cancellation_prior_to_expected_receipt:
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::CardholderCancellationPriorToExpectedReceipt,
                delayed:
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed,
                delivered_to_wrong_location:
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::DeliveredToWrongLocation,
                merchant_cancellation:
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::MerchantCancellation,
                no_cancellation:
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::NoCancellation
              }
            )
          end
          def to_hash
          end

          # Cancellation outcome.
          module CancellationOutcome
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::CancellationOutcome
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Cardholder cancellation prior to expected receipt.
            CARDHOLDER_CANCELLATION_PRIOR_TO_EXPECTED_RECEIPT =
              T.let(
                :cardholder_cancellation_prior_to_expected_receipt,
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::CancellationOutcome::TaggedSymbol
              )

            # Merchant cancellation.
            MERCHANT_CANCELLATION =
              T.let(
                :merchant_cancellation,
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::CancellationOutcome::TaggedSymbol
              )

            # No cancellation.
            NO_CANCELLATION =
              T.let(
                :no_cancellation,
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::CancellationOutcome::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::CancellationOutcome::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # Delivery issue.
          module DeliveryIssue
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::DeliveryIssue
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Delayed.
            DELAYED =
              T.let(
                :delayed,
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::DeliveryIssue::TaggedSymbol
              )

            # Delivered to wrong location.
            DELIVERED_TO_WRONG_LOCATION =
              T.let(
                :delivered_to_wrong_location,
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::DeliveryIssue::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::DeliveryIssue::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # Merchant resolution attempted.
          module MerchantResolutionAttempted
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::MerchantResolutionAttempted
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Attempted.
            ATTEMPTED =
              T.let(
                :attempted,
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::MerchantResolutionAttempted::TaggedSymbol
              )

            # Prohibited by local law.
            PROHIBITED_BY_LOCAL_LAW =
              T.let(
                :prohibited_by_local_law,
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::MerchantResolutionAttempted::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::MerchantResolutionAttempted::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class CardholderCancellationPriorToExpectedReceipt < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::CardholderCancellationPriorToExpectedReceipt,
                  Increase::Internal::AnyHash
                )
              end

            # Canceled at.
            sig { returns(Date) }
            attr_accessor :canceled_at

            # Reason.
            sig { returns(T.nilable(String)) }
            attr_reader :reason

            sig { params(reason: String).void }
            attr_writer :reason

            # Cardholder cancellation prior to expected receipt. Required if and only if
            # `cancellation_outcome` is `cardholder_cancellation_prior_to_expected_receipt`.
            sig do
              params(canceled_at: Date, reason: String).returns(
                T.attached_class
              )
            end
            def self.new(
              # Canceled at.
              canceled_at:,
              # Reason.
              reason: nil
            )
            end

            sig { override.returns({ canceled_at: Date, reason: String }) }
            def to_hash
            end
          end

          class Delayed < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed,
                  Increase::Internal::AnyHash
                )
              end

            # Explanation.
            sig { returns(String) }
            attr_accessor :explanation

            # Return outcome.
            sig do
              returns(
                Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed::ReturnOutcome::OrSymbol
              )
            end
            attr_accessor :return_outcome

            # Not returned. Required if and only if `return_outcome` is `not_returned`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed::NotReturned
                )
              )
            end
            attr_reader :not_returned

            sig do
              params(
                not_returned:
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed::NotReturned::OrHash
              ).void
            end
            attr_writer :not_returned

            # Return attempted. Required if and only if `return_outcome` is
            # `return_attempted`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed::ReturnAttempted
                )
              )
            end
            attr_reader :return_attempted

            sig do
              params(
                return_attempted:
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed::ReturnAttempted::OrHash
              ).void
            end
            attr_writer :return_attempted

            # Returned. Required if and only if `return_outcome` is `returned`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed::Returned
                )
              )
            end
            attr_reader :returned

            sig do
              params(
                returned:
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed::Returned::OrHash
              ).void
            end
            attr_writer :returned

            # Delayed. Required if and only if `delivery_issue` is `delayed`.
            sig do
              params(
                explanation: String,
                return_outcome:
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed::ReturnOutcome::OrSymbol,
                not_returned:
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed::NotReturned::OrHash,
                return_attempted:
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed::ReturnAttempted::OrHash,
                returned:
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed::Returned::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # Explanation.
              explanation:,
              # Return outcome.
              return_outcome:,
              # Not returned. Required if and only if `return_outcome` is `not_returned`.
              not_returned: nil,
              # Return attempted. Required if and only if `return_outcome` is
              # `return_attempted`.
              return_attempted: nil,
              # Returned. Required if and only if `return_outcome` is `returned`.
              returned: nil
            )
            end

            sig do
              override.returns(
                {
                  explanation: String,
                  return_outcome:
                    Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed::ReturnOutcome::OrSymbol,
                  not_returned:
                    Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed::NotReturned,
                  return_attempted:
                    Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed::ReturnAttempted,
                  returned:
                    Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed::Returned
                }
              )
            end
            def to_hash
            end

            # Return outcome.
            module ReturnOutcome
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed::ReturnOutcome
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Not returned.
              NOT_RETURNED =
                T.let(
                  :not_returned,
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed::ReturnOutcome::TaggedSymbol
                )

              # Returned.
              RETURNED =
                T.let(
                  :returned,
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed::ReturnOutcome::TaggedSymbol
                )

              # Return attempted.
              RETURN_ATTEMPTED =
                T.let(
                  :return_attempted,
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed::ReturnOutcome::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed::ReturnOutcome::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            class NotReturned < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed::NotReturned,
                    Increase::Internal::AnyHash
                  )
                end

              # Not returned. Required if and only if `return_outcome` is `not_returned`.
              sig { returns(T.attached_class) }
              def self.new
              end

              sig { override.returns({}) }
              def to_hash
              end
            end

            class ReturnAttempted < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed::ReturnAttempted,
                    Increase::Internal::AnyHash
                  )
                end

              # Attempted at.
              sig { returns(Date) }
              attr_accessor :attempted_at

              # Return attempted. Required if and only if `return_outcome` is
              # `return_attempted`.
              sig { params(attempted_at: Date).returns(T.attached_class) }
              def self.new(
                # Attempted at.
                attempted_at:
              )
              end

              sig { override.returns({ attempted_at: Date }) }
              def to_hash
              end
            end

            class Returned < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::Delayed::Returned,
                    Increase::Internal::AnyHash
                  )
                end

              # Merchant received return at.
              sig { returns(Date) }
              attr_accessor :merchant_received_return_at

              # Returned at.
              sig { returns(Date) }
              attr_accessor :returned_at

              # Returned. Required if and only if `return_outcome` is `returned`.
              sig do
                params(
                  merchant_received_return_at: Date,
                  returned_at: Date
                ).returns(T.attached_class)
              end
              def self.new(
                # Merchant received return at.
                merchant_received_return_at:,
                # Returned at.
                returned_at:
              )
              end

              sig do
                override.returns(
                  { merchant_received_return_at: Date, returned_at: Date }
                )
              end
              def to_hash
              end
            end
          end

          class DeliveredToWrongLocation < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::DeliveredToWrongLocation,
                  Increase::Internal::AnyHash
                )
              end

            # Agreed location.
            sig { returns(String) }
            attr_accessor :agreed_location

            # Delivered to wrong location. Required if and only if `delivery_issue` is
            # `delivered_to_wrong_location`.
            sig { params(agreed_location: String).returns(T.attached_class) }
            def self.new(
              # Agreed location.
              agreed_location:
            )
            end

            sig { override.returns({ agreed_location: String }) }
            def to_hash
            end
          end

          class MerchantCancellation < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::MerchantCancellation,
                  Increase::Internal::AnyHash
                )
              end

            # Canceled at.
            sig { returns(Date) }
            attr_accessor :canceled_at

            # Merchant cancellation. Required if and only if `cancellation_outcome` is
            # `merchant_cancellation`.
            sig { params(canceled_at: Date).returns(T.attached_class) }
            def self.new(
              # Canceled at.
              canceled_at:
            )
            end

            sig { override.returns({ canceled_at: Date }) }
            def to_hash
            end
          end

          class NoCancellation < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDisputeCreateParams::Visa::ConsumerMerchandiseNotReceived::NoCancellation,
                  Increase::Internal::AnyHash
                )
              end

            # No cancellation. Required if and only if `cancellation_outcome` is
            # `no_cancellation`.
            sig { returns(T.attached_class) }
            def self.new
            end

            sig { override.returns({}) }
            def to_hash
            end
          end
        end

        class ConsumerNonReceiptOfCash < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardDisputeCreateParams::Visa::ConsumerNonReceiptOfCash,
                Increase::Internal::AnyHash
              )
            end

          # Non-receipt of cash. Required if and only if `category` is
          # `consumer_non_receipt_of_cash`.
          sig { returns(T.attached_class) }
          def self.new
          end

          sig { override.returns({}) }
          def to_hash
          end
        end

        class ConsumerOriginalCreditTransactionNotAccepted < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardDisputeCreateParams::Visa::ConsumerOriginalCreditTransactionNotAccepted,
                Increase::Internal::AnyHash
              )
            end

          # Explanation.
          sig { returns(String) }
          attr_accessor :explanation

          # Reason.
          sig do
            returns(
              Increase::CardDisputeCreateParams::Visa::ConsumerOriginalCreditTransactionNotAccepted::Reason::OrSymbol
            )
          end
          attr_accessor :reason

          # Original Credit Transaction (OCT) not accepted. Required if and only if
          # `category` is `consumer_original_credit_transaction_not_accepted`.
          sig do
            params(
              explanation: String,
              reason:
                Increase::CardDisputeCreateParams::Visa::ConsumerOriginalCreditTransactionNotAccepted::Reason::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Explanation.
            explanation:,
            # Reason.
            reason:
          )
          end

          sig do
            override.returns(
              {
                explanation: String,
                reason:
                  Increase::CardDisputeCreateParams::Visa::ConsumerOriginalCreditTransactionNotAccepted::Reason::OrSymbol
              }
            )
          end
          def to_hash
          end

          # Reason.
          module Reason
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardDisputeCreateParams::Visa::ConsumerOriginalCreditTransactionNotAccepted::Reason
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Prohibited by local laws or regulation.
            PROHIBITED_BY_LOCAL_LAWS_OR_REGULATION =
              T.let(
                :prohibited_by_local_laws_or_regulation,
                Increase::CardDisputeCreateParams::Visa::ConsumerOriginalCreditTransactionNotAccepted::Reason::TaggedSymbol
              )

            # Recipient refused.
            RECIPIENT_REFUSED =
              T.let(
                :recipient_refused,
                Increase::CardDisputeCreateParams::Visa::ConsumerOriginalCreditTransactionNotAccepted::Reason::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardDisputeCreateParams::Visa::ConsumerOriginalCreditTransactionNotAccepted::Reason::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class ConsumerQualityMerchandise < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise,
                Increase::Internal::AnyHash
              )
            end

          # Expected at.
          sig { returns(Date) }
          attr_accessor :expected_at

          # Merchant resolution attempted.
          sig do
            returns(
              Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::MerchantResolutionAttempted::OrSymbol
            )
          end
          attr_accessor :merchant_resolution_attempted

          # Purchase information and quality issue.
          sig { returns(String) }
          attr_accessor :purchase_info_and_quality_issue

          # Received at.
          sig { returns(Date) }
          attr_accessor :received_at

          # Return outcome.
          sig do
            returns(
              Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::ReturnOutcome::OrSymbol
            )
          end
          attr_accessor :return_outcome

          # Not returned. Required if and only if `return_outcome` is `not_returned`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::NotReturned
              )
            )
          end
          attr_reader :not_returned

          sig do
            params(
              not_returned:
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::NotReturned::OrHash
            ).void
          end
          attr_writer :not_returned

          # Ongoing negotiations. Exclude if there is no evidence of ongoing negotiations.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::OngoingNegotiations
              )
            )
          end
          attr_reader :ongoing_negotiations

          sig do
            params(
              ongoing_negotiations:
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::OngoingNegotiations::OrHash
            ).void
          end
          attr_writer :ongoing_negotiations

          # Return attempted. Required if and only if `return_outcome` is
          # `return_attempted`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::ReturnAttempted
              )
            )
          end
          attr_reader :return_attempted

          sig do
            params(
              return_attempted:
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::ReturnAttempted::OrHash
            ).void
          end
          attr_writer :return_attempted

          # Returned. Required if and only if `return_outcome` is `returned`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::Returned
              )
            )
          end
          attr_reader :returned

          sig do
            params(
              returned:
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::Returned::OrHash
            ).void
          end
          attr_writer :returned

          # Merchandise quality issue. Required if and only if `category` is
          # `consumer_quality_merchandise`.
          sig do
            params(
              expected_at: Date,
              merchant_resolution_attempted:
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::MerchantResolutionAttempted::OrSymbol,
              purchase_info_and_quality_issue: String,
              received_at: Date,
              return_outcome:
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::ReturnOutcome::OrSymbol,
              not_returned:
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::NotReturned::OrHash,
              ongoing_negotiations:
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::OngoingNegotiations::OrHash,
              return_attempted:
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::ReturnAttempted::OrHash,
              returned:
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::Returned::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Expected at.
            expected_at:,
            # Merchant resolution attempted.
            merchant_resolution_attempted:,
            # Purchase information and quality issue.
            purchase_info_and_quality_issue:,
            # Received at.
            received_at:,
            # Return outcome.
            return_outcome:,
            # Not returned. Required if and only if `return_outcome` is `not_returned`.
            not_returned: nil,
            # Ongoing negotiations. Exclude if there is no evidence of ongoing negotiations.
            ongoing_negotiations: nil,
            # Return attempted. Required if and only if `return_outcome` is
            # `return_attempted`.
            return_attempted: nil,
            # Returned. Required if and only if `return_outcome` is `returned`.
            returned: nil
          )
          end

          sig do
            override.returns(
              {
                expected_at: Date,
                merchant_resolution_attempted:
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::MerchantResolutionAttempted::OrSymbol,
                purchase_info_and_quality_issue: String,
                received_at: Date,
                return_outcome:
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::ReturnOutcome::OrSymbol,
                not_returned:
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::NotReturned,
                ongoing_negotiations:
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::OngoingNegotiations,
                return_attempted:
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::ReturnAttempted,
                returned:
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::Returned
              }
            )
          end
          def to_hash
          end

          # Merchant resolution attempted.
          module MerchantResolutionAttempted
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::MerchantResolutionAttempted
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Attempted.
            ATTEMPTED =
              T.let(
                :attempted,
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::MerchantResolutionAttempted::TaggedSymbol
              )

            # Prohibited by local law.
            PROHIBITED_BY_LOCAL_LAW =
              T.let(
                :prohibited_by_local_law,
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::MerchantResolutionAttempted::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::MerchantResolutionAttempted::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # Return outcome.
          module ReturnOutcome
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::ReturnOutcome
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Not returned.
            NOT_RETURNED =
              T.let(
                :not_returned,
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::ReturnOutcome::TaggedSymbol
              )

            # Returned.
            RETURNED =
              T.let(
                :returned,
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::ReturnOutcome::TaggedSymbol
              )

            # Return attempted.
            RETURN_ATTEMPTED =
              T.let(
                :return_attempted,
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::ReturnOutcome::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::ReturnOutcome::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class NotReturned < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::NotReturned,
                  Increase::Internal::AnyHash
                )
              end

            # Not returned. Required if and only if `return_outcome` is `not_returned`.
            sig { returns(T.attached_class) }
            def self.new
            end

            sig { override.returns({}) }
            def to_hash
            end
          end

          class OngoingNegotiations < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::OngoingNegotiations,
                  Increase::Internal::AnyHash
                )
              end

            # Explanation of the previous ongoing negotiations between the cardholder and
            # merchant.
            sig { returns(String) }
            attr_accessor :explanation

            # Date the cardholder first notified the issuer of the dispute.
            sig { returns(Date) }
            attr_accessor :issuer_first_notified_at

            # Started at.
            sig { returns(Date) }
            attr_accessor :started_at

            # Ongoing negotiations. Exclude if there is no evidence of ongoing negotiations.
            sig do
              params(
                explanation: String,
                issuer_first_notified_at: Date,
                started_at: Date
              ).returns(T.attached_class)
            end
            def self.new(
              # Explanation of the previous ongoing negotiations between the cardholder and
              # merchant.
              explanation:,
              # Date the cardholder first notified the issuer of the dispute.
              issuer_first_notified_at:,
              # Started at.
              started_at:
            )
            end

            sig do
              override.returns(
                {
                  explanation: String,
                  issuer_first_notified_at: Date,
                  started_at: Date
                }
              )
            end
            def to_hash
            end
          end

          class ReturnAttempted < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::ReturnAttempted,
                  Increase::Internal::AnyHash
                )
              end

            # Attempt explanation.
            sig { returns(String) }
            attr_accessor :attempt_explanation

            # Attempt reason.
            sig do
              returns(
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::ReturnAttempted::AttemptReason::OrSymbol
              )
            end
            attr_accessor :attempt_reason

            # Attempted at.
            sig { returns(Date) }
            attr_accessor :attempted_at

            # Merchandise disposition.
            sig { returns(String) }
            attr_accessor :merchandise_disposition

            # Return attempted. Required if and only if `return_outcome` is
            # `return_attempted`.
            sig do
              params(
                attempt_explanation: String,
                attempt_reason:
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::ReturnAttempted::AttemptReason::OrSymbol,
                attempted_at: Date,
                merchandise_disposition: String
              ).returns(T.attached_class)
            end
            def self.new(
              # Attempt explanation.
              attempt_explanation:,
              # Attempt reason.
              attempt_reason:,
              # Attempted at.
              attempted_at:,
              # Merchandise disposition.
              merchandise_disposition:
            )
            end

            sig do
              override.returns(
                {
                  attempt_explanation: String,
                  attempt_reason:
                    Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::ReturnAttempted::AttemptReason::OrSymbol,
                  attempted_at: Date,
                  merchandise_disposition: String
                }
              )
            end
            def to_hash
            end

            # Attempt reason.
            module AttemptReason
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::ReturnAttempted::AttemptReason
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Merchant not responding.
              MERCHANT_NOT_RESPONDING =
                T.let(
                  :merchant_not_responding,
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                )

              # No return authorization provided.
              NO_RETURN_AUTHORIZATION_PROVIDED =
                T.let(
                  :no_return_authorization_provided,
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                )

              # No return instructions.
              NO_RETURN_INSTRUCTIONS =
                T.let(
                  :no_return_instructions,
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                )

              # Requested not to return.
              REQUESTED_NOT_TO_RETURN =
                T.let(
                  :requested_not_to_return,
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                )

              # Return not accepted.
              RETURN_NOT_ACCEPTED =
                T.let(
                  :return_not_accepted,
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class Returned < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::Returned,
                  Increase::Internal::AnyHash
                )
              end

            # Return method.
            sig do
              returns(
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::Returned::ReturnMethod::OrSymbol
              )
            end
            attr_accessor :return_method

            # Returned at.
            sig { returns(Date) }
            attr_accessor :returned_at

            # Merchant received return at.
            sig { returns(T.nilable(Date)) }
            attr_reader :merchant_received_return_at

            sig { params(merchant_received_return_at: Date).void }
            attr_writer :merchant_received_return_at

            # Other explanation. Required if and only if the return method is `other`.
            sig { returns(T.nilable(String)) }
            attr_reader :other_explanation

            sig { params(other_explanation: String).void }
            attr_writer :other_explanation

            # Tracking number.
            sig { returns(T.nilable(String)) }
            attr_reader :tracking_number

            sig { params(tracking_number: String).void }
            attr_writer :tracking_number

            # Returned. Required if and only if `return_outcome` is `returned`.
            sig do
              params(
                return_method:
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::Returned::ReturnMethod::OrSymbol,
                returned_at: Date,
                merchant_received_return_at: Date,
                other_explanation: String,
                tracking_number: String
              ).returns(T.attached_class)
            end
            def self.new(
              # Return method.
              return_method:,
              # Returned at.
              returned_at:,
              # Merchant received return at.
              merchant_received_return_at: nil,
              # Other explanation. Required if and only if the return method is `other`.
              other_explanation: nil,
              # Tracking number.
              tracking_number: nil
            )
            end

            sig do
              override.returns(
                {
                  return_method:
                    Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::Returned::ReturnMethod::OrSymbol,
                  returned_at: Date,
                  merchant_received_return_at: Date,
                  other_explanation: String,
                  tracking_number: String
                }
              )
            end
            def to_hash
            end

            # Return method.
            module ReturnMethod
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::Returned::ReturnMethod
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # DHL.
              DHL =
                T.let(
                  :dhl,
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::Returned::ReturnMethod::TaggedSymbol
                )

              # Face-to-face.
              FACE_TO_FACE =
                T.let(
                  :face_to_face,
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::Returned::ReturnMethod::TaggedSymbol
                )

              # FedEx.
              FEDEX =
                T.let(
                  :fedex,
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::Returned::ReturnMethod::TaggedSymbol
                )

              # Other.
              OTHER =
                T.let(
                  :other,
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::Returned::ReturnMethod::TaggedSymbol
                )

              # Postal service.
              POSTAL_SERVICE =
                T.let(
                  :postal_service,
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::Returned::ReturnMethod::TaggedSymbol
                )

              # UPS.
              UPS =
                T.let(
                  :ups,
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::Returned::ReturnMethod::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeCreateParams::Visa::ConsumerQualityMerchandise::Returned::ReturnMethod::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end

        class ConsumerQualityServices < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices,
                Increase::Internal::AnyHash
              )
            end

          # Cardholder cancellation.
          sig do
            returns(
              Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::CardholderCancellation
            )
          end
          attr_reader :cardholder_cancellation

          sig do
            params(
              cardholder_cancellation:
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::CardholderCancellation::OrHash
            ).void
          end
          attr_writer :cardholder_cancellation

          # Non-fiat currency or non-fungible token related and not matching description.
          sig do
            returns(
              Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::NonFiatCurrencyOrNonFungibleTokenRelatedAndNotMatchingDescription::OrSymbol
            )
          end
          attr_accessor :non_fiat_currency_or_non_fungible_token_related_and_not_matching_description

          # Purchase information and quality issue.
          sig { returns(String) }
          attr_accessor :purchase_info_and_quality_issue

          # Services received at.
          sig { returns(Date) }
          attr_accessor :services_received_at

          # Cardholder paid to have work redone.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::CardholderPaidToHaveWorkRedone::OrSymbol
              )
            )
          end
          attr_reader :cardholder_paid_to_have_work_redone

          sig do
            params(
              cardholder_paid_to_have_work_redone:
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::CardholderPaidToHaveWorkRedone::OrSymbol
            ).void
          end
          attr_writer :cardholder_paid_to_have_work_redone

          # Ongoing negotiations. Exclude if there is no evidence of ongoing negotiations.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::OngoingNegotiations
              )
            )
          end
          attr_reader :ongoing_negotiations

          sig do
            params(
              ongoing_negotiations:
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::OngoingNegotiations::OrHash
            ).void
          end
          attr_writer :ongoing_negotiations

          # Whether the dispute is related to the quality of food from an eating place or
          # restaurant. Must be provided when Merchant Category Code (MCC) is 5812, 5813
          # or 5814.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::RestaurantFoodRelated::OrSymbol
              )
            )
          end
          attr_reader :restaurant_food_related

          sig do
            params(
              restaurant_food_related:
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::RestaurantFoodRelated::OrSymbol
            ).void
          end
          attr_writer :restaurant_food_related

          # Services quality issue. Required if and only if `category` is
          # `consumer_quality_services`.
          sig do
            params(
              cardholder_cancellation:
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::CardholderCancellation::OrHash,
              non_fiat_currency_or_non_fungible_token_related_and_not_matching_description:
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::NonFiatCurrencyOrNonFungibleTokenRelatedAndNotMatchingDescription::OrSymbol,
              purchase_info_and_quality_issue: String,
              services_received_at: Date,
              cardholder_paid_to_have_work_redone:
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::CardholderPaidToHaveWorkRedone::OrSymbol,
              ongoing_negotiations:
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::OngoingNegotiations::OrHash,
              restaurant_food_related:
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::RestaurantFoodRelated::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Cardholder cancellation.
            cardholder_cancellation:,
            # Non-fiat currency or non-fungible token related and not matching description.
            non_fiat_currency_or_non_fungible_token_related_and_not_matching_description:,
            # Purchase information and quality issue.
            purchase_info_and_quality_issue:,
            # Services received at.
            services_received_at:,
            # Cardholder paid to have work redone.
            cardholder_paid_to_have_work_redone: nil,
            # Ongoing negotiations. Exclude if there is no evidence of ongoing negotiations.
            ongoing_negotiations: nil,
            # Whether the dispute is related to the quality of food from an eating place or
            # restaurant. Must be provided when Merchant Category Code (MCC) is 5812, 5813
            # or 5814.
            restaurant_food_related: nil
          )
          end

          sig do
            override.returns(
              {
                cardholder_cancellation:
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::CardholderCancellation,
                non_fiat_currency_or_non_fungible_token_related_and_not_matching_description:
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::NonFiatCurrencyOrNonFungibleTokenRelatedAndNotMatchingDescription::OrSymbol,
                purchase_info_and_quality_issue: String,
                services_received_at: Date,
                cardholder_paid_to_have_work_redone:
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::CardholderPaidToHaveWorkRedone::OrSymbol,
                ongoing_negotiations:
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::OngoingNegotiations,
                restaurant_food_related:
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::RestaurantFoodRelated::OrSymbol
              }
            )
          end
          def to_hash
          end

          class CardholderCancellation < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::CardholderCancellation,
                  Increase::Internal::AnyHash
                )
              end

            # Accepted by merchant.
            sig do
              returns(
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::CardholderCancellation::AcceptedByMerchant::OrSymbol
              )
            end
            attr_accessor :accepted_by_merchant

            # Canceled at.
            sig { returns(Date) }
            attr_accessor :canceled_at

            # Reason.
            sig { returns(String) }
            attr_accessor :reason

            # Cardholder cancellation.
            sig do
              params(
                accepted_by_merchant:
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::CardholderCancellation::AcceptedByMerchant::OrSymbol,
                canceled_at: Date,
                reason: String
              ).returns(T.attached_class)
            end
            def self.new(
              # Accepted by merchant.
              accepted_by_merchant:,
              # Canceled at.
              canceled_at:,
              # Reason.
              reason:
            )
            end

            sig do
              override.returns(
                {
                  accepted_by_merchant:
                    Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::CardholderCancellation::AcceptedByMerchant::OrSymbol,
                  canceled_at: Date,
                  reason: String
                }
              )
            end
            def to_hash
            end

            # Accepted by merchant.
            module AcceptedByMerchant
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::CardholderCancellation::AcceptedByMerchant
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Accepted.
              ACCEPTED =
                T.let(
                  :accepted,
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::CardholderCancellation::AcceptedByMerchant::TaggedSymbol
                )

              # Not accepted.
              NOT_ACCEPTED =
                T.let(
                  :not_accepted,
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::CardholderCancellation::AcceptedByMerchant::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::CardholderCancellation::AcceptedByMerchant::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          # Non-fiat currency or non-fungible token related and not matching description.
          module NonFiatCurrencyOrNonFungibleTokenRelatedAndNotMatchingDescription
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::NonFiatCurrencyOrNonFungibleTokenRelatedAndNotMatchingDescription
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Not related.
            NOT_RELATED =
              T.let(
                :not_related,
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::NonFiatCurrencyOrNonFungibleTokenRelatedAndNotMatchingDescription::TaggedSymbol
              )

            # Related.
            RELATED =
              T.let(
                :related,
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::NonFiatCurrencyOrNonFungibleTokenRelatedAndNotMatchingDescription::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::NonFiatCurrencyOrNonFungibleTokenRelatedAndNotMatchingDescription::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # Cardholder paid to have work redone.
          module CardholderPaidToHaveWorkRedone
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::CardholderPaidToHaveWorkRedone
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Cardholder did not pay to have work redone.
            DID_NOT_PAY_TO_HAVE_WORK_REDONE =
              T.let(
                :did_not_pay_to_have_work_redone,
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::CardholderPaidToHaveWorkRedone::TaggedSymbol
              )

            # Cardholder paid to have work redone.
            PAID_TO_HAVE_WORK_REDONE =
              T.let(
                :paid_to_have_work_redone,
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::CardholderPaidToHaveWorkRedone::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::CardholderPaidToHaveWorkRedone::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class OngoingNegotiations < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::OngoingNegotiations,
                  Increase::Internal::AnyHash
                )
              end

            # Explanation of the previous ongoing negotiations between the cardholder and
            # merchant.
            sig { returns(String) }
            attr_accessor :explanation

            # Date the cardholder first notified the issuer of the dispute.
            sig { returns(Date) }
            attr_accessor :issuer_first_notified_at

            # Started at.
            sig { returns(Date) }
            attr_accessor :started_at

            # Ongoing negotiations. Exclude if there is no evidence of ongoing negotiations.
            sig do
              params(
                explanation: String,
                issuer_first_notified_at: Date,
                started_at: Date
              ).returns(T.attached_class)
            end
            def self.new(
              # Explanation of the previous ongoing negotiations between the cardholder and
              # merchant.
              explanation:,
              # Date the cardholder first notified the issuer of the dispute.
              issuer_first_notified_at:,
              # Started at.
              started_at:
            )
            end

            sig do
              override.returns(
                {
                  explanation: String,
                  issuer_first_notified_at: Date,
                  started_at: Date
                }
              )
            end
            def to_hash
            end
          end

          # Whether the dispute is related to the quality of food from an eating place or
          # restaurant. Must be provided when Merchant Category Code (MCC) is 5812, 5813
          # or 5814.
          module RestaurantFoodRelated
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::RestaurantFoodRelated
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Not related.
            NOT_RELATED =
              T.let(
                :not_related,
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::RestaurantFoodRelated::TaggedSymbol
              )

            # Related.
            RELATED =
              T.let(
                :related,
                Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::RestaurantFoodRelated::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardDisputeCreateParams::Visa::ConsumerQualityServices::RestaurantFoodRelated::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class ConsumerServicesMisrepresentation < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardDisputeCreateParams::Visa::ConsumerServicesMisrepresentation,
                Increase::Internal::AnyHash
              )
            end

          # Cardholder cancellation.
          sig do
            returns(
              Increase::CardDisputeCreateParams::Visa::ConsumerServicesMisrepresentation::CardholderCancellation
            )
          end
          attr_reader :cardholder_cancellation

          sig do
            params(
              cardholder_cancellation:
                Increase::CardDisputeCreateParams::Visa::ConsumerServicesMisrepresentation::CardholderCancellation::OrHash
            ).void
          end
          attr_writer :cardholder_cancellation

          # Merchant resolution attempted.
          sig do
            returns(
              Increase::CardDisputeCreateParams::Visa::ConsumerServicesMisrepresentation::MerchantResolutionAttempted::OrSymbol
            )
          end
          attr_accessor :merchant_resolution_attempted

          # Misrepresentation explanation.
          sig { returns(String) }
          attr_accessor :misrepresentation_explanation

          # Purchase explanation.
          sig { returns(String) }
          attr_accessor :purchase_explanation

          # Received at.
          sig { returns(Date) }
          attr_accessor :received_at

          # Services misrepresentation. Required if and only if `category` is
          # `consumer_services_misrepresentation`.
          sig do
            params(
              cardholder_cancellation:
                Increase::CardDisputeCreateParams::Visa::ConsumerServicesMisrepresentation::CardholderCancellation::OrHash,
              merchant_resolution_attempted:
                Increase::CardDisputeCreateParams::Visa::ConsumerServicesMisrepresentation::MerchantResolutionAttempted::OrSymbol,
              misrepresentation_explanation: String,
              purchase_explanation: String,
              received_at: Date
            ).returns(T.attached_class)
          end
          def self.new(
            # Cardholder cancellation.
            cardholder_cancellation:,
            # Merchant resolution attempted.
            merchant_resolution_attempted:,
            # Misrepresentation explanation.
            misrepresentation_explanation:,
            # Purchase explanation.
            purchase_explanation:,
            # Received at.
            received_at:
          )
          end

          sig do
            override.returns(
              {
                cardholder_cancellation:
                  Increase::CardDisputeCreateParams::Visa::ConsumerServicesMisrepresentation::CardholderCancellation,
                merchant_resolution_attempted:
                  Increase::CardDisputeCreateParams::Visa::ConsumerServicesMisrepresentation::MerchantResolutionAttempted::OrSymbol,
                misrepresentation_explanation: String,
                purchase_explanation: String,
                received_at: Date
              }
            )
          end
          def to_hash
          end

          class CardholderCancellation < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDisputeCreateParams::Visa::ConsumerServicesMisrepresentation::CardholderCancellation,
                  Increase::Internal::AnyHash
                )
              end

            # Accepted by merchant.
            sig do
              returns(
                Increase::CardDisputeCreateParams::Visa::ConsumerServicesMisrepresentation::CardholderCancellation::AcceptedByMerchant::OrSymbol
              )
            end
            attr_accessor :accepted_by_merchant

            # Canceled at.
            sig { returns(Date) }
            attr_accessor :canceled_at

            # Reason.
            sig { returns(String) }
            attr_accessor :reason

            # Cardholder cancellation.
            sig do
              params(
                accepted_by_merchant:
                  Increase::CardDisputeCreateParams::Visa::ConsumerServicesMisrepresentation::CardholderCancellation::AcceptedByMerchant::OrSymbol,
                canceled_at: Date,
                reason: String
              ).returns(T.attached_class)
            end
            def self.new(
              # Accepted by merchant.
              accepted_by_merchant:,
              # Canceled at.
              canceled_at:,
              # Reason.
              reason:
            )
            end

            sig do
              override.returns(
                {
                  accepted_by_merchant:
                    Increase::CardDisputeCreateParams::Visa::ConsumerServicesMisrepresentation::CardholderCancellation::AcceptedByMerchant::OrSymbol,
                  canceled_at: Date,
                  reason: String
                }
              )
            end
            def to_hash
            end

            # Accepted by merchant.
            module AcceptedByMerchant
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::CardDisputeCreateParams::Visa::ConsumerServicesMisrepresentation::CardholderCancellation::AcceptedByMerchant
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Accepted.
              ACCEPTED =
                T.let(
                  :accepted,
                  Increase::CardDisputeCreateParams::Visa::ConsumerServicesMisrepresentation::CardholderCancellation::AcceptedByMerchant::TaggedSymbol
                )

              # Not accepted.
              NOT_ACCEPTED =
                T.let(
                  :not_accepted,
                  Increase::CardDisputeCreateParams::Visa::ConsumerServicesMisrepresentation::CardholderCancellation::AcceptedByMerchant::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeCreateParams::Visa::ConsumerServicesMisrepresentation::CardholderCancellation::AcceptedByMerchant::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          # Merchant resolution attempted.
          module MerchantResolutionAttempted
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardDisputeCreateParams::Visa::ConsumerServicesMisrepresentation::MerchantResolutionAttempted
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Attempted.
            ATTEMPTED =
              T.let(
                :attempted,
                Increase::CardDisputeCreateParams::Visa::ConsumerServicesMisrepresentation::MerchantResolutionAttempted::TaggedSymbol
              )

            # Prohibited by local law.
            PROHIBITED_BY_LOCAL_LAW =
              T.let(
                :prohibited_by_local_law,
                Increase::CardDisputeCreateParams::Visa::ConsumerServicesMisrepresentation::MerchantResolutionAttempted::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardDisputeCreateParams::Visa::ConsumerServicesMisrepresentation::MerchantResolutionAttempted::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class ConsumerServicesNotAsDescribed < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotAsDescribed,
                Increase::Internal::AnyHash
              )
            end

          # Cardholder cancellation.
          sig do
            returns(
              Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotAsDescribed::CardholderCancellation
            )
          end
          attr_reader :cardholder_cancellation

          sig do
            params(
              cardholder_cancellation:
                Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotAsDescribed::CardholderCancellation::OrHash
            ).void
          end
          attr_writer :cardholder_cancellation

          # Merchant resolution attempted.
          sig do
            returns(
              Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotAsDescribed::MerchantResolutionAttempted::OrSymbol
            )
          end
          attr_accessor :merchant_resolution_attempted

          # Received at.
          sig { returns(Date) }
          attr_accessor :received_at

          # Services not as described. Required if and only if `category` is
          # `consumer_services_not_as_described`.
          sig do
            params(
              cardholder_cancellation:
                Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotAsDescribed::CardholderCancellation::OrHash,
              merchant_resolution_attempted:
                Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotAsDescribed::MerchantResolutionAttempted::OrSymbol,
              received_at: Date
            ).returns(T.attached_class)
          end
          def self.new(
            # Cardholder cancellation.
            cardholder_cancellation:,
            # Merchant resolution attempted.
            merchant_resolution_attempted:,
            # Received at.
            received_at:
          )
          end

          sig do
            override.returns(
              {
                cardholder_cancellation:
                  Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotAsDescribed::CardholderCancellation,
                merchant_resolution_attempted:
                  Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotAsDescribed::MerchantResolutionAttempted::OrSymbol,
                received_at: Date
              }
            )
          end
          def to_hash
          end

          class CardholderCancellation < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotAsDescribed::CardholderCancellation,
                  Increase::Internal::AnyHash
                )
              end

            # Accepted by merchant.
            sig do
              returns(
                Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotAsDescribed::CardholderCancellation::AcceptedByMerchant::OrSymbol
              )
            end
            attr_accessor :accepted_by_merchant

            # Canceled at.
            sig { returns(Date) }
            attr_accessor :canceled_at

            # Reason.
            sig { returns(String) }
            attr_accessor :reason

            # Cardholder cancellation.
            sig do
              params(
                accepted_by_merchant:
                  Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotAsDescribed::CardholderCancellation::AcceptedByMerchant::OrSymbol,
                canceled_at: Date,
                reason: String
              ).returns(T.attached_class)
            end
            def self.new(
              # Accepted by merchant.
              accepted_by_merchant:,
              # Canceled at.
              canceled_at:,
              # Reason.
              reason:
            )
            end

            sig do
              override.returns(
                {
                  accepted_by_merchant:
                    Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotAsDescribed::CardholderCancellation::AcceptedByMerchant::OrSymbol,
                  canceled_at: Date,
                  reason: String
                }
              )
            end
            def to_hash
            end

            # Accepted by merchant.
            module AcceptedByMerchant
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotAsDescribed::CardholderCancellation::AcceptedByMerchant
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Accepted.
              ACCEPTED =
                T.let(
                  :accepted,
                  Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotAsDescribed::CardholderCancellation::AcceptedByMerchant::TaggedSymbol
                )

              # Not accepted.
              NOT_ACCEPTED =
                T.let(
                  :not_accepted,
                  Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotAsDescribed::CardholderCancellation::AcceptedByMerchant::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotAsDescribed::CardholderCancellation::AcceptedByMerchant::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          # Merchant resolution attempted.
          module MerchantResolutionAttempted
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotAsDescribed::MerchantResolutionAttempted
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Attempted.
            ATTEMPTED =
              T.let(
                :attempted,
                Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotAsDescribed::MerchantResolutionAttempted::TaggedSymbol
              )

            # Prohibited by local law.
            PROHIBITED_BY_LOCAL_LAW =
              T.let(
                :prohibited_by_local_law,
                Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotAsDescribed::MerchantResolutionAttempted::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotAsDescribed::MerchantResolutionAttempted::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class ConsumerServicesNotReceived < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived,
                Increase::Internal::AnyHash
              )
            end

          # Cancellation outcome.
          sig do
            returns(
              Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::CancellationOutcome::OrSymbol
            )
          end
          attr_accessor :cancellation_outcome

          # Last expected receipt at.
          sig { returns(Date) }
          attr_accessor :last_expected_receipt_at

          # Merchant resolution attempted.
          sig do
            returns(
              Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::MerchantResolutionAttempted::OrSymbol
            )
          end
          attr_accessor :merchant_resolution_attempted

          # Purchase information and explanation.
          sig { returns(String) }
          attr_accessor :purchase_info_and_explanation

          # Cardholder cancellation prior to expected receipt. Required if and only if
          # `cancellation_outcome` is `cardholder_cancellation_prior_to_expected_receipt`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::CardholderCancellationPriorToExpectedReceipt
              )
            )
          end
          attr_reader :cardholder_cancellation_prior_to_expected_receipt

          sig do
            params(
              cardholder_cancellation_prior_to_expected_receipt:
                Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::CardholderCancellationPriorToExpectedReceipt::OrHash
            ).void
          end
          attr_writer :cardholder_cancellation_prior_to_expected_receipt

          # Merchant cancellation. Required if and only if `cancellation_outcome` is
          # `merchant_cancellation`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::MerchantCancellation
              )
            )
          end
          attr_reader :merchant_cancellation

          sig do
            params(
              merchant_cancellation:
                Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::MerchantCancellation::OrHash
            ).void
          end
          attr_writer :merchant_cancellation

          # No cancellation. Required if and only if `cancellation_outcome` is
          # `no_cancellation`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::NoCancellation
              )
            )
          end
          attr_reader :no_cancellation

          sig do
            params(
              no_cancellation:
                Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::NoCancellation::OrHash
            ).void
          end
          attr_writer :no_cancellation

          # Services not received. Required if and only if `category` is
          # `consumer_services_not_received`.
          sig do
            params(
              cancellation_outcome:
                Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::CancellationOutcome::OrSymbol,
              last_expected_receipt_at: Date,
              merchant_resolution_attempted:
                Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::MerchantResolutionAttempted::OrSymbol,
              purchase_info_and_explanation: String,
              cardholder_cancellation_prior_to_expected_receipt:
                Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::CardholderCancellationPriorToExpectedReceipt::OrHash,
              merchant_cancellation:
                Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::MerchantCancellation::OrHash,
              no_cancellation:
                Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::NoCancellation::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Cancellation outcome.
            cancellation_outcome:,
            # Last expected receipt at.
            last_expected_receipt_at:,
            # Merchant resolution attempted.
            merchant_resolution_attempted:,
            # Purchase information and explanation.
            purchase_info_and_explanation:,
            # Cardholder cancellation prior to expected receipt. Required if and only if
            # `cancellation_outcome` is `cardholder_cancellation_prior_to_expected_receipt`.
            cardholder_cancellation_prior_to_expected_receipt: nil,
            # Merchant cancellation. Required if and only if `cancellation_outcome` is
            # `merchant_cancellation`.
            merchant_cancellation: nil,
            # No cancellation. Required if and only if `cancellation_outcome` is
            # `no_cancellation`.
            no_cancellation: nil
          )
          end

          sig do
            override.returns(
              {
                cancellation_outcome:
                  Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::CancellationOutcome::OrSymbol,
                last_expected_receipt_at: Date,
                merchant_resolution_attempted:
                  Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::MerchantResolutionAttempted::OrSymbol,
                purchase_info_and_explanation: String,
                cardholder_cancellation_prior_to_expected_receipt:
                  Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::CardholderCancellationPriorToExpectedReceipt,
                merchant_cancellation:
                  Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::MerchantCancellation,
                no_cancellation:
                  Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::NoCancellation
              }
            )
          end
          def to_hash
          end

          # Cancellation outcome.
          module CancellationOutcome
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::CancellationOutcome
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Cardholder cancellation prior to expected receipt.
            CARDHOLDER_CANCELLATION_PRIOR_TO_EXPECTED_RECEIPT =
              T.let(
                :cardholder_cancellation_prior_to_expected_receipt,
                Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::CancellationOutcome::TaggedSymbol
              )

            # Merchant cancellation.
            MERCHANT_CANCELLATION =
              T.let(
                :merchant_cancellation,
                Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::CancellationOutcome::TaggedSymbol
              )

            # No cancellation.
            NO_CANCELLATION =
              T.let(
                :no_cancellation,
                Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::CancellationOutcome::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::CancellationOutcome::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # Merchant resolution attempted.
          module MerchantResolutionAttempted
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::MerchantResolutionAttempted
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Attempted.
            ATTEMPTED =
              T.let(
                :attempted,
                Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::MerchantResolutionAttempted::TaggedSymbol
              )

            # Prohibited by local law.
            PROHIBITED_BY_LOCAL_LAW =
              T.let(
                :prohibited_by_local_law,
                Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::MerchantResolutionAttempted::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::MerchantResolutionAttempted::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class CardholderCancellationPriorToExpectedReceipt < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::CardholderCancellationPriorToExpectedReceipt,
                  Increase::Internal::AnyHash
                )
              end

            # Canceled at.
            sig { returns(Date) }
            attr_accessor :canceled_at

            # Reason.
            sig { returns(T.nilable(String)) }
            attr_reader :reason

            sig { params(reason: String).void }
            attr_writer :reason

            # Cardholder cancellation prior to expected receipt. Required if and only if
            # `cancellation_outcome` is `cardholder_cancellation_prior_to_expected_receipt`.
            sig do
              params(canceled_at: Date, reason: String).returns(
                T.attached_class
              )
            end
            def self.new(
              # Canceled at.
              canceled_at:,
              # Reason.
              reason: nil
            )
            end

            sig { override.returns({ canceled_at: Date, reason: String }) }
            def to_hash
            end
          end

          class MerchantCancellation < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::MerchantCancellation,
                  Increase::Internal::AnyHash
                )
              end

            # Canceled at.
            sig { returns(Date) }
            attr_accessor :canceled_at

            # Merchant cancellation. Required if and only if `cancellation_outcome` is
            # `merchant_cancellation`.
            sig { params(canceled_at: Date).returns(T.attached_class) }
            def self.new(
              # Canceled at.
              canceled_at:
            )
            end

            sig { override.returns({ canceled_at: Date }) }
            def to_hash
            end
          end

          class NoCancellation < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDisputeCreateParams::Visa::ConsumerServicesNotReceived::NoCancellation,
                  Increase::Internal::AnyHash
                )
              end

            # No cancellation. Required if and only if `cancellation_outcome` is
            # `no_cancellation`.
            sig { returns(T.attached_class) }
            def self.new
            end

            sig { override.returns({}) }
            def to_hash
            end
          end
        end

        class Fraud < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardDisputeCreateParams::Visa::Fraud,
                Increase::Internal::AnyHash
              )
            end

          # Fraud type.
          sig do
            returns(
              Increase::CardDisputeCreateParams::Visa::Fraud::FraudType::OrSymbol
            )
          end
          attr_accessor :fraud_type

          # Fraud. Required if and only if `category` is `fraud`.
          sig do
            params(
              fraud_type:
                Increase::CardDisputeCreateParams::Visa::Fraud::FraudType::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Fraud type.
            fraud_type:
          )
          end

          sig do
            override.returns(
              {
                fraud_type:
                  Increase::CardDisputeCreateParams::Visa::Fraud::FraudType::OrSymbol
              }
            )
          end
          def to_hash
          end

          # Fraud type.
          module FraudType
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardDisputeCreateParams::Visa::Fraud::FraudType
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Account or credentials takeover.
            ACCOUNT_OR_CREDENTIALS_TAKEOVER =
              T.let(
                :account_or_credentials_takeover,
                Increase::CardDisputeCreateParams::Visa::Fraud::FraudType::TaggedSymbol
              )

            # Card not received as issued.
            CARD_NOT_RECEIVED_AS_ISSUED =
              T.let(
                :card_not_received_as_issued,
                Increase::CardDisputeCreateParams::Visa::Fraud::FraudType::TaggedSymbol
              )

            # Fraudulent application.
            FRAUDULENT_APPLICATION =
              T.let(
                :fraudulent_application,
                Increase::CardDisputeCreateParams::Visa::Fraud::FraudType::TaggedSymbol
              )

            # Fraudulent use of account number.
            FRAUDULENT_USE_OF_ACCOUNT_NUMBER =
              T.let(
                :fraudulent_use_of_account_number,
                Increase::CardDisputeCreateParams::Visa::Fraud::FraudType::TaggedSymbol
              )

            # Incorrect processing.
            INCORRECT_PROCESSING =
              T.let(
                :incorrect_processing,
                Increase::CardDisputeCreateParams::Visa::Fraud::FraudType::TaggedSymbol
              )

            # Issuer reported counterfeit.
            ISSUER_REPORTED_COUNTERFEIT =
              T.let(
                :issuer_reported_counterfeit,
                Increase::CardDisputeCreateParams::Visa::Fraud::FraudType::TaggedSymbol
              )

            # Lost.
            LOST =
              T.let(
                :lost,
                Increase::CardDisputeCreateParams::Visa::Fraud::FraudType::TaggedSymbol
              )

            # Manipulation of account holder.
            MANIPULATION_OF_ACCOUNT_HOLDER =
              T.let(
                :manipulation_of_account_holder,
                Increase::CardDisputeCreateParams::Visa::Fraud::FraudType::TaggedSymbol
              )

            # Merchant misrepresentation.
            MERCHANT_MISREPRESENTATION =
              T.let(
                :merchant_misrepresentation,
                Increase::CardDisputeCreateParams::Visa::Fraud::FraudType::TaggedSymbol
              )

            # Miscellaneous.
            MISCELLANEOUS =
              T.let(
                :miscellaneous,
                Increase::CardDisputeCreateParams::Visa::Fraud::FraudType::TaggedSymbol
              )

            # Stolen.
            STOLEN =
              T.let(
                :stolen,
                Increase::CardDisputeCreateParams::Visa::Fraud::FraudType::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardDisputeCreateParams::Visa::Fraud::FraudType::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        class ProcessingError < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardDisputeCreateParams::Visa::ProcessingError,
                Increase::Internal::AnyHash
              )
            end

          # Error reason.
          sig do
            returns(
              Increase::CardDisputeCreateParams::Visa::ProcessingError::ErrorReason::OrSymbol
            )
          end
          attr_accessor :error_reason

          # Merchant resolution attempted.
          sig do
            returns(
              Increase::CardDisputeCreateParams::Visa::ProcessingError::MerchantResolutionAttempted::OrSymbol
            )
          end
          attr_accessor :merchant_resolution_attempted

          # Duplicate transaction. Required if and only if `error_reason` is
          # `duplicate_transaction`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeCreateParams::Visa::ProcessingError::DuplicateTransaction
              )
            )
          end
          attr_reader :duplicate_transaction

          sig do
            params(
              duplicate_transaction:
                Increase::CardDisputeCreateParams::Visa::ProcessingError::DuplicateTransaction::OrHash
            ).void
          end
          attr_writer :duplicate_transaction

          # Incorrect amount. Required if and only if `error_reason` is `incorrect_amount`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeCreateParams::Visa::ProcessingError::IncorrectAmount
              )
            )
          end
          attr_reader :incorrect_amount

          sig do
            params(
              incorrect_amount:
                Increase::CardDisputeCreateParams::Visa::ProcessingError::IncorrectAmount::OrHash
            ).void
          end
          attr_writer :incorrect_amount

          # Paid by other means. Required if and only if `error_reason` is
          # `paid_by_other_means`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeCreateParams::Visa::ProcessingError::PaidByOtherMeans
              )
            )
          end
          attr_reader :paid_by_other_means

          sig do
            params(
              paid_by_other_means:
                Increase::CardDisputeCreateParams::Visa::ProcessingError::PaidByOtherMeans::OrHash
            ).void
          end
          attr_writer :paid_by_other_means

          # Processing error. Required if and only if `category` is `processing_error`.
          sig do
            params(
              error_reason:
                Increase::CardDisputeCreateParams::Visa::ProcessingError::ErrorReason::OrSymbol,
              merchant_resolution_attempted:
                Increase::CardDisputeCreateParams::Visa::ProcessingError::MerchantResolutionAttempted::OrSymbol,
              duplicate_transaction:
                Increase::CardDisputeCreateParams::Visa::ProcessingError::DuplicateTransaction::OrHash,
              incorrect_amount:
                Increase::CardDisputeCreateParams::Visa::ProcessingError::IncorrectAmount::OrHash,
              paid_by_other_means:
                Increase::CardDisputeCreateParams::Visa::ProcessingError::PaidByOtherMeans::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Error reason.
            error_reason:,
            # Merchant resolution attempted.
            merchant_resolution_attempted:,
            # Duplicate transaction. Required if and only if `error_reason` is
            # `duplicate_transaction`.
            duplicate_transaction: nil,
            # Incorrect amount. Required if and only if `error_reason` is `incorrect_amount`.
            incorrect_amount: nil,
            # Paid by other means. Required if and only if `error_reason` is
            # `paid_by_other_means`.
            paid_by_other_means: nil
          )
          end

          sig do
            override.returns(
              {
                error_reason:
                  Increase::CardDisputeCreateParams::Visa::ProcessingError::ErrorReason::OrSymbol,
                merchant_resolution_attempted:
                  Increase::CardDisputeCreateParams::Visa::ProcessingError::MerchantResolutionAttempted::OrSymbol,
                duplicate_transaction:
                  Increase::CardDisputeCreateParams::Visa::ProcessingError::DuplicateTransaction,
                incorrect_amount:
                  Increase::CardDisputeCreateParams::Visa::ProcessingError::IncorrectAmount,
                paid_by_other_means:
                  Increase::CardDisputeCreateParams::Visa::ProcessingError::PaidByOtherMeans
              }
            )
          end
          def to_hash
          end

          # Error reason.
          module ErrorReason
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardDisputeCreateParams::Visa::ProcessingError::ErrorReason
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Duplicate transaction.
            DUPLICATE_TRANSACTION =
              T.let(
                :duplicate_transaction,
                Increase::CardDisputeCreateParams::Visa::ProcessingError::ErrorReason::TaggedSymbol
              )

            # Incorrect amount.
            INCORRECT_AMOUNT =
              T.let(
                :incorrect_amount,
                Increase::CardDisputeCreateParams::Visa::ProcessingError::ErrorReason::TaggedSymbol
              )

            # Paid by other means.
            PAID_BY_OTHER_MEANS =
              T.let(
                :paid_by_other_means,
                Increase::CardDisputeCreateParams::Visa::ProcessingError::ErrorReason::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardDisputeCreateParams::Visa::ProcessingError::ErrorReason::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # Merchant resolution attempted.
          module MerchantResolutionAttempted
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::CardDisputeCreateParams::Visa::ProcessingError::MerchantResolutionAttempted
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Attempted.
            ATTEMPTED =
              T.let(
                :attempted,
                Increase::CardDisputeCreateParams::Visa::ProcessingError::MerchantResolutionAttempted::TaggedSymbol
              )

            # Prohibited by local law.
            PROHIBITED_BY_LOCAL_LAW =
              T.let(
                :prohibited_by_local_law,
                Increase::CardDisputeCreateParams::Visa::ProcessingError::MerchantResolutionAttempted::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardDisputeCreateParams::Visa::ProcessingError::MerchantResolutionAttempted::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class DuplicateTransaction < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDisputeCreateParams::Visa::ProcessingError::DuplicateTransaction,
                  Increase::Internal::AnyHash
                )
              end

            # Other transaction ID.
            sig { returns(String) }
            attr_accessor :other_transaction_id

            # Duplicate transaction. Required if and only if `error_reason` is
            # `duplicate_transaction`.
            sig do
              params(other_transaction_id: String).returns(T.attached_class)
            end
            def self.new(
              # Other transaction ID.
              other_transaction_id:
            )
            end

            sig { override.returns({ other_transaction_id: String }) }
            def to_hash
            end
          end

          class IncorrectAmount < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDisputeCreateParams::Visa::ProcessingError::IncorrectAmount,
                  Increase::Internal::AnyHash
                )
              end

            # Expected amount.
            sig { returns(Integer) }
            attr_accessor :expected_amount

            # Incorrect amount. Required if and only if `error_reason` is `incorrect_amount`.
            sig { params(expected_amount: Integer).returns(T.attached_class) }
            def self.new(
              # Expected amount.
              expected_amount:
            )
            end

            sig { override.returns({ expected_amount: Integer }) }
            def to_hash
            end
          end

          class PaidByOtherMeans < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDisputeCreateParams::Visa::ProcessingError::PaidByOtherMeans,
                  Increase::Internal::AnyHash
                )
              end

            # Other form of payment evidence.
            sig do
              returns(
                Increase::CardDisputeCreateParams::Visa::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence::OrSymbol
              )
            end
            attr_accessor :other_form_of_payment_evidence

            # Other transaction ID.
            sig { returns(T.nilable(String)) }
            attr_reader :other_transaction_id

            sig { params(other_transaction_id: String).void }
            attr_writer :other_transaction_id

            # Paid by other means. Required if and only if `error_reason` is
            # `paid_by_other_means`.
            sig do
              params(
                other_form_of_payment_evidence:
                  Increase::CardDisputeCreateParams::Visa::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence::OrSymbol,
                other_transaction_id: String
              ).returns(T.attached_class)
            end
            def self.new(
              # Other form of payment evidence.
              other_form_of_payment_evidence:,
              # Other transaction ID.
              other_transaction_id: nil
            )
            end

            sig do
              override.returns(
                {
                  other_form_of_payment_evidence:
                    Increase::CardDisputeCreateParams::Visa::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence::OrSymbol,
                  other_transaction_id: String
                }
              )
            end
            def to_hash
            end

            # Other form of payment evidence.
            module OtherFormOfPaymentEvidence
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::CardDisputeCreateParams::Visa::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Canceled check.
              CANCELED_CHECK =
                T.let(
                  :canceled_check,
                  Increase::CardDisputeCreateParams::Visa::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence::TaggedSymbol
                )

              # Card transaction.
              CARD_TRANSACTION =
                T.let(
                  :card_transaction,
                  Increase::CardDisputeCreateParams::Visa::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence::TaggedSymbol
                )

              # Cash receipt.
              CASH_RECEIPT =
                T.let(
                  :cash_receipt,
                  Increase::CardDisputeCreateParams::Visa::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence::TaggedSymbol
                )

              # Other.
              OTHER =
                T.let(
                  :other,
                  Increase::CardDisputeCreateParams::Visa::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence::TaggedSymbol
                )

              # Statement.
              STATEMENT =
                T.let(
                  :statement,
                  Increase::CardDisputeCreateParams::Visa::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence::TaggedSymbol
                )

              # Voucher.
              VOUCHER =
                T.let(
                  :voucher,
                  Increase::CardDisputeCreateParams::Visa::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeCreateParams::Visa::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end
      end
    end
  end
end
