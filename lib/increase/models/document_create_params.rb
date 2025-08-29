# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Documents#create
    class DocumentCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute category
      #   The type of document to create.
      #
      #   @return [Symbol, Increase::Models::DocumentCreateParams::Category]
      required :category, enum: -> { Increase::DocumentCreateParams::Category }

      # @!attribute account_verification_letter
      #   An account verification letter. Required if and only if `category` is
      #   `account_verification_letter`.
      #
      #   @return [Increase::Models::DocumentCreateParams::AccountVerificationLetter, nil]
      optional :account_verification_letter, -> { Increase::DocumentCreateParams::AccountVerificationLetter }

      # @!attribute funding_instructions
      #   Funding instructions. Required if and only if `category` is
      #   `funding_instructions`.
      #
      #   @return [Increase::Models::DocumentCreateParams::FundingInstructions, nil]
      optional :funding_instructions, -> { Increase::DocumentCreateParams::FundingInstructions }

      # @!method initialize(category:, account_verification_letter: nil, funding_instructions: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::DocumentCreateParams} for more details.
      #
      #   @param category [Symbol, Increase::Models::DocumentCreateParams::Category] The type of document to create.
      #
      #   @param account_verification_letter [Increase::Models::DocumentCreateParams::AccountVerificationLetter] An account verification letter. Required if and only if `category` is `account_v
      #
      #   @param funding_instructions [Increase::Models::DocumentCreateParams::FundingInstructions] Funding instructions. Required if and only if `category` is `funding_instruction
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      # The type of document to create.
      module Category
        extend Increase::Internal::Type::Enum

        # An account verification letter.
        ACCOUNT_VERIFICATION_LETTER = :account_verification_letter

        # Funding instructions.
        FUNDING_INSTRUCTIONS = :funding_instructions

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      class AccountVerificationLetter < Increase::Internal::Type::BaseModel
        # @!attribute account_number_id
        #   The Account Number the bank letter should be generated for.
        #
        #   @return [String]
        required :account_number_id, String

        # @!attribute balance_date
        #   If provided, the letter will include the Account's balance as of the date.
        #
        #   @return [Date, nil]
        optional :balance_date, Date

        # @!method initialize(account_number_id:, balance_date: nil)
        #   An account verification letter. Required if and only if `category` is
        #   `account_verification_letter`.
        #
        #   @param account_number_id [String] The Account Number the bank letter should be generated for.
        #
        #   @param balance_date [Date] If provided, the letter will include the Account's balance as of the date.
      end

      class FundingInstructions < Increase::Internal::Type::BaseModel
        # @!attribute account_number_id
        #   The Account Number the funding instructions should be generated for.
        #
        #   @return [String]
        required :account_number_id, String

        # @!method initialize(account_number_id:)
        #   Funding instructions. Required if and only if `category` is
        #   `funding_instructions`.
        #
        #   @param account_number_id [String] The Account Number the funding instructions should be generated for.
      end
    end
  end
end
