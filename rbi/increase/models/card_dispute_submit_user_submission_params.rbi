# typed: strong

module Increase
  module Models
    class CardDisputeSubmitUserSubmissionParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::CardDisputeSubmitUserSubmissionParams,
            Increase::Internal::AnyHash
          )
        end

      # The network of the Card Dispute. Details specific to the network are required
      # under the sub-object with the same identifier as the network.
      sig do
        returns(
          Increase::CardDisputeSubmitUserSubmissionParams::Network::OrSymbol
        )
      end
      attr_accessor :network

      # The adjusted monetary amount of the part of the transaction that is being
      # disputed. This is optional and will default to the most recent amount provided.
      # If provided, the amount must be less than or equal to the amount of the
      # transaction.
      sig { returns(T.nilable(Integer)) }
      attr_reader :amount

      sig { params(amount: Integer).void }
      attr_writer :amount

      # The files to be attached to the user submission.
      sig do
        returns(
          T.nilable(
            T::Array[
              Increase::CardDisputeSubmitUserSubmissionParams::AttachmentFile
            ]
          )
        )
      end
      attr_reader :attachment_files

      sig do
        params(
          attachment_files:
            T::Array[
              Increase::CardDisputeSubmitUserSubmissionParams::AttachmentFile::OrHash
            ]
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
      sig do
        returns(
          T.nilable(Increase::CardDisputeSubmitUserSubmissionParams::Visa)
        )
      end
      attr_reader :visa

      sig do
        params(
          visa: Increase::CardDisputeSubmitUserSubmissionParams::Visa::OrHash
        ).void
      end
      attr_writer :visa

      sig do
        params(
          network:
            Increase::CardDisputeSubmitUserSubmissionParams::Network::OrSymbol,
          amount: Integer,
          attachment_files:
            T::Array[
              Increase::CardDisputeSubmitUserSubmissionParams::AttachmentFile::OrHash
            ],
          explanation: String,
          visa: Increase::CardDisputeSubmitUserSubmissionParams::Visa::OrHash,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The network of the Card Dispute. Details specific to the network are required
        # under the sub-object with the same identifier as the network.
        network:,
        # The adjusted monetary amount of the part of the transaction that is being
        # disputed. This is optional and will default to the most recent amount provided.
        # If provided, the amount must be less than or equal to the amount of the
        # transaction.
        amount: nil,
        # The files to be attached to the user submission.
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
            network:
              Increase::CardDisputeSubmitUserSubmissionParams::Network::OrSymbol,
            amount: Integer,
            attachment_files:
              T::Array[
                Increase::CardDisputeSubmitUserSubmissionParams::AttachmentFile
              ],
            explanation: String,
            visa: Increase::CardDisputeSubmitUserSubmissionParams::Visa,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      # The network of the Card Dispute. Details specific to the network are required
      # under the sub-object with the same identifier as the network.
      module Network
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              Increase::CardDisputeSubmitUserSubmissionParams::Network
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # Visa
        VISA =
          T.let(
            :visa,
            Increase::CardDisputeSubmitUserSubmissionParams::Network::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Increase::CardDisputeSubmitUserSubmissionParams::Network::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class AttachmentFile < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CardDisputeSubmitUserSubmissionParams::AttachmentFile,
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
              Increase::CardDisputeSubmitUserSubmissionParams::Visa,
              Increase::Internal::AnyHash
            )
          end

        # The category of the user submission. Details specific to the category are
        # required under the sub-object with the same identifier as the category.
        sig do
          returns(
            Increase::CardDisputeSubmitUserSubmissionParams::Visa::Category::OrSymbol
          )
        end
        attr_accessor :category

        # The chargeback details for the user submission. Required if and only if
        # `category` is `chargeback`.
        sig do
          returns(
            T.nilable(
              Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback
            )
          )
        end
        attr_reader :chargeback

        sig do
          params(
            chargeback:
              Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::OrHash
          ).void
        end
        attr_writer :chargeback

        # The merchant pre-arbitration decline details for the user submission. Required
        # if and only if `category` is `merchant_prearbitration_decline`.
        sig do
          returns(
            T.nilable(
              Increase::CardDisputeSubmitUserSubmissionParams::Visa::MerchantPrearbitrationDecline
            )
          )
        end
        attr_reader :merchant_prearbitration_decline

        sig do
          params(
            merchant_prearbitration_decline:
              Increase::CardDisputeSubmitUserSubmissionParams::Visa::MerchantPrearbitrationDecline::OrHash
          ).void
        end
        attr_writer :merchant_prearbitration_decline

        # The user pre-arbitration details for the user submission. Required if and only
        # if `category` is `user_prearbitration`.
        sig do
          returns(
            T.nilable(
              Increase::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration
            )
          )
        end
        attr_reader :user_prearbitration

        sig do
          params(
            user_prearbitration:
              Increase::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration::OrHash
          ).void
        end
        attr_writer :user_prearbitration

        # The Visa-specific parameters for the dispute. Required if and only if `network`
        # is `visa`.
        sig do
          params(
            category:
              Increase::CardDisputeSubmitUserSubmissionParams::Visa::Category::OrSymbol,
            chargeback:
              Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::OrHash,
            merchant_prearbitration_decline:
              Increase::CardDisputeSubmitUserSubmissionParams::Visa::MerchantPrearbitrationDecline::OrHash,
            user_prearbitration:
              Increase::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The category of the user submission. Details specific to the category are
          # required under the sub-object with the same identifier as the category.
          category:,
          # The chargeback details for the user submission. Required if and only if
          # `category` is `chargeback`.
          chargeback: nil,
          # The merchant pre-arbitration decline details for the user submission. Required
          # if and only if `category` is `merchant_prearbitration_decline`.
          merchant_prearbitration_decline: nil,
          # The user pre-arbitration details for the user submission. Required if and only
          # if `category` is `user_prearbitration`.
          user_prearbitration: nil
        )
        end

        sig do
          override.returns(
            {
              category:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Category::OrSymbol,
              chargeback:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback,
              merchant_prearbitration_decline:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::MerchantPrearbitrationDecline,
              user_prearbitration:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration
            }
          )
        end
        def to_hash
        end

        # The category of the user submission. Details specific to the category are
        # required under the sub-object with the same identifier as the category.
        module Category
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Category
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Chargeback.
          CHARGEBACK =
            T.let(
              :chargeback,
              Increase::CardDisputeSubmitUserSubmissionParams::Visa::Category::TaggedSymbol
            )

          # Merchant pre-arbitration decline.
          MERCHANT_PREARBITRATION_DECLINE =
            T.let(
              :merchant_prearbitration_decline,
              Increase::CardDisputeSubmitUserSubmissionParams::Visa::Category::TaggedSymbol
            )

          # User pre-arbitration.
          USER_PREARBITRATION =
            T.let(
              :user_prearbitration,
              Increase::CardDisputeSubmitUserSubmissionParams::Visa::Category::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Category::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Chargeback < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback,
                Increase::Internal::AnyHash
              )
            end

          # Category.
          sig do
            returns(
              Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Category::OrSymbol
            )
          end
          attr_accessor :category

          # Authorization. Required if and only if `category` is `authorization`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Authorization
              )
            )
          end
          attr_reader :authorization

          sig do
            params(
              authorization:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Authorization::OrHash
            ).void
          end
          attr_writer :authorization

          # Canceled merchandise. Required if and only if `category` is
          # `consumer_canceled_merchandise`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise
              )
            )
          end
          attr_reader :consumer_canceled_merchandise

          sig do
            params(
              consumer_canceled_merchandise:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::OrHash
            ).void
          end
          attr_writer :consumer_canceled_merchandise

          # Canceled recurring transaction. Required if and only if `category` is
          # `consumer_canceled_recurring_transaction`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledRecurringTransaction
              )
            )
          end
          attr_reader :consumer_canceled_recurring_transaction

          sig do
            params(
              consumer_canceled_recurring_transaction:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledRecurringTransaction::OrHash
            ).void
          end
          attr_writer :consumer_canceled_recurring_transaction

          # Canceled services. Required if and only if `category` is
          # `consumer_canceled_services`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices
              )
            )
          end
          attr_reader :consumer_canceled_services

          sig do
            params(
              consumer_canceled_services:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::OrHash
            ).void
          end
          attr_writer :consumer_canceled_services

          # Counterfeit merchandise. Required if and only if `category` is
          # `consumer_counterfeit_merchandise`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCounterfeitMerchandise
              )
            )
          end
          attr_reader :consumer_counterfeit_merchandise

          sig do
            params(
              consumer_counterfeit_merchandise:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCounterfeitMerchandise::OrHash
            ).void
          end
          attr_writer :consumer_counterfeit_merchandise

          # Credit not processed. Required if and only if `category` is
          # `consumer_credit_not_processed`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCreditNotProcessed
              )
            )
          end
          attr_reader :consumer_credit_not_processed

          sig do
            params(
              consumer_credit_not_processed:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCreditNotProcessed::OrHash
            ).void
          end
          attr_writer :consumer_credit_not_processed

          # Damaged or defective merchandise. Required if and only if `category` is
          # `consumer_damaged_or_defective_merchandise`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise
              )
            )
          end
          attr_reader :consumer_damaged_or_defective_merchandise

          sig do
            params(
              consumer_damaged_or_defective_merchandise:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::OrHash
            ).void
          end
          attr_writer :consumer_damaged_or_defective_merchandise

          # Merchandise misrepresentation. Required if and only if `category` is
          # `consumer_merchandise_misrepresentation`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation
              )
            )
          end
          attr_reader :consumer_merchandise_misrepresentation

          sig do
            params(
              consumer_merchandise_misrepresentation:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::OrHash
            ).void
          end
          attr_writer :consumer_merchandise_misrepresentation

          # Merchandise not as described. Required if and only if `category` is
          # `consumer_merchandise_not_as_described`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed
              )
            )
          end
          attr_reader :consumer_merchandise_not_as_described

          sig do
            params(
              consumer_merchandise_not_as_described:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::OrHash
            ).void
          end
          attr_writer :consumer_merchandise_not_as_described

          # Merchandise not received. Required if and only if `category` is
          # `consumer_merchandise_not_received`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived
              )
            )
          end
          attr_reader :consumer_merchandise_not_received

          sig do
            params(
              consumer_merchandise_not_received:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::OrHash
            ).void
          end
          attr_writer :consumer_merchandise_not_received

          # Non-receipt of cash. Required if and only if `category` is
          # `consumer_non_receipt_of_cash`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerNonReceiptOfCash
              )
            )
          end
          attr_reader :consumer_non_receipt_of_cash

          sig do
            params(
              consumer_non_receipt_of_cash:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerNonReceiptOfCash::OrHash
            ).void
          end
          attr_writer :consumer_non_receipt_of_cash

          # Original Credit Transaction (OCT) not accepted. Required if and only if
          # `category` is `consumer_original_credit_transaction_not_accepted`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerOriginalCreditTransactionNotAccepted
              )
            )
          end
          attr_reader :consumer_original_credit_transaction_not_accepted

          sig do
            params(
              consumer_original_credit_transaction_not_accepted:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerOriginalCreditTransactionNotAccepted::OrHash
            ).void
          end
          attr_writer :consumer_original_credit_transaction_not_accepted

          # Merchandise quality issue. Required if and only if `category` is
          # `consumer_quality_merchandise`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise
              )
            )
          end
          attr_reader :consumer_quality_merchandise

          sig do
            params(
              consumer_quality_merchandise:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::OrHash
            ).void
          end
          attr_writer :consumer_quality_merchandise

          # Services quality issue. Required if and only if `category` is
          # `consumer_quality_services`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices
              )
            )
          end
          attr_reader :consumer_quality_services

          sig do
            params(
              consumer_quality_services:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::OrHash
            ).void
          end
          attr_writer :consumer_quality_services

          # Services misrepresentation. Required if and only if `category` is
          # `consumer_services_misrepresentation`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesMisrepresentation
              )
            )
          end
          attr_reader :consumer_services_misrepresentation

          sig do
            params(
              consumer_services_misrepresentation:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesMisrepresentation::OrHash
            ).void
          end
          attr_writer :consumer_services_misrepresentation

          # Services not as described. Required if and only if `category` is
          # `consumer_services_not_as_described`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotAsDescribed
              )
            )
          end
          attr_reader :consumer_services_not_as_described

          sig do
            params(
              consumer_services_not_as_described:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotAsDescribed::OrHash
            ).void
          end
          attr_writer :consumer_services_not_as_described

          # Services not received. Required if and only if `category` is
          # `consumer_services_not_received`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived
              )
            )
          end
          attr_reader :consumer_services_not_received

          sig do
            params(
              consumer_services_not_received:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::OrHash
            ).void
          end
          attr_writer :consumer_services_not_received

          # Fraud. Required if and only if `category` is `fraud`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Fraud
              )
            )
          end
          attr_reader :fraud

          sig do
            params(
              fraud:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Fraud::OrHash
            ).void
          end
          attr_writer :fraud

          # Processing error. Required if and only if `category` is `processing_error`.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError
              )
            )
          end
          attr_reader :processing_error

          sig do
            params(
              processing_error:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::OrHash
            ).void
          end
          attr_writer :processing_error

          # The chargeback details for the user submission. Required if and only if
          # `category` is `chargeback`.
          sig do
            params(
              category:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Category::OrSymbol,
              authorization:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Authorization::OrHash,
              consumer_canceled_merchandise:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::OrHash,
              consumer_canceled_recurring_transaction:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledRecurringTransaction::OrHash,
              consumer_canceled_services:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::OrHash,
              consumer_counterfeit_merchandise:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCounterfeitMerchandise::OrHash,
              consumer_credit_not_processed:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCreditNotProcessed::OrHash,
              consumer_damaged_or_defective_merchandise:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::OrHash,
              consumer_merchandise_misrepresentation:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::OrHash,
              consumer_merchandise_not_as_described:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::OrHash,
              consumer_merchandise_not_received:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::OrHash,
              consumer_non_receipt_of_cash:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerNonReceiptOfCash::OrHash,
              consumer_original_credit_transaction_not_accepted:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerOriginalCreditTransactionNotAccepted::OrHash,
              consumer_quality_merchandise:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::OrHash,
              consumer_quality_services:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::OrHash,
              consumer_services_misrepresentation:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesMisrepresentation::OrHash,
              consumer_services_not_as_described:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotAsDescribed::OrHash,
              consumer_services_not_received:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::OrHash,
              fraud:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Fraud::OrHash,
              processing_error:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::OrHash
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
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Category::OrSymbol,
                authorization:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Authorization,
                consumer_canceled_merchandise:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise,
                consumer_canceled_recurring_transaction:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledRecurringTransaction,
                consumer_canceled_services:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices,
                consumer_counterfeit_merchandise:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCounterfeitMerchandise,
                consumer_credit_not_processed:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCreditNotProcessed,
                consumer_damaged_or_defective_merchandise:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise,
                consumer_merchandise_misrepresentation:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation,
                consumer_merchandise_not_as_described:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed,
                consumer_merchandise_not_received:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived,
                consumer_non_receipt_of_cash:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerNonReceiptOfCash,
                consumer_original_credit_transaction_not_accepted:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerOriginalCreditTransactionNotAccepted,
                consumer_quality_merchandise:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise,
                consumer_quality_services:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices,
                consumer_services_misrepresentation:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesMisrepresentation,
                consumer_services_not_as_described:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotAsDescribed,
                consumer_services_not_received:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived,
                fraud:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Fraud,
                processing_error:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError
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
                T.all(
                  Symbol,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Category
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Authorization.
            AUTHORIZATION =
              T.let(
                :authorization,
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Category::TaggedSymbol
              )

            # Consumer: canceled merchandise.
            CONSUMER_CANCELED_MERCHANDISE =
              T.let(
                :consumer_canceled_merchandise,
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Category::TaggedSymbol
              )

            # Consumer: canceled recurring transaction.
            CONSUMER_CANCELED_RECURRING_TRANSACTION =
              T.let(
                :consumer_canceled_recurring_transaction,
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Category::TaggedSymbol
              )

            # Consumer: canceled services.
            CONSUMER_CANCELED_SERVICES =
              T.let(
                :consumer_canceled_services,
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Category::TaggedSymbol
              )

            # Consumer: counterfeit merchandise.
            CONSUMER_COUNTERFEIT_MERCHANDISE =
              T.let(
                :consumer_counterfeit_merchandise,
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Category::TaggedSymbol
              )

            # Consumer: credit not processed.
            CONSUMER_CREDIT_NOT_PROCESSED =
              T.let(
                :consumer_credit_not_processed,
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Category::TaggedSymbol
              )

            # Consumer: damaged or defective merchandise.
            CONSUMER_DAMAGED_OR_DEFECTIVE_MERCHANDISE =
              T.let(
                :consumer_damaged_or_defective_merchandise,
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Category::TaggedSymbol
              )

            # Consumer: merchandise misrepresentation.
            CONSUMER_MERCHANDISE_MISREPRESENTATION =
              T.let(
                :consumer_merchandise_misrepresentation,
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Category::TaggedSymbol
              )

            # Consumer: merchandise not as described.
            CONSUMER_MERCHANDISE_NOT_AS_DESCRIBED =
              T.let(
                :consumer_merchandise_not_as_described,
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Category::TaggedSymbol
              )

            # Consumer: merchandise not received.
            CONSUMER_MERCHANDISE_NOT_RECEIVED =
              T.let(
                :consumer_merchandise_not_received,
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Category::TaggedSymbol
              )

            # Consumer: non-receipt of cash.
            CONSUMER_NON_RECEIPT_OF_CASH =
              T.let(
                :consumer_non_receipt_of_cash,
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Category::TaggedSymbol
              )

            # Consumer: Original Credit Transaction (OCT) not accepted.
            CONSUMER_ORIGINAL_CREDIT_TRANSACTION_NOT_ACCEPTED =
              T.let(
                :consumer_original_credit_transaction_not_accepted,
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Category::TaggedSymbol
              )

            # Consumer: merchandise quality issue.
            CONSUMER_QUALITY_MERCHANDISE =
              T.let(
                :consumer_quality_merchandise,
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Category::TaggedSymbol
              )

            # Consumer: services quality issue.
            CONSUMER_QUALITY_SERVICES =
              T.let(
                :consumer_quality_services,
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Category::TaggedSymbol
              )

            # Consumer: services misrepresentation.
            CONSUMER_SERVICES_MISREPRESENTATION =
              T.let(
                :consumer_services_misrepresentation,
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Category::TaggedSymbol
              )

            # Consumer: services not as described.
            CONSUMER_SERVICES_NOT_AS_DESCRIBED =
              T.let(
                :consumer_services_not_as_described,
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Category::TaggedSymbol
              )

            # Consumer: services not received.
            CONSUMER_SERVICES_NOT_RECEIVED =
              T.let(
                :consumer_services_not_received,
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Category::TaggedSymbol
              )

            # Fraud.
            FRAUD =
              T.let(
                :fraud,
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Category::TaggedSymbol
              )

            # Processing error.
            PROCESSING_ERROR =
              T.let(
                :processing_error,
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Category::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Category::TaggedSymbol
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
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Authorization,
                  Increase::Internal::AnyHash
                )
              end

            # Account status.
            sig do
              returns(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Authorization::AccountStatus::OrSymbol
              )
            end
            attr_accessor :account_status

            # Authorization. Required if and only if `category` is `authorization`.
            sig do
              params(
                account_status:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Authorization::AccountStatus::OrSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Authorization::AccountStatus::OrSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Authorization::AccountStatus
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Account closed.
              ACCOUNT_CLOSED =
                T.let(
                  :account_closed,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Authorization::AccountStatus::TaggedSymbol
                )

              # Credit problem.
              CREDIT_PROBLEM =
                T.let(
                  :credit_problem,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Authorization::AccountStatus::TaggedSymbol
                )

              # Fraud.
              FRAUD =
                T.let(
                  :fraud,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Authorization::AccountStatus::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Authorization::AccountStatus::TaggedSymbol
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
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise,
                  Increase::Internal::AnyHash
                )
              end

            # Merchant resolution attempted.
            sig do
              returns(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::MerchantResolutionAttempted::OrSymbol
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
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::ReturnOutcome::OrSymbol
              )
            end
            attr_accessor :return_outcome

            # Cardholder cancellation.
            sig do
              returns(
                T.nilable(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation
                )
              )
            end
            attr_reader :cardholder_cancellation

            sig do
              params(
                cardholder_cancellation:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::OrHash
              ).void
            end
            attr_writer :cardholder_cancellation

            # Not returned. Required if and only if `return_outcome` is `not_returned`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::NotReturned
                )
              )
            end
            attr_reader :not_returned

            sig do
              params(
                not_returned:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::NotReturned::OrHash
              ).void
            end
            attr_writer :not_returned

            # Return attempted. Required if and only if `return_outcome` is
            # `return_attempted`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted
                )
              )
            end
            attr_reader :return_attempted

            sig do
              params(
                return_attempted:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted::OrHash
              ).void
            end
            attr_writer :return_attempted

            # Returned. Required if and only if `return_outcome` is `returned`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::Returned
                )
              )
            end
            attr_reader :returned

            sig do
              params(
                returned:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::Returned::OrHash
              ).void
            end
            attr_writer :returned

            # Canceled merchandise. Required if and only if `category` is
            # `consumer_canceled_merchandise`.
            sig do
              params(
                merchant_resolution_attempted:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::MerchantResolutionAttempted::OrSymbol,
                purchase_explanation: String,
                received_or_expected_at: Date,
                return_outcome:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::ReturnOutcome::OrSymbol,
                cardholder_cancellation:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::OrHash,
                not_returned:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::NotReturned::OrHash,
                return_attempted:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted::OrHash,
                returned:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::Returned::OrHash
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::MerchantResolutionAttempted::OrSymbol,
                  purchase_explanation: String,
                  received_or_expected_at: Date,
                  return_outcome:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::ReturnOutcome::OrSymbol,
                  cardholder_cancellation:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation,
                  not_returned:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::NotReturned,
                  return_attempted:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted,
                  returned:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::Returned
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::MerchantResolutionAttempted
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Attempted.
              ATTEMPTED =
                T.let(
                  :attempted,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::MerchantResolutionAttempted::TaggedSymbol
                )

              # Prohibited by local law.
              PROHIBITED_BY_LOCAL_LAW =
                T.let(
                  :prohibited_by_local_law,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::MerchantResolutionAttempted::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::MerchantResolutionAttempted::TaggedSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::ReturnOutcome
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Not returned.
              NOT_RETURNED =
                T.let(
                  :not_returned,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::ReturnOutcome::TaggedSymbol
                )

              # Returned.
              RETURNED =
                T.let(
                  :returned,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::ReturnOutcome::TaggedSymbol
                )

              # Return attempted.
              RETURN_ATTEMPTED =
                T.let(
                  :return_attempted,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::ReturnOutcome::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::ReturnOutcome::TaggedSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation,
                    Increase::Internal::AnyHash
                  )
                end

              # Canceled at.
              sig { returns(Date) }
              attr_accessor :canceled_at

              # Canceled prior to ship date.
              sig do
                returns(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CanceledPriorToShipDate::OrSymbol
                )
              end
              attr_accessor :canceled_prior_to_ship_date

              # Cancellation policy provided.
              sig do
                returns(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CancellationPolicyProvided::OrSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CanceledPriorToShipDate::OrSymbol,
                  cancellation_policy_provided:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CancellationPolicyProvided::OrSymbol,
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CanceledPriorToShipDate::OrSymbol,
                    cancellation_policy_provided:
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CancellationPolicyProvided::OrSymbol,
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CanceledPriorToShipDate
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Canceled prior to ship date.
                CANCELED_PRIOR_TO_SHIP_DATE =
                  T.let(
                    :canceled_prior_to_ship_date,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CanceledPriorToShipDate::TaggedSymbol
                  )

                # Not canceled prior to ship date.
                NOT_CANCELED_PRIOR_TO_SHIP_DATE =
                  T.let(
                    :not_canceled_prior_to_ship_date,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CanceledPriorToShipDate::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CanceledPriorToShipDate::TaggedSymbol
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CancellationPolicyProvided
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Not provided.
                NOT_PROVIDED =
                  T.let(
                    :not_provided,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CancellationPolicyProvided::TaggedSymbol
                  )

                # Provided.
                PROVIDED =
                  T.let(
                    :provided,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CancellationPolicyProvided::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::CardholderCancellation::CancellationPolicyProvided::TaggedSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::NotReturned,
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted,
                    Increase::Internal::AnyHash
                  )
                end

              # Attempt explanation.
              sig { returns(String) }
              attr_accessor :attempt_explanation

              # Attempt reason.
              sig do
                returns(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted::AttemptReason::OrSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted::AttemptReason::OrSymbol,
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted::AttemptReason::OrSymbol,
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted::AttemptReason
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Merchant not responding.
                MERCHANT_NOT_RESPONDING =
                  T.let(
                    :merchant_not_responding,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                  )

                # No return authorization provided.
                NO_RETURN_AUTHORIZATION_PROVIDED =
                  T.let(
                    :no_return_authorization_provided,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                  )

                # No return instructions.
                NO_RETURN_INSTRUCTIONS =
                  T.let(
                    :no_return_instructions,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                  )

                # Requested not to return.
                REQUESTED_NOT_TO_RETURN =
                  T.let(
                    :requested_not_to_return,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                  )

                # Return not accepted.
                RETURN_NOT_ACCEPTED =
                  T.let(
                    :return_not_accepted,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::Returned,
                    Increase::Internal::AnyHash
                  )
                end

              # Return method.
              sig do
                returns(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::Returned::ReturnMethod::OrSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::Returned::ReturnMethod::OrSymbol,
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::Returned::ReturnMethod::OrSymbol,
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::Returned::ReturnMethod
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # DHL.
                DHL =
                  T.let(
                    :dhl,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::Returned::ReturnMethod::TaggedSymbol
                  )

                # Face-to-face.
                FACE_TO_FACE =
                  T.let(
                    :face_to_face,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::Returned::ReturnMethod::TaggedSymbol
                  )

                # FedEx.
                FEDEX =
                  T.let(
                    :fedex,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::Returned::ReturnMethod::TaggedSymbol
                  )

                # Other.
                OTHER =
                  T.let(
                    :other,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::Returned::ReturnMethod::TaggedSymbol
                  )

                # Postal service.
                POSTAL_SERVICE =
                  T.let(
                    :postal_service,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::Returned::ReturnMethod::TaggedSymbol
                  )

                # UPS.
                UPS =
                  T.let(
                    :ups,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::Returned::ReturnMethod::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledMerchandise::Returned::ReturnMethod::TaggedSymbol
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
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledRecurringTransaction,
                  Increase::Internal::AnyHash
                )
              end

            # Cancellation target.
            sig do
              returns(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledRecurringTransaction::CancellationTarget::OrSymbol
              )
            end
            attr_accessor :cancellation_target

            # Merchant contact methods.
            sig do
              returns(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledRecurringTransaction::MerchantContactMethods
              )
            end
            attr_reader :merchant_contact_methods

            sig do
              params(
                merchant_contact_methods:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledRecurringTransaction::MerchantContactMethods::OrHash
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
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledRecurringTransaction::CancellationTarget::OrSymbol,
                merchant_contact_methods:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledRecurringTransaction::MerchantContactMethods::OrHash,
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledRecurringTransaction::CancellationTarget::OrSymbol,
                  merchant_contact_methods:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledRecurringTransaction::MerchantContactMethods,
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledRecurringTransaction::CancellationTarget
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Account.
              ACCOUNT =
                T.let(
                  :account,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledRecurringTransaction::CancellationTarget::TaggedSymbol
                )

              # Transaction.
              TRANSACTION =
                T.let(
                  :transaction,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledRecurringTransaction::CancellationTarget::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledRecurringTransaction::CancellationTarget::TaggedSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledRecurringTransaction::MerchantContactMethods,
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
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices,
                  Increase::Internal::AnyHash
                )
              end

            # Cardholder cancellation.
            sig do
              returns(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::CardholderCancellation
              )
            end
            attr_reader :cardholder_cancellation

            sig do
              params(
                cardholder_cancellation:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::CardholderCancellation::OrHash
              ).void
            end
            attr_writer :cardholder_cancellation

            # Contracted at.
            sig { returns(Date) }
            attr_accessor :contracted_at

            # Merchant resolution attempted.
            sig do
              returns(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::MerchantResolutionAttempted::OrSymbol
              )
            end
            attr_accessor :merchant_resolution_attempted

            # Purchase explanation.
            sig { returns(String) }
            attr_accessor :purchase_explanation

            # Service type.
            sig do
              returns(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::ServiceType::OrSymbol
              )
            end
            attr_accessor :service_type

            # Guaranteed reservation explanation. Required if and only if `service_type` is
            # `guaranteed_reservation`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::GuaranteedReservation
                )
              )
            end
            attr_reader :guaranteed_reservation

            sig do
              params(
                guaranteed_reservation:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::GuaranteedReservation::OrHash
              ).void
            end
            attr_writer :guaranteed_reservation

            # Other service type explanation. Required if and only if `service_type` is
            # `other`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::Other
                )
              )
            end
            attr_reader :other

            sig do
              params(
                other:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::Other::OrHash
              ).void
            end
            attr_writer :other

            # Timeshare explanation. Required if and only if `service_type` is `timeshare`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::Timeshare
                )
              )
            end
            attr_reader :timeshare

            sig do
              params(
                timeshare:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::Timeshare::OrHash
              ).void
            end
            attr_writer :timeshare

            # Canceled services. Required if and only if `category` is
            # `consumer_canceled_services`.
            sig do
              params(
                cardholder_cancellation:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::CardholderCancellation::OrHash,
                contracted_at: Date,
                merchant_resolution_attempted:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::MerchantResolutionAttempted::OrSymbol,
                purchase_explanation: String,
                service_type:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::ServiceType::OrSymbol,
                guaranteed_reservation:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::GuaranteedReservation::OrHash,
                other:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::Other::OrHash,
                timeshare:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::Timeshare::OrHash
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::CardholderCancellation,
                  contracted_at: Date,
                  merchant_resolution_attempted:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::MerchantResolutionAttempted::OrSymbol,
                  purchase_explanation: String,
                  service_type:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::ServiceType::OrSymbol,
                  guaranteed_reservation:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::GuaranteedReservation,
                  other:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::Other,
                  timeshare:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::Timeshare
                }
              )
            end
            def to_hash
            end

            class CardholderCancellation < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::CardholderCancellation,
                    Increase::Internal::AnyHash
                  )
                end

              # Canceled at.
              sig { returns(Date) }
              attr_accessor :canceled_at

              # Cancellation policy provided.
              sig do
                returns(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::CardholderCancellation::CancellationPolicyProvided::OrSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::CardholderCancellation::CancellationPolicyProvided::OrSymbol,
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::CardholderCancellation::CancellationPolicyProvided::OrSymbol,
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::CardholderCancellation::CancellationPolicyProvided
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Not provided.
                NOT_PROVIDED =
                  T.let(
                    :not_provided,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::CardholderCancellation::CancellationPolicyProvided::TaggedSymbol
                  )

                # Provided.
                PROVIDED =
                  T.let(
                    :provided,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::CardholderCancellation::CancellationPolicyProvided::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::CardholderCancellation::CancellationPolicyProvided::TaggedSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::MerchantResolutionAttempted
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Attempted.
              ATTEMPTED =
                T.let(
                  :attempted,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::MerchantResolutionAttempted::TaggedSymbol
                )

              # Prohibited by local law.
              PROHIBITED_BY_LOCAL_LAW =
                T.let(
                  :prohibited_by_local_law,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::MerchantResolutionAttempted::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::MerchantResolutionAttempted::TaggedSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::ServiceType
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Guaranteed reservation.
              GUARANTEED_RESERVATION =
                T.let(
                  :guaranteed_reservation,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::ServiceType::TaggedSymbol
                )

              # Other.
              OTHER =
                T.let(
                  :other,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::ServiceType::TaggedSymbol
                )

              # Timeshare.
              TIMESHARE =
                T.let(
                  :timeshare,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::ServiceType::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::ServiceType::TaggedSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::GuaranteedReservation,
                    Increase::Internal::AnyHash
                  )
                end

              # Explanation.
              sig do
                returns(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::GuaranteedReservation::Explanation::OrSymbol
                )
              end
              attr_accessor :explanation

              # Guaranteed reservation explanation. Required if and only if `service_type` is
              # `guaranteed_reservation`.
              sig do
                params(
                  explanation:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::GuaranteedReservation::Explanation::OrSymbol
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::GuaranteedReservation::Explanation::OrSymbol
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::GuaranteedReservation::Explanation
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Cardholder canceled prior to service.
                CARDHOLDER_CANCELED_PRIOR_TO_SERVICE =
                  T.let(
                    :cardholder_canceled_prior_to_service,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::GuaranteedReservation::Explanation::TaggedSymbol
                  )

                # Cardholder cancellation attempt within 24 hours of confirmation.
                CARDHOLDER_CANCELLATION_ATTEMPT_WITHIN_24_HOURS_OF_CONFIRMATION =
                  T.let(
                    :cardholder_cancellation_attempt_within_24_hours_of_confirmation,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::GuaranteedReservation::Explanation::TaggedSymbol
                  )

                # Merchant billed for no-show.
                MERCHANT_BILLED_NO_SHOW =
                  T.let(
                    :merchant_billed_no_show,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::GuaranteedReservation::Explanation::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::GuaranteedReservation::Explanation::TaggedSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::Other,
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCanceledServices::Timeshare,
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
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCounterfeitMerchandise,
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
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerCreditNotProcessed,
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
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise,
                  Increase::Internal::AnyHash
                )
              end

            # Merchant resolution attempted.
            sig do
              returns(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::MerchantResolutionAttempted::OrSymbol
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
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnOutcome::OrSymbol
              )
            end
            attr_accessor :return_outcome

            # Not returned. Required if and only if `return_outcome` is `not_returned`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::NotReturned
                )
              )
            end
            attr_reader :not_returned

            sig do
              params(
                not_returned:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::NotReturned::OrHash
              ).void
            end
            attr_writer :not_returned

            # Return attempted. Required if and only if `return_outcome` is
            # `return_attempted`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted
                )
              )
            end
            attr_reader :return_attempted

            sig do
              params(
                return_attempted:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::OrHash
              ).void
            end
            attr_writer :return_attempted

            # Returned. Required if and only if `return_outcome` is `returned`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned
                )
              )
            end
            attr_reader :returned

            sig do
              params(
                returned:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned::OrHash
              ).void
            end
            attr_writer :returned

            # Damaged or defective merchandise. Required if and only if `category` is
            # `consumer_damaged_or_defective_merchandise`.
            sig do
              params(
                merchant_resolution_attempted:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::MerchantResolutionAttempted::OrSymbol,
                order_and_issue_explanation: String,
                received_at: Date,
                return_outcome:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnOutcome::OrSymbol,
                not_returned:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::NotReturned::OrHash,
                return_attempted:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::OrHash,
                returned:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned::OrHash
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::MerchantResolutionAttempted::OrSymbol,
                  order_and_issue_explanation: String,
                  received_at: Date,
                  return_outcome:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnOutcome::OrSymbol,
                  not_returned:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::NotReturned,
                  return_attempted:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted,
                  returned:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::MerchantResolutionAttempted
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Attempted.
              ATTEMPTED =
                T.let(
                  :attempted,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::MerchantResolutionAttempted::TaggedSymbol
                )

              # Prohibited by local law.
              PROHIBITED_BY_LOCAL_LAW =
                T.let(
                  :prohibited_by_local_law,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::MerchantResolutionAttempted::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::MerchantResolutionAttempted::TaggedSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnOutcome
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Not returned.
              NOT_RETURNED =
                T.let(
                  :not_returned,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnOutcome::TaggedSymbol
                )

              # Returned.
              RETURNED =
                T.let(
                  :returned,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnOutcome::TaggedSymbol
                )

              # Return attempted.
              RETURN_ATTEMPTED =
                T.let(
                  :return_attempted,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnOutcome::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnOutcome::TaggedSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::NotReturned,
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted,
                    Increase::Internal::AnyHash
                  )
                end

              # Attempt explanation.
              sig { returns(String) }
              attr_accessor :attempt_explanation

              # Attempt reason.
              sig do
                returns(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::AttemptReason::OrSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::AttemptReason::OrSymbol,
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::AttemptReason::OrSymbol,
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::AttemptReason
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Merchant not responding.
                MERCHANT_NOT_RESPONDING =
                  T.let(
                    :merchant_not_responding,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                  )

                # No return authorization provided.
                NO_RETURN_AUTHORIZATION_PROVIDED =
                  T.let(
                    :no_return_authorization_provided,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                  )

                # No return instructions.
                NO_RETURN_INSTRUCTIONS =
                  T.let(
                    :no_return_instructions,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                  )

                # Requested not to return.
                REQUESTED_NOT_TO_RETURN =
                  T.let(
                    :requested_not_to_return,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                  )

                # Return not accepted.
                RETURN_NOT_ACCEPTED =
                  T.let(
                    :return_not_accepted,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned,
                    Increase::Internal::AnyHash
                  )
                end

              # Return method.
              sig do
                returns(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod::OrSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod::OrSymbol,
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod::OrSymbol,
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # DHL.
                DHL =
                  T.let(
                    :dhl,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod::TaggedSymbol
                  )

                # Face-to-face.
                FACE_TO_FACE =
                  T.let(
                    :face_to_face,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod::TaggedSymbol
                  )

                # FedEx.
                FEDEX =
                  T.let(
                    :fedex,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod::TaggedSymbol
                  )

                # Other.
                OTHER =
                  T.let(
                    :other,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod::TaggedSymbol
                  )

                # Postal service.
                POSTAL_SERVICE =
                  T.let(
                    :postal_service,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod::TaggedSymbol
                  )

                # UPS.
                UPS =
                  T.let(
                    :ups,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerDamagedOrDefectiveMerchandise::Returned::ReturnMethod::TaggedSymbol
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
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation,
                  Increase::Internal::AnyHash
                )
              end

            # Merchant resolution attempted.
            sig do
              returns(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::MerchantResolutionAttempted::OrSymbol
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
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnOutcome::OrSymbol
              )
            end
            attr_accessor :return_outcome

            # Not returned. Required if and only if `return_outcome` is `not_returned`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::NotReturned
                )
              )
            end
            attr_reader :not_returned

            sig do
              params(
                not_returned:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::NotReturned::OrHash
              ).void
            end
            attr_writer :not_returned

            # Return attempted. Required if and only if `return_outcome` is
            # `return_attempted`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted
                )
              )
            end
            attr_reader :return_attempted

            sig do
              params(
                return_attempted:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted::OrHash
              ).void
            end
            attr_writer :return_attempted

            # Returned. Required if and only if `return_outcome` is `returned`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::Returned
                )
              )
            end
            attr_reader :returned

            sig do
              params(
                returned:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::Returned::OrHash
              ).void
            end
            attr_writer :returned

            # Merchandise misrepresentation. Required if and only if `category` is
            # `consumer_merchandise_misrepresentation`.
            sig do
              params(
                merchant_resolution_attempted:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::MerchantResolutionAttempted::OrSymbol,
                misrepresentation_explanation: String,
                purchase_explanation: String,
                received_at: Date,
                return_outcome:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnOutcome::OrSymbol,
                not_returned:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::NotReturned::OrHash,
                return_attempted:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted::OrHash,
                returned:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::Returned::OrHash
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::MerchantResolutionAttempted::OrSymbol,
                  misrepresentation_explanation: String,
                  purchase_explanation: String,
                  received_at: Date,
                  return_outcome:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnOutcome::OrSymbol,
                  not_returned:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::NotReturned,
                  return_attempted:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted,
                  returned:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::Returned
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::MerchantResolutionAttempted
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Attempted.
              ATTEMPTED =
                T.let(
                  :attempted,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::MerchantResolutionAttempted::TaggedSymbol
                )

              # Prohibited by local law.
              PROHIBITED_BY_LOCAL_LAW =
                T.let(
                  :prohibited_by_local_law,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::MerchantResolutionAttempted::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::MerchantResolutionAttempted::TaggedSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnOutcome
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Not returned.
              NOT_RETURNED =
                T.let(
                  :not_returned,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnOutcome::TaggedSymbol
                )

              # Returned.
              RETURNED =
                T.let(
                  :returned,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnOutcome::TaggedSymbol
                )

              # Return attempted.
              RETURN_ATTEMPTED =
                T.let(
                  :return_attempted,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnOutcome::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnOutcome::TaggedSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::NotReturned,
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted,
                    Increase::Internal::AnyHash
                  )
                end

              # Attempt explanation.
              sig { returns(String) }
              attr_accessor :attempt_explanation

              # Attempt reason.
              sig do
                returns(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted::AttemptReason::OrSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted::AttemptReason::OrSymbol,
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted::AttemptReason::OrSymbol,
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted::AttemptReason
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Merchant not responding.
                MERCHANT_NOT_RESPONDING =
                  T.let(
                    :merchant_not_responding,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted::AttemptReason::TaggedSymbol
                  )

                # No return authorization provided.
                NO_RETURN_AUTHORIZATION_PROVIDED =
                  T.let(
                    :no_return_authorization_provided,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted::AttemptReason::TaggedSymbol
                  )

                # No return instructions.
                NO_RETURN_INSTRUCTIONS =
                  T.let(
                    :no_return_instructions,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted::AttemptReason::TaggedSymbol
                  )

                # Requested not to return.
                REQUESTED_NOT_TO_RETURN =
                  T.let(
                    :requested_not_to_return,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted::AttemptReason::TaggedSymbol
                  )

                # Return not accepted.
                RETURN_NOT_ACCEPTED =
                  T.let(
                    :return_not_accepted,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted::AttemptReason::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::ReturnAttempted::AttemptReason::TaggedSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::Returned,
                    Increase::Internal::AnyHash
                  )
                end

              # Return method.
              sig do
                returns(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod::OrSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod::OrSymbol,
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod::OrSymbol,
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # DHL.
                DHL =
                  T.let(
                    :dhl,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod::TaggedSymbol
                  )

                # Face-to-face.
                FACE_TO_FACE =
                  T.let(
                    :face_to_face,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod::TaggedSymbol
                  )

                # FedEx.
                FEDEX =
                  T.let(
                    :fedex,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod::TaggedSymbol
                  )

                # Other.
                OTHER =
                  T.let(
                    :other,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod::TaggedSymbol
                  )

                # Postal service.
                POSTAL_SERVICE =
                  T.let(
                    :postal_service,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod::TaggedSymbol
                  )

                # UPS.
                UPS =
                  T.let(
                    :ups,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseMisrepresentation::Returned::ReturnMethod::TaggedSymbol
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
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed,
                  Increase::Internal::AnyHash
                )
              end

            # Merchant resolution attempted.
            sig do
              returns(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::MerchantResolutionAttempted::OrSymbol
              )
            end
            attr_accessor :merchant_resolution_attempted

            # Received at.
            sig { returns(Date) }
            attr_accessor :received_at

            # Return outcome.
            sig do
              returns(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnOutcome::OrSymbol
              )
            end
            attr_accessor :return_outcome

            # Return attempted. Required if and only if `return_outcome` is
            # `return_attempted`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted
                )
              )
            end
            attr_reader :return_attempted

            sig do
              params(
                return_attempted:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::OrHash
              ).void
            end
            attr_writer :return_attempted

            # Returned. Required if and only if `return_outcome` is `returned`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned
                )
              )
            end
            attr_reader :returned

            sig do
              params(
                returned:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned::OrHash
              ).void
            end
            attr_writer :returned

            # Merchandise not as described. Required if and only if `category` is
            # `consumer_merchandise_not_as_described`.
            sig do
              params(
                merchant_resolution_attempted:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::MerchantResolutionAttempted::OrSymbol,
                received_at: Date,
                return_outcome:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnOutcome::OrSymbol,
                return_attempted:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::OrHash,
                returned:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned::OrHash
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::MerchantResolutionAttempted::OrSymbol,
                  received_at: Date,
                  return_outcome:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnOutcome::OrSymbol,
                  return_attempted:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted,
                  returned:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::MerchantResolutionAttempted
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Attempted.
              ATTEMPTED =
                T.let(
                  :attempted,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::MerchantResolutionAttempted::TaggedSymbol
                )

              # Prohibited by local law.
              PROHIBITED_BY_LOCAL_LAW =
                T.let(
                  :prohibited_by_local_law,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::MerchantResolutionAttempted::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::MerchantResolutionAttempted::TaggedSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnOutcome
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Returned.
              RETURNED =
                T.let(
                  :returned,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnOutcome::TaggedSymbol
                )

              # Return attempted.
              RETURN_ATTEMPTED =
                T.let(
                  :return_attempted,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnOutcome::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnOutcome::TaggedSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted,
                    Increase::Internal::AnyHash
                  )
                end

              # Attempt explanation.
              sig { returns(String) }
              attr_accessor :attempt_explanation

              # Attempt reason.
              sig do
                returns(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::AttemptReason::OrSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::AttemptReason::OrSymbol,
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::AttemptReason::OrSymbol,
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::AttemptReason
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Merchant not responding.
                MERCHANT_NOT_RESPONDING =
                  T.let(
                    :merchant_not_responding,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::AttemptReason::TaggedSymbol
                  )

                # No return authorization provided.
                NO_RETURN_AUTHORIZATION_PROVIDED =
                  T.let(
                    :no_return_authorization_provided,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::AttemptReason::TaggedSymbol
                  )

                # No return instructions.
                NO_RETURN_INSTRUCTIONS =
                  T.let(
                    :no_return_instructions,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::AttemptReason::TaggedSymbol
                  )

                # Requested not to return.
                REQUESTED_NOT_TO_RETURN =
                  T.let(
                    :requested_not_to_return,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::AttemptReason::TaggedSymbol
                  )

                # Return not accepted.
                RETURN_NOT_ACCEPTED =
                  T.let(
                    :return_not_accepted,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::AttemptReason::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::ReturnAttempted::AttemptReason::TaggedSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned,
                    Increase::Internal::AnyHash
                  )
                end

              # Return method.
              sig do
                returns(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod::OrSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod::OrSymbol,
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod::OrSymbol,
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # DHL.
                DHL =
                  T.let(
                    :dhl,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod::TaggedSymbol
                  )

                # Face-to-face.
                FACE_TO_FACE =
                  T.let(
                    :face_to_face,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod::TaggedSymbol
                  )

                # FedEx.
                FEDEX =
                  T.let(
                    :fedex,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod::TaggedSymbol
                  )

                # Other.
                OTHER =
                  T.let(
                    :other,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod::TaggedSymbol
                  )

                # Postal service.
                POSTAL_SERVICE =
                  T.let(
                    :postal_service,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod::TaggedSymbol
                  )

                # UPS.
                UPS =
                  T.let(
                    :ups,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotAsDescribed::Returned::ReturnMethod::TaggedSymbol
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
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived,
                  Increase::Internal::AnyHash
                )
              end

            # Cancellation outcome.
            sig do
              returns(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::CancellationOutcome::OrSymbol
              )
            end
            attr_accessor :cancellation_outcome

            # Delivery issue.
            sig do
              returns(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::DeliveryIssue::OrSymbol
              )
            end
            attr_accessor :delivery_issue

            # Last expected receipt at.
            sig { returns(Date) }
            attr_accessor :last_expected_receipt_at

            # Merchant resolution attempted.
            sig do
              returns(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::MerchantResolutionAttempted::OrSymbol
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
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::CardholderCancellationPriorToExpectedReceipt
                )
              )
            end
            attr_reader :cardholder_cancellation_prior_to_expected_receipt

            sig do
              params(
                cardholder_cancellation_prior_to_expected_receipt:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::CardholderCancellationPriorToExpectedReceipt::OrHash
              ).void
            end
            attr_writer :cardholder_cancellation_prior_to_expected_receipt

            # Delayed. Required if and only if `delivery_issue` is `delayed`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed
                )
              )
            end
            attr_reader :delayed

            sig do
              params(
                delayed:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed::OrHash
              ).void
            end
            attr_writer :delayed

            # Delivered to wrong location. Required if and only if `delivery_issue` is
            # `delivered_to_wrong_location`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::DeliveredToWrongLocation
                )
              )
            end
            attr_reader :delivered_to_wrong_location

            sig do
              params(
                delivered_to_wrong_location:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::DeliveredToWrongLocation::OrHash
              ).void
            end
            attr_writer :delivered_to_wrong_location

            # Merchant cancellation. Required if and only if `cancellation_outcome` is
            # `merchant_cancellation`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::MerchantCancellation
                )
              )
            end
            attr_reader :merchant_cancellation

            sig do
              params(
                merchant_cancellation:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::MerchantCancellation::OrHash
              ).void
            end
            attr_writer :merchant_cancellation

            # No cancellation. Required if and only if `cancellation_outcome` is
            # `no_cancellation`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::NoCancellation
                )
              )
            end
            attr_reader :no_cancellation

            sig do
              params(
                no_cancellation:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::NoCancellation::OrHash
              ).void
            end
            attr_writer :no_cancellation

            # Merchandise not received. Required if and only if `category` is
            # `consumer_merchandise_not_received`.
            sig do
              params(
                cancellation_outcome:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::CancellationOutcome::OrSymbol,
                delivery_issue:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::DeliveryIssue::OrSymbol,
                last_expected_receipt_at: Date,
                merchant_resolution_attempted:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::MerchantResolutionAttempted::OrSymbol,
                purchase_info_and_explanation: String,
                cardholder_cancellation_prior_to_expected_receipt:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::CardholderCancellationPriorToExpectedReceipt::OrHash,
                delayed:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed::OrHash,
                delivered_to_wrong_location:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::DeliveredToWrongLocation::OrHash,
                merchant_cancellation:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::MerchantCancellation::OrHash,
                no_cancellation:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::NoCancellation::OrHash
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::CancellationOutcome::OrSymbol,
                  delivery_issue:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::DeliveryIssue::OrSymbol,
                  last_expected_receipt_at: Date,
                  merchant_resolution_attempted:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::MerchantResolutionAttempted::OrSymbol,
                  purchase_info_and_explanation: String,
                  cardholder_cancellation_prior_to_expected_receipt:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::CardholderCancellationPriorToExpectedReceipt,
                  delayed:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed,
                  delivered_to_wrong_location:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::DeliveredToWrongLocation,
                  merchant_cancellation:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::MerchantCancellation,
                  no_cancellation:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::NoCancellation
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::CancellationOutcome
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Cardholder cancellation prior to expected receipt.
              CARDHOLDER_CANCELLATION_PRIOR_TO_EXPECTED_RECEIPT =
                T.let(
                  :cardholder_cancellation_prior_to_expected_receipt,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::CancellationOutcome::TaggedSymbol
                )

              # Merchant cancellation.
              MERCHANT_CANCELLATION =
                T.let(
                  :merchant_cancellation,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::CancellationOutcome::TaggedSymbol
                )

              # No cancellation.
              NO_CANCELLATION =
                T.let(
                  :no_cancellation,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::CancellationOutcome::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::CancellationOutcome::TaggedSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::DeliveryIssue
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Delayed.
              DELAYED =
                T.let(
                  :delayed,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::DeliveryIssue::TaggedSymbol
                )

              # Delivered to wrong location.
              DELIVERED_TO_WRONG_LOCATION =
                T.let(
                  :delivered_to_wrong_location,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::DeliveryIssue::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::DeliveryIssue::TaggedSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::MerchantResolutionAttempted
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Attempted.
              ATTEMPTED =
                T.let(
                  :attempted,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::MerchantResolutionAttempted::TaggedSymbol
                )

              # Prohibited by local law.
              PROHIBITED_BY_LOCAL_LAW =
                T.let(
                  :prohibited_by_local_law,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::MerchantResolutionAttempted::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::MerchantResolutionAttempted::TaggedSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::CardholderCancellationPriorToExpectedReceipt,
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed,
                    Increase::Internal::AnyHash
                  )
                end

              # Explanation.
              sig { returns(String) }
              attr_accessor :explanation

              # Return outcome.
              sig do
                returns(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed::ReturnOutcome::OrSymbol
                )
              end
              attr_accessor :return_outcome

              # Not returned. Required if and only if `return_outcome` is `not_returned`.
              sig do
                returns(
                  T.nilable(
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed::NotReturned
                  )
                )
              end
              attr_reader :not_returned

              sig do
                params(
                  not_returned:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed::NotReturned::OrHash
                ).void
              end
              attr_writer :not_returned

              # Return attempted. Required if and only if `return_outcome` is
              # `return_attempted`.
              sig do
                returns(
                  T.nilable(
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed::ReturnAttempted
                  )
                )
              end
              attr_reader :return_attempted

              sig do
                params(
                  return_attempted:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed::ReturnAttempted::OrHash
                ).void
              end
              attr_writer :return_attempted

              # Returned. Required if and only if `return_outcome` is `returned`.
              sig do
                returns(
                  T.nilable(
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed::Returned
                  )
                )
              end
              attr_reader :returned

              sig do
                params(
                  returned:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed::Returned::OrHash
                ).void
              end
              attr_writer :returned

              # Delayed. Required if and only if `delivery_issue` is `delayed`.
              sig do
                params(
                  explanation: String,
                  return_outcome:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed::ReturnOutcome::OrSymbol,
                  not_returned:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed::NotReturned::OrHash,
                  return_attempted:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed::ReturnAttempted::OrHash,
                  returned:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed::Returned::OrHash
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed::ReturnOutcome::OrSymbol,
                    not_returned:
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed::NotReturned,
                    return_attempted:
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed::ReturnAttempted,
                    returned:
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed::Returned
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed::ReturnOutcome
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Not returned.
                NOT_RETURNED =
                  T.let(
                    :not_returned,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed::ReturnOutcome::TaggedSymbol
                  )

                # Returned.
                RETURNED =
                  T.let(
                    :returned,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed::ReturnOutcome::TaggedSymbol
                  )

                # Return attempted.
                RETURN_ATTEMPTED =
                  T.let(
                    :return_attempted,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed::ReturnOutcome::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed::ReturnOutcome::TaggedSymbol
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed::NotReturned,
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed::ReturnAttempted,
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::Delayed::Returned,
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::DeliveredToWrongLocation,
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::MerchantCancellation,
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerMerchandiseNotReceived::NoCancellation,
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
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerNonReceiptOfCash,
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
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerOriginalCreditTransactionNotAccepted,
                  Increase::Internal::AnyHash
                )
              end

            # Explanation.
            sig { returns(String) }
            attr_accessor :explanation

            # Reason.
            sig do
              returns(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerOriginalCreditTransactionNotAccepted::Reason::OrSymbol
              )
            end
            attr_accessor :reason

            # Original Credit Transaction (OCT) not accepted. Required if and only if
            # `category` is `consumer_original_credit_transaction_not_accepted`.
            sig do
              params(
                explanation: String,
                reason:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerOriginalCreditTransactionNotAccepted::Reason::OrSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerOriginalCreditTransactionNotAccepted::Reason::OrSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerOriginalCreditTransactionNotAccepted::Reason
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Prohibited by local laws or regulation.
              PROHIBITED_BY_LOCAL_LAWS_OR_REGULATION =
                T.let(
                  :prohibited_by_local_laws_or_regulation,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerOriginalCreditTransactionNotAccepted::Reason::TaggedSymbol
                )

              # Recipient refused.
              RECIPIENT_REFUSED =
                T.let(
                  :recipient_refused,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerOriginalCreditTransactionNotAccepted::Reason::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerOriginalCreditTransactionNotAccepted::Reason::TaggedSymbol
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
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise,
                  Increase::Internal::AnyHash
                )
              end

            # Expected at.
            sig { returns(Date) }
            attr_accessor :expected_at

            # Merchant resolution attempted.
            sig do
              returns(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::MerchantResolutionAttempted::OrSymbol
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
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::ReturnOutcome::OrSymbol
              )
            end
            attr_accessor :return_outcome

            # Not returned. Required if and only if `return_outcome` is `not_returned`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::NotReturned
                )
              )
            end
            attr_reader :not_returned

            sig do
              params(
                not_returned:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::NotReturned::OrHash
              ).void
            end
            attr_writer :not_returned

            # Ongoing negotiations. Exclude if there is no evidence of ongoing negotiations.
            sig do
              returns(
                T.nilable(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::OngoingNegotiations
                )
              )
            end
            attr_reader :ongoing_negotiations

            sig do
              params(
                ongoing_negotiations:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::OngoingNegotiations::OrHash
              ).void
            end
            attr_writer :ongoing_negotiations

            # Return attempted. Required if and only if `return_outcome` is
            # `return_attempted`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::ReturnAttempted
                )
              )
            end
            attr_reader :return_attempted

            sig do
              params(
                return_attempted:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::ReturnAttempted::OrHash
              ).void
            end
            attr_writer :return_attempted

            # Returned. Required if and only if `return_outcome` is `returned`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::Returned
                )
              )
            end
            attr_reader :returned

            sig do
              params(
                returned:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::Returned::OrHash
              ).void
            end
            attr_writer :returned

            # Merchandise quality issue. Required if and only if `category` is
            # `consumer_quality_merchandise`.
            sig do
              params(
                expected_at: Date,
                merchant_resolution_attempted:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::MerchantResolutionAttempted::OrSymbol,
                purchase_info_and_quality_issue: String,
                received_at: Date,
                return_outcome:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::ReturnOutcome::OrSymbol,
                not_returned:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::NotReturned::OrHash,
                ongoing_negotiations:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::OngoingNegotiations::OrHash,
                return_attempted:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::ReturnAttempted::OrHash,
                returned:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::Returned::OrHash
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::MerchantResolutionAttempted::OrSymbol,
                  purchase_info_and_quality_issue: String,
                  received_at: Date,
                  return_outcome:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::ReturnOutcome::OrSymbol,
                  not_returned:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::NotReturned,
                  ongoing_negotiations:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::OngoingNegotiations,
                  return_attempted:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::ReturnAttempted,
                  returned:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::Returned
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::MerchantResolutionAttempted
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Attempted.
              ATTEMPTED =
                T.let(
                  :attempted,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::MerchantResolutionAttempted::TaggedSymbol
                )

              # Prohibited by local law.
              PROHIBITED_BY_LOCAL_LAW =
                T.let(
                  :prohibited_by_local_law,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::MerchantResolutionAttempted::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::MerchantResolutionAttempted::TaggedSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::ReturnOutcome
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Not returned.
              NOT_RETURNED =
                T.let(
                  :not_returned,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::ReturnOutcome::TaggedSymbol
                )

              # Returned.
              RETURNED =
                T.let(
                  :returned,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::ReturnOutcome::TaggedSymbol
                )

              # Return attempted.
              RETURN_ATTEMPTED =
                T.let(
                  :return_attempted,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::ReturnOutcome::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::ReturnOutcome::TaggedSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::NotReturned,
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::OngoingNegotiations,
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::ReturnAttempted,
                    Increase::Internal::AnyHash
                  )
                end

              # Attempt explanation.
              sig { returns(String) }
              attr_accessor :attempt_explanation

              # Attempt reason.
              sig do
                returns(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::ReturnAttempted::AttemptReason::OrSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::ReturnAttempted::AttemptReason::OrSymbol,
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::ReturnAttempted::AttemptReason::OrSymbol,
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::ReturnAttempted::AttemptReason
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Merchant not responding.
                MERCHANT_NOT_RESPONDING =
                  T.let(
                    :merchant_not_responding,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                  )

                # No return authorization provided.
                NO_RETURN_AUTHORIZATION_PROVIDED =
                  T.let(
                    :no_return_authorization_provided,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                  )

                # No return instructions.
                NO_RETURN_INSTRUCTIONS =
                  T.let(
                    :no_return_instructions,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                  )

                # Requested not to return.
                REQUESTED_NOT_TO_RETURN =
                  T.let(
                    :requested_not_to_return,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                  )

                # Return not accepted.
                RETURN_NOT_ACCEPTED =
                  T.let(
                    :return_not_accepted,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::ReturnAttempted::AttemptReason::TaggedSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::Returned,
                    Increase::Internal::AnyHash
                  )
                end

              # Return method.
              sig do
                returns(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::Returned::ReturnMethod::OrSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::Returned::ReturnMethod::OrSymbol,
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::Returned::ReturnMethod::OrSymbol,
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::Returned::ReturnMethod
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # DHL.
                DHL =
                  T.let(
                    :dhl,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::Returned::ReturnMethod::TaggedSymbol
                  )

                # Face-to-face.
                FACE_TO_FACE =
                  T.let(
                    :face_to_face,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::Returned::ReturnMethod::TaggedSymbol
                  )

                # FedEx.
                FEDEX =
                  T.let(
                    :fedex,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::Returned::ReturnMethod::TaggedSymbol
                  )

                # Other.
                OTHER =
                  T.let(
                    :other,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::Returned::ReturnMethod::TaggedSymbol
                  )

                # Postal service.
                POSTAL_SERVICE =
                  T.let(
                    :postal_service,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::Returned::ReturnMethod::TaggedSymbol
                  )

                # UPS.
                UPS =
                  T.let(
                    :ups,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::Returned::ReturnMethod::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityMerchandise::Returned::ReturnMethod::TaggedSymbol
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
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices,
                  Increase::Internal::AnyHash
                )
              end

            # Cardholder cancellation.
            sig do
              returns(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::CardholderCancellation
              )
            end
            attr_reader :cardholder_cancellation

            sig do
              params(
                cardholder_cancellation:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::CardholderCancellation::OrHash
              ).void
            end
            attr_writer :cardholder_cancellation

            # Non-fiat currency or non-fungible token related and not matching description.
            sig do
              returns(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::NonFiatCurrencyOrNonFungibleTokenRelatedAndNotMatchingDescription::OrSymbol
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
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::CardholderPaidToHaveWorkRedone::OrSymbol
                )
              )
            end
            attr_reader :cardholder_paid_to_have_work_redone

            sig do
              params(
                cardholder_paid_to_have_work_redone:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::CardholderPaidToHaveWorkRedone::OrSymbol
              ).void
            end
            attr_writer :cardholder_paid_to_have_work_redone

            # Ongoing negotiations. Exclude if there is no evidence of ongoing negotiations.
            sig do
              returns(
                T.nilable(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::OngoingNegotiations
                )
              )
            end
            attr_reader :ongoing_negotiations

            sig do
              params(
                ongoing_negotiations:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::OngoingNegotiations::OrHash
              ).void
            end
            attr_writer :ongoing_negotiations

            # Whether the dispute is related to the quality of food from an eating place or
            # restaurant. Must be provided when Merchant Category Code (MCC) is 5812, 5813
            # or 5814.
            sig do
              returns(
                T.nilable(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::RestaurantFoodRelated::OrSymbol
                )
              )
            end
            attr_reader :restaurant_food_related

            sig do
              params(
                restaurant_food_related:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::RestaurantFoodRelated::OrSymbol
              ).void
            end
            attr_writer :restaurant_food_related

            # Services quality issue. Required if and only if `category` is
            # `consumer_quality_services`.
            sig do
              params(
                cardholder_cancellation:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::CardholderCancellation::OrHash,
                non_fiat_currency_or_non_fungible_token_related_and_not_matching_description:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::NonFiatCurrencyOrNonFungibleTokenRelatedAndNotMatchingDescription::OrSymbol,
                purchase_info_and_quality_issue: String,
                services_received_at: Date,
                cardholder_paid_to_have_work_redone:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::CardholderPaidToHaveWorkRedone::OrSymbol,
                ongoing_negotiations:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::OngoingNegotiations::OrHash,
                restaurant_food_related:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::RestaurantFoodRelated::OrSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::CardholderCancellation,
                  non_fiat_currency_or_non_fungible_token_related_and_not_matching_description:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::NonFiatCurrencyOrNonFungibleTokenRelatedAndNotMatchingDescription::OrSymbol,
                  purchase_info_and_quality_issue: String,
                  services_received_at: Date,
                  cardholder_paid_to_have_work_redone:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::CardholderPaidToHaveWorkRedone::OrSymbol,
                  ongoing_negotiations:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::OngoingNegotiations,
                  restaurant_food_related:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::RestaurantFoodRelated::OrSymbol
                }
              )
            end
            def to_hash
            end

            class CardholderCancellation < Increase::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::CardholderCancellation,
                    Increase::Internal::AnyHash
                  )
                end

              # Accepted by merchant.
              sig do
                returns(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::CardholderCancellation::AcceptedByMerchant::OrSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::CardholderCancellation::AcceptedByMerchant::OrSymbol,
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::CardholderCancellation::AcceptedByMerchant::OrSymbol,
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::CardholderCancellation::AcceptedByMerchant
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Accepted.
                ACCEPTED =
                  T.let(
                    :accepted,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::CardholderCancellation::AcceptedByMerchant::TaggedSymbol
                  )

                # Not accepted.
                NOT_ACCEPTED =
                  T.let(
                    :not_accepted,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::CardholderCancellation::AcceptedByMerchant::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::CardholderCancellation::AcceptedByMerchant::TaggedSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::NonFiatCurrencyOrNonFungibleTokenRelatedAndNotMatchingDescription
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Not related.
              NOT_RELATED =
                T.let(
                  :not_related,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::NonFiatCurrencyOrNonFungibleTokenRelatedAndNotMatchingDescription::TaggedSymbol
                )

              # Related.
              RELATED =
                T.let(
                  :related,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::NonFiatCurrencyOrNonFungibleTokenRelatedAndNotMatchingDescription::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::NonFiatCurrencyOrNonFungibleTokenRelatedAndNotMatchingDescription::TaggedSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::CardholderPaidToHaveWorkRedone
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Cardholder did not pay to have work redone.
              DID_NOT_PAY_TO_HAVE_WORK_REDONE =
                T.let(
                  :did_not_pay_to_have_work_redone,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::CardholderPaidToHaveWorkRedone::TaggedSymbol
                )

              # Cardholder paid to have work redone.
              PAID_TO_HAVE_WORK_REDONE =
                T.let(
                  :paid_to_have_work_redone,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::CardholderPaidToHaveWorkRedone::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::CardholderPaidToHaveWorkRedone::TaggedSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::OngoingNegotiations,
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::RestaurantFoodRelated
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Not related.
              NOT_RELATED =
                T.let(
                  :not_related,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::RestaurantFoodRelated::TaggedSymbol
                )

              # Related.
              RELATED =
                T.let(
                  :related,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::RestaurantFoodRelated::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerQualityServices::RestaurantFoodRelated::TaggedSymbol
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
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesMisrepresentation,
                  Increase::Internal::AnyHash
                )
              end

            # Cardholder cancellation.
            sig do
              returns(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesMisrepresentation::CardholderCancellation
              )
            end
            attr_reader :cardholder_cancellation

            sig do
              params(
                cardholder_cancellation:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesMisrepresentation::CardholderCancellation::OrHash
              ).void
            end
            attr_writer :cardholder_cancellation

            # Merchant resolution attempted.
            sig do
              returns(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesMisrepresentation::MerchantResolutionAttempted::OrSymbol
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
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesMisrepresentation::CardholderCancellation::OrHash,
                merchant_resolution_attempted:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesMisrepresentation::MerchantResolutionAttempted::OrSymbol,
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesMisrepresentation::CardholderCancellation,
                  merchant_resolution_attempted:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesMisrepresentation::MerchantResolutionAttempted::OrSymbol,
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesMisrepresentation::CardholderCancellation,
                    Increase::Internal::AnyHash
                  )
                end

              # Accepted by merchant.
              sig do
                returns(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesMisrepresentation::CardholderCancellation::AcceptedByMerchant::OrSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesMisrepresentation::CardholderCancellation::AcceptedByMerchant::OrSymbol,
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesMisrepresentation::CardholderCancellation::AcceptedByMerchant::OrSymbol,
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesMisrepresentation::CardholderCancellation::AcceptedByMerchant
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Accepted.
                ACCEPTED =
                  T.let(
                    :accepted,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesMisrepresentation::CardholderCancellation::AcceptedByMerchant::TaggedSymbol
                  )

                # Not accepted.
                NOT_ACCEPTED =
                  T.let(
                    :not_accepted,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesMisrepresentation::CardholderCancellation::AcceptedByMerchant::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesMisrepresentation::CardholderCancellation::AcceptedByMerchant::TaggedSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesMisrepresentation::MerchantResolutionAttempted
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Attempted.
              ATTEMPTED =
                T.let(
                  :attempted,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesMisrepresentation::MerchantResolutionAttempted::TaggedSymbol
                )

              # Prohibited by local law.
              PROHIBITED_BY_LOCAL_LAW =
                T.let(
                  :prohibited_by_local_law,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesMisrepresentation::MerchantResolutionAttempted::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesMisrepresentation::MerchantResolutionAttempted::TaggedSymbol
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
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotAsDescribed,
                  Increase::Internal::AnyHash
                )
              end

            # Cardholder cancellation.
            sig do
              returns(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotAsDescribed::CardholderCancellation
              )
            end
            attr_reader :cardholder_cancellation

            sig do
              params(
                cardholder_cancellation:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotAsDescribed::CardholderCancellation::OrHash
              ).void
            end
            attr_writer :cardholder_cancellation

            # Merchant resolution attempted.
            sig do
              returns(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotAsDescribed::MerchantResolutionAttempted::OrSymbol
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
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotAsDescribed::CardholderCancellation::OrHash,
                merchant_resolution_attempted:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotAsDescribed::MerchantResolutionAttempted::OrSymbol,
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotAsDescribed::CardholderCancellation,
                  merchant_resolution_attempted:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotAsDescribed::MerchantResolutionAttempted::OrSymbol,
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotAsDescribed::CardholderCancellation,
                    Increase::Internal::AnyHash
                  )
                end

              # Accepted by merchant.
              sig do
                returns(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotAsDescribed::CardholderCancellation::AcceptedByMerchant::OrSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotAsDescribed::CardholderCancellation::AcceptedByMerchant::OrSymbol,
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotAsDescribed::CardholderCancellation::AcceptedByMerchant::OrSymbol,
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotAsDescribed::CardholderCancellation::AcceptedByMerchant
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Accepted.
                ACCEPTED =
                  T.let(
                    :accepted,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotAsDescribed::CardholderCancellation::AcceptedByMerchant::TaggedSymbol
                  )

                # Not accepted.
                NOT_ACCEPTED =
                  T.let(
                    :not_accepted,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotAsDescribed::CardholderCancellation::AcceptedByMerchant::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotAsDescribed::CardholderCancellation::AcceptedByMerchant::TaggedSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotAsDescribed::MerchantResolutionAttempted
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Attempted.
              ATTEMPTED =
                T.let(
                  :attempted,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotAsDescribed::MerchantResolutionAttempted::TaggedSymbol
                )

              # Prohibited by local law.
              PROHIBITED_BY_LOCAL_LAW =
                T.let(
                  :prohibited_by_local_law,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotAsDescribed::MerchantResolutionAttempted::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotAsDescribed::MerchantResolutionAttempted::TaggedSymbol
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
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived,
                  Increase::Internal::AnyHash
                )
              end

            # Cancellation outcome.
            sig do
              returns(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::CancellationOutcome::OrSymbol
              )
            end
            attr_accessor :cancellation_outcome

            # Last expected receipt at.
            sig { returns(Date) }
            attr_accessor :last_expected_receipt_at

            # Merchant resolution attempted.
            sig do
              returns(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::MerchantResolutionAttempted::OrSymbol
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
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::CardholderCancellationPriorToExpectedReceipt
                )
              )
            end
            attr_reader :cardholder_cancellation_prior_to_expected_receipt

            sig do
              params(
                cardholder_cancellation_prior_to_expected_receipt:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::CardholderCancellationPriorToExpectedReceipt::OrHash
              ).void
            end
            attr_writer :cardholder_cancellation_prior_to_expected_receipt

            # Merchant cancellation. Required if and only if `cancellation_outcome` is
            # `merchant_cancellation`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::MerchantCancellation
                )
              )
            end
            attr_reader :merchant_cancellation

            sig do
              params(
                merchant_cancellation:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::MerchantCancellation::OrHash
              ).void
            end
            attr_writer :merchant_cancellation

            # No cancellation. Required if and only if `cancellation_outcome` is
            # `no_cancellation`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::NoCancellation
                )
              )
            end
            attr_reader :no_cancellation

            sig do
              params(
                no_cancellation:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::NoCancellation::OrHash
              ).void
            end
            attr_writer :no_cancellation

            # Services not received. Required if and only if `category` is
            # `consumer_services_not_received`.
            sig do
              params(
                cancellation_outcome:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::CancellationOutcome::OrSymbol,
                last_expected_receipt_at: Date,
                merchant_resolution_attempted:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::MerchantResolutionAttempted::OrSymbol,
                purchase_info_and_explanation: String,
                cardholder_cancellation_prior_to_expected_receipt:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::CardholderCancellationPriorToExpectedReceipt::OrHash,
                merchant_cancellation:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::MerchantCancellation::OrHash,
                no_cancellation:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::NoCancellation::OrHash
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::CancellationOutcome::OrSymbol,
                  last_expected_receipt_at: Date,
                  merchant_resolution_attempted:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::MerchantResolutionAttempted::OrSymbol,
                  purchase_info_and_explanation: String,
                  cardholder_cancellation_prior_to_expected_receipt:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::CardholderCancellationPriorToExpectedReceipt,
                  merchant_cancellation:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::MerchantCancellation,
                  no_cancellation:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::NoCancellation
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::CancellationOutcome
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Cardholder cancellation prior to expected receipt.
              CARDHOLDER_CANCELLATION_PRIOR_TO_EXPECTED_RECEIPT =
                T.let(
                  :cardholder_cancellation_prior_to_expected_receipt,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::CancellationOutcome::TaggedSymbol
                )

              # Merchant cancellation.
              MERCHANT_CANCELLATION =
                T.let(
                  :merchant_cancellation,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::CancellationOutcome::TaggedSymbol
                )

              # No cancellation.
              NO_CANCELLATION =
                T.let(
                  :no_cancellation,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::CancellationOutcome::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::CancellationOutcome::TaggedSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::MerchantResolutionAttempted
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Attempted.
              ATTEMPTED =
                T.let(
                  :attempted,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::MerchantResolutionAttempted::TaggedSymbol
                )

              # Prohibited by local law.
              PROHIBITED_BY_LOCAL_LAW =
                T.let(
                  :prohibited_by_local_law,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::MerchantResolutionAttempted::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::MerchantResolutionAttempted::TaggedSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::CardholderCancellationPriorToExpectedReceipt,
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::MerchantCancellation,
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ConsumerServicesNotReceived::NoCancellation,
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
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Fraud,
                  Increase::Internal::AnyHash
                )
              end

            # Fraud type.
            sig do
              returns(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Fraud::FraudType::OrSymbol
              )
            end
            attr_accessor :fraud_type

            # Fraud. Required if and only if `category` is `fraud`.
            sig do
              params(
                fraud_type:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Fraud::FraudType::OrSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Fraud::FraudType::OrSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Fraud::FraudType
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Account or credentials takeover.
              ACCOUNT_OR_CREDENTIALS_TAKEOVER =
                T.let(
                  :account_or_credentials_takeover,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Fraud::FraudType::TaggedSymbol
                )

              # Card not received as issued.
              CARD_NOT_RECEIVED_AS_ISSUED =
                T.let(
                  :card_not_received_as_issued,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Fraud::FraudType::TaggedSymbol
                )

              # Fraudulent application.
              FRAUDULENT_APPLICATION =
                T.let(
                  :fraudulent_application,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Fraud::FraudType::TaggedSymbol
                )

              # Fraudulent use of account number.
              FRAUDULENT_USE_OF_ACCOUNT_NUMBER =
                T.let(
                  :fraudulent_use_of_account_number,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Fraud::FraudType::TaggedSymbol
                )

              # Incorrect processing.
              INCORRECT_PROCESSING =
                T.let(
                  :incorrect_processing,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Fraud::FraudType::TaggedSymbol
                )

              # Issuer reported counterfeit.
              ISSUER_REPORTED_COUNTERFEIT =
                T.let(
                  :issuer_reported_counterfeit,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Fraud::FraudType::TaggedSymbol
                )

              # Lost.
              LOST =
                T.let(
                  :lost,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Fraud::FraudType::TaggedSymbol
                )

              # Manipulation of account holder.
              MANIPULATION_OF_ACCOUNT_HOLDER =
                T.let(
                  :manipulation_of_account_holder,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Fraud::FraudType::TaggedSymbol
                )

              # Merchant misrepresentation.
              MERCHANT_MISREPRESENTATION =
                T.let(
                  :merchant_misrepresentation,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Fraud::FraudType::TaggedSymbol
                )

              # Miscellaneous.
              MISCELLANEOUS =
                T.let(
                  :miscellaneous,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Fraud::FraudType::TaggedSymbol
                )

              # Stolen.
              STOLEN =
                T.let(
                  :stolen,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Fraud::FraudType::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::Fraud::FraudType::TaggedSymbol
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
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError,
                  Increase::Internal::AnyHash
                )
              end

            # Error reason.
            sig do
              returns(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::ErrorReason::OrSymbol
              )
            end
            attr_accessor :error_reason

            # Merchant resolution attempted.
            sig do
              returns(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::MerchantResolutionAttempted::OrSymbol
              )
            end
            attr_accessor :merchant_resolution_attempted

            # Duplicate transaction. Required if and only if `error_reason` is
            # `duplicate_transaction`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::DuplicateTransaction
                )
              )
            end
            attr_reader :duplicate_transaction

            sig do
              params(
                duplicate_transaction:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::DuplicateTransaction::OrHash
              ).void
            end
            attr_writer :duplicate_transaction

            # Incorrect amount. Required if and only if `error_reason` is `incorrect_amount`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::IncorrectAmount
                )
              )
            end
            attr_reader :incorrect_amount

            sig do
              params(
                incorrect_amount:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::IncorrectAmount::OrHash
              ).void
            end
            attr_writer :incorrect_amount

            # Paid by other means. Required if and only if `error_reason` is
            # `paid_by_other_means`.
            sig do
              returns(
                T.nilable(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::PaidByOtherMeans
                )
              )
            end
            attr_reader :paid_by_other_means

            sig do
              params(
                paid_by_other_means:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::PaidByOtherMeans::OrHash
              ).void
            end
            attr_writer :paid_by_other_means

            # Processing error. Required if and only if `category` is `processing_error`.
            sig do
              params(
                error_reason:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::ErrorReason::OrSymbol,
                merchant_resolution_attempted:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::MerchantResolutionAttempted::OrSymbol,
                duplicate_transaction:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::DuplicateTransaction::OrHash,
                incorrect_amount:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::IncorrectAmount::OrHash,
                paid_by_other_means:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::PaidByOtherMeans::OrHash
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::ErrorReason::OrSymbol,
                  merchant_resolution_attempted:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::MerchantResolutionAttempted::OrSymbol,
                  duplicate_transaction:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::DuplicateTransaction,
                  incorrect_amount:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::IncorrectAmount,
                  paid_by_other_means:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::PaidByOtherMeans
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::ErrorReason
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Duplicate transaction.
              DUPLICATE_TRANSACTION =
                T.let(
                  :duplicate_transaction,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::ErrorReason::TaggedSymbol
                )

              # Incorrect amount.
              INCORRECT_AMOUNT =
                T.let(
                  :incorrect_amount,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::ErrorReason::TaggedSymbol
                )

              # Paid by other means.
              PAID_BY_OTHER_MEANS =
                T.let(
                  :paid_by_other_means,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::ErrorReason::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::ErrorReason::TaggedSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::MerchantResolutionAttempted
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Attempted.
              ATTEMPTED =
                T.let(
                  :attempted,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::MerchantResolutionAttempted::TaggedSymbol
                )

              # Prohibited by local law.
              PROHIBITED_BY_LOCAL_LAW =
                T.let(
                  :prohibited_by_local_law,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::MerchantResolutionAttempted::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::MerchantResolutionAttempted::TaggedSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::DuplicateTransaction,
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::IncorrectAmount,
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::PaidByOtherMeans,
                    Increase::Internal::AnyHash
                  )
                end

              # Other form of payment evidence.
              sig do
                returns(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence::OrSymbol
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
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence::OrSymbol,
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence::OrSymbol,
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
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                # Canceled check.
                CANCELED_CHECK =
                  T.let(
                    :canceled_check,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence::TaggedSymbol
                  )

                # Card transaction.
                CARD_TRANSACTION =
                  T.let(
                    :card_transaction,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence::TaggedSymbol
                  )

                # Cash receipt.
                CASH_RECEIPT =
                  T.let(
                    :cash_receipt,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence::TaggedSymbol
                  )

                # Other.
                OTHER =
                  T.let(
                    :other,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence::TaggedSymbol
                  )

                # Statement.
                STATEMENT =
                  T.let(
                    :statement,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence::TaggedSymbol
                  )

                # Voucher.
                VOUCHER =
                  T.let(
                    :voucher,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Increase::CardDisputeSubmitUserSubmissionParams::Visa::Chargeback::ProcessingError::PaidByOtherMeans::OtherFormOfPaymentEvidence::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end
            end
          end
        end

        class MerchantPrearbitrationDecline < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::MerchantPrearbitrationDecline,
                Increase::Internal::AnyHash
              )
            end

          # The reason for declining the merchant's pre-arbitration request.
          sig { returns(String) }
          attr_accessor :reason

          # The merchant pre-arbitration decline details for the user submission. Required
          # if and only if `category` is `merchant_prearbitration_decline`.
          sig { params(reason: String).returns(T.attached_class) }
          def self.new(
            # The reason for declining the merchant's pre-arbitration request.
            reason:
          )
          end

          sig { override.returns({ reason: String }) }
          def to_hash
          end
        end

        class UserPrearbitration < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration,
                Increase::Internal::AnyHash
              )
            end

          # The reason for the pre-arbitration request.
          sig { returns(String) }
          attr_accessor :reason

          # Category change details for the pre-arbitration request. Should only be
          # populated if the category of the dispute is being changed as part of the
          # pre-arbitration request.
          sig do
            returns(
              T.nilable(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration::CategoryChange
              )
            )
          end
          attr_reader :category_change

          sig do
            params(
              category_change:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration::CategoryChange::OrHash
            ).void
          end
          attr_writer :category_change

          # The user pre-arbitration details for the user submission. Required if and only
          # if `category` is `user_prearbitration`.
          sig do
            params(
              reason: String,
              category_change:
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration::CategoryChange::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # The reason for the pre-arbitration request.
            reason:,
            # Category change details for the pre-arbitration request. Should only be
            # populated if the category of the dispute is being changed as part of the
            # pre-arbitration request.
            category_change: nil
          )
          end

          sig do
            override.returns(
              {
                reason: String,
                category_change:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration::CategoryChange
              }
            )
          end
          def to_hash
          end

          class CategoryChange < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration::CategoryChange,
                  Increase::Internal::AnyHash
                )
              end

            sig do
              returns(
                Increase::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration::CategoryChange::Category::OrSymbol
              )
            end
            attr_accessor :category

            # The reason for the category change.
            sig { returns(String) }
            attr_accessor :reason

            # Category change details for the pre-arbitration request. Should only be
            # populated if the category of the dispute is being changed as part of the
            # pre-arbitration request.
            sig do
              params(
                category:
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration::CategoryChange::Category::OrSymbol,
                reason: String
              ).returns(T.attached_class)
            end
            def self.new(
              category:,
              # The reason for the category change.
              reason:
            )
            end

            sig do
              override.returns(
                {
                  category:
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration::CategoryChange::Category::OrSymbol,
                  reason: String
                }
              )
            end
            def to_hash
            end

            module Category
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration::CategoryChange::Category
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Authorization.
              AUTHORIZATION =
                T.let(
                  :authorization,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                )

              # Consumer: canceled merchandise.
              CONSUMER_CANCELED_MERCHANDISE =
                T.let(
                  :consumer_canceled_merchandise,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                )

              # Consumer: canceled recurring transaction.
              CONSUMER_CANCELED_RECURRING_TRANSACTION =
                T.let(
                  :consumer_canceled_recurring_transaction,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                )

              # Consumer: canceled services.
              CONSUMER_CANCELED_SERVICES =
                T.let(
                  :consumer_canceled_services,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                )

              # Consumer: counterfeit merchandise.
              CONSUMER_COUNTERFEIT_MERCHANDISE =
                T.let(
                  :consumer_counterfeit_merchandise,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                )

              # Consumer: credit not processed.
              CONSUMER_CREDIT_NOT_PROCESSED =
                T.let(
                  :consumer_credit_not_processed,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                )

              # Consumer: damaged or defective merchandise.
              CONSUMER_DAMAGED_OR_DEFECTIVE_MERCHANDISE =
                T.let(
                  :consumer_damaged_or_defective_merchandise,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                )

              # Consumer: merchandise misrepresentation.
              CONSUMER_MERCHANDISE_MISREPRESENTATION =
                T.let(
                  :consumer_merchandise_misrepresentation,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                )

              # Consumer: merchandise not as described.
              CONSUMER_MERCHANDISE_NOT_AS_DESCRIBED =
                T.let(
                  :consumer_merchandise_not_as_described,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                )

              # Consumer: merchandise not received.
              CONSUMER_MERCHANDISE_NOT_RECEIVED =
                T.let(
                  :consumer_merchandise_not_received,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                )

              # Consumer: non-receipt of cash.
              CONSUMER_NON_RECEIPT_OF_CASH =
                T.let(
                  :consumer_non_receipt_of_cash,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                )

              # Consumer: Original Credit Transaction (OCT) not accepted.
              CONSUMER_ORIGINAL_CREDIT_TRANSACTION_NOT_ACCEPTED =
                T.let(
                  :consumer_original_credit_transaction_not_accepted,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                )

              # Consumer: merchandise quality issue.
              CONSUMER_QUALITY_MERCHANDISE =
                T.let(
                  :consumer_quality_merchandise,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                )

              # Consumer: services quality issue.
              CONSUMER_QUALITY_SERVICES =
                T.let(
                  :consumer_quality_services,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                )

              # Consumer: services misrepresentation.
              CONSUMER_SERVICES_MISREPRESENTATION =
                T.let(
                  :consumer_services_misrepresentation,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                )

              # Consumer: services not as described.
              CONSUMER_SERVICES_NOT_AS_DESCRIBED =
                T.let(
                  :consumer_services_not_as_described,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                )

              # Consumer: services not received.
              CONSUMER_SERVICES_NOT_RECEIVED =
                T.let(
                  :consumer_services_not_received,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                )

              # Fraud.
              FRAUD =
                T.let(
                  :fraud,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                )

              # Processing error.
              PROCESSING_ERROR =
                T.let(
                  :processing_error,
                  Increase::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration::CategoryChange::Category::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::CardDisputeSubmitUserSubmissionParams::Visa::UserPrearbitration::CategoryChange::Category::TaggedSymbol
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
