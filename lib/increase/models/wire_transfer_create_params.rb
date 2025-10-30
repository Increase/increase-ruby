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

      # @!attribute creditor
      #   The person or business that is receiving the funds from the transfer.
      #
      #   @return [Increase::Models::WireTransferCreateParams::Creditor]
      required :creditor, -> { Increase::WireTransferCreateParams::Creditor }

      # @!attribute remittance
      #   Additional remittance information related to the wire transfer.
      #
      #   @return [Increase::Models::WireTransferCreateParams::Remittance]
      required :remittance, -> { Increase::WireTransferCreateParams::Remittance }

      # @!attribute account_number
      #   The account number for the destination account.
      #
      #   @return [String, nil]
      optional :account_number, String

      # @!attribute debtor
      #   The person or business whose funds are being transferred. This is only necessary
      #   if you're transferring from a commingled account. Otherwise, we'll use the
      #   associated entity's details.
      #
      #   @return [Increase::Models::WireTransferCreateParams::Debtor, nil]
      optional :debtor, -> { Increase::WireTransferCreateParams::Debtor }

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

      # @!method initialize(account_id:, amount:, creditor:, remittance:, account_number: nil, debtor: nil, external_account_id: nil, inbound_wire_drawdown_request_id: nil, require_approval: nil, routing_number: nil, source_account_number_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::WireTransferCreateParams} for more details.
      #
      #   @param account_id [String] The identifier for the account that will send the transfer.
      #
      #   @param amount [Integer] The transfer amount in USD cents.
      #
      #   @param creditor [Increase::Models::WireTransferCreateParams::Creditor] The person or business that is receiving the funds from the transfer.
      #
      #   @param remittance [Increase::Models::WireTransferCreateParams::Remittance] Additional remittance information related to the wire transfer.
      #
      #   @param account_number [String] The account number for the destination account.
      #
      #   @param debtor [Increase::Models::WireTransferCreateParams::Debtor] The person or business whose funds are being transferred. This is only necessary
      #
      #   @param external_account_id [String] The ID of an External Account to initiate a transfer to. If this parameter is pr
      #
      #   @param inbound_wire_drawdown_request_id [String] The ID of an Inbound Wire Drawdown Request in response to which this transfer is
      #
      #   @param require_approval [Boolean] Whether the transfer requires explicit approval via the dashboard or API.
      #
      #   @param routing_number [String] The American Bankers' Association (ABA) Routing Transit Number (RTN) for the des
      #
      #   @param source_account_number_id [String] The ID of an Account Number that will be passed to the wire's recipient
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      class Creditor < Increase::Internal::Type::BaseModel
        # @!attribute name
        #   The person or business's name.
        #
        #   @return [String]
        required :name, String

        # @!attribute address
        #   The person or business's address.
        #
        #   @return [Increase::Models::WireTransferCreateParams::Creditor::Address, nil]
        optional :address, -> { Increase::WireTransferCreateParams::Creditor::Address }

        # @!method initialize(name:, address: nil)
        #   The person or business that is receiving the funds from the transfer.
        #
        #   @param name [String] The person or business's name.
        #
        #   @param address [Increase::Models::WireTransferCreateParams::Creditor::Address] The person or business's address.

        # @see Increase::Models::WireTransferCreateParams::Creditor#address
        class Address < Increase::Internal::Type::BaseModel
          # @!attribute unstructured
          #   Unstructured address lines.
          #
          #   @return [Increase::Models::WireTransferCreateParams::Creditor::Address::Unstructured]
          required :unstructured, -> { Increase::WireTransferCreateParams::Creditor::Address::Unstructured }

          # @!method initialize(unstructured:)
          #   The person or business's address.
          #
          #   @param unstructured [Increase::Models::WireTransferCreateParams::Creditor::Address::Unstructured] Unstructured address lines.

          # @see Increase::Models::WireTransferCreateParams::Creditor::Address#unstructured
          class Unstructured < Increase::Internal::Type::BaseModel
            # @!attribute line1
            #   The address line 1.
            #
            #   @return [String]
            required :line1, String

            # @!attribute line2
            #   The address line 2.
            #
            #   @return [String, nil]
            optional :line2, String

            # @!attribute line3
            #   The address line 3.
            #
            #   @return [String, nil]
            optional :line3, String

            # @!method initialize(line1:, line2: nil, line3: nil)
            #   Unstructured address lines.
            #
            #   @param line1 [String] The address line 1.
            #
            #   @param line2 [String] The address line 2.
            #
            #   @param line3 [String] The address line 3.
          end
        end
      end

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
          #   The information.
          #
          #   @return [String]
          required :message, String

          # @!method initialize(message:)
          #   Unstructured remittance information. Required if `category` is equal to
          #   `unstructured`.
          #
          #   @param message [String] The information.
        end
      end

      class Debtor < Increase::Internal::Type::BaseModel
        # @!attribute name
        #   The person or business's name.
        #
        #   @return [String]
        required :name, String

        # @!attribute address
        #   The person or business's address.
        #
        #   @return [Increase::Models::WireTransferCreateParams::Debtor::Address, nil]
        optional :address, -> { Increase::WireTransferCreateParams::Debtor::Address }

        # @!method initialize(name:, address: nil)
        #   The person or business whose funds are being transferred. This is only necessary
        #   if you're transferring from a commingled account. Otherwise, we'll use the
        #   associated entity's details.
        #
        #   @param name [String] The person or business's name.
        #
        #   @param address [Increase::Models::WireTransferCreateParams::Debtor::Address] The person or business's address.

        # @see Increase::Models::WireTransferCreateParams::Debtor#address
        class Address < Increase::Internal::Type::BaseModel
          # @!attribute unstructured
          #   Unstructured address lines.
          #
          #   @return [Increase::Models::WireTransferCreateParams::Debtor::Address::Unstructured]
          required :unstructured, -> { Increase::WireTransferCreateParams::Debtor::Address::Unstructured }

          # @!method initialize(unstructured:)
          #   The person or business's address.
          #
          #   @param unstructured [Increase::Models::WireTransferCreateParams::Debtor::Address::Unstructured] Unstructured address lines.

          # @see Increase::Models::WireTransferCreateParams::Debtor::Address#unstructured
          class Unstructured < Increase::Internal::Type::BaseModel
            # @!attribute line1
            #   The address line 1.
            #
            #   @return [String]
            required :line1, String

            # @!attribute line2
            #   The address line 2.
            #
            #   @return [String, nil]
            optional :line2, String

            # @!attribute line3
            #   The address line 3.
            #
            #   @return [String, nil]
            optional :line3, String

            # @!method initialize(line1:, line2: nil, line3: nil)
            #   Unstructured address lines.
            #
            #   @param line1 [String] The address line 1.
            #
            #   @param line2 [String] The address line 2.
            #
            #   @param line3 [String] The address line 3.
          end
        end
      end
    end
  end
end
