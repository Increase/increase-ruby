# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::ACHPrenotifications#retrieve
    class ACHPrenotificationRetrieveParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute ach_prenotification_id
      #   The identifier of the ACH Prenotification to retrieve.
      #
      #   @return [String]
      required :ach_prenotification_id, String

      # @!method initialize(ach_prenotification_id:, request_options: {})
      #   @param ach_prenotification_id [String] The identifier of the ACH Prenotification to retrieve.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
