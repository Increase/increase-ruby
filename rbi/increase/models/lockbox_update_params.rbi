# typed: strong

module Increase
  module Models
    class LockboxUpdateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash = T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

      # The description you choose for the Lockbox.
      sig { returns(T.nilable(String)) }
      attr_reader :description

      sig { params(description: String).void }
      attr_writer :description

      # The recipient name you choose for the Lockbox.
      sig { returns(T.nilable(String)) }
      attr_reader :recipient_name

      sig { params(recipient_name: String).void }
      attr_writer :recipient_name

      # This indicates if checks can be sent to the Lockbox.
      sig do
        returns(T.nilable(Increase::LockboxUpdateParams::Status::OrSymbol))
      end
      attr_reader :status

      sig do
        params(status: Increase::LockboxUpdateParams::Status::OrSymbol).void
      end
      attr_writer :status

      sig do
        params(
          description: String,
          recipient_name: String,
          status: Increase::LockboxUpdateParams::Status::OrSymbol,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The description you choose for the Lockbox.
        description: nil,
        # The recipient name you choose for the Lockbox.
        recipient_name: nil,
        # This indicates if checks can be sent to the Lockbox.
        status: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            description: String,
            recipient_name: String,
            status: Increase::LockboxUpdateParams::Status::OrSymbol,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      # This indicates if checks can be sent to the Lockbox.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::LockboxUpdateParams::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # This Lockbox is active. Checks mailed to it will be deposited automatically.
        ACTIVE =
          T.let(:active, Increase::LockboxUpdateParams::Status::TaggedSymbol)

        # This Lockbox is inactive. Checks mailed to it will not be deposited.
        INACTIVE =
          T.let(:inactive, Increase::LockboxUpdateParams::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::LockboxUpdateParams::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
