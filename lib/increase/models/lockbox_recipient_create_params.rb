# frozen_string_literal: true

module Increase
  module Models
    # @see Increase::Resources::LockboxRecipients#create
    class LockboxRecipientCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # @!attribute account_id
      #   The Account that checks sent to this Lockbox Recipient should be deposited into.
      #
      #   @return [String]
      required :account_id, String

      # @!attribute lockbox_address_id
      #   The Lockbox Address where this Lockbox Recipient may receive mail.
      #
      #   @return [String]
      required :lockbox_address_id, String

      # @!attribute description
      #   The description you choose for the Lockbox Recipient.
      #
      #   @return [String, nil]
      optional :description, String

      # @!attribute recipient_name
      #   The name of the Lockbox Recipient
      #
      #   @return [String, nil]
      optional :recipient_name, String

      # @!method initialize(account_id:, lockbox_address_id:, description: nil, recipient_name: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Increase::Models::LockboxRecipientCreateParams} for more details.
      #
      #   @param account_id [String] The Account that checks sent to this Lockbox Recipient should be deposited into.
      #
      #   @param lockbox_address_id [String] The Lockbox Address where this Lockbox Recipient may receive mail.
      #
      #   @param description [String] The description you choose for the Lockbox Recipient.
      #
      #   @param recipient_name [String] The name of the Lockbox Recipient
      #
      #   @param request_options [Increase::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
