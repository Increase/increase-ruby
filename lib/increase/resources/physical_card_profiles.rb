# frozen_string_literal: true

module Increase
  module Resources
    class PhysicalCardProfiles
      # Some parameter documentations has been truncated, see
      # {Increase::Models::PhysicalCardProfileCreateParams} for more details.
      #
      # Create a Physical Card Profile
      #
      # @overload create(carrier_image_file_id:, contact_phone:, description:, front_image_file_id:, program_id:, back_color: nil, card_stock_reference: nil, carrier_stock_reference: nil, front_color: nil, front_text: nil, request_options: {})
      #
      # @param carrier_image_file_id [String] The identifier of the File containing the physical card's carrier image.
      #
      # @param contact_phone [String] A phone number the user can contact to receive support for their card.
      #
      # @param description [String] A description you can use to identify the Card Profile.
      #
      # @param front_image_file_id [String] The identifier of the File containing the physical card's front image.
      #
      # @param program_id [String] The identifier for the Program that this Physical Card Profile falls under.
      #
      # @param back_color [Symbol, Increase::Models::PhysicalCardProfileCreateParams::BackColor] The color of the text on the back of the card. Defaults to "black".
      #
      # @param card_stock_reference [String] A reference ID provided by the fulfillment provider for the card stock used. Onl
      #
      # @param carrier_stock_reference [String] A reference ID provided by the fulfillment provider for the carrier stock used.
      #
      # @param front_color [Symbol, Increase::Models::PhysicalCardProfileCreateParams::FrontColor] The color of the design on the front of the card. Defaults to "black".
      #
      # @param front_text [Increase::Models::PhysicalCardProfileCreateParams::FrontText] Text printed on the front of the card. Reach out to [support@increase.com](mailt
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::PhysicalCardProfile]
      #
      # @see Increase::Models::PhysicalCardProfileCreateParams
      def create(params)
        parsed, options = Increase::PhysicalCardProfileCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "physical_card_profiles",
          body: parsed,
          model: Increase::PhysicalCardProfile,
          options: options
        )
      end

      # Retrieve a Card Profile
      #
      # @overload retrieve(physical_card_profile_id, request_options: {})
      #
      # @param physical_card_profile_id [String] The identifier of the Card Profile.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::PhysicalCardProfile]
      #
      # @see Increase::Models::PhysicalCardProfileRetrieveParams
      def retrieve(physical_card_profile_id, params = {})
        @client.request(
          method: :get,
          path: ["physical_card_profiles/%1$s", physical_card_profile_id],
          model: Increase::PhysicalCardProfile,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::PhysicalCardProfileListParams} for more details.
      #
      # List Physical Card Profiles
      #
      # @overload list(cursor: nil, idempotency_key: nil, limit: nil, status: nil, request_options: {})
      #
      # @param cursor [String] Return the page of entries after this one.
      #
      # @param idempotency_key [String] Filter records to the one with the specified `idempotency_key` you chose for tha
      #
      # @param limit [Integer] Limit the size of the list that is returned. The default (and maximum) is 100 ob
      #
      # @param status [Increase::Models::PhysicalCardProfileListParams::Status]
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::PhysicalCardProfile>]
      #
      # @see Increase::Models::PhysicalCardProfileListParams
      def list(params = {})
        parsed, options = Increase::PhysicalCardProfileListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "physical_card_profiles",
          query: parsed,
          page: Increase::Internal::Page,
          model: Increase::PhysicalCardProfile,
          options: options
        )
      end

      # Archive a Physical Card Profile
      #
      # @overload archive(physical_card_profile_id, request_options: {})
      #
      # @param physical_card_profile_id [String] The identifier of the Physical Card Profile to archive.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::PhysicalCardProfile]
      #
      # @see Increase::Models::PhysicalCardProfileArchiveParams
      def archive(physical_card_profile_id, params = {})
        @client.request(
          method: :post,
          path: ["physical_card_profiles/%1$s/archive", physical_card_profile_id],
          model: Increase::PhysicalCardProfile,
          options: params[:request_options]
        )
      end

      # Some parameter documentations has been truncated, see
      # {Increase::Models::PhysicalCardProfileCloneParams} for more details.
      #
      # Clone a Physical Card Profile
      #
      # @overload clone_(physical_card_profile_id, carrier_image_file_id: nil, contact_phone: nil, description: nil, front_image_file_id: nil, front_text: nil, program_id: nil, request_options: {})
      #
      # @param physical_card_profile_id [String] The identifier of the Physical Card Profile to clone.
      #
      # @param carrier_image_file_id [String] The identifier of the File containing the physical card's carrier image.
      #
      # @param contact_phone [String] A phone number the user can contact to receive support for their card.
      #
      # @param description [String] A description you can use to identify the Card Profile.
      #
      # @param front_image_file_id [String] The identifier of the File containing the physical card's front image.
      #
      # @param front_text [Increase::Models::PhysicalCardProfileCloneParams::FrontText] Text printed on the front of the card. Reach out to [support@increase.com](mailt
      #
      # @param program_id [String] The identifier of the Program to use for the cloned Physical Card Profile.
      #
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::PhysicalCardProfile]
      #
      # @see Increase::Models::PhysicalCardProfileCloneParams
      def clone_(physical_card_profile_id, params = {})
        parsed, options = Increase::PhysicalCardProfileCloneParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["physical_card_profiles/%1$s/clone", physical_card_profile_id],
          body: parsed,
          model: Increase::PhysicalCardProfile,
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
