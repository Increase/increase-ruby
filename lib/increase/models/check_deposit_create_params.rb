# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CheckDeposits#create
    class CheckDepositCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_id
      #   The identifier for the Account to deposit the check in.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute amount
      #   The deposit amount in USD cents.
      #
      #   @return [Integer]
      required :amount, Integer

      # @!attribute back_image_file_id
      #   The File containing the check's back image.
      #
      #   @return [String]
      required :back_image_file_id, String

      # @!attribute front_image_file_id
      #   The File containing the check's front image.
      #
      #   @return [String]
      required :front_image_file_id, String

      # @!attribute description
      #   The description you choose to give the Check Deposit, for display purposes only.
      #
      #   @return [String, nil]
      optional :description, String

      # @!method initialize(account_id:, amount:, back_image_file_id:, front_image_file_id:, description: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::CheckDepositCreateParams} for more details.
      #
      #   @param account_id [String] The identifier for the Account to deposit the check in.
      #
      #   @param amount [Integer] The deposit amount in USD cents.
      #
      #   @param back_image_file_id [String] The File containing the check's back image.
      #
      #   @param front_image_file_id [String] The File containing the check's front image.
      #
      #   @param description [String] The description you choose to give the Check Deposit, for display purposes only.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
