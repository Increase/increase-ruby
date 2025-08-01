# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::PhysicalCardProfiles#clone_
    class PhysicalCardProfileCloneParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute carrier_image_file_id
      #   The identifier of the File containing the physical card's carrier image.
      #
      #   @return [String, nil]
      optional :carrier_image_file_id, String

      # @!attribute contact_phone
      #   A phone number the user can contact to receive support for their card.
      #
      #   @return [String, nil]
      optional :contact_phone, String

      # @!attribute description
      #   A description you can use to identify the Card Profile.
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute front_image_file_id
      #   The identifier of the File containing the physical card's front image.
      #
      #   @return [String, nil]
      optional :front_image_file_id, String

      # @!attribute front_text
      #   Text printed on the front of the card. Reach out to
      #   [support@increase.com](mailto:support@increase.com) for more information.
      #
      #   @return [Increase::Models::PhysicalCardProfileCloneParams::FrontText, nil]
      optional :front_text, -> { Increase::PhysicalCardProfileCloneParams::FrontText }

      # @!attribute program_id
      #   The identifier of the Program to use for the cloned Physical Card Profile.
      #
      #   @return [String, nil]
      optional :program_id, String

      # @!method initialize(carrier_image_file_id: nil, contact_phone: nil, description: nil, front_image_file_id: nil, front_text: nil, program_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::PhysicalCardProfileCloneParams} for more details.
      #
      #   @param carrier_image_file_id [String] The identifier of the File containing the physical card's carrier image.
      #
      #   @param contact_phone [String] A phone number the user can contact to receive support for their card.
      #
      #   @param description [String] A description you can use to identify the Card Profile.
      #
      #   @param front_image_file_id [String] The identifier of the File containing the physical card's front image.
      #
      #   @param front_text [Increase::Models::PhysicalCardProfileCloneParams::FrontText] Text printed on the front of the card. Reach out to [support@increase.com](mailt
      #
      #   @param program_id [String] The identifier of the Program to use for the cloned Physical Card Profile.
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      class FrontText < Increase::Internal::Type::BaseModel
        # @!attribute line1
        #   The first line of text on the front of the card.
        #
        #   @return [String]
        required :line1, String

        # @!attribute line2
        #   The second line of text on the front of the card. Providing a second line moves
        #   the first line slightly higher and prints the second line in the spot where the
        #   first line would have otherwise been printed.
        #
        #   @return [String, nil]
        optional :line2, String

        # @!method initialize(line1:, line2: nil)
        #   Some parameter documentations has been truncated, see
        #   {Increase::Models::PhysicalCardProfileCloneParams::FrontText} for more details.
        #
        #   Text printed on the front of the card. Reach out to
        #   [support@increase.com](mailto:support@increase.com) for more information.
        #
        #   @param line1 [String] The first line of text on the front of the card.
        #
        #   @param line2 [String] The second line of text on the front of the card. Providing a second line moves
      end
    end
  end
end
