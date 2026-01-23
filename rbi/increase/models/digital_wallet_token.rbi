# typed: strong

module Increase
  module Models
    class DigitalWalletToken < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::DigitalWalletToken, Increase::Internal::AnyHash)
        end

      # The Digital Wallet Token identifier.
      sig { returns(String) }
      attr_accessor :id

      # The identifier for the Card this Digital Wallet Token belongs to.
      sig { returns(String) }
      attr_accessor :card_id

      # The cardholder information given when the Digital Wallet Token was created.
      sig { returns(Increase::DigitalWalletToken::Cardholder) }
      attr_reader :cardholder

      sig do
        params(
          cardholder: Increase::DigitalWalletToken::Cardholder::OrHash
        ).void
      end
      attr_writer :cardholder

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      # the Digital Wallet Token was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The device that was used to create the Digital Wallet Token.
      sig { returns(Increase::DigitalWalletToken::Device) }
      attr_reader :device

      sig { params(device: Increase::DigitalWalletToken::Device::OrHash).void }
      attr_writer :device

      # The redacted Dynamic Primary Account Number.
      sig do
        returns(
          T.nilable(Increase::DigitalWalletToken::DynamicPrimaryAccountNumber)
        )
      end
      attr_reader :dynamic_primary_account_number

      sig do
        params(
          dynamic_primary_account_number:
            T.nilable(
              Increase::DigitalWalletToken::DynamicPrimaryAccountNumber::OrHash
            )
        ).void
      end
      attr_writer :dynamic_primary_account_number

      # This indicates if payments can be made with the Digital Wallet Token.
      sig { returns(Increase::DigitalWalletToken::Status::TaggedSymbol) }
      attr_accessor :status

      # The digital wallet app being used.
      sig do
        returns(Increase::DigitalWalletToken::TokenRequestor::TaggedSymbol)
      end
      attr_accessor :token_requestor

      # A constant representing the object's type. For this resource it will always be
      # `digital_wallet_token`.
      sig { returns(Increase::DigitalWalletToken::Type::TaggedSymbol) }
      attr_accessor :type

      # Updates to the Digital Wallet Token.
      sig { returns(T::Array[Increase::DigitalWalletToken::Update]) }
      attr_accessor :updates

      # A Digital Wallet Token is created when a user adds a Card to their Apple Pay or
      # Google Pay app. The Digital Wallet Token can be used for purchases just like a
      # Card.
      sig do
        params(
          id: String,
          card_id: String,
          cardholder: Increase::DigitalWalletToken::Cardholder::OrHash,
          created_at: Time,
          device: Increase::DigitalWalletToken::Device::OrHash,
          dynamic_primary_account_number:
            T.nilable(
              Increase::DigitalWalletToken::DynamicPrimaryAccountNumber::OrHash
            ),
          status: Increase::DigitalWalletToken::Status::OrSymbol,
          token_requestor:
            Increase::DigitalWalletToken::TokenRequestor::OrSymbol,
          type: Increase::DigitalWalletToken::Type::OrSymbol,
          updates: T::Array[Increase::DigitalWalletToken::Update::OrHash]
        ).returns(T.attached_class)
      end
      def self.new(
        # The Digital Wallet Token identifier.
        id:,
        # The identifier for the Card this Digital Wallet Token belongs to.
        card_id:,
        # The cardholder information given when the Digital Wallet Token was created.
        cardholder:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the Digital Wallet Token was created.
        created_at:,
        # The device that was used to create the Digital Wallet Token.
        device:,
        # The redacted Dynamic Primary Account Number.
        dynamic_primary_account_number:,
        # This indicates if payments can be made with the Digital Wallet Token.
        status:,
        # The digital wallet app being used.
        token_requestor:,
        # A constant representing the object's type. For this resource it will always be
        # `digital_wallet_token`.
        type:,
        # Updates to the Digital Wallet Token.
        updates:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            card_id: String,
            cardholder: Increase::DigitalWalletToken::Cardholder,
            created_at: Time,
            device: Increase::DigitalWalletToken::Device,
            dynamic_primary_account_number:
              T.nilable(
                Increase::DigitalWalletToken::DynamicPrimaryAccountNumber
              ),
            status: Increase::DigitalWalletToken::Status::TaggedSymbol,
            token_requestor:
              Increase::DigitalWalletToken::TokenRequestor::TaggedSymbol,
            type: Increase::DigitalWalletToken::Type::TaggedSymbol,
            updates: T::Array[Increase::DigitalWalletToken::Update]
          }
        )
      end
      def to_hash
      end

      class Cardholder < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::DigitalWalletToken::Cardholder,
              Increase::Internal::AnyHash
            )
          end

        # Name of the cardholder, for example "John Smith".
        sig { returns(T.nilable(String)) }
        attr_accessor :name

        # The cardholder information given when the Digital Wallet Token was created.
        sig { params(name: T.nilable(String)).returns(T.attached_class) }
        def self.new(
          # Name of the cardholder, for example "John Smith".
          name:
        )
        end

        sig { override.returns({ name: T.nilable(String) }) }
        def to_hash
        end
      end

      class Device < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::DigitalWalletToken::Device,
              Increase::Internal::AnyHash
            )
          end

        # Device type.
        sig do
          returns(
            T.nilable(
              Increase::DigitalWalletToken::Device::DeviceType::TaggedSymbol
            )
          )
        end
        attr_accessor :device_type

        # ID assigned to the device by the digital wallet provider.
        sig { returns(T.nilable(String)) }
        attr_accessor :identifier

        # IP address of the device.
        sig { returns(T.nilable(String)) }
        attr_accessor :ip_address

        # Name of the device, for example "My Work Phone".
        sig { returns(T.nilable(String)) }
        attr_accessor :name

        # The device that was used to create the Digital Wallet Token.
        sig do
          params(
            device_type:
              T.nilable(
                Increase::DigitalWalletToken::Device::DeviceType::OrSymbol
              ),
            identifier: T.nilable(String),
            ip_address: T.nilable(String),
            name: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # Device type.
          device_type:,
          # ID assigned to the device by the digital wallet provider.
          identifier:,
          # IP address of the device.
          ip_address:,
          # Name of the device, for example "My Work Phone".
          name:
        )
        end

        sig do
          override.returns(
            {
              device_type:
                T.nilable(
                  Increase::DigitalWalletToken::Device::DeviceType::TaggedSymbol
                ),
              identifier: T.nilable(String),
              ip_address: T.nilable(String),
              name: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        # Device type.
        module DeviceType
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::DigitalWalletToken::Device::DeviceType)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Unknown
          UNKNOWN =
            T.let(
              :unknown,
              Increase::DigitalWalletToken::Device::DeviceType::TaggedSymbol
            )

          # Mobile Phone
          MOBILE_PHONE =
            T.let(
              :mobile_phone,
              Increase::DigitalWalletToken::Device::DeviceType::TaggedSymbol
            )

          # Tablet
          TABLET =
            T.let(
              :tablet,
              Increase::DigitalWalletToken::Device::DeviceType::TaggedSymbol
            )

          # Watch
          WATCH =
            T.let(
              :watch,
              Increase::DigitalWalletToken::Device::DeviceType::TaggedSymbol
            )

          # Mobile Phone or Tablet
          MOBILEPHONE_OR_TABLET =
            T.let(
              :mobilephone_or_tablet,
              Increase::DigitalWalletToken::Device::DeviceType::TaggedSymbol
            )

          # PC
          PC =
            T.let(
              :pc,
              Increase::DigitalWalletToken::Device::DeviceType::TaggedSymbol
            )

          # Household Device
          HOUSEHOLD_DEVICE =
            T.let(
              :household_device,
              Increase::DigitalWalletToken::Device::DeviceType::TaggedSymbol
            )

          # Wearable Device
          WEARABLE_DEVICE =
            T.let(
              :wearable_device,
              Increase::DigitalWalletToken::Device::DeviceType::TaggedSymbol
            )

          # Automobile Device
          AUTOMOBILE_DEVICE =
            T.let(
              :automobile_device,
              Increase::DigitalWalletToken::Device::DeviceType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::DigitalWalletToken::Device::DeviceType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class DynamicPrimaryAccountNumber < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::DigitalWalletToken::DynamicPrimaryAccountNumber,
              Increase::Internal::AnyHash
            )
          end

        # The first 6 digits of the token's Dynamic Primary Account Number.
        sig { returns(String) }
        attr_accessor :first6

        # The last 4 digits of the token's Dynamic Primary Account Number.
        sig { returns(String) }
        attr_accessor :last4

        # The redacted Dynamic Primary Account Number.
        sig { params(first6: String, last4: String).returns(T.attached_class) }
        def self.new(
          # The first 6 digits of the token's Dynamic Primary Account Number.
          first6:,
          # The last 4 digits of the token's Dynamic Primary Account Number.
          last4:
        )
        end

        sig { override.returns({ first6: String, last4: String }) }
        def to_hash
        end
      end

      # This indicates if payments can be made with the Digital Wallet Token.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::DigitalWalletToken::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The digital wallet token is active.
        ACTIVE =
          T.let(:active, Increase::DigitalWalletToken::Status::TaggedSymbol)

        # The digital wallet token has been created but not successfully activated via two-factor authentication yet.
        INACTIVE =
          T.let(:inactive, Increase::DigitalWalletToken::Status::TaggedSymbol)

        # The digital wallet token has been temporarily paused.
        SUSPENDED =
          T.let(:suspended, Increase::DigitalWalletToken::Status::TaggedSymbol)

        # The digital wallet token has been permanently canceled.
        DEACTIVATED =
          T.let(
            :deactivated,
            Increase::DigitalWalletToken::Status::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::DigitalWalletToken::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # The digital wallet app being used.
      module TokenRequestor
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::DigitalWalletToken::TokenRequestor)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # Apple Pay
        APPLE_PAY =
          T.let(
            :apple_pay,
            Increase::DigitalWalletToken::TokenRequestor::TaggedSymbol
          )

        # Google Pay
        GOOGLE_PAY =
          T.let(
            :google_pay,
            Increase::DigitalWalletToken::TokenRequestor::TaggedSymbol
          )

        # Samsung Pay
        SAMSUNG_PAY =
          T.let(
            :samsung_pay,
            Increase::DigitalWalletToken::TokenRequestor::TaggedSymbol
          )

        # Unknown
        UNKNOWN =
          T.let(
            :unknown,
            Increase::DigitalWalletToken::TokenRequestor::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::DigitalWalletToken::TokenRequestor::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `digital_wallet_token`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::DigitalWalletToken::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        DIGITAL_WALLET_TOKEN =
          T.let(
            :digital_wallet_token,
            Increase::DigitalWalletToken::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::DigitalWalletToken::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Update < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::DigitalWalletToken::Update,
              Increase::Internal::AnyHash
            )
          end

        # The status the update changed this Digital Wallet Token to.
        sig do
          returns(Increase::DigitalWalletToken::Update::Status::TaggedSymbol)
        end
        attr_accessor :status

        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the update happened.
        sig { returns(Time) }
        attr_accessor :timestamp

        sig do
          params(
            status: Increase::DigitalWalletToken::Update::Status::OrSymbol,
            timestamp: Time
          ).returns(T.attached_class)
        end
        def self.new(
          # The status the update changed this Digital Wallet Token to.
          status:,
          # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
          # the update happened.
          timestamp:
        )
        end

        sig do
          override.returns(
            {
              status:
                Increase::DigitalWalletToken::Update::Status::TaggedSymbol,
              timestamp: Time
            }
          )
        end
        def to_hash
        end

        # The status the update changed this Digital Wallet Token to.
        module Status
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::DigitalWalletToken::Update::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The digital wallet token is active.
          ACTIVE =
            T.let(
              :active,
              Increase::DigitalWalletToken::Update::Status::TaggedSymbol
            )

          # The digital wallet token has been created but not successfully activated via two-factor authentication yet.
          INACTIVE =
            T.let(
              :inactive,
              Increase::DigitalWalletToken::Update::Status::TaggedSymbol
            )

          # The digital wallet token has been temporarily paused.
          SUSPENDED =
            T.let(
              :suspended,
              Increase::DigitalWalletToken::Update::Status::TaggedSymbol
            )

          # The digital wallet token has been permanently canceled.
          DEACTIVATED =
            T.let(
              :deactivated,
              Increase::DigitalWalletToken::Update::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::DigitalWalletToken::Update::Status::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
