# frozen_string_literal: true

module Increase
  module Models
    class File < BaseModel
      # @!attribute [rw] id
      #   The File's identifier.
      #   @return [String]
      required :id, String

      # @!attribute [rw] created_at
      #   The time the File was created.
      #   @return [String]
      required :created_at, String

      # @!attribute [rw] description
      #   A description of the File.
      #   @return [String]
      required :description, String

      # @!attribute [rw] direction
      #   Whether the File was generated by Increase or by you and sent to Increase.
      #   @return [Symbol]
      required :direction, Increase::Enum.new(:to_increase, :from_increase)

      # @!attribute [rw] download_url
      #   A URL from where the File can be downloaded at this point in time. The location of this URL may change over time.
      #   @return [String]
      required :download_url, String

      # @!attribute [rw] filename
      #   The filename that was provided upon upload or generated by Increase.
      #   @return [String]
      required :filename, String

      # @!attribute [rw] idempotency_key
      #   The idempotency key you chose for this object. This value is unique across Increase and is used to ensure that a request is only processed once. Learn more about [idempotency](https://increase.com/documentation/idempotency-keys).
      #   @return [String]
      required :idempotency_key, String

      # @!attribute [rw] mime_type
      #   The MIME type of the file.
      #   @return [String]
      required :mime_type, String

      # @!attribute [rw] purpose
      #   What the File will be used for. We may add additional possible values for this enum over time; your application should be able to handle such additions gracefully.
      #   @return [Symbol]
      required :purpose,
               Increase::Enum.new(
                 :check_image_front,
                 :check_image_back,
                 :processed_check_image_front,
                 :processed_check_image_back,
                 :mailed_check_image,
                 :inbound_mail_item,
                 :form_1099_int,
                 :form_ss_4,
                 :identity_document,
                 :increase_statement,
                 :other,
                 :trust_formation_document,
                 :digital_wallet_artwork,
                 :digital_wallet_app_icon,
                 :physical_card_front,
                 :physical_card_back,
                 :physical_card_carrier,
                 :document_request,
                 :entity_supplemental_document,
                 :export,
                 :unusual_activity_report_attachment,
                 :deposit_access_control_agreement
               )

      # @!attribute [rw] type
      #   A constant representing the object's type. For this resource it will always be `file`.
      #   @return [Symbol]
      required :type, Increase::Enum.new(:file)
    end
  end
end
