# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::PhysicalCardProfiles#create
    class PhysicalCardProfileCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute carrier_image_file_id
      #   The identifier of the File containing the physical card's carrier image.
      #
      #   @return [String]
      required :carrier_image_file_id, String

      # @!attribute contact_phone
      #   A phone number the user can contact to receive support for their card.
      #
      #   @return [String]
      required :contact_phone, String

      # @!attribute description
      #   A description you can use to identify the Card Profile.
      #
      #   @return [String]
      required :description, String

      # @!attribute front_image_file_id
      #   The identifier of the File containing the physical card's front image.
      #
      #   @return [String]
      required :front_image_file_id, String

      # @!attribute program_id
      #   The identifier for the Program that this Physical Card Profile falls under.
      #
      #   @return [String]
      required :program_id, String

      # @!attribute back_color
      #   The color of the text on the back of the card. Defaults to "black".
      #
      #   @return [Symbol, Increase::Models::PhysicalCardProfileCreateParams::BackColor, nil]
      optional :back_color, enum: -> { Increase::PhysicalCardProfileCreateParams::BackColor }

      # @!attribute card_stock_reference
      #   A reference ID provided by the fulfillment provider for the card stock used.
      #   Only used if you've ordered card stock separately.
      #
      #   @return [String, nil]
      optional :card_stock_reference, String

      # @!attribute carrier_stock_reference
      #   A reference ID provided by the fulfillment provider for the carrier stock used.
      #   Only used if you've ordered carrier stock separately.
      #
      #   @return [String, nil]
      optional :carrier_stock_reference, String

      # @!attribute front_color
      #   The color of the design on the front of the card. Defaults to "black".
      #
      #   @return [Symbol, Increase::Models::PhysicalCardProfileCreateParams::FrontColor, nil]
      optional :front_color, enum: -> { Increase::PhysicalCardProfileCreateParams::FrontColor }

      # @!attribute front_text
      #   Text printed on the front of the card. Reach out to
      #   [support@increase.com](mailto:support@increase.com) for more information.
      #
      #   @return [Increase::Models::PhysicalCardProfileCreateParams::FrontText, nil]
      optional :front_text, -> { Increase::PhysicalCardProfileCreateParams::FrontText }

      # @!method initialize(carrier_image_file_id:, contact_phone:, description:, front_image_file_id:, program_id:, back_color: nil, card_stock_reference: nil, carrier_stock_reference: nil, front_color: nil, front_text: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::PhysicalCardProfileCreateParams} for more details.
      #
      #   @param carrier_image_file_id [String] The identifier of the File containing the physical card's carrier image.
      #
      #   @param contact_phone [String] A phone number the user can contact to receive support for their card.
      #
      #   @param description [String] A description you can use to identify the Card Profile.
      #
      #   @param front_image_file_id [String] The identifier of the File containing the physical card's front image.
      #
      #   @param program_id [String] The identifier for the Program that this Physical Card Profile falls under.
      #
      #   @param back_color [Symbol, Increase::Models::PhysicalCardProfileCreateParams::BackColor] The color of the text on the back of the card. Defaults to "black".
      #
      #   @param card_stock_reference [String] A reference ID provided by the fulfillment provider for the card stock used. Onl
      #
      #   @param carrier_stock_reference [String] A reference ID provided by the fulfillment provider for the carrier stock used.
      #
      #   @param front_color [Symbol, Increase::Models::PhysicalCardProfileCreateParams::FrontColor] The color of the design on the front of the card. Defaults to "black".
      #
      #   @param front_text [Increase::Models::PhysicalCardProfileCreateParams::FrontText] Text printed on the front of the card. Reach out to [support@increase.com](mailt
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]

      # The color of the text on the back of the card. Defaults to "black".
      module BackColor
        extend Increase::Internal::Type::Enum

        # Black personalization color.
        BLACK = :black

        # White personalization color.
        WHITE = :white

        # @!method self.values
        #   @return [Array<Symbol>]
      end

      # The color of the design on the front of the card. Defaults to "black".
      module FrontColor
        extend Increase::Internal::Type::Enum

        # Black personalization color.
        BLACK = :black

        # White personalization color.
        WHITE = :white

        # @!method self.values
        #   @return [Array<Symbol>]
      end

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
        #   {Increase::Models::PhysicalCardProfileCreateParams::FrontText} for more details.
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
