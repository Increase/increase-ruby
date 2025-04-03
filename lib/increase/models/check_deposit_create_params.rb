# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::CheckDeposits#create
    class CheckDepositCreateParams < Increase::Internal::Type::BaseModel
      # @!parse
      #   extend Increase::Internal::Type::RequestParameters::Converter
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

      # @!attribute [r] description
      #   The description you choose to give the Check Deposit, for display purposes only.
      #
      #   @return [String, nil]
      optional :description, String

      # @!parse
      #   # @return [String]
      #   attr_writer :description

      # @!parse
      #   # @param account_id [String]
      #   # @param amount [Integer]
      #   # @param back_image_file_id [String]
      #   # @param front_image_file_id [String]
      #   # @param description [String]
      #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(account_id:, amount:, back_image_file_id:, front_image_file_id:, description: nil, request_options: {}, **) = super

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
    end
  end
end
