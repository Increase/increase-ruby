# typed: strong

module Increase
  module Models
    class DigitalWalletTokenRequest < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Increase::DigitalWalletTokenRequest,
            Increase::Internal::AnyHash
          )
        end

      # The Digital Wallet Token Request identifier.
      sig { returns(String) }
      attr_accessor :id

      # The identifier of the Card the tokenization was requested for.
      sig { returns(String) }
      attr_accessor :card_id

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      # the Digital Wallet Token Request was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # Details of the decline. Present if and only if `outcome` is `declined`.
      sig { returns(T.nilable(Increase::DigitalWalletTokenRequest::Declined)) }
      attr_reader :declined

      sig do
        params(
          declined:
            T.nilable(Increase::DigitalWalletTokenRequest::Declined::OrHash)
        ).void
      end
      attr_writer :declined

      # The device that requested the tokenization.
      sig { returns(Increase::DigitalWalletTokenRequest::Device) }
      attr_reader :device

      sig do
        params(device: Increase::DigitalWalletTokenRequest::Device::OrHash).void
      end
      attr_writer :device

      # The outcome of the tokenization request.
      sig do
        returns(Increase::DigitalWalletTokenRequest::Outcome::TaggedSymbol)
      end
      attr_accessor :outcome

      # Details of the provisioned Digital Wallet Token. Present if and only if
      # `outcome` is `provisioned`.
      sig do
        returns(T.nilable(Increase::DigitalWalletTokenRequest::Provisioned))
      end
      attr_reader :provisioned

      sig do
        params(
          provisioned:
            T.nilable(Increase::DigitalWalletTokenRequest::Provisioned::OrHash)
        ).void
      end
      attr_writer :provisioned

      # The reference identifier assigned by the card network to the token.
      sig { returns(String) }
      attr_accessor :token_reference_identifier

      # The digital wallet app being used.
      sig do
        returns(
          Increase::DigitalWalletTokenRequest::TokenRequestor::TaggedSymbol
        )
      end
      attr_accessor :token_requestor

      # A constant representing the object's type. For this resource it will always be
      # `digital_wallet_token_request`.
      sig { returns(Increase::DigitalWalletTokenRequest::Type::TaggedSymbol) }
      attr_accessor :type

      # A Digital Wallet Token Request is created each time a digital wallet app, such
      # as Apple Pay or Google Pay, requests to tokenize a Card.
      sig do
        params(
          id: String,
          card_id: String,
          created_at: Time,
          declined:
            T.nilable(Increase::DigitalWalletTokenRequest::Declined::OrHash),
          device: Increase::DigitalWalletTokenRequest::Device::OrHash,
          outcome: Increase::DigitalWalletTokenRequest::Outcome::OrSymbol,
          provisioned:
            T.nilable(Increase::DigitalWalletTokenRequest::Provisioned::OrHash),
          token_reference_identifier: String,
          token_requestor:
            Increase::DigitalWalletTokenRequest::TokenRequestor::OrSymbol,
          type: Increase::DigitalWalletTokenRequest::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The Digital Wallet Token Request identifier.
        id:,
        # The identifier of the Card the tokenization was requested for.
        card_id:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the Digital Wallet Token Request was created.
        created_at:,
        # Details of the decline. Present if and only if `outcome` is `declined`.
        declined:,
        # The device that requested the tokenization.
        device:,
        # The outcome of the tokenization request.
        outcome:,
        # Details of the provisioned Digital Wallet Token. Present if and only if
        # `outcome` is `provisioned`.
        provisioned:,
        # The reference identifier assigned by the card network to the token.
        token_reference_identifier:,
        # The digital wallet app being used.
        token_requestor:,
        # A constant representing the object's type. For this resource it will always be
        # `digital_wallet_token_request`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            card_id: String,
            created_at: Time,
            declined: T.nilable(Increase::DigitalWalletTokenRequest::Declined),
            device: Increase::DigitalWalletTokenRequest::Device,
            outcome: Increase::DigitalWalletTokenRequest::Outcome::TaggedSymbol,
            provisioned:
              T.nilable(Increase::DigitalWalletTokenRequest::Provisioned),
            token_reference_identifier: String,
            token_requestor:
              Increase::DigitalWalletTokenRequest::TokenRequestor::TaggedSymbol,
            type: Increase::DigitalWalletTokenRequest::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Declined < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::DigitalWalletTokenRequest::Declined,
              Increase::Internal::AnyHash
            )
          end

        # The reason the tokenization was declined.
        sig do
          returns(
            Increase::DigitalWalletTokenRequest::Declined::Reason::TaggedSymbol
          )
        end
        attr_accessor :reason

        # Details of the decline. Present if and only if `outcome` is `declined`.
        sig do
          params(
            reason:
              Increase::DigitalWalletTokenRequest::Declined::Reason::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The reason the tokenization was declined.
          reason:
        )
        end

        sig do
          override.returns(
            {
              reason:
                Increase::DigitalWalletTokenRequest::Declined::Reason::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # The reason the tokenization was declined.
        module Reason
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::DigitalWalletTokenRequest::Declined::Reason
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The card is not active.
          CARD_NOT_ACTIVE =
            T.let(
              :card_not_active,
              Increase::DigitalWalletTokenRequest::Declined::Reason::TaggedSymbol
            )

          # The card does not have a two-factor authentication method.
          NO_VERIFICATION_METHOD =
            T.let(
              :no_verification_method,
              Increase::DigitalWalletTokenRequest::Declined::Reason::TaggedSymbol
            )

          # Your webhook timed out when evaluating the token provisioning attempt.
          WEBHOOK_TIMED_OUT =
            T.let(
              :webhook_timed_out,
              Increase::DigitalWalletTokenRequest::Declined::Reason::TaggedSymbol
            )

          # Your webhook declined the token provisioning attempt.
          WEBHOOK_DECLINED =
            T.let(
              :webhook_declined,
              Increase::DigitalWalletTokenRequest::Declined::Reason::TaggedSymbol
            )

          # The tokenization attempt failed because the Card Verification Code (CVC) was incorrect.
          INCORRECT_CARD_VERIFICATION_CODE =
            T.let(
              :incorrect_card_verification_code,
              Increase::DigitalWalletTokenRequest::Declined::Reason::TaggedSymbol
            )

          # The tokenization attempt was declined by the token requestor.
          DECLINED_BY_TOKEN_REQUESTOR =
            T.let(
              :declined_by_token_requestor,
              Increase::DigitalWalletTokenRequest::Declined::Reason::TaggedSymbol
            )

          # The group was locked.
          GROUP_LOCKED =
            T.let(
              :group_locked,
              Increase::DigitalWalletTokenRequest::Declined::Reason::TaggedSymbol
            )

          # The account has been closed.
          ACCOUNT_CLOSED =
            T.let(
              :account_closed,
              Increase::DigitalWalletTokenRequest::Declined::Reason::TaggedSymbol
            )

          # The account's entity was not active.
          ENTITY_NOT_ACTIVE =
            T.let(
              :entity_not_active,
              Increase::DigitalWalletTokenRequest::Declined::Reason::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::DigitalWalletTokenRequest::Declined::Reason::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class Device < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::DigitalWalletTokenRequest::Device,
              Increase::Internal::AnyHash
            )
          end

        # Device type.
        sig do
          returns(
            T.nilable(
              Increase::DigitalWalletTokenRequest::Device::DeviceType::TaggedSymbol
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

        # The device that requested the tokenization.
        sig do
          params(
            device_type:
              T.nilable(
                Increase::DigitalWalletTokenRequest::Device::DeviceType::OrSymbol
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
                  Increase::DigitalWalletTokenRequest::Device::DeviceType::TaggedSymbol
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
              T.all(
                Symbol,
                Increase::DigitalWalletTokenRequest::Device::DeviceType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Unknown
          UNKNOWN =
            T.let(
              :unknown,
              Increase::DigitalWalletTokenRequest::Device::DeviceType::TaggedSymbol
            )

          # Mobile Phone
          MOBILE_PHONE =
            T.let(
              :mobile_phone,
              Increase::DigitalWalletTokenRequest::Device::DeviceType::TaggedSymbol
            )

          # Tablet
          TABLET =
            T.let(
              :tablet,
              Increase::DigitalWalletTokenRequest::Device::DeviceType::TaggedSymbol
            )

          # Watch
          WATCH =
            T.let(
              :watch,
              Increase::DigitalWalletTokenRequest::Device::DeviceType::TaggedSymbol
            )

          # Mobile Phone or Tablet
          MOBILEPHONE_OR_TABLET =
            T.let(
              :mobilephone_or_tablet,
              Increase::DigitalWalletTokenRequest::Device::DeviceType::TaggedSymbol
            )

          # PC
          PC =
            T.let(
              :pc,
              Increase::DigitalWalletTokenRequest::Device::DeviceType::TaggedSymbol
            )

          # Household Device
          HOUSEHOLD_DEVICE =
            T.let(
              :household_device,
              Increase::DigitalWalletTokenRequest::Device::DeviceType::TaggedSymbol
            )

          # Wearable Device
          WEARABLE_DEVICE =
            T.let(
              :wearable_device,
              Increase::DigitalWalletTokenRequest::Device::DeviceType::TaggedSymbol
            )

          # Automobile Device
          AUTOMOBILE_DEVICE =
            T.let(
              :automobile_device,
              Increase::DigitalWalletTokenRequest::Device::DeviceType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::DigitalWalletTokenRequest::Device::DeviceType::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # The outcome of the tokenization request.
      module Outcome
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::DigitalWalletTokenRequest::Outcome)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The tokenization request was approved and a Digital Wallet Token was provisioned.
        PROVISIONED =
          T.let(
            :provisioned,
            Increase::DigitalWalletTokenRequest::Outcome::TaggedSymbol
          )

        # The tokenization request was declined.
        DECLINED =
          T.let(
            :declined,
            Increase::DigitalWalletTokenRequest::Outcome::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::DigitalWalletTokenRequest::Outcome::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Provisioned < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::DigitalWalletTokenRequest::Provisioned,
              Increase::Internal::AnyHash
            )
          end

        # The identifier of the Digital Wallet Token that was provisioned.
        sig { returns(String) }
        attr_accessor :digital_wallet_token_id

        # Details of the provisioned Digital Wallet Token. Present if and only if
        # `outcome` is `provisioned`.
        sig do
          params(digital_wallet_token_id: String).returns(T.attached_class)
        end
        def self.new(
          # The identifier of the Digital Wallet Token that was provisioned.
          digital_wallet_token_id:
        )
        end

        sig { override.returns({ digital_wallet_token_id: String }) }
        def to_hash
        end
      end

      # The digital wallet app being used.
      module TokenRequestor
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::DigitalWalletTokenRequest::TokenRequestor)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # Apple Pay
        APPLE_PAY =
          T.let(
            :apple_pay,
            Increase::DigitalWalletTokenRequest::TokenRequestor::TaggedSymbol
          )

        # Google Pay
        GOOGLE_PAY =
          T.let(
            :google_pay,
            Increase::DigitalWalletTokenRequest::TokenRequestor::TaggedSymbol
          )

        # Samsung Pay
        SAMSUNG_PAY =
          T.let(
            :samsung_pay,
            Increase::DigitalWalletTokenRequest::TokenRequestor::TaggedSymbol
          )

        # Garmin Pay
        GARMIN_PAY =
          T.let(
            :garmin_pay,
            Increase::DigitalWalletTokenRequest::TokenRequestor::TaggedSymbol
          )

        # Unknown
        UNKNOWN =
          T.let(
            :unknown,
            Increase::DigitalWalletTokenRequest::TokenRequestor::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Increase::DigitalWalletTokenRequest::TokenRequestor::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `digital_wallet_token_request`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::DigitalWalletTokenRequest::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        DIGITAL_WALLET_TOKEN_REQUEST =
          T.let(
            :digital_wallet_token_request,
            Increase::DigitalWalletTokenRequest::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::DigitalWalletTokenRequest::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
