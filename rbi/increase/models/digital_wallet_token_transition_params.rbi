# typed: strong

module Increase
  module Models
    class DigitalWalletTokenTransitionParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::DigitalWalletTokenTransitionParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier of the Digital Wallet Token.
      sig { returns(String) }
      attr_accessor :digital_wallet_token_id

      # The status to transition the Digital Wallet Token to.
      sig do
        returns(Increase::DigitalWalletTokenTransitionParams::Status::OrSymbol)
      end
      attr_accessor :status

      sig do
        params(
          digital_wallet_token_id: String,
          status:
            Increase::DigitalWalletTokenTransitionParams::Status::OrSymbol,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Digital Wallet Token.
        digital_wallet_token_id:,
        # The status to transition the Digital Wallet Token to.
        status:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            digital_wallet_token_id: String,
            status:
              Increase::DigitalWalletTokenTransitionParams::Status::OrSymbol,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      # The status to transition the Digital Wallet Token to.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::DigitalWalletTokenTransitionParams::Status)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # Reactivate a suspended Digital Wallet Token.
        ACTIVE =
          T.let(
            :active,
            Increase::DigitalWalletTokenTransitionParams::Status::TaggedSymbol
          )

        # Temporarily pause an active Digital Wallet Token.
        SUSPENDED =
          T.let(
            :suspended,
            Increase::DigitalWalletTokenTransitionParams::Status::TaggedSymbol
          )

        # Permanently cancel an active, inactive, or suspended Digital Wallet Token.
        DEACTIVATED =
          T.let(
            :deactivated,
            Increase::DigitalWalletTokenTransitionParams::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Increase::DigitalWalletTokenTransitionParams::Status::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
