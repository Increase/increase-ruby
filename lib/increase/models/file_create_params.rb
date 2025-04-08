# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::Files#create
    class FileCreateParams < Increase::Internal::Type::BaseModel
      # @!parse
      #   extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute file
      #   The file contents. This should follow the specifications of
      #   [RFC 7578](https://datatracker.ietf.org/doc/html/rfc7578) which defines file
      #   transfers for the multipart/form-data protocol.
      #
      #   @return [Pathname, StringIO]
      required :file, Increase::Internal::Type::IOLike

      # @!attribute purpose
      #   What the File will be used for in Increase's systems.
      #
      #   @return [Symbol, Increase::Models::FileCreateParams::Purpose]
      required :purpose, enum: -> { Increase::Models::FileCreateParams::Purpose }

      # @!attribute [r] description
      #   The description you choose to give the File.
      #
      #   @return [String, nil]
      optional :description, String

      # @!parse
      #   # @return [String]
      #   attr_writer :description

      # @!parse
      #   # @param file [Pathname, StringIO]
      #   # @param purpose [Symbol, Increase::Models::FileCreateParams::Purpose]
      #   # @param description [String]
      #   # @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
      #   #
      #   def initialize(file:, purpose:, description: nil, request_options: {}, **) = super

      # def initialize: (Hash | Increase::Internal::Type::BaseModel) -> void

      # What the File will be used for in Increase's systems.
      module Purpose
        extend Increase::Internal::Type::Enum

        # An image of the front of a check, used for check deposits.
        CHECK_IMAGE_FRONT = :check_image_front

        # An image of the back of a check, used for check deposits.
        CHECK_IMAGE_BACK = :check_image_back

        # An image of a check that was mailed to a recipient.
        MAILED_CHECK_IMAGE = :mailed_check_image

        # A document to be printed on an additional page and mailed with a check that you've requested Increase print.
        CHECK_ATTACHMENT = :check_attachment

        # IRS Form SS-4.
        FORM_SS_4 = :form_ss_4

        # An image of a government-issued ID.
        IDENTITY_DOCUMENT = :identity_document

        # A file purpose not covered by any of the other cases.
        OTHER = :other

        # A legal document forming a trust.
        TRUST_FORMATION_DOCUMENT = :trust_formation_document

        # A card image to be rendered inside digital wallet apps. This must be a 1536x969 pixel PNG.
        DIGITAL_WALLET_ARTWORK = :digital_wallet_artwork

        # An icon for you app to be rendered inside digital wallet apps. This must be a 100x100 pixel PNG.
        DIGITAL_WALLET_APP_ICON = :digital_wallet_app_icon

        # A card image to be printed on the front of a physical card. This must be a 2100x1340 pixel PNG with no other color but black.
        PHYSICAL_CARD_FRONT = :physical_card_front

        # An image representing the entirety of the carrier used for a physical card. This must be a 2550x3300 pixel PNG with no other color but black.
        PHYSICAL_CARD_CARRIER = :physical_card_carrier

        # A document requested by Increase.
        DOCUMENT_REQUEST = :document_request

        # A supplemental document associated an an Entity.
        ENTITY_SUPPLEMENTAL_DOCUMENT = :entity_supplemental_document

        # An attachment to an Unusual Activity Report.
        UNUSUAL_ACTIVITY_REPORT_ATTACHMENT = :unusual_activity_report_attachment

        # A file containing additional evidence for a Proof of Authorization Request Submission.
        PROOF_OF_AUTHORIZATION_REQUEST_SUBMISSION = :proof_of_authorization_request_submission

        finalize!

        # @!parse
        #   # @return [Array<Symbol>]
        #   def self.values; end
      end
    end
  end
end
