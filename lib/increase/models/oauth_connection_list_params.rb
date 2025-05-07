# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::OAuthConnections#list
    class OAuthConnectionListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute cursor
      #   Return the page of entries after this one.
      #
      #   @return [String, nil]
      optional :cursor, String

      # @!attribute limit
      #   Limit the size of the list that is returned. The default (and maximum) is 100
      #   objects.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute oauth_application_id
      #   Filter results to only include OAuth Connections for a specific OAuth
      #   Application.
      #
      #   @return [String, nil]
      optional :oauth_application_id, String

      # @!attribute status
      #
      #   @return [Increase::OAuthConnectionListParams::Status, nil]
      optional :status, -> { Increase::OAuthConnectionListParams::Status }

      # @!method initialize(cursor: nil, limit: nil, oauth_application_id: nil, status: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::OAuthConnectionListParams} for more details.
      #
      #   @param cursor [String] Return the page of entries after this one.
      #
      #   @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      #   @param oauth_application_id [String] Filter results to only include OAuth Connections for a specific OAuth Applicatio
      #
      #   @param status [Increase::OAuthConnectionListParams::Status]
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      class Status < Increase::Internal::Type::BaseModel
        # @!attribute in_
        #   Filter to OAuth Connections by their status. By default, return only the
        #   `active` ones. For GET requests, this should be encoded as a comma-delimited
        #   string, such as `?in=one,two,three`.
        #
        #   @return [Array<Symbol, Increase::OAuthConnectionListParams::Status::In>, nil]
        optional :in_,
                 -> {
                   Increase::Internal::Type::ArrayOf[enum: Increase::OAuthConnectionListParams::Status::In]
                 },
                 api_name: :in

        # @!method initialize(in_: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::OAuthConnectionListParams::Status} for more details.
        #
        #   @param in_ [Array<Symbol, Increase::OAuthConnectionListParams::Status::In>] Filter to OAuth Connections by their status. By default, return only the `active

        module In
          extend Increase::Internal::Type::Enum

          # The OAuth connection is active.
          ACTIVE = :active

          # The OAuth connection is permanently deactivated.
          INACTIVE = :inactive

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
