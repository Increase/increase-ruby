# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::IntrafiAccountEnrollments#create
    class IntrafiAccountEnrollmentCreateParams < Increase::Internal::Type::BaseModel
      # @!parse
      #   extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_id
      #   The identifier for the account to be added to IntraFi.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute email_address
      #   The contact email for the account owner, to be shared with IntraFi.
      #
      #   @return [String]
      required :email_address, String

      # @!parse
      #   # @param account_id [String]
      #   # @param email_address [String]
      #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(account_id:, email_address:, request_options: {}, **) = super

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void
    end
  end
end
