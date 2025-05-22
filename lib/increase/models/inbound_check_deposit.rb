# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::InboundCheckDeposits#retrieve
    class InboundCheckDeposit < Increase::Internal::Type::BaseModel
      # @!attribute id
      #   The deposit's identifier.
      #
      #   @return [String]
      required :id, String

      # @!attribute accepted_at
      #   If the Inbound Check Deposit was accepted, the
      #   [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which this
      #   took place.
      #
      #   @return [Time, nil]
      required :accepted_at, Time, nil?: true

      # @!attribute account_id
      #   The Account the check is being deposited against.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute account_number_id
      #   The Account Number the check is being deposited against.
      #
      #   @return [String, nil]
      required :account_number_id, String, nil?: true

      # @!attribute adjustments
      #   If the deposit or the return was adjusted by the sending institution, this will
      #   contain details of the adjustments.
      #
      #   @return [Array<Increase::Models::InboundCheckDeposit::Adjustment>]
      required :adjustments,
               -> {
                 Increase::Internal::Type::ArrayOf[Increase::InboundCheckDeposit::Adjustment]
               }

      # @!attribute amount
      #   The deposited amount in USD cents.
      #
      #   @return [Integer]
      required :amount, Integer

      # @!attribute back_image_file_id
      #   The ID for the File containing the image of the back of the check.
      #
      #   @return [String, nil]
      required :back_image_file_id, String, nil?: true

      # @!attribute bank_of_first_deposit_routing_number
      #   The American Bankers' Association (ABA) Routing Transit Number (RTN) for the
      #   bank depositing this check. In some rare cases, this is not transmitted via
      #   Check21 and the value will be null.
      #
      #   @return [String, nil]
      required :bank_of_first_deposit_routing_number, String, nil?: true

      # @!attribute check_number
      #   The check number printed on the check being deposited.
      #
      #   @return [String, nil]
      required :check_number, String, nil?: true

      # @!attribute check_transfer_id
      #   If this deposit is for an existing Check Transfer, the identifier of that Check
      #   Transfer.
      #
      #   @return [String, nil]
      required :check_transfer_id, String, nil?: true

      # @!attribute created_at
      #   The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      #   the deposit was attempted.
      #
      #   @return [Time]
      required :created_at, Time

      # @!attribute currency
      #   The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the deposit.
      #
      #   @return [Symbol, Increase::Models::InboundCheckDeposit::Currency]
      required :currency, enum: -> { Increase::InboundCheckDeposit::Currency }

      # @!attribute declined_at
      #   If the Inbound Check Deposit was declined, the
      #   [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which this
      #   took place.
      #
      #   @return [Time, nil]
      required :declined_at, Time, nil?: true

      # @!attribute declined_transaction_id
      #   If the deposit attempt has been rejected, the identifier of the Declined
      #   Transaction object created as a result of the failed deposit.
      #
      #   @return [String, nil]
      required :declined_transaction_id, String, nil?: true

      # @!attribute deposit_return
      #   If you requested a return of this deposit, this will contain details of the
      #   return.
      #
      #   @return [Increase::Models::InboundCheckDeposit::DepositReturn, nil]
      required :deposit_return, -> { Increase::InboundCheckDeposit::DepositReturn }, nil?: true

      # @!attribute front_image_file_id
      #   The ID for the File containing the image of the front of the check.
      #
      #   @return [String, nil]
      required :front_image_file_id, String, nil?: true

      # @!attribute payee_name_analysis
      #   Whether the details on the check match the recipient name of the check transfer.
      #   This is an optional feature, contact sales to enable.
      #
      #   @return [Symbol, Increase::Models::InboundCheckDeposit::PayeeNameAnalysis]
      required :payee_name_analysis, enum: -> { Increase::InboundCheckDeposit::PayeeNameAnalysis }

      # @!attribute status
      #   The status of the Inbound Check Deposit.
      #
      #   @return [Symbol, Increase::Models::InboundCheckDeposit::Status]
      required :status, enum: -> { Increase::InboundCheckDeposit::Status }

      # @!attribute transaction_id
      #   If the deposit attempt has been accepted, the identifier of the Transaction
      #   object created as a result of the successful deposit.
      #
      #   @return [String, nil]
      required :transaction_id, String, nil?: true

      # @!attribute type
      #   A constant representing the object's type. For this resource it will always be
      #   `inbound_check_deposit`.
      #
      #   @return [Symbol, Increase::Models::InboundCheckDeposit::Type]
      required :type, enum: -> { Increase::InboundCheckDeposit::Type }

      # @!method initialize(id:, accepted_at:, account_id:, account_number_id:, adjustments:, amount:, back_image_file_id:, bank_of_first_deposit_routing_number:, check_number:, check_transfer_id:, created_at:, currency:, declined_at:, declined_transaction_id:, deposit_return:, front_image_file_id:, payee_name_analysis:, status:, transaction_id:, type:)
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::InboundCheckDeposit} for more details.
      #
      #   Inbound Check Deposits are records of third-parties attempting to deposit checks
      #   against your account.
      #
      #   @param id [String] The deposit's identifier.
      #
      #   @param accepted_at [Time, nil] If the Inbound Check Deposit was accepted, the [ISO 8601](https://en.wikipedia.o
      #
      #   @param account_id [String] The Account the check is being deposited against.
      #
      #   @param account_number_id [String, nil] The Account Number the check is being deposited against.
      #
      #   @param adjustments [Array<Increase::Models::InboundCheckDeposit::Adjustment>] If the deposit or the return was adjusted by the sending institution, this will
      #
      #   @param amount [Integer] The deposited amount in USD cents.
      #
      #   @param back_image_file_id [String, nil] The ID for the File containing the image of the back of the check.
      #
      #   @param bank_of_first_deposit_routing_number [String, nil] The American Bankers' Association (ABA) Routing Transit Number (RTN) for the ban
      #
      #   @param check_number [String, nil] The check number printed on the check being deposited.
      #
      #   @param check_transfer_id [String, nil] If this deposit is for an existing Check Transfer, the identifier of that Check
      #
      #   @param created_at [Time] The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which th
      #
      #   @param currency [Symbol, Increase::Models::InboundCheckDeposit::Currency] The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the deposit.
      #
      #   @param declined_at [Time, nil] If the Inbound Check Deposit was declined, the [ISO 8601](https://en.wikipedia.o
      #
      #   @param declined_transaction_id [String, nil] If the deposit attempt has been rejected, the identifier of the Declined Transac
      #
      #   @param deposit_return [Increase::Models::InboundCheckDeposit::DepositReturn, nil] If you requested a return of this deposit, this will contain details of the retu
      #
      #   @param front_image_file_id [String, nil] The ID for the File containing the image of the front of the check.
      #
      #   @param payee_name_analysis [Symbol, Increase::Models::InboundCheckDeposit::PayeeNameAnalysis] Whether the details on the check match the recipient name of the check transfer.
      #
      #   @param status [Symbol, Increase::Models::InboundCheckDeposit::Status] The status of the Inbound Check Deposit.
      #
      #   @param transaction_id [String, nil] If the deposit attempt has been accepted, the identifier of the Transaction obje
      #
      #   @param type [Symbol, Increase::Models::InboundCheckDeposit::Type] A constant representing the object's type. For this resource it will always be `

      class Adjustment < Increase::Internal::Type::BaseModel
        # @!attribute adjusted_at
        #   The time at which the return adjustment was received.
        #
        #   @return [Time]
        required :adjusted_at, Time

        # @!attribute amount
        #   The amount of the adjustment.
        #
        #   @return [Integer]
        required :amount, Integer

        # @!attribute reason
        #   The reason for the adjustment.
        #
        #   @return [Symbol, Increase::Models::InboundCheckDeposit::Adjustment::Reason]
        required :reason, enum: -> { Increase::InboundCheckDeposit::Adjustment::Reason }

        # @!attribute transaction_id
        #   The id of the transaction for the adjustment.
        #
        #   @return [String]
        required :transaction_id, String

        # @!method initialize(adjusted_at:, amount:, reason:, transaction_id:)
        #   @param adjusted_at [Time] The time at which the return adjustment was received.
        #
        #   @param amount [Integer] The amount of the adjustment.
        #
        #   @param reason [Symbol, Increase::Models::InboundCheckDeposit::Adjustment::Reason] The reason for the adjustment.
        #
        #   @param transaction_id [String] The id of the transaction for the adjustment.

        # The reason for the adjustment.
        #
        # @see Increase::Models::InboundCheckDeposit::Adjustment#reason
        module Reason
          extend Increase::Internal::Type::Enum

          # The return was initiated too late and the receiving institution has responded with a Late Return Claim.
          LATE_RETURN = :late_return

          # The check was deposited to the wrong payee and the depositing institution has reimbursed the funds with a Wrong Payee Credit.
          WRONG_PAYEE_CREDIT = :wrong_payee_credit

          # The check was deposited with a different amount than what was written on the check.
          ADJUSTED_AMOUNT = :adjusted_amount

          # The recipient was not able to process the check. This usually happens for e.g., low quality images.
          NON_CONFORMING_ITEM = :non_conforming_item

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the deposit.
      #
      # @see Increase::Models::InboundCheckDeposit#currency
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

      # @see Increase::Models::InboundCheckDeposit#deposit_return
      class DepositReturn < Increase::Internal::Type::BaseModel
        # @!attribute reason
        #   The reason the deposit was returned.
        #
        #   @return [Symbol, Increase::Models::InboundCheckDeposit::DepositReturn::Reason]
        required :reason, enum: -> { Increase::InboundCheckDeposit::DepositReturn::Reason }

        # @!attribute returned_at
        #   The time at which the deposit was returned.
        #
        #   @return [Time]
        required :returned_at, Time

        # @!attribute transaction_id
        #   The id of the transaction for the returned deposit.
        #
        #   @return [String]
        required :transaction_id, String

        # @!method initialize(reason:, returned_at:, transaction_id:)
        #   If you requested a return of this deposit, this will contain details of the
        #   return.
        #
        #   @param reason [Symbol, Increase::Models::InboundCheckDeposit::DepositReturn::Reason] The reason the deposit was returned.
        #
        #   @param returned_at [Time] The time at which the deposit was returned.
        #
        #   @param transaction_id [String] The id of the transaction for the returned deposit.

        # The reason the deposit was returned.
        #
        # @see Increase::Models::InboundCheckDeposit::DepositReturn#reason
        module Reason
          extend Increase::Internal::Type::Enum

          # The check was altered or fictitious.
          ALTERED_OR_FICTITIOUS = :altered_or_fictitious

          # The check was not authorized.
          NOT_AUTHORIZED = :not_authorized

          # The check was a duplicate presentment.
          DUPLICATE_PRESENTMENT = :duplicate_presentment

          # The check was not endorsed.
          ENDORSEMENT_MISSING = :endorsement_missing

          # The check was not endorsed by the payee.
          ENDORSEMENT_IRREGULAR = :endorsement_irregular

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end

      # Whether the details on the check match the recipient name of the check transfer.
      # This is an optional feature, contact sales to enable.
      #
      # @see Increase::Models::InboundCheckDeposit#payee_name_analysis
      module PayeeNameAnalysis
        extend Increase::Internal::Type::Enum

        # The details on the check match the recipient name of the check transfer.
        NAME_MATCHES = :name_matches

        # The details on the check do not match the recipient name of the check transfer.
        DOES_NOT_MATCH = :does_not_match

        # The payee name analysis was not evaluated.
        NOT_EVALUATED = :not_evaluated

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # The status of the Inbound Check Deposit.
      #
      # @see Increase::Models::InboundCheckDeposit#status
      module Status
        extend Increase::Internal::Type::Enum

        # The Inbound Check Deposit is pending.
        PENDING = :pending

        # The Inbound Check Deposit was accepted.
        ACCEPTED = :accepted

        # The Inbound Check Deposit was rejected.
        DECLINED = :declined

        # The Inbound Check Deposit was returned.
        RETURNED = :returned

        # The Inbound Check Deposit requires attention from an Increase operator.
        REQUIRES_ATTENTION = :requires_attention

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # A constant representing the object's type. For this resource it will always be
      # `inbound_check_deposit`.
      #
      # @see Increase::Models::InboundCheckDeposit#type
      module Type
        extend Increase::Internal::Type::Enum

        INBOUND_CHECK_DEPOSIT = :inbound_check_deposit

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end
  end
end
