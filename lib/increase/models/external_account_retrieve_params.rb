# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::ExternalAccounts#retrieve
    class ExternalAccountRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute external_account_id
      #   The identifier of the External Account.
      #
      #   @return [String]
      required :external_account_id, String

      # @!method initialize(external_account_id:, request_options: {})
      #   @param external_account_id [String] The identifier of the External Account.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
