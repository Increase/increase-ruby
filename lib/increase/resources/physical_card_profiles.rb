# frozen_string_literal: true

module Increase
  module Resources
    class PhysicalCardProfiles
      # Create a Physical Card Profile
      #
      # @overload create(carrier_image_file_id:, contact_phone:, description:, front_image_file_id:, program_id:, request_options: {})
      #
      # @param carrier_image_file_id [String]
      # @param contact_phone [String]
      # @param description [String]
      # @param front_image_file_id [String]
      # @param program_id [String]
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::PhysicalCardProfile]
      #
      # @see Increase::Models::PhysicalCardProfileCreateParams
      def create(params)
        parsed, options = Increase::Models::PhysicalCardProfileCreateParams.dump_request(params)
        @client.request(
          method: :post,
          path: "physical_card_profiles",
          body: parsed,
          model: Increase::Models::PhysicalCardProfile,
          options: options
        )
      end

      # Retrieve a Card Profile
      #
      # @overload retrieve(physical_card_profile_id, request_options: {})
      #
      # @param physical_card_profile_id [String]
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::PhysicalCardProfile]
      #
      # @see Increase::Models::PhysicalCardProfileRetrieveParams
      def retrieve(physical_card_profile_id, params = {})
        @client.request(
          method: :get,
          path: ["physical_card_profiles/%1$s", physical_card_profile_id],
          model: Increase::Models::PhysicalCardProfile,
          options: params[:request_options]
        )
      end

      # List Physical Card Profiles
      #
      # @overload list(cursor: nil, idempotency_key: nil, limit: nil, status: nil, request_options: {})
      #
      # @param cursor [String]
      # @param idempotency_key [String]
      # @param limit [Integer]
      # @param status [Increase::Models::PhysicalCardProfileListParams::Status]
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Internal::Page<Increase::Models::PhysicalCardProfile>]
      #
      # @see Increase::Models::PhysicalCardProfileListParams
      def list(params = {})
        parsed, options = Increase::Models::PhysicalCardProfileListParams.dump_request(params)
        @client.request(
          method: :get,
          path: "physical_card_profiles",
          query: parsed,
          page: Increase::Internal::Page,
          model: Increase::Models::PhysicalCardProfile,
          options: options
        )
      end

      # Archive a Physical Card Profile
      #
      # @overload archive(physical_card_profile_id, request_options: {})
      #
      # @param physical_card_profile_id [String]
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::PhysicalCardProfile]
      #
      # @see Increase::Models::PhysicalCardProfileArchiveParams
      def archive(physical_card_profile_id, params = {})
        @client.request(
          method: :post,
          path: ["physical_card_profiles/%1$s/archive", physical_card_profile_id],
          model: Increase::Models::PhysicalCardProfile,
          options: params[:request_options]
        )
      end

      # Clone a Physical Card Profile
      #
      # @overload clone_(physical_card_profile_id, carrier_image_file_id: nil, contact_phone: nil, description: nil, front_image_file_id: nil, front_text: nil, request_options: {})
      #
      # @param physical_card_profile_id [String]
      # @param carrier_image_file_id [String]
      # @param contact_phone [String]
      # @param description [String]
      # @param front_image_file_id [String]
      # @param front_text [Increase::Models::PhysicalCardProfileCloneParams::FrontText]
      # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}, nil]
      #
      # @return [Increase::Models::PhysicalCardProfile]
      #
      # @see Increase::Models::PhysicalCardProfileCloneParams
      def clone_(physical_card_profile_id, params = {})
        parsed, options = Increase::Models::PhysicalCardProfileCloneParams.dump_request(params)
        @client.request(
          method: :post,
          path: ["physical_card_profiles/%1$s/clone", physical_card_profile_id],
          body: parsed,
          model: Increase::Models::PhysicalCardProfile,
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
