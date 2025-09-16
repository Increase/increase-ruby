# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::WireTransfers#create
    class WireTransferCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_id
      #   The identifier for the account that will send the transfer.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute amount
      #   The transfer amount in USD cents.
      #
      #   @return [Integer]
      required :amount, Integer

      # @!attribute beneficiary_name
      #   The beneficiary's name.
      #
      #   @return [String]
      required :beneficiary_name, String

      # @!attribute account_number
      #   The account number for the destination account.
      #
      #   @return [String, nil]
      optional :account_number, String

      # @!attribute beneficiary_address_line1
      #   The beneficiary's address line 1.
      #
      #   @return [String, nil]
      optional :beneficiary_address_line1, String

      # @!attribute beneficiary_address_line2
      #   The beneficiary's address line 2.
      #
      #   @return [String, nil]
      optional :beneficiary_address_line2, String

      # @!attribute beneficiary_address_line3
      #   The beneficiary's address line 3.
      #
      #   @return [String, nil]
      optional :beneficiary_address_line3, String

      # @!attribute external_account_id
      #   The ID of an External Account to initiate a transfer to. If this parameter is
      #   provided, `account_number` and `routing_number` must be absent.
      #
      #   @return [String, nil]
      optional :external_account_id, String

      # @!attribute inbound_wire_drawdown_request_id
      #   The ID of an Inbound Wire Drawdown Request in response to which this transfer is
      #   being sent.
      #
      #   @return [String, nil]
      optional :inbound_wire_drawdown_request_id, String

      # @!attribute originator_address_line1
      #   The originator's address line 1. This is only necessary if you're transferring
      #   from a commingled account. Otherwise, we'll use the associated entity's details.
      #
      #   @return [String, nil]
      optional :originator_address_line1, String

      # @!attribute originator_address_line2
      #   The originator's address line 2. This is only necessary if you're transferring
      #   from a commingled account. Otherwise, we'll use the associated entity's details.
      #
      #   @return [String, nil]
      optional :originator_address_line2, String

      # @!attribute originator_address_line3
      #   The originator's address line 3. This is only necessary if you're transferring
      #   from a commingled account. Otherwise, we'll use the associated entity's details.
      #
      #   @return [String, nil]
      optional :originator_address_line3, String

      # @!attribute originator_name
      #   The originator's name. This is only necessary if you're transferring from a
      #   commingled account. Otherwise, we'll use the associated entity's details.
      #
      #   @return [String, nil]
      optional :originator_name, String

      # @!attribute remittance
      #   Additional remittance information related to the wire transfer.
      #
      #   @return [Increase::Models::WireTransferCreateParams::Remittance, nil]
      optional :remittance, -> { Increase::WireTransferCreateParams::Remittance }

      # @!attribute require_approval
      #   Whether the transfer requires explicit approval via the dashboard or API.
      #
      #   @return [Boolean, nil]
      optional :require_approval, Increase::Internal::Type::Boolean

      # @!attribute routing_number
      #   The American Bankers' Association (ABA) Routing Transit Number (RTN) for the
      #   destination account.
      #
      #   @return [String, nil]
      optional :routing_number, String

      # @!attribute source_account_number_id
      #   The ID of an Account Number that will be passed to the wire's recipient
      #
      #   @return [String, nil]
      optional :source_account_number_id, String

      # @!method initialize(account_id:, amount:, beneficiary_name:, account_number: nil, beneficiary_address_line1: nil, beneficiary_address_line2: nil, beneficiary_address_line3: nil, external_account_id: nil, inbound_wire_drawdown_request_id: nil, originator_address_line1: nil, originator_address_line2: nil, originator_address_line3: nil, originator_name: nil, remittance: nil, require_approval: nil, routing_number: nil, source_account_number_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::WireTransferCreateParams} for more details.
      #
      #   @param account_id [String] The identifier for the account that will send the transfer.
      #
      #   @param amount [Integer] The transfer amount in USD cents.
      #
      #   @param beneficiary_name [String] The beneficiary's name.
      #
      #   @param account_number [String] The account number for the destination account.
      #
      #   @param beneficiary_address_line1 [String] The beneficiary's address line 1.
      #
      #   @param beneficiary_address_line2 [String] The beneficiary's address line 2.
      #
      #   @param beneficiary_address_line3 [String] The beneficiary's address line 3.
      #
      #   @param external_account_id [String] The ID of an External Account to initiate a transfer to. If this parameter is pr
      #
      #   @param inbound_wire_drawdown_request_id [String] The ID of an Inbound Wire Drawdown Request in response to which this transfer is
      #
      #   @param originator_address_line1 [String] The originator's address line 1. This is only necessary if you're transferring f
      #
      #   @param originator_address_line2 [String] The originator's address line 2. This is only necessary if you're transferring f
      #
      #   @param originator_address_line3 [String] The originator's address line 3. This is only necessary if you're transferring f
      #
      #   @param originator_name [String] The originator's name. This is only necessary if you're transferring from a comm
      #
      #   @param remittance [Increase::Models::WireTransferCreateParams::Remittance] Additional remittance information related to the wire transfer.
      #
      #   @param require_approval [Boolean] Whether the transfer requires explicit approval via the dashboard or API.
      #
      #   @param routing_number [String] The American Bankers' Association (ABA) Routing Transit Number (RTN) for the des
      #
      #   @param source_account_number_id [String] The ID of an Account Number that will be passed to the wire's recipient
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      class Remittance < Increase::Internal::Type::BaseModel
        # @!attribute category
        #   The type of remittance information being passed.
        #
        #   @return [Symbol, Increase::Models::WireTransferCreateParams::Remittance::Category]
        required :category, enum: -> { Increase::WireTransferCreateParams::Remittance::Category }

        # @!attribute tax
        #   Internal Revenue Service (IRS) tax repayment information. Required if `category`
        #   is equal to `tax`.
        #
        #   @return [Increase::Models::WireTransferCreateParams::Remittance::Tax, nil]
        optional :tax, -> { Increase::WireTransferCreateParams::Remittance::Tax }

        # @!attribute unstructured
        #   Unstructured remittance information. Required if `category` is equal to
        #   `unstructured`.
        #
        #   @return [Increase::Models::WireTransferCreateParams::Remittance::Unstructured, nil]
        optional :unstructured, -> { Increase::WireTransferCreateParams::Remittance::Unstructured }

        # @!method initialize(category:, tax: nil, unstructured: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::WireTransferCreateParams::Remittance} for more details.
        #
        #   Additional remittance information related to the wire transfer.
        #
        #   @param category [Symbol, Increase::Models::WireTransferCreateParams::Remittance::Category] The type of remittance information being passed.
        #
        #   @param tax [Increase::Models::WireTransferCreateParams::Remittance::Tax] Internal Revenue Service (IRS) tax repayment information. Required if `category`
        #
        #   @param unstructured [Increase::Models::WireTransferCreateParams::Remittance::Unstructured] Unstructured remittance information. Required if `category` is equal to `unstruc

        # The type of remittance information being passed.
        #
        # @see Increase::Models::WireTransferCreateParams::Remittance#category
        module Category
          extend Increase::Internal::Type::Enum

          # The wire transfer contains unstructured remittance information.
          UNSTRUCTURED = :unstructured

          # The wire transfer is for tax payment purposes to the Internal Revenue Service (IRS).
          TAX = :tax

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @see Increase::Models::WireTransferCreateParams::Remittance#tax
        class Tax < Increase::Internal::Type::BaseModel
          # @!attribute date
          #   The month and year the tax payment is for, in YYYY-MM-DD format. The day is
          #   ignored.
          #
          #   @return [Date]
          required :date, Date

          # @!attribute identification_number
          #   The 9-digit Tax Identification Number (TIN) or Employer Identification Number
          #   (EIN).
          #
          #   @return [String]
          required :identification_number, String

          # @!attribute type_code
          #   The 5-character tax type code.
          #
          #   @return [String]
          required :type_code, String

          # @!method initialize(date:, identification_number:, type_code:)
          #   Some parameter documentations has been truncated, see
          #   {Increase::Models::WireTransferCreateParams::Remittance::Tax} for more details.
          #
          #   Internal Revenue Service (IRS) tax repayment information. Required if `category`
          #   is equal to `tax`.
          #
          #   @param date [Date] The month and year the tax payment is for, in YYYY-MM-DD format. The day is igno
          #
          #   @param identification_number [String] The 9-digit Tax Identification Number (TIN) or Employer Identification Number (E
          #
          #   @param type_code [String] The 5-character tax type code.
        end

        # @see Increase::Models::WireTransferCreateParams::Remittance#unstructured
        class Unstructured < Increase::Internal::Type::BaseModel
          # @!attribute message
          #   The message to the beneficiary.
          #
          #   @return [String]
          required :message, String

          # @!method initialize(message:)
          #   Unstructured remittance information. Required if `category` is equal to
          #   `unstructured`.
          #
          #   @param message [String] The message to the beneficiary.
        end
      end
    end
  end
end
