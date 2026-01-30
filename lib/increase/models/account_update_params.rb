# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Accounts#update
    class AccountUpdateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute name
      #   The new name of the Account.
      #
      #   @return [String, nil]
      optional :name, String

      # @!method initialize(name: nil, request_options: {})
      #   @param name [String] The new name of the Account.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
