# typed: strong

module Increase
  module Models
    class LockboxUpdateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

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
      sig { returns(T.nilable(Increase::Models::LockboxUpdateParams::Status::OrSymbol)) }
      attr_reader :status

      sig { params(status: Increase::Models::LockboxUpdateParams::Status::OrSymbol).void }
      attr_writer :status

      sig do
        params(
          description: String,
          recipient_name: String,
          status: Increase::Models::LockboxUpdateParams::Status::OrSymbol,
          request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(description: nil, recipient_name: nil, status: nil, request_options: {})
      end

      sig do
        override
          .returns(
            {
              description: String,
              recipient_name: String,
              status: Increase::Models::LockboxUpdateParams::Status::OrSymbol,
              request_options: Increase::RequestOptions
            }
          )
      end
      def to_hash
      end

      # This indicates if checks can be sent to the Lockbox.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::LockboxUpdateParams::Status) }
        OrSymbol =
          T.type_alias { T.any(Symbol, String, Increase::Models::LockboxUpdateParams::Status::TaggedSymbol) }

        # This Lockbox is active. Checks mailed to it will be deposited automatically.
        ACTIVE = T.let(:active, Increase::Models::LockboxUpdateParams::Status::TaggedSymbol)

        # This Lockbox is inactive. Checks mailed to it will not be deposited.
        INACTIVE = T.let(:inactive, Increase::Models::LockboxUpdateParams::Status::TaggedSymbol)

        sig { override.returns(T::Array[Increase::Models::LockboxUpdateParams::Status::TaggedSymbol]) }
        def self.values
        end
      end
    end
  end
end
