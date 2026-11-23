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

      # The cardholder adding the card to the digital wallet.
      sig { returns(Increase::DigitalWalletTokenRequest::Cardholder) }
      attr_reader :cardholder

      sig do
        params(
          cardholder: Increase::DigitalWalletTokenRequest::Cardholder::OrHash
        ).void
      end
      attr_writer :cardholder

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

      # The card network the token is being provisioned on.
      sig do
        returns(Increase::DigitalWalletTokenRequest::Network::TaggedSymbol)
      end
      attr_accessor :network

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

      # The digital wallet or merchant that requested the token.
      sig do
        returns(Increase::DigitalWalletTokenRequest::TokenRequestorDetails)
      end
      attr_reader :token_requestor_details

      sig do
        params(
          token_requestor_details:
            Increase::DigitalWalletTokenRequest::TokenRequestorDetails::OrHash
        ).void
      end
      attr_writer :token_requestor_details

      # A constant representing the object's type. For this resource it will always be
      # `digital_wallet_token_request`.
      sig { returns(Increase::DigitalWalletTokenRequest::Type::TaggedSymbol) }
      attr_accessor :type

      # Fields related to verification of cardholder-provided values.
      sig { returns(Increase::DigitalWalletTokenRequest::Verification) }
      attr_reader :verification

      sig do
        params(
          verification:
            Increase::DigitalWalletTokenRequest::Verification::OrHash
        ).void
      end
      attr_writer :verification

      # Risk scores provided by Visa for the provisioning request. This field will be
      # present in the JSON response if and only if `network` is equal to `visa`.
      sig { returns(T.nilable(Increase::DigitalWalletTokenRequest::Visa)) }
      attr_reader :visa

      sig do
        params(
          visa: T.nilable(Increase::DigitalWalletTokenRequest::Visa::OrHash)
        ).void
      end
      attr_writer :visa

      # Details about the digital wallet.
      sig { returns(Increase::DigitalWalletTokenRequest::Wallet) }
      attr_reader :wallet

      sig do
        params(wallet: Increase::DigitalWalletTokenRequest::Wallet::OrHash).void
      end
      attr_writer :wallet

      # A Digital Wallet Token Request is created each time a digital wallet app, such
      # as Apple Pay or Google Pay, requests to tokenize a Card.
      sig do
        params(
          id: String,
          card_id: String,
          cardholder: Increase::DigitalWalletTokenRequest::Cardholder::OrHash,
          created_at: Time,
          declined:
            T.nilable(Increase::DigitalWalletTokenRequest::Declined::OrHash),
          device: Increase::DigitalWalletTokenRequest::Device::OrHash,
          network: Increase::DigitalWalletTokenRequest::Network::OrSymbol,
          outcome: Increase::DigitalWalletTokenRequest::Outcome::OrSymbol,
          provisioned:
            T.nilable(Increase::DigitalWalletTokenRequest::Provisioned::OrHash),
          token_reference_identifier: String,
          token_requestor:
            Increase::DigitalWalletTokenRequest::TokenRequestor::OrSymbol,
          token_requestor_details:
            Increase::DigitalWalletTokenRequest::TokenRequestorDetails::OrHash,
          type: Increase::DigitalWalletTokenRequest::Type::OrSymbol,
          verification:
            Increase::DigitalWalletTokenRequest::Verification::OrHash,
          visa: T.nilable(Increase::DigitalWalletTokenRequest::Visa::OrHash),
          wallet: Increase::DigitalWalletTokenRequest::Wallet::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The Digital Wallet Token Request identifier.
        id:,
        # The identifier of the Card the tokenization was requested for.
        card_id:,
        # The cardholder adding the card to the digital wallet.
        cardholder:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the Digital Wallet Token Request was created.
        created_at:,
        # Details of the decline. Present if and only if `outcome` is `declined`.
        declined:,
        # The device that requested the tokenization.
        device:,
        # The card network the token is being provisioned on.
        network:,
        # The outcome of the tokenization request.
        outcome:,
        # Details of the provisioned Digital Wallet Token. Present if and only if
        # `outcome` is `provisioned`.
        provisioned:,
        # The reference identifier assigned by the card network to the token.
        token_reference_identifier:,
        # The digital wallet app being used.
        token_requestor:,
        # The digital wallet or merchant that requested the token.
        token_requestor_details:,
        # A constant representing the object's type. For this resource it will always be
        # `digital_wallet_token_request`.
        type:,
        # Fields related to verification of cardholder-provided values.
        verification:,
        # Risk scores provided by Visa for the provisioning request. This field will be
        # present in the JSON response if and only if `network` is equal to `visa`.
        visa:,
        # Details about the digital wallet.
        wallet:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            card_id: String,
            cardholder: Increase::DigitalWalletTokenRequest::Cardholder,
            created_at: Time,
            declined: T.nilable(Increase::DigitalWalletTokenRequest::Declined),
            device: Increase::DigitalWalletTokenRequest::Device,
            network: Increase::DigitalWalletTokenRequest::Network::TaggedSymbol,
            outcome: Increase::DigitalWalletTokenRequest::Outcome::TaggedSymbol,
            provisioned:
              T.nilable(Increase::DigitalWalletTokenRequest::Provisioned),
            token_reference_identifier: String,
            token_requestor:
              Increase::DigitalWalletTokenRequest::TokenRequestor::TaggedSymbol,
            token_requestor_details:
              Increase::DigitalWalletTokenRequest::TokenRequestorDetails,
            type: Increase::DigitalWalletTokenRequest::Type::TaggedSymbol,
            verification: Increase::DigitalWalletTokenRequest::Verification,
            visa: T.nilable(Increase::DigitalWalletTokenRequest::Visa),
            wallet: Increase::DigitalWalletTokenRequest::Wallet
          }
        )
      end
      def to_hash
      end

      class Cardholder < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::DigitalWalletTokenRequest::Cardholder,
              Increase::Internal::AnyHash
            )
          end

        # The cardholder's name, as entered in the digital wallet.
        sig { returns(T.nilable(String)) }
        attr_accessor :name

        # The cardholder adding the card to the digital wallet.
        sig { params(name: T.nilable(String)).returns(T.attached_class) }
        def self.new(
          # The cardholder's name, as entered in the digital wallet.
          name:
        )
        end

        sig { override.returns({ name: T.nilable(String) }) }
        def to_hash
        end
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

          # The given expiration date did not match the card's value.
          CARD_EXPIRATION_MISMATCH =
            T.let(
              :card_expiration_mismatch,
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

      # The card network the token is being provisioned on.
      module Network
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::DigitalWalletTokenRequest::Network)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # Visa
        VISA =
          T.let(
            :visa,
            Increase::DigitalWalletTokenRequest::Network::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::DigitalWalletTokenRequest::Network::TaggedSymbol]
          )
        end
        def self.values
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

      class TokenRequestorDetails < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::DigitalWalletTokenRequest::TokenRequestorDetails,
              Increase::Internal::AnyHash
            )
          end

        # The identifier assigned to the token requestor by the card network.
        sig { returns(String) }
        attr_accessor :identifier

        # The name of the token requestor, for example "Apple Inc.".
        sig { returns(T.nilable(String)) }
        attr_accessor :name

        # The digital wallet or merchant that requested the token.
        sig do
          params(identifier: String, name: T.nilable(String)).returns(
            T.attached_class
          )
        end
        def self.new(
          # The identifier assigned to the token requestor by the card network.
          identifier:,
          # The name of the token requestor, for example "Apple Inc.".
          name:
        )
        end

        sig do
          override.returns({ identifier: String, name: T.nilable(String) })
        end
        def to_hash
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

      class Verification < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::DigitalWalletTokenRequest::Verification,
              Increase::Internal::AnyHash
            )
          end

        # Cardholder address provided in the provisioning request and the address on file
        # we verified it against.
        sig do
          returns(
            Increase::DigitalWalletTokenRequest::Verification::CardholderAddress
          )
        end
        attr_reader :cardholder_address

        sig do
          params(
            cardholder_address:
              Increase::DigitalWalletTokenRequest::Verification::CardholderAddress::OrHash
          ).void
        end
        attr_writer :cardholder_address

        # Fields related to verification of cardholder-provided values.
        sig do
          params(
            cardholder_address:
              Increase::DigitalWalletTokenRequest::Verification::CardholderAddress::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Cardholder address provided in the provisioning request and the address on file
          # we verified it against.
          cardholder_address:
        )
        end

        sig do
          override.returns(
            {
              cardholder_address:
                Increase::DigitalWalletTokenRequest::Verification::CardholderAddress
            }
          )
        end
        def to_hash
        end

        class CardholderAddress < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::DigitalWalletTokenRequest::Verification::CardholderAddress,
                Increase::Internal::AnyHash
              )
            end

          # Line 1 of the address on file for the cardholder.
          sig { returns(T.nilable(String)) }
          attr_accessor :actual_line1

          # The postal code of the address on file for the cardholder.
          sig { returns(T.nilable(String)) }
          attr_accessor :actual_postal_code

          # The cardholder address line 1 provided for verification in the provisioning
          # request.
          sig { returns(T.nilable(String)) }
          attr_accessor :provided_line1

          # The postal code provided for verification in the provisioning request.
          sig { returns(T.nilable(String)) }
          attr_accessor :provided_postal_code

          # The address verification result.
          sig do
            returns(
              Increase::DigitalWalletTokenRequest::Verification::CardholderAddress::Result::TaggedSymbol
            )
          end
          attr_accessor :result

          # Cardholder address provided in the provisioning request and the address on file
          # we verified it against.
          sig do
            params(
              actual_line1: T.nilable(String),
              actual_postal_code: T.nilable(String),
              provided_line1: T.nilable(String),
              provided_postal_code: T.nilable(String),
              result:
                Increase::DigitalWalletTokenRequest::Verification::CardholderAddress::Result::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Line 1 of the address on file for the cardholder.
            actual_line1:,
            # The postal code of the address on file for the cardholder.
            actual_postal_code:,
            # The cardholder address line 1 provided for verification in the provisioning
            # request.
            provided_line1:,
            # The postal code provided for verification in the provisioning request.
            provided_postal_code:,
            # The address verification result.
            result:
          )
          end

          sig do
            override.returns(
              {
                actual_line1: T.nilable(String),
                actual_postal_code: T.nilable(String),
                provided_line1: T.nilable(String),
                provided_postal_code: T.nilable(String),
                result:
                  Increase::DigitalWalletTokenRequest::Verification::CardholderAddress::Result::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          # The address verification result.
          module Result
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::DigitalWalletTokenRequest::Verification::CardholderAddress::Result
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # No address information was provided in the authorization request.
            NOT_CHECKED =
              T.let(
                :not_checked,
                Increase::DigitalWalletTokenRequest::Verification::CardholderAddress::Result::TaggedSymbol
              )

            # Postal code matches, but the street address does not match or was not provided.
            POSTAL_CODE_MATCH_ADDRESS_NO_MATCH =
              T.let(
                :postal_code_match_address_no_match,
                Increase::DigitalWalletTokenRequest::Verification::CardholderAddress::Result::TaggedSymbol
              )

            # Postal code does not match, but the street address matches or was not provided.
            POSTAL_CODE_NO_MATCH_ADDRESS_MATCH =
              T.let(
                :postal_code_no_match_address_match,
                Increase::DigitalWalletTokenRequest::Verification::CardholderAddress::Result::TaggedSymbol
              )

            # Postal code and street address match.
            MATCH =
              T.let(
                :match,
                Increase::DigitalWalletTokenRequest::Verification::CardholderAddress::Result::TaggedSymbol
              )

            # Postal code and street address do not match.
            NO_MATCH =
              T.let(
                :no_match,
                Increase::DigitalWalletTokenRequest::Verification::CardholderAddress::Result::TaggedSymbol
              )

            # Postal code matches, but the street address was not verified. (deprecated)
            POSTAL_CODE_MATCH_ADDRESS_NOT_CHECKED =
              T.let(
                :postal_code_match_address_not_checked,
                Increase::DigitalWalletTokenRequest::Verification::CardholderAddress::Result::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::DigitalWalletTokenRequest::Verification::CardholderAddress::Result::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end

      class Visa < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::DigitalWalletTokenRequest::Visa,
              Increase::Internal::AnyHash
            )
          end

        # Visa's risk score for the card, based on its transaction history, from 0 to 99.
        # A higher score indicates a higher risk.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :network_risk_score

        # Visa's risk score for the provisioning request, from 1 to 99. A higher score
        # indicates a higher risk.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :provisioning_risk_score

        # Risk scores provided by Visa for the provisioning request. This field will be
        # present in the JSON response if and only if `network` is equal to `visa`.
        sig do
          params(
            network_risk_score: T.nilable(Integer),
            provisioning_risk_score: T.nilable(Integer)
          ).returns(T.attached_class)
        end
        def self.new(
          # Visa's risk score for the card, based on its transaction history, from 0 to 99.
          # A higher score indicates a higher risk.
          network_risk_score:,
          # Visa's risk score for the provisioning request, from 1 to 99. A higher score
          # indicates a higher risk.
          provisioning_risk_score:
        )
        end

        sig do
          override.returns(
            {
              network_risk_score: T.nilable(Integer),
              provisioning_risk_score: T.nilable(Integer)
            }
          )
        end
        def to_hash
        end
      end

      class Wallet < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::DigitalWalletTokenRequest::Wallet,
              Increase::Internal::AnyHash
            )
          end

        # The number of days since the email address was added to the cardholder's digital
        # wallet account, up to 999.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :account_email_age_days

        # An identifier for the cardholder's account with the digital wallet.
        sig { returns(T.nilable(String)) }
        attr_accessor :account_identifier

        # How much the digital wallet trusts the cardholder's account, from 1 to 5. A
        # higher score indicates more trust.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :account_score

        # How much the digital wallet trusts the device the card is being added to, from 1
        # to 5. A higher score indicates more trust.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :device_score

        # A hash of the email address on the cardholder's digital wallet account.
        sig { returns(T.nilable(String)) }
        attr_accessor :email_hash

        # Details about the digital wallet.
        sig do
          params(
            account_email_age_days: T.nilable(Integer),
            account_identifier: T.nilable(String),
            account_score: T.nilable(Integer),
            device_score: T.nilable(Integer),
            email_hash: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # The number of days since the email address was added to the cardholder's digital
          # wallet account, up to 999.
          account_email_age_days:,
          # An identifier for the cardholder's account with the digital wallet.
          account_identifier:,
          # How much the digital wallet trusts the cardholder's account, from 1 to 5. A
          # higher score indicates more trust.
          account_score:,
          # How much the digital wallet trusts the device the card is being added to, from 1
          # to 5. A higher score indicates more trust.
          device_score:,
          # A hash of the email address on the cardholder's digital wallet account.
          email_hash:
        )
        end

        sig do
          override.returns(
            {
              account_email_age_days: T.nilable(Integer),
              account_identifier: T.nilable(String),
              account_score: T.nilable(Integer),
              device_score: T.nilable(Integer),
              email_hash: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
