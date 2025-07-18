# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Accounts#update
    class AccountUpdateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute credit_limit
      #   The new credit limit of the Account, if and only if the Account is a loan
      #   account.
      #
      #   @return [Integer, nil]
      optional :credit_limit, Integer

      # @!attribute name
      #   The new name of the Account.
      #
      #   @return [String, nil]
      optional :name, String

      # @!method initialize(credit_limit: nil, name: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::AccountUpdateParams} for more details.
      #
      #   @param credit_limit [Integer] The new credit limit of the Account, if and only if the Account is a loan accoun
      #
      #   @param name [String] The new name of the Account.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
