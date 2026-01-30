# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::IntrafiExclusions#create
    class IntrafiExclusionCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute entity_id
      #   The identifier of the Entity whose deposits will be excluded.
      #
      #   @return [String]
      required :entity_id, String

      # @!attribute fdic_certificate_number
      #   The FDIC certificate number of the financial institution to be excluded. An FDIC
      #   certificate number uniquely identifies a financial institution, and is different
      #   than a routing number. To find one, we recommend searching by Bank Name using
      #   the [FDIC's bankfind tool](https://banks.data.fdic.gov/bankfind-suite/bankfind).
      #
      #   @return [String]
      required :fdic_certificate_number, String

      # @!method initialize(entity_id:, fdic_certificate_number:, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::IntrafiExclusionCreateParams} for more details.
      #
      #   @param entity_id [String] The identifier of the Entity whose deposits will be excluded.
      #
      #   @param fdic_certificate_number [String] The FDIC certificate number of the financial institution to be excluded. An FDIC
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
