# typed: strong

module Increase
  module Models
    class LockboxCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Increase::LockboxCreateParams, Increase::Internal::AnyHash)
        end

      # The Account checks sent to this Lockbox should be deposited into.
      sig { returns(String) }
      attr_accessor :account_id

      # The description you choose for the Lockbox, for display purposes.
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # The name of the recipient that will receive mail at this location.
      sig { returns(T.nilable(String)) }
      attr_reader :recipient_name

      sig { params(recipient_name: String).void }
      attr_writer :recipient_name

      sig do
        params(
          account_id: String,
          description: String,
          recipient_name: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The Account checks sent to this Lockbox should be deposited into.
        account_id:,
        # The description you choose for the Lockbox, for display purposes.
        description: nil,
        # The name of the recipient that will receive mail at this location.
        recipient_name: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            description: String,
            recipient_name: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
