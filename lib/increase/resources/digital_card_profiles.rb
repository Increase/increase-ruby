# frozen_string_literal: true

module Increase
  module Resources
    class DigitalCardProfiles
      # Create a Digital Card Profile
      #
      # @overload create(app_icon_file_id:, background_image_file_id:, card_description:, description:, issuer_name:, contact_email: nil, contact_phone: nil, contact_website: nil, text_color: nil, request_options: {})
      #
      # @param app_icon_file_id [String] The identifier of the File containing the card's icon image.
      #
      # @param background_image_file_id [String] The identifier of the File containing the card's front image.
      #
      # @param card_description [String] A user-facing description for the card itself.
      #
      # @param description [String] A description you can use to identify the Card Profile.
      #
      # @param issuer_name [String] A user-facing description for whoever is issuing the card.
      #
      # @param contact_email [String] An email address the user can contact to receive support for their card.
      #
      # @param contact_phone [String] A phone number the user can contact to receive support for their card.
      #
      # @param contact_website [String] A website the user can visit to view and receive support for their card.
      #
      # @param text_color [Increase::Models::DigitalCardProfileCreateParams::TextColor] The Card's text color, specified as an RGB triple. The default is white.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::DigitalCardProfile]
      #
      # @see Increase::Models::DigitalCardProfileCreateParams
      def create(params)
        parsed, options = Increase::DigitalCardProfileCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "digital_card_profiles",
          body: parsed,
          model: Increase::DigitalCardProfile,
          options: options
        )
      end

      # Retrieve a Digital Card Profile
      #
      # @overload retrieve(digital_card_profile_id, request_options: {})
      #
      # @param digital_card_profile_id [String] The identifier of the Digital Card Profile.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::DigitalCardProfile]
      #
      # @see Increase::Models::DigitalCardProfileRetrieveParams
      def retrieve(digital_card_profile_id, params = {})
        @client.request(
          method: :get,
          path: ["digital_card_profiles/%1$s", digital_card_profile_id],
          model: Increase::DigitalCardProfile,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::DigitalCardProfileListParams} for more details.
      #
      # List Card Profiles
      #
      # @overload list(cursor: nil, idempotency_key: nil, limit: nil, status: nil, request_options: {})
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param status [Increase::Models::DigitalCardProfileListParams::Status]
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::DigitalCardProfileListResponse]
      #
      # @see Increase::Models::DigitalCardProfileListParams
      def list(params = {})
        parsed, options = Increase::DigitalCardProfileListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "digital_card_profiles",
          query: parsed,
          model: Increase::Models::DigitalCardProfileListResponse,
          options: options
        )
      end

      # Archive a Digital Card Profile
      #
      # @overload archive(digital_card_profile_id, request_options: {})
      #
      # @param digital_card_profile_id [String] The identifier of the Digital Card Profile to archive.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::DigitalCardProfile]
      #
      # @see Increase::Models::DigitalCardProfileArchiveParams
      def archive(digital_card_profile_id, params = {})
        @client.request(
          method: :post,
          path: ["digital_card_profiles/%1$s/archive", digital_card_profile_id],
          model: Increase::DigitalCardProfile,
          options: params[:request_options]
        )
      end

      # Clones a Digital Card Profile
      #
      # @overload clone_(digital_card_profile_id, app_icon_file_id: nil, background_image_file_id: nil, card_description: nil, contact_email: nil, contact_phone: nil, contact_website: nil, description: nil, issuer_name: nil, text_color: nil, request_options: {})
      #
      # @param digital_card_profile_id [String] The identifier of the Digital Card Profile to clone.
      #
      # @param app_icon_file_id [String] The identifier of the File containing the card's icon image.
      #
      # @param background_image_file_id [String] The identifier of the File containing the card's front image.
      #
      # @param card_description [String] A user-facing description for the card itself.
      #
      # @param contact_email [String] An email address the user can contact to receive support for their card.
      #
      # @param contact_phone [String] A phone number the user can contact to receive support for their card.
      #
      # @param contact_website [String] A website the user can visit to view and receive support for their card.
      #
      # @param description [String] A description you can use to identify the Card Profile.
      #
      # @param issuer_name [String] A user-facing description for whoever is issuing the card.
      #
      # @param text_color [Increase::Models::DigitalCardProfileCloneParams::TextColor] The Card's text color, specified as an RGB triple. The default is white.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::DigitalCardProfile]
      #
      # @see Increase::Models::DigitalCardProfileCloneParams
      def clone_(digital_card_profile_id, params = {})
        parsed, options = Increase::DigitalCardProfileCloneParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["digital_card_profiles/%1$s/clone", digital_card_profile_id],
          body: parsed,
          model: Increase::DigitalCardProfile,
          options: options
        )
      end

      # @api private
      #
      # @param client [Increase::Client]
      def initialize(client:)
        @client = client
      end
    end
  end
end
