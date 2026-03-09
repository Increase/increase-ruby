# typed: strong

module Increase
  module Models
    class RealTimeDecision < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::RealTimeDecision, Increase::Internal::AnyHash)
        end

      # The Real-Time Decision identifier.
      sig { returns(String) }
      attr_accessor :id

      # Fields related to a 3DS authentication attempt.
      sig { returns(T.nilable(Increase::RealTimeDecision::CardAuthentication)) }
      attr_reader :card_authentication

      sig do
        params(
          card_authentication:
            T.nilable(Increase::RealTimeDecision::CardAuthentication::OrHash)
        ).void
      end
      attr_writer :card_authentication

      # Fields related to a 3DS authentication attempt.
      sig do
        returns(
          T.nilable(Increase::RealTimeDecision::CardAuthenticationChallenge)
        )
      end
      attr_reader :card_authentication_challenge

      sig do
        params(
          card_authentication_challenge:
            T.nilable(
              Increase::RealTimeDecision::CardAuthenticationChallenge::OrHash
            )
        ).void
      end
      attr_writer :card_authentication_challenge

      # Fields related to a card authorization.
      sig { returns(T.nilable(Increase::RealTimeDecision::CardAuthorization)) }
      attr_reader :card_authorization

      sig do
        params(
          card_authorization:
            T.nilable(Increase::RealTimeDecision::CardAuthorization::OrHash)
        ).void
      end
      attr_writer :card_authorization

      # Fields related to a card balance inquiry.
      sig { returns(T.nilable(Increase::RealTimeDecision::CardBalanceInquiry)) }
      attr_reader :card_balance_inquiry

      sig do
        params(
          card_balance_inquiry:
            T.nilable(Increase::RealTimeDecision::CardBalanceInquiry::OrHash)
        ).void
      end
      attr_writer :card_balance_inquiry

      # The category of the Real-Time Decision.
      sig { returns(Increase::RealTimeDecision::Category::TaggedSymbol) }
      attr_accessor :category

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      # the Real-Time Decision was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # Fields related to a digital wallet authentication attempt.
      sig do
        returns(
          T.nilable(Increase::RealTimeDecision::DigitalWalletAuthentication)
        )
      end
      attr_reader :digital_wallet_authentication

      sig do
        params(
          digital_wallet_authentication:
            T.nilable(
              Increase::RealTimeDecision::DigitalWalletAuthentication::OrHash
            )
        ).void
      end
      attr_writer :digital_wallet_authentication

      # Fields related to a digital wallet token provisioning attempt.
      sig { returns(T.nilable(Increase::RealTimeDecision::DigitalWalletToken)) }
      attr_reader :digital_wallet_token

      sig do
        params(
          digital_wallet_token:
            T.nilable(Increase::RealTimeDecision::DigitalWalletToken::OrHash)
        ).void
      end
      attr_writer :digital_wallet_token

      # The status of the Real-Time Decision.
      sig { returns(Increase::RealTimeDecision::Status::TaggedSymbol) }
      attr_accessor :status

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      # your application can no longer respond to the Real-Time Decision.
      sig { returns(Time) }
      attr_accessor :timeout_at

      # A constant representing the object's type. For this resource it will always be
      # `real_time_decision`.
      sig { returns(Increase::RealTimeDecision::Type::TaggedSymbol) }
      attr_accessor :type

      # Real Time Decisions are created when your application needs to take action in
      # real-time to some event such as a card authorization. For more information, see
      # our
      # [Real-Time Decisions guide](https://increase.com/documentation/real-time-decisions).
      sig do
        params(
          id: String,
          card_authentication:
            T.nilable(Increase::RealTimeDecision::CardAuthentication::OrHash),
          card_authentication_challenge:
            T.nilable(
              Increase::RealTimeDecision::CardAuthenticationChallenge::OrHash
            ),
          card_authorization:
            T.nilable(Increase::RealTimeDecision::CardAuthorization::OrHash),
          card_balance_inquiry:
            T.nilable(Increase::RealTimeDecision::CardBalanceInquiry::OrHash),
          category: Increase::RealTimeDecision::Category::OrSymbol,
          created_at: Time,
          digital_wallet_authentication:
            T.nilable(
              Increase::RealTimeDecision::DigitalWalletAuthentication::OrHash
            ),
          digital_wallet_token:
            T.nilable(Increase::RealTimeDecision::DigitalWalletToken::OrHash),
          status: Increase::RealTimeDecision::Status::OrSymbol,
          timeout_at: Time,
          type: Increase::RealTimeDecision::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The Real-Time Decision identifier.
        id:,
        # Fields related to a 3DS authentication attempt.
        card_authentication:,
        # Fields related to a 3DS authentication attempt.
        card_authentication_challenge:,
        # Fields related to a card authorization.
        card_authorization:,
        # Fields related to a card balance inquiry.
        card_balance_inquiry:,
        # The category of the Real-Time Decision.
        category:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the Real-Time Decision was created.
        created_at:,
        # Fields related to a digital wallet authentication attempt.
        digital_wallet_authentication:,
        # Fields related to a digital wallet token provisioning attempt.
        digital_wallet_token:,
        # The status of the Real-Time Decision.
        status:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # your application can no longer respond to the Real-Time Decision.
        timeout_at:,
        # A constant representing the object's type. For this resource it will always be
        # `real_time_decision`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            card_authentication:
              T.nilable(Increase::RealTimeDecision::CardAuthentication),
            card_authentication_challenge:
              T.nilable(
                Increase::RealTimeDecision::CardAuthenticationChallenge
              ),
            card_authorization:
              T.nilable(Increase::RealTimeDecision::CardAuthorization),
            card_balance_inquiry:
              T.nilable(Increase::RealTimeDecision::CardBalanceInquiry),
            category: Increase::RealTimeDecision::Category::TaggedSymbol,
            created_at: Time,
            digital_wallet_authentication:
              T.nilable(
                Increase::RealTimeDecision::DigitalWalletAuthentication
              ),
            digital_wallet_token:
              T.nilable(Increase::RealTimeDecision::DigitalWalletToken),
            status: Increase::RealTimeDecision::Status::TaggedSymbol,
            timeout_at: Time,
            type: Increase::RealTimeDecision::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class CardAuthentication < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::RealTimeDecision::CardAuthentication,
              Increase::Internal::AnyHash
            )
          end

        # A unique identifier assigned by the Access Control Server (us) for this
        # transaction.
        sig { returns(String) }
        attr_accessor :access_control_server_transaction_id

        # The identifier of the Account the card belongs to.
        sig { returns(String) }
        attr_accessor :account_id

        # The city of the cardholder billing address associated with the card used for
        # this purchase.
        sig { returns(T.nilable(String)) }
        attr_accessor :billing_address_city

        # The country of the cardholder billing address associated with the card used for
        # this purchase.
        sig { returns(T.nilable(String)) }
        attr_accessor :billing_address_country

        # The first line of the cardholder billing address associated with the card used
        # for this purchase.
        sig { returns(T.nilable(String)) }
        attr_accessor :billing_address_line1

        # The second line of the cardholder billing address associated with the card used
        # for this purchase.
        sig { returns(T.nilable(String)) }
        attr_accessor :billing_address_line2

        # The third line of the cardholder billing address associated with the card used
        # for this purchase.
        sig { returns(T.nilable(String)) }
        attr_accessor :billing_address_line3

        # The postal code of the cardholder billing address associated with the card used
        # for this purchase.
        sig { returns(T.nilable(String)) }
        attr_accessor :billing_address_postal_code

        # The US state of the cardholder billing address associated with the card used for
        # this purchase.
        sig { returns(T.nilable(String)) }
        attr_accessor :billing_address_state

        # The identifier of the Card.
        sig { returns(String) }
        attr_accessor :card_id

        # The email address of the cardholder.
        sig { returns(T.nilable(String)) }
        attr_accessor :cardholder_email

        # The name of the cardholder.
        sig { returns(T.nilable(String)) }
        attr_accessor :cardholder_name

        # Whether or not the authentication attempt was approved.
        sig do
          returns(
            T.nilable(
              Increase::RealTimeDecision::CardAuthentication::Decision::TaggedSymbol
            )
          )
        end
        attr_accessor :decision

        # The device channel of the card authentication attempt.
        sig do
          returns(Increase::RealTimeDecision::CardAuthentication::DeviceChannel)
        end
        attr_reader :device_channel

        sig do
          params(
            device_channel:
              Increase::RealTimeDecision::CardAuthentication::DeviceChannel::OrHash
          ).void
        end
        attr_writer :device_channel

        # A unique identifier assigned by the Directory Server (the card network) for this
        # transaction.
        sig { returns(String) }
        attr_accessor :directory_server_transaction_id

        # The merchant identifier (commonly abbreviated as MID) of the merchant the card
        # is transacting with.
        sig { returns(T.nilable(String)) }
        attr_accessor :merchant_acceptor_id

        # The Merchant Category Code (commonly abbreviated as MCC) of the merchant the
        # card is transacting with.
        sig { returns(T.nilable(String)) }
        attr_accessor :merchant_category_code

        # The country the merchant resides in.
        sig { returns(T.nilable(String)) }
        attr_accessor :merchant_country

        # The name of the merchant.
        sig { returns(T.nilable(String)) }
        attr_accessor :merchant_name

        # The message category of the card authentication attempt.
        sig do
          returns(
            Increase::RealTimeDecision::CardAuthentication::MessageCategory
          )
        end
        attr_reader :message_category

        sig do
          params(
            message_category:
              Increase::RealTimeDecision::CardAuthentication::MessageCategory::OrHash
          ).void
        end
        attr_writer :message_category

        # The ID of a prior Card Authentication that the requestor used to authenticate
        # this cardholder for a previous transaction.
        sig { returns(T.nilable(String)) }
        attr_accessor :prior_authenticated_card_payment_id

        # The 3DS requestor authentication indicator describes why the authentication
        # attempt is performed, such as for a recurring transaction.
        sig do
          returns(
            T.nilable(
              Increase::RealTimeDecision::CardAuthentication::RequestorAuthenticationIndicator::TaggedSymbol
            )
          )
        end
        attr_accessor :requestor_authentication_indicator

        # Indicates whether a challenge is requested for this transaction.
        sig do
          returns(
            T.nilable(
              Increase::RealTimeDecision::CardAuthentication::RequestorChallengeIndicator::TaggedSymbol
            )
          )
        end
        attr_accessor :requestor_challenge_indicator

        # The name of the 3DS requestor.
        sig { returns(String) }
        attr_accessor :requestor_name

        # The URL of the 3DS requestor.
        sig { returns(String) }
        attr_accessor :requestor_url

        # The city of the shipping address associated with this purchase.
        sig { returns(T.nilable(String)) }
        attr_accessor :shipping_address_city

        # The country of the shipping address associated with this purchase.
        sig { returns(T.nilable(String)) }
        attr_accessor :shipping_address_country

        # The first line of the shipping address associated with this purchase.
        sig { returns(T.nilable(String)) }
        attr_accessor :shipping_address_line1

        # The second line of the shipping address associated with this purchase.
        sig { returns(T.nilable(String)) }
        attr_accessor :shipping_address_line2

        # The third line of the shipping address associated with this purchase.
        sig { returns(T.nilable(String)) }
        attr_accessor :shipping_address_line3

        # The postal code of the shipping address associated with this purchase.
        sig { returns(T.nilable(String)) }
        attr_accessor :shipping_address_postal_code

        # The US state of the shipping address associated with this purchase.
        sig { returns(T.nilable(String)) }
        attr_accessor :shipping_address_state

        # A unique identifier assigned by the 3DS Server initiating the authentication
        # attempt for this transaction.
        sig { returns(String) }
        attr_accessor :three_d_secure_server_transaction_id

        # The identifier of the Card Payment this authentication attempt will belong to.
        # Available in the API once the card authentication has completed.
        sig { returns(String) }
        attr_accessor :upcoming_card_payment_id

        # Fields related to a 3DS authentication attempt.
        sig do
          params(
            access_control_server_transaction_id: String,
            account_id: String,
            billing_address_city: T.nilable(String),
            billing_address_country: T.nilable(String),
            billing_address_line1: T.nilable(String),
            billing_address_line2: T.nilable(String),
            billing_address_line3: T.nilable(String),
            billing_address_postal_code: T.nilable(String),
            billing_address_state: T.nilable(String),
            card_id: String,
            cardholder_email: T.nilable(String),
            cardholder_name: T.nilable(String),
            decision:
              T.nilable(
                Increase::RealTimeDecision::CardAuthentication::Decision::OrSymbol
              ),
            device_channel:
              Increase::RealTimeDecision::CardAuthentication::DeviceChannel::OrHash,
            directory_server_transaction_id: String,
            merchant_acceptor_id: T.nilable(String),
            merchant_category_code: T.nilable(String),
            merchant_country: T.nilable(String),
            merchant_name: T.nilable(String),
            message_category:
              Increase::RealTimeDecision::CardAuthentication::MessageCategory::OrHash,
            prior_authenticated_card_payment_id: T.nilable(String),
            requestor_authentication_indicator:
              T.nilable(
                Increase::RealTimeDecision::CardAuthentication::RequestorAuthenticationIndicator::OrSymbol
              ),
            requestor_challenge_indicator:
              T.nilable(
                Increase::RealTimeDecision::CardAuthentication::RequestorChallengeIndicator::OrSymbol
              ),
            requestor_name: String,
            requestor_url: String,
            shipping_address_city: T.nilable(String),
            shipping_address_country: T.nilable(String),
            shipping_address_line1: T.nilable(String),
            shipping_address_line2: T.nilable(String),
            shipping_address_line3: T.nilable(String),
            shipping_address_postal_code: T.nilable(String),
            shipping_address_state: T.nilable(String),
            three_d_secure_server_transaction_id: String,
            upcoming_card_payment_id: String
          ).returns(T.attached_class)
        end
        def self.new(
          # A unique identifier assigned by the Access Control Server (us) for this
          # transaction.
          access_control_server_transaction_id:,
          # The identifier of the Account the card belongs to.
          account_id:,
          # The city of the cardholder billing address associated with the card used for
          # this purchase.
          billing_address_city:,
          # The country of the cardholder billing address associated with the card used for
          # this purchase.
          billing_address_country:,
          # The first line of the cardholder billing address associated with the card used
          # for this purchase.
          billing_address_line1:,
          # The second line of the cardholder billing address associated with the card used
          # for this purchase.
          billing_address_line2:,
          # The third line of the cardholder billing address associated with the card used
          # for this purchase.
          billing_address_line3:,
          # The postal code of the cardholder billing address associated with the card used
          # for this purchase.
          billing_address_postal_code:,
          # The US state of the cardholder billing address associated with the card used for
          # this purchase.
          billing_address_state:,
          # The identifier of the Card.
          card_id:,
          # The email address of the cardholder.
          cardholder_email:,
          # The name of the cardholder.
          cardholder_name:,
          # Whether or not the authentication attempt was approved.
          decision:,
          # The device channel of the card authentication attempt.
          device_channel:,
          # A unique identifier assigned by the Directory Server (the card network) for this
          # transaction.
          directory_server_transaction_id:,
          # The merchant identifier (commonly abbreviated as MID) of the merchant the card
          # is transacting with.
          merchant_acceptor_id:,
          # The Merchant Category Code (commonly abbreviated as MCC) of the merchant the
          # card is transacting with.
          merchant_category_code:,
          # The country the merchant resides in.
          merchant_country:,
          # The name of the merchant.
          merchant_name:,
          # The message category of the card authentication attempt.
          message_category:,
          # The ID of a prior Card Authentication that the requestor used to authenticate
          # this cardholder for a previous transaction.
          prior_authenticated_card_payment_id:,
          # The 3DS requestor authentication indicator describes why the authentication
          # attempt is performed, such as for a recurring transaction.
          requestor_authentication_indicator:,
          # Indicates whether a challenge is requested for this transaction.
          requestor_challenge_indicator:,
          # The name of the 3DS requestor.
          requestor_name:,
          # The URL of the 3DS requestor.
          requestor_url:,
          # The city of the shipping address associated with this purchase.
          shipping_address_city:,
          # The country of the shipping address associated with this purchase.
          shipping_address_country:,
          # The first line of the shipping address associated with this purchase.
          shipping_address_line1:,
          # The second line of the shipping address associated with this purchase.
          shipping_address_line2:,
          # The third line of the shipping address associated with this purchase.
          shipping_address_line3:,
          # The postal code of the shipping address associated with this purchase.
          shipping_address_postal_code:,
          # The US state of the shipping address associated with this purchase.
          shipping_address_state:,
          # A unique identifier assigned by the 3DS Server initiating the authentication
          # attempt for this transaction.
          three_d_secure_server_transaction_id:,
          # The identifier of the Card Payment this authentication attempt will belong to.
          # Available in the API once the card authentication has completed.
          upcoming_card_payment_id:
        )
        end

        sig do
          override.returns(
            {
              access_control_server_transaction_id: String,
              account_id: String,
              billing_address_city: T.nilable(String),
              billing_address_country: T.nilable(String),
              billing_address_line1: T.nilable(String),
              billing_address_line2: T.nilable(String),
              billing_address_line3: T.nilable(String),
              billing_address_postal_code: T.nilable(String),
              billing_address_state: T.nilable(String),
              card_id: String,
              cardholder_email: T.nilable(String),
              cardholder_name: T.nilable(String),
              decision:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthentication::Decision::TaggedSymbol
                ),
              device_channel:
                Increase::RealTimeDecision::CardAuthentication::DeviceChannel,
              directory_server_transaction_id: String,
              merchant_acceptor_id: T.nilable(String),
              merchant_category_code: T.nilable(String),
              merchant_country: T.nilable(String),
              merchant_name: T.nilable(String),
              message_category:
                Increase::RealTimeDecision::CardAuthentication::MessageCategory,
              prior_authenticated_card_payment_id: T.nilable(String),
              requestor_authentication_indicator:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthentication::RequestorAuthenticationIndicator::TaggedSymbol
                ),
              requestor_challenge_indicator:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthentication::RequestorChallengeIndicator::TaggedSymbol
                ),
              requestor_name: String,
              requestor_url: String,
              shipping_address_city: T.nilable(String),
              shipping_address_country: T.nilable(String),
              shipping_address_line1: T.nilable(String),
              shipping_address_line2: T.nilable(String),
              shipping_address_line3: T.nilable(String),
              shipping_address_postal_code: T.nilable(String),
              shipping_address_state: T.nilable(String),
              three_d_secure_server_transaction_id: String,
              upcoming_card_payment_id: String
            }
          )
        end
        def to_hash
        end

        # Whether or not the authentication attempt was approved.
        module Decision
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::RealTimeDecision::CardAuthentication::Decision
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Approve the authentication attempt without triggering a challenge.
          APPROVE =
            T.let(
              :approve,
              Increase::RealTimeDecision::CardAuthentication::Decision::TaggedSymbol
            )

          # Request further validation before approving the authentication attempt.
          CHALLENGE =
            T.let(
              :challenge,
              Increase::RealTimeDecision::CardAuthentication::Decision::TaggedSymbol
            )

          # Deny the authentication attempt.
          DENY =
            T.let(
              :deny,
              Increase::RealTimeDecision::CardAuthentication::Decision::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::RealTimeDecision::CardAuthentication::Decision::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class DeviceChannel < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::RealTimeDecision::CardAuthentication::DeviceChannel,
                Increase::Internal::AnyHash
              )
            end

          # Fields specific to the browser device channel.
          sig do
            returns(
              T.nilable(
                Increase::RealTimeDecision::CardAuthentication::DeviceChannel::Browser
              )
            )
          end
          attr_reader :browser

          sig do
            params(
              browser:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthentication::DeviceChannel::Browser::OrHash
                )
            ).void
          end
          attr_writer :browser

          # The category of the device channel.
          sig do
            returns(
              Increase::RealTimeDecision::CardAuthentication::DeviceChannel::Category::TaggedSymbol
            )
          end
          attr_accessor :category

          # Fields specific to merchant initiated transactions.
          sig do
            returns(
              T.nilable(
                Increase::RealTimeDecision::CardAuthentication::DeviceChannel::MerchantInitiated
              )
            )
          end
          attr_reader :merchant_initiated

          sig do
            params(
              merchant_initiated:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthentication::DeviceChannel::MerchantInitiated::OrHash
                )
            ).void
          end
          attr_writer :merchant_initiated

          # The device channel of the card authentication attempt.
          sig do
            params(
              browser:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthentication::DeviceChannel::Browser::OrHash
                ),
              category:
                Increase::RealTimeDecision::CardAuthentication::DeviceChannel::Category::OrSymbol,
              merchant_initiated:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthentication::DeviceChannel::MerchantInitiated::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # Fields specific to the browser device channel.
            browser:,
            # The category of the device channel.
            category:,
            # Fields specific to merchant initiated transactions.
            merchant_initiated:
          )
          end

          sig do
            override.returns(
              {
                browser:
                  T.nilable(
                    Increase::RealTimeDecision::CardAuthentication::DeviceChannel::Browser
                  ),
                category:
                  Increase::RealTimeDecision::CardAuthentication::DeviceChannel::Category::TaggedSymbol,
                merchant_initiated:
                  T.nilable(
                    Increase::RealTimeDecision::CardAuthentication::DeviceChannel::MerchantInitiated
                  )
              }
            )
          end
          def to_hash
          end

          class Browser < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardAuthentication::DeviceChannel::Browser,
                  Increase::Internal::AnyHash
                )
              end

            # The accept header from the cardholder's browser.
            sig { returns(T.nilable(String)) }
            attr_accessor :accept_header

            # The IP address of the cardholder's browser.
            sig { returns(T.nilable(String)) }
            attr_accessor :ip_address

            # Whether JavaScript is enabled in the cardholder's browser.
            sig do
              returns(
                T.nilable(
                  Increase::RealTimeDecision::CardAuthentication::DeviceChannel::Browser::JavascriptEnabled::TaggedSymbol
                )
              )
            end
            attr_accessor :javascript_enabled

            # The language of the cardholder's browser.
            sig { returns(T.nilable(String)) }
            attr_accessor :language

            # The user agent of the cardholder's browser.
            sig { returns(T.nilable(String)) }
            attr_accessor :user_agent

            # Fields specific to the browser device channel.
            sig do
              params(
                accept_header: T.nilable(String),
                ip_address: T.nilable(String),
                javascript_enabled:
                  T.nilable(
                    Increase::RealTimeDecision::CardAuthentication::DeviceChannel::Browser::JavascriptEnabled::OrSymbol
                  ),
                language: T.nilable(String),
                user_agent: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              # The accept header from the cardholder's browser.
              accept_header:,
              # The IP address of the cardholder's browser.
              ip_address:,
              # Whether JavaScript is enabled in the cardholder's browser.
              javascript_enabled:,
              # The language of the cardholder's browser.
              language:,
              # The user agent of the cardholder's browser.
              user_agent:
            )
            end

            sig do
              override.returns(
                {
                  accept_header: T.nilable(String),
                  ip_address: T.nilable(String),
                  javascript_enabled:
                    T.nilable(
                      Increase::RealTimeDecision::CardAuthentication::DeviceChannel::Browser::JavascriptEnabled::TaggedSymbol
                    ),
                  language: T.nilable(String),
                  user_agent: T.nilable(String)
                }
              )
            end
            def to_hash
            end

            # Whether JavaScript is enabled in the cardholder's browser.
            module JavascriptEnabled
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::RealTimeDecision::CardAuthentication::DeviceChannel::Browser::JavascriptEnabled
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # JavaScript is enabled in the cardholder's browser.
              ENABLED =
                T.let(
                  :enabled,
                  Increase::RealTimeDecision::CardAuthentication::DeviceChannel::Browser::JavascriptEnabled::TaggedSymbol
                )

              # JavaScript is not enabled in the cardholder's browser.
              DISABLED =
                T.let(
                  :disabled,
                  Increase::RealTimeDecision::CardAuthentication::DeviceChannel::Browser::JavascriptEnabled::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::RealTimeDecision::CardAuthentication::DeviceChannel::Browser::JavascriptEnabled::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          # The category of the device channel.
          module Category
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::RealTimeDecision::CardAuthentication::DeviceChannel::Category
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # The authentication attempt was made from an app.
            APP =
              T.let(
                :app,
                Increase::RealTimeDecision::CardAuthentication::DeviceChannel::Category::TaggedSymbol
              )

            # The authentication attempt was made from a browser.
            BROWSER =
              T.let(
                :browser,
                Increase::RealTimeDecision::CardAuthentication::DeviceChannel::Category::TaggedSymbol
              )

            # The authentication attempt was initiated by the 3DS Requestor.
            THREE_DS_REQUESTOR_INITIATED =
              T.let(
                :three_ds_requestor_initiated,
                Increase::RealTimeDecision::CardAuthentication::DeviceChannel::Category::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::RealTimeDecision::CardAuthentication::DeviceChannel::Category::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class MerchantInitiated < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardAuthentication::DeviceChannel::MerchantInitiated,
                  Increase::Internal::AnyHash
                )
              end

            # The merchant initiated indicator for the transaction.
            sig do
              returns(
                Increase::RealTimeDecision::CardAuthentication::DeviceChannel::MerchantInitiated::Indicator::TaggedSymbol
              )
            end
            attr_accessor :indicator

            # Fields specific to merchant initiated transactions.
            sig do
              params(
                indicator:
                  Increase::RealTimeDecision::CardAuthentication::DeviceChannel::MerchantInitiated::Indicator::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              # The merchant initiated indicator for the transaction.
              indicator:
            )
            end

            sig do
              override.returns(
                {
                  indicator:
                    Increase::RealTimeDecision::CardAuthentication::DeviceChannel::MerchantInitiated::Indicator::TaggedSymbol
                }
              )
            end
            def to_hash
            end

            # The merchant initiated indicator for the transaction.
            module Indicator
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::RealTimeDecision::CardAuthentication::DeviceChannel::MerchantInitiated::Indicator
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Recurring transaction.
              RECURRING_TRANSACTION =
                T.let(
                  :recurring_transaction,
                  Increase::RealTimeDecision::CardAuthentication::DeviceChannel::MerchantInitiated::Indicator::TaggedSymbol
                )

              # Installment transaction.
              INSTALLMENT_TRANSACTION =
                T.let(
                  :installment_transaction,
                  Increase::RealTimeDecision::CardAuthentication::DeviceChannel::MerchantInitiated::Indicator::TaggedSymbol
                )

              # Add card.
              ADD_CARD =
                T.let(
                  :add_card,
                  Increase::RealTimeDecision::CardAuthentication::DeviceChannel::MerchantInitiated::Indicator::TaggedSymbol
                )

              # Maintain card information.
              MAINTAIN_CARD_INFORMATION =
                T.let(
                  :maintain_card_information,
                  Increase::RealTimeDecision::CardAuthentication::DeviceChannel::MerchantInitiated::Indicator::TaggedSymbol
                )

              # Account verification.
              ACCOUNT_VERIFICATION =
                T.let(
                  :account_verification,
                  Increase::RealTimeDecision::CardAuthentication::DeviceChannel::MerchantInitiated::Indicator::TaggedSymbol
                )

              # Split or delayed shipment.
              SPLIT_DELAYED_SHIPMENT =
                T.let(
                  :split_delayed_shipment,
                  Increase::RealTimeDecision::CardAuthentication::DeviceChannel::MerchantInitiated::Indicator::TaggedSymbol
                )

              # Top up.
              TOP_UP =
                T.let(
                  :top_up,
                  Increase::RealTimeDecision::CardAuthentication::DeviceChannel::MerchantInitiated::Indicator::TaggedSymbol
                )

              # Mail order.
              MAIL_ORDER =
                T.let(
                  :mail_order,
                  Increase::RealTimeDecision::CardAuthentication::DeviceChannel::MerchantInitiated::Indicator::TaggedSymbol
                )

              # Telephone order.
              TELEPHONE_ORDER =
                T.let(
                  :telephone_order,
                  Increase::RealTimeDecision::CardAuthentication::DeviceChannel::MerchantInitiated::Indicator::TaggedSymbol
                )

              # Whitelist status check.
              WHITELIST_STATUS_CHECK =
                T.let(
                  :whitelist_status_check,
                  Increase::RealTimeDecision::CardAuthentication::DeviceChannel::MerchantInitiated::Indicator::TaggedSymbol
                )

              # Other payment.
              OTHER_PAYMENT =
                T.let(
                  :other_payment,
                  Increase::RealTimeDecision::CardAuthentication::DeviceChannel::MerchantInitiated::Indicator::TaggedSymbol
                )

              # Billing agreement.
              BILLING_AGREEMENT =
                T.let(
                  :billing_agreement,
                  Increase::RealTimeDecision::CardAuthentication::DeviceChannel::MerchantInitiated::Indicator::TaggedSymbol
                )

              # Device binding status check.
              DEVICE_BINDING_STATUS_CHECK =
                T.let(
                  :device_binding_status_check,
                  Increase::RealTimeDecision::CardAuthentication::DeviceChannel::MerchantInitiated::Indicator::TaggedSymbol
                )

              # Card security code status check.
              CARD_SECURITY_CODE_STATUS_CHECK =
                T.let(
                  :card_security_code_status_check,
                  Increase::RealTimeDecision::CardAuthentication::DeviceChannel::MerchantInitiated::Indicator::TaggedSymbol
                )

              # Delayed shipment.
              DELAYED_SHIPMENT =
                T.let(
                  :delayed_shipment,
                  Increase::RealTimeDecision::CardAuthentication::DeviceChannel::MerchantInitiated::Indicator::TaggedSymbol
                )

              # Split payment.
              SPLIT_PAYMENT =
                T.let(
                  :split_payment,
                  Increase::RealTimeDecision::CardAuthentication::DeviceChannel::MerchantInitiated::Indicator::TaggedSymbol
                )

              # FIDO credential deletion.
              FIDO_CREDENTIAL_DELETION =
                T.let(
                  :fido_credential_deletion,
                  Increase::RealTimeDecision::CardAuthentication::DeviceChannel::MerchantInitiated::Indicator::TaggedSymbol
                )

              # FIDO credential registration.
              FIDO_CREDENTIAL_REGISTRATION =
                T.let(
                  :fido_credential_registration,
                  Increase::RealTimeDecision::CardAuthentication::DeviceChannel::MerchantInitiated::Indicator::TaggedSymbol
                )

              # Decoupled authentication fallback.
              DECOUPLED_AUTHENTICATION_FALLBACK =
                T.let(
                  :decoupled_authentication_fallback,
                  Increase::RealTimeDecision::CardAuthentication::DeviceChannel::MerchantInitiated::Indicator::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::RealTimeDecision::CardAuthentication::DeviceChannel::MerchantInitiated::Indicator::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end

        class MessageCategory < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::RealTimeDecision::CardAuthentication::MessageCategory,
                Increase::Internal::AnyHash
              )
            end

          # The category of the card authentication attempt.
          sig do
            returns(
              Increase::RealTimeDecision::CardAuthentication::MessageCategory::Category::TaggedSymbol
            )
          end
          attr_accessor :category

          # Fields specific to non-payment authentication attempts.
          sig do
            returns(
              T.nilable(
                Increase::RealTimeDecision::CardAuthentication::MessageCategory::NonPayment
              )
            )
          end
          attr_reader :non_payment

          sig do
            params(
              non_payment:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthentication::MessageCategory::NonPayment::OrHash
                )
            ).void
          end
          attr_writer :non_payment

          # Fields specific to payment authentication attempts.
          sig do
            returns(
              T.nilable(
                Increase::RealTimeDecision::CardAuthentication::MessageCategory::Payment
              )
            )
          end
          attr_reader :payment

          sig do
            params(
              payment:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthentication::MessageCategory::Payment::OrHash
                )
            ).void
          end
          attr_writer :payment

          # The message category of the card authentication attempt.
          sig do
            params(
              category:
                Increase::RealTimeDecision::CardAuthentication::MessageCategory::Category::OrSymbol,
              non_payment:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthentication::MessageCategory::NonPayment::OrHash
                ),
              payment:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthentication::MessageCategory::Payment::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # The category of the card authentication attempt.
            category:,
            # Fields specific to non-payment authentication attempts.
            non_payment:,
            # Fields specific to payment authentication attempts.
            payment:
          )
          end

          sig do
            override.returns(
              {
                category:
                  Increase::RealTimeDecision::CardAuthentication::MessageCategory::Category::TaggedSymbol,
                non_payment:
                  T.nilable(
                    Increase::RealTimeDecision::CardAuthentication::MessageCategory::NonPayment
                  ),
                payment:
                  T.nilable(
                    Increase::RealTimeDecision::CardAuthentication::MessageCategory::Payment
                  )
              }
            )
          end
          def to_hash
          end

          # The category of the card authentication attempt.
          module Category
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::RealTimeDecision::CardAuthentication::MessageCategory::Category
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # The authentication attempt is for a payment.
            PAYMENT_AUTHENTICATION =
              T.let(
                :payment_authentication,
                Increase::RealTimeDecision::CardAuthentication::MessageCategory::Category::TaggedSymbol
              )

            # The authentication attempt is not for a payment.
            NON_PAYMENT_AUTHENTICATION =
              T.let(
                :non_payment_authentication,
                Increase::RealTimeDecision::CardAuthentication::MessageCategory::Category::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::RealTimeDecision::CardAuthentication::MessageCategory::Category::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class NonPayment < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardAuthentication::MessageCategory::NonPayment,
                  Increase::Internal::AnyHash
                )
              end

            # Fields specific to non-payment authentication attempts.
            sig { returns(T.attached_class) }
            def self.new
            end

            sig { override.returns({}) }
            def to_hash
            end
          end

          class Payment < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardAuthentication::MessageCategory::Payment,
                  Increase::Internal::AnyHash
                )
              end

            # The purchase amount in minor units.
            sig { returns(Integer) }
            attr_accessor :purchase_amount

            # The purchase amount in the cardholder's currency (i.e., USD) estimated using
            # daily conversion rates from the card network.
            sig { returns(T.nilable(Integer)) }
            attr_accessor :purchase_amount_cardholder_estimated

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
            # authentication attempt's purchase currency.
            sig { returns(String) }
            attr_accessor :purchase_currency

            # The type of transaction being authenticated.
            sig do
              returns(
                T.nilable(
                  Increase::RealTimeDecision::CardAuthentication::MessageCategory::Payment::TransactionType::TaggedSymbol
                )
              )
            end
            attr_accessor :transaction_type

            # Fields specific to payment authentication attempts.
            sig do
              params(
                purchase_amount: Integer,
                purchase_amount_cardholder_estimated: T.nilable(Integer),
                purchase_currency: String,
                transaction_type:
                  T.nilable(
                    Increase::RealTimeDecision::CardAuthentication::MessageCategory::Payment::TransactionType::OrSymbol
                  )
              ).returns(T.attached_class)
            end
            def self.new(
              # The purchase amount in minor units.
              purchase_amount:,
              # The purchase amount in the cardholder's currency (i.e., USD) estimated using
              # daily conversion rates from the card network.
              purchase_amount_cardholder_estimated:,
              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the
              # authentication attempt's purchase currency.
              purchase_currency:,
              # The type of transaction being authenticated.
              transaction_type:
            )
            end

            sig do
              override.returns(
                {
                  purchase_amount: Integer,
                  purchase_amount_cardholder_estimated: T.nilable(Integer),
                  purchase_currency: String,
                  transaction_type:
                    T.nilable(
                      Increase::RealTimeDecision::CardAuthentication::MessageCategory::Payment::TransactionType::TaggedSymbol
                    )
                }
              )
            end
            def to_hash
            end

            # The type of transaction being authenticated.
            module TransactionType
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::RealTimeDecision::CardAuthentication::MessageCategory::Payment::TransactionType
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Purchase of goods or services.
              GOODS_SERVICE_PURCHASE =
                T.let(
                  :goods_service_purchase,
                  Increase::RealTimeDecision::CardAuthentication::MessageCategory::Payment::TransactionType::TaggedSymbol
                )

              # Check acceptance.
              CHECK_ACCEPTANCE =
                T.let(
                  :check_acceptance,
                  Increase::RealTimeDecision::CardAuthentication::MessageCategory::Payment::TransactionType::TaggedSymbol
                )

              # Account funding.
              ACCOUNT_FUNDING =
                T.let(
                  :account_funding,
                  Increase::RealTimeDecision::CardAuthentication::MessageCategory::Payment::TransactionType::TaggedSymbol
                )

              # Quasi-cash transaction.
              QUASI_CASH_TRANSACTION =
                T.let(
                  :quasi_cash_transaction,
                  Increase::RealTimeDecision::CardAuthentication::MessageCategory::Payment::TransactionType::TaggedSymbol
                )

              # Prepaid activation and load.
              PREPAID_ACTIVATION_AND_LOAD =
                T.let(
                  :prepaid_activation_and_load,
                  Increase::RealTimeDecision::CardAuthentication::MessageCategory::Payment::TransactionType::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::RealTimeDecision::CardAuthentication::MessageCategory::Payment::TransactionType::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end

        # The 3DS requestor authentication indicator describes why the authentication
        # attempt is performed, such as for a recurring transaction.
        module RequestorAuthenticationIndicator
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::RealTimeDecision::CardAuthentication::RequestorAuthenticationIndicator
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The authentication is for a payment transaction.
          PAYMENT_TRANSACTION =
            T.let(
              :payment_transaction,
              Increase::RealTimeDecision::CardAuthentication::RequestorAuthenticationIndicator::TaggedSymbol
            )

          # The authentication is for a recurring transaction.
          RECURRING_TRANSACTION =
            T.let(
              :recurring_transaction,
              Increase::RealTimeDecision::CardAuthentication::RequestorAuthenticationIndicator::TaggedSymbol
            )

          # The authentication is for an installment transaction.
          INSTALLMENT_TRANSACTION =
            T.let(
              :installment_transaction,
              Increase::RealTimeDecision::CardAuthentication::RequestorAuthenticationIndicator::TaggedSymbol
            )

          # The authentication is for adding a card.
          ADD_CARD =
            T.let(
              :add_card,
              Increase::RealTimeDecision::CardAuthentication::RequestorAuthenticationIndicator::TaggedSymbol
            )

          # The authentication is for maintaining a card.
          MAINTAIN_CARD =
            T.let(
              :maintain_card,
              Increase::RealTimeDecision::CardAuthentication::RequestorAuthenticationIndicator::TaggedSymbol
            )

          # The authentication is for EMV token cardholder verification.
          EMV_TOKEN_CARDHOLDER_VERIFICATION =
            T.let(
              :emv_token_cardholder_verification,
              Increase::RealTimeDecision::CardAuthentication::RequestorAuthenticationIndicator::TaggedSymbol
            )

          # The authentication is for a billing agreement.
          BILLING_AGREEMENT =
            T.let(
              :billing_agreement,
              Increase::RealTimeDecision::CardAuthentication::RequestorAuthenticationIndicator::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::RealTimeDecision::CardAuthentication::RequestorAuthenticationIndicator::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Indicates whether a challenge is requested for this transaction.
        module RequestorChallengeIndicator
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::RealTimeDecision::CardAuthentication::RequestorChallengeIndicator
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # No preference.
          NO_PREFERENCE =
            T.let(
              :no_preference,
              Increase::RealTimeDecision::CardAuthentication::RequestorChallengeIndicator::TaggedSymbol
            )

          # No challenge requested.
          NO_CHALLENGE_REQUESTED =
            T.let(
              :no_challenge_requested,
              Increase::RealTimeDecision::CardAuthentication::RequestorChallengeIndicator::TaggedSymbol
            )

          # Challenge requested, 3DS Requestor preference.
          CHALLENGE_REQUESTED_3DS_REQUESTOR_PREFERENCE =
            T.let(
              :challenge_requested_3ds_requestor_preference,
              Increase::RealTimeDecision::CardAuthentication::RequestorChallengeIndicator::TaggedSymbol
            )

          # Challenge requested, mandate.
          CHALLENGE_REQUESTED_MANDATE =
            T.let(
              :challenge_requested_mandate,
              Increase::RealTimeDecision::CardAuthentication::RequestorChallengeIndicator::TaggedSymbol
            )

          # No challenge requested, transactional risk analysis already performed.
          NO_CHALLENGE_REQUESTED_TRANSACTIONAL_RISK_ANALYSIS_ALREADY_PERFORMED =
            T.let(
              :no_challenge_requested_transactional_risk_analysis_already_performed,
              Increase::RealTimeDecision::CardAuthentication::RequestorChallengeIndicator::TaggedSymbol
            )

          # No challenge requested, data share only.
          NO_CHALLENGE_REQUESTED_DATA_SHARE_ONLY =
            T.let(
              :no_challenge_requested_data_share_only,
              Increase::RealTimeDecision::CardAuthentication::RequestorChallengeIndicator::TaggedSymbol
            )

          # No challenge requested, strong consumer authentication already performed.
          NO_CHALLENGE_REQUESTED_STRONG_CONSUMER_AUTHENTICATION_ALREADY_PERFORMED =
            T.let(
              :no_challenge_requested_strong_consumer_authentication_already_performed,
              Increase::RealTimeDecision::CardAuthentication::RequestorChallengeIndicator::TaggedSymbol
            )

          # No challenge requested, utilize whitelist exemption if no challenge required.
          NO_CHALLENGE_REQUESTED_UTILIZE_WHITELIST_EXEMPTION_IF_NO_CHALLENGE_REQUIRED =
            T.let(
              :no_challenge_requested_utilize_whitelist_exemption_if_no_challenge_required,
              Increase::RealTimeDecision::CardAuthentication::RequestorChallengeIndicator::TaggedSymbol
            )

          # Challenge requested, whitelist prompt requested if challenge required.
          CHALLENGE_REQUESTED_WHITELIST_PROMPT_REQUESTED_IF_CHALLENGE_REQUIRED =
            T.let(
              :challenge_requested_whitelist_prompt_requested_if_challenge_required,
              Increase::RealTimeDecision::CardAuthentication::RequestorChallengeIndicator::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::RealTimeDecision::CardAuthentication::RequestorChallengeIndicator::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class CardAuthenticationChallenge < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::RealTimeDecision::CardAuthenticationChallenge,
              Increase::Internal::AnyHash
            )
          end

        # The identifier of the Account the card belongs to.
        sig { returns(String) }
        attr_accessor :account_id

        # The identifier of the Card that is being tokenized.
        sig { returns(String) }
        attr_accessor :card_id

        # The identifier of the Card Payment this authentication challenge attempt belongs
        # to.
        sig { returns(String) }
        attr_accessor :card_payment_id

        # The one-time code delivered to the cardholder.
        sig { returns(String) }
        attr_accessor :one_time_code

        # Whether or not the challenge was delivered to the cardholder.
        sig do
          returns(
            T.nilable(
              Increase::RealTimeDecision::CardAuthenticationChallenge::Result::TaggedSymbol
            )
          )
        end
        attr_accessor :result

        # Fields related to a 3DS authentication attempt.
        sig do
          params(
            account_id: String,
            card_id: String,
            card_payment_id: String,
            one_time_code: String,
            result:
              T.nilable(
                Increase::RealTimeDecision::CardAuthenticationChallenge::Result::OrSymbol
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # The identifier of the Account the card belongs to.
          account_id:,
          # The identifier of the Card that is being tokenized.
          card_id:,
          # The identifier of the Card Payment this authentication challenge attempt belongs
          # to.
          card_payment_id:,
          # The one-time code delivered to the cardholder.
          one_time_code:,
          # Whether or not the challenge was delivered to the cardholder.
          result:
        )
        end

        sig do
          override.returns(
            {
              account_id: String,
              card_id: String,
              card_payment_id: String,
              one_time_code: String,
              result:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthenticationChallenge::Result::TaggedSymbol
                )
            }
          )
        end
        def to_hash
        end

        # Whether or not the challenge was delivered to the cardholder.
        module Result
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::RealTimeDecision::CardAuthenticationChallenge::Result
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Your application successfully delivered the one-time code to the cardholder.
          SUCCESS =
            T.let(
              :success,
              Increase::RealTimeDecision::CardAuthenticationChallenge::Result::TaggedSymbol
            )

          # Your application was unable to deliver the one-time code to the cardholder.
          FAILURE =
            T.let(
              :failure,
              Increase::RealTimeDecision::CardAuthenticationChallenge::Result::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::RealTimeDecision::CardAuthenticationChallenge::Result::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class CardAuthorization < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::RealTimeDecision::CardAuthorization,
              Increase::Internal::AnyHash
            )
          end

        # The identifier of the Account the authorization will debit.
        sig { returns(String) }
        attr_accessor :account_id

        # Additional amounts associated with the card authorization, such as ATM
        # surcharges fees. These are usually a subset of the `amount` field and are used
        # to provide more detailed information about the transaction.
        sig do
          returns(
            Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts
          )
        end
        attr_reader :additional_amounts

        sig do
          params(
            additional_amounts:
              Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::OrHash
          ).void
        end
        attr_writer :additional_amounts

        # Present if and only if `decision` is `approve`. Contains information related to
        # the approval of the authorization.
        sig do
          returns(
            T.nilable(Increase::RealTimeDecision::CardAuthorization::Approval)
          )
        end
        attr_reader :approval

        sig do
          params(
            approval:
              T.nilable(
                Increase::RealTimeDecision::CardAuthorization::Approval::OrHash
              )
          ).void
        end
        attr_writer :approval

        # The identifier of the Card that is being authorized.
        sig { returns(String) }
        attr_accessor :card_id

        # Whether or not the authorization was approved.
        sig do
          returns(
            T.nilable(
              Increase::RealTimeDecision::CardAuthorization::Decision::TaggedSymbol
            )
          )
        end
        attr_accessor :decision

        # Present if and only if `decision` is `decline`. Contains information related to
        # the reason the authorization was declined.
        sig do
          returns(
            T.nilable(Increase::RealTimeDecision::CardAuthorization::Decline)
          )
        end
        attr_reader :decline

        sig do
          params(
            decline:
              T.nilable(
                Increase::RealTimeDecision::CardAuthorization::Decline::OrHash
              )
          ).void
        end
        attr_writer :decline

        # If the authorization was made via a Digital Wallet Token (such as an Apple Pay
        # purchase), the identifier of the token that was used.
        sig { returns(T.nilable(String)) }
        attr_accessor :digital_wallet_token_id

        # The direction describes the direction the funds will move, either from the
        # cardholder to the merchant or from the merchant to the cardholder.
        sig do
          returns(
            Increase::RealTimeDecision::CardAuthorization::Direction::TaggedSymbol
          )
        end
        attr_accessor :direction

        # The merchant identifier (commonly abbreviated as MID) of the merchant the card
        # is transacting with.
        sig { returns(String) }
        attr_accessor :merchant_acceptor_id

        # The Merchant Category Code (commonly abbreviated as MCC) of the merchant the
        # card is transacting with.
        sig { returns(String) }
        attr_accessor :merchant_category_code

        # The city the merchant resides in.
        sig { returns(T.nilable(String)) }
        attr_accessor :merchant_city

        # The country the merchant resides in.
        sig { returns(String) }
        attr_accessor :merchant_country

        # The merchant descriptor of the merchant the card is transacting with.
        sig { returns(String) }
        attr_accessor :merchant_descriptor

        # The merchant's postal code. For US merchants this is either a 5-digit or 9-digit
        # ZIP code, where the first 5 and last 4 are separated by a dash.
        sig { returns(T.nilable(String)) }
        attr_accessor :merchant_postal_code

        # The state the merchant resides in.
        sig { returns(T.nilable(String)) }
        attr_accessor :merchant_state

        # Fields specific to the `network`.
        sig do
          returns(Increase::RealTimeDecision::CardAuthorization::NetworkDetails)
        end
        attr_reader :network_details

        sig do
          params(
            network_details:
              Increase::RealTimeDecision::CardAuthorization::NetworkDetails::OrHash
          ).void
        end
        attr_writer :network_details

        # Network-specific identifiers for a specific request or transaction.
        sig do
          returns(
            Increase::RealTimeDecision::CardAuthorization::NetworkIdentifiers
          )
        end
        attr_reader :network_identifiers

        sig do
          params(
            network_identifiers:
              Increase::RealTimeDecision::CardAuthorization::NetworkIdentifiers::OrHash
          ).void
        end
        attr_writer :network_identifiers

        # The risk score generated by the card network. For Visa this is the Visa Advanced
        # Authorization risk score, from 0 to 99, where 99 is the riskiest. For Pulse the
        # score is from 0 to 999, where 999 is the riskiest.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :network_risk_score

        # Whether or not the authorization supports partial approvals.
        sig do
          returns(
            Increase::RealTimeDecision::CardAuthorization::PartialApprovalCapability::TaggedSymbol
          )
        end
        attr_accessor :partial_approval_capability

        # If the authorization was made in-person with a physical card, the Physical Card
        # that was used.
        sig { returns(T.nilable(String)) }
        attr_accessor :physical_card_id

        # The amount of the attempted authorization in the currency the card user sees at
        # the time of purchase, in the minor unit of that currency. For dollars, for
        # example, this is cents.
        sig { returns(Integer) }
        attr_accessor :presentment_amount

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the currency the
        # user sees at the time of purchase.
        sig { returns(String) }
        attr_accessor :presentment_currency

        # The processing category describes the intent behind the authorization, such as
        # whether it was used for bill payments or an automatic fuel dispenser.
        sig do
          returns(
            Increase::RealTimeDecision::CardAuthorization::ProcessingCategory::TaggedSymbol
          )
        end
        attr_accessor :processing_category

        # Fields specific to the type of request, such as an incremental authorization.
        sig do
          returns(Increase::RealTimeDecision::CardAuthorization::RequestDetails)
        end
        attr_reader :request_details

        sig do
          params(
            request_details:
              Increase::RealTimeDecision::CardAuthorization::RequestDetails::OrHash
          ).void
        end
        attr_writer :request_details

        # The amount of the attempted authorization in the currency it will be settled in.
        # This currency is the same as that of the Account the card belongs to.
        sig { returns(Integer) }
        attr_accessor :settlement_amount

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the currency the
        # transaction will be settled in.
        sig { returns(String) }
        attr_accessor :settlement_currency

        # The terminal identifier (commonly abbreviated as TID) of the terminal the card
        # is transacting with.
        sig { returns(T.nilable(String)) }
        attr_accessor :terminal_id

        # The identifier of the Card Payment this authorization will belong to. Available
        # in the API once the card authorization has completed.
        sig { returns(String) }
        attr_accessor :upcoming_card_payment_id

        # Fields related to verification of cardholder-provided values.
        sig do
          returns(Increase::RealTimeDecision::CardAuthorization::Verification)
        end
        attr_reader :verification

        sig do
          params(
            verification:
              Increase::RealTimeDecision::CardAuthorization::Verification::OrHash
          ).void
        end
        attr_writer :verification

        # Fields related to a card authorization.
        sig do
          params(
            account_id: String,
            additional_amounts:
              Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::OrHash,
            approval:
              T.nilable(
                Increase::RealTimeDecision::CardAuthorization::Approval::OrHash
              ),
            card_id: String,
            decision:
              T.nilable(
                Increase::RealTimeDecision::CardAuthorization::Decision::OrSymbol
              ),
            decline:
              T.nilable(
                Increase::RealTimeDecision::CardAuthorization::Decline::OrHash
              ),
            digital_wallet_token_id: T.nilable(String),
            direction:
              Increase::RealTimeDecision::CardAuthorization::Direction::OrSymbol,
            merchant_acceptor_id: String,
            merchant_category_code: String,
            merchant_city: T.nilable(String),
            merchant_country: String,
            merchant_descriptor: String,
            merchant_postal_code: T.nilable(String),
            merchant_state: T.nilable(String),
            network_details:
              Increase::RealTimeDecision::CardAuthorization::NetworkDetails::OrHash,
            network_identifiers:
              Increase::RealTimeDecision::CardAuthorization::NetworkIdentifiers::OrHash,
            network_risk_score: T.nilable(Integer),
            partial_approval_capability:
              Increase::RealTimeDecision::CardAuthorization::PartialApprovalCapability::OrSymbol,
            physical_card_id: T.nilable(String),
            presentment_amount: Integer,
            presentment_currency: String,
            processing_category:
              Increase::RealTimeDecision::CardAuthorization::ProcessingCategory::OrSymbol,
            request_details:
              Increase::RealTimeDecision::CardAuthorization::RequestDetails::OrHash,
            settlement_amount: Integer,
            settlement_currency: String,
            terminal_id: T.nilable(String),
            upcoming_card_payment_id: String,
            verification:
              Increase::RealTimeDecision::CardAuthorization::Verification::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The identifier of the Account the authorization will debit.
          account_id:,
          # Additional amounts associated with the card authorization, such as ATM
          # surcharges fees. These are usually a subset of the `amount` field and are used
          # to provide more detailed information about the transaction.
          additional_amounts:,
          # Present if and only if `decision` is `approve`. Contains information related to
          # the approval of the authorization.
          approval:,
          # The identifier of the Card that is being authorized.
          card_id:,
          # Whether or not the authorization was approved.
          decision:,
          # Present if and only if `decision` is `decline`. Contains information related to
          # the reason the authorization was declined.
          decline:,
          # If the authorization was made via a Digital Wallet Token (such as an Apple Pay
          # purchase), the identifier of the token that was used.
          digital_wallet_token_id:,
          # The direction describes the direction the funds will move, either from the
          # cardholder to the merchant or from the merchant to the cardholder.
          direction:,
          # The merchant identifier (commonly abbreviated as MID) of the merchant the card
          # is transacting with.
          merchant_acceptor_id:,
          # The Merchant Category Code (commonly abbreviated as MCC) of the merchant the
          # card is transacting with.
          merchant_category_code:,
          # The city the merchant resides in.
          merchant_city:,
          # The country the merchant resides in.
          merchant_country:,
          # The merchant descriptor of the merchant the card is transacting with.
          merchant_descriptor:,
          # The merchant's postal code. For US merchants this is either a 5-digit or 9-digit
          # ZIP code, where the first 5 and last 4 are separated by a dash.
          merchant_postal_code:,
          # The state the merchant resides in.
          merchant_state:,
          # Fields specific to the `network`.
          network_details:,
          # Network-specific identifiers for a specific request or transaction.
          network_identifiers:,
          # The risk score generated by the card network. For Visa this is the Visa Advanced
          # Authorization risk score, from 0 to 99, where 99 is the riskiest. For Pulse the
          # score is from 0 to 999, where 999 is the riskiest.
          network_risk_score:,
          # Whether or not the authorization supports partial approvals.
          partial_approval_capability:,
          # If the authorization was made in-person with a physical card, the Physical Card
          # that was used.
          physical_card_id:,
          # The amount of the attempted authorization in the currency the card user sees at
          # the time of purchase, in the minor unit of that currency. For dollars, for
          # example, this is cents.
          presentment_amount:,
          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the currency the
          # user sees at the time of purchase.
          presentment_currency:,
          # The processing category describes the intent behind the authorization, such as
          # whether it was used for bill payments or an automatic fuel dispenser.
          processing_category:,
          # Fields specific to the type of request, such as an incremental authorization.
          request_details:,
          # The amount of the attempted authorization in the currency it will be settled in.
          # This currency is the same as that of the Account the card belongs to.
          settlement_amount:,
          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the currency the
          # transaction will be settled in.
          settlement_currency:,
          # The terminal identifier (commonly abbreviated as TID) of the terminal the card
          # is transacting with.
          terminal_id:,
          # The identifier of the Card Payment this authorization will belong to. Available
          # in the API once the card authorization has completed.
          upcoming_card_payment_id:,
          # Fields related to verification of cardholder-provided values.
          verification:
        )
        end

        sig do
          override.returns(
            {
              account_id: String,
              additional_amounts:
                Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts,
              approval:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::Approval
                ),
              card_id: String,
              decision:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::Decision::TaggedSymbol
                ),
              decline:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::Decline
                ),
              digital_wallet_token_id: T.nilable(String),
              direction:
                Increase::RealTimeDecision::CardAuthorization::Direction::TaggedSymbol,
              merchant_acceptor_id: String,
              merchant_category_code: String,
              merchant_city: T.nilable(String),
              merchant_country: String,
              merchant_descriptor: String,
              merchant_postal_code: T.nilable(String),
              merchant_state: T.nilable(String),
              network_details:
                Increase::RealTimeDecision::CardAuthorization::NetworkDetails,
              network_identifiers:
                Increase::RealTimeDecision::CardAuthorization::NetworkIdentifiers,
              network_risk_score: T.nilable(Integer),
              partial_approval_capability:
                Increase::RealTimeDecision::CardAuthorization::PartialApprovalCapability::TaggedSymbol,
              physical_card_id: T.nilable(String),
              presentment_amount: Integer,
              presentment_currency: String,
              processing_category:
                Increase::RealTimeDecision::CardAuthorization::ProcessingCategory::TaggedSymbol,
              request_details:
                Increase::RealTimeDecision::CardAuthorization::RequestDetails,
              settlement_amount: Integer,
              settlement_currency: String,
              terminal_id: T.nilable(String),
              upcoming_card_payment_id: String,
              verification:
                Increase::RealTimeDecision::CardAuthorization::Verification
            }
          )
        end
        def to_hash
        end

        class AdditionalAmounts < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts,
                Increase::Internal::AnyHash
              )
            end

          # The part of this transaction amount that was for clinic-related services.
          sig do
            returns(
              T.nilable(
                Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Clinic
              )
            )
          end
          attr_reader :clinic

          sig do
            params(
              clinic:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Clinic::OrHash
                )
            ).void
          end
          attr_writer :clinic

          # The part of this transaction amount that was for dental-related services.
          sig do
            returns(
              T.nilable(
                Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Dental
              )
            )
          end
          attr_reader :dental

          sig do
            params(
              dental:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Dental::OrHash
                )
            ).void
          end
          attr_writer :dental

          # The original pre-authorized amount.
          sig do
            returns(
              T.nilable(
                Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Original
              )
            )
          end
          attr_reader :original

          sig do
            params(
              original:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Original::OrHash
                )
            ).void
          end
          attr_writer :original

          # The part of this transaction amount that was for healthcare prescriptions.
          sig do
            returns(
              T.nilable(
                Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Prescription
              )
            )
          end
          attr_reader :prescription

          sig do
            params(
              prescription:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Prescription::OrHash
                )
            ).void
          end
          attr_writer :prescription

          # The surcharge amount charged for this transaction by the merchant.
          sig do
            returns(
              T.nilable(
                Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Surcharge
              )
            )
          end
          attr_reader :surcharge

          sig do
            params(
              surcharge:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Surcharge::OrHash
                )
            ).void
          end
          attr_writer :surcharge

          # The total amount of a series of incremental authorizations, optionally provided.
          sig do
            returns(
              T.nilable(
                Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::TotalCumulative
              )
            )
          end
          attr_reader :total_cumulative

          sig do
            params(
              total_cumulative:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::TotalCumulative::OrHash
                )
            ).void
          end
          attr_writer :total_cumulative

          # The total amount of healthcare-related additional amounts.
          sig do
            returns(
              T.nilable(
                Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::TotalHealthcare
              )
            )
          end
          attr_reader :total_healthcare

          sig do
            params(
              total_healthcare:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::TotalHealthcare::OrHash
                )
            ).void
          end
          attr_writer :total_healthcare

          # The part of this transaction amount that was for transit-related services.
          sig do
            returns(
              T.nilable(
                Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Transit
              )
            )
          end
          attr_reader :transit

          sig do
            params(
              transit:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Transit::OrHash
                )
            ).void
          end
          attr_writer :transit

          # An unknown additional amount.
          sig do
            returns(
              T.nilable(
                Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Unknown
              )
            )
          end
          attr_reader :unknown

          sig do
            params(
              unknown:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Unknown::OrHash
                )
            ).void
          end
          attr_writer :unknown

          # The part of this transaction amount that was for vision-related services.
          sig do
            returns(
              T.nilable(
                Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Vision
              )
            )
          end
          attr_reader :vision

          sig do
            params(
              vision:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Vision::OrHash
                )
            ).void
          end
          attr_writer :vision

          # Additional amounts associated with the card authorization, such as ATM
          # surcharges fees. These are usually a subset of the `amount` field and are used
          # to provide more detailed information about the transaction.
          sig do
            params(
              clinic:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Clinic::OrHash
                ),
              dental:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Dental::OrHash
                ),
              original:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Original::OrHash
                ),
              prescription:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Prescription::OrHash
                ),
              surcharge:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Surcharge::OrHash
                ),
              total_cumulative:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::TotalCumulative::OrHash
                ),
              total_healthcare:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::TotalHealthcare::OrHash
                ),
              transit:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Transit::OrHash
                ),
              unknown:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Unknown::OrHash
                ),
              vision:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Vision::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # The part of this transaction amount that was for clinic-related services.
            clinic:,
            # The part of this transaction amount that was for dental-related services.
            dental:,
            # The original pre-authorized amount.
            original:,
            # The part of this transaction amount that was for healthcare prescriptions.
            prescription:,
            # The surcharge amount charged for this transaction by the merchant.
            surcharge:,
            # The total amount of a series of incremental authorizations, optionally provided.
            total_cumulative:,
            # The total amount of healthcare-related additional amounts.
            total_healthcare:,
            # The part of this transaction amount that was for transit-related services.
            transit:,
            # An unknown additional amount.
            unknown:,
            # The part of this transaction amount that was for vision-related services.
            vision:
          )
          end

          sig do
            override.returns(
              {
                clinic:
                  T.nilable(
                    Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Clinic
                  ),
                dental:
                  T.nilable(
                    Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Dental
                  ),
                original:
                  T.nilable(
                    Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Original
                  ),
                prescription:
                  T.nilable(
                    Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Prescription
                  ),
                surcharge:
                  T.nilable(
                    Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Surcharge
                  ),
                total_cumulative:
                  T.nilable(
                    Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::TotalCumulative
                  ),
                total_healthcare:
                  T.nilable(
                    Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::TotalHealthcare
                  ),
                transit:
                  T.nilable(
                    Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Transit
                  ),
                unknown:
                  T.nilable(
                    Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Unknown
                  ),
                vision:
                  T.nilable(
                    Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Vision
                  )
              }
            )
          end
          def to_hash
          end

          class Clinic < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Clinic,
                  Increase::Internal::AnyHash
                )
              end

            # The amount in minor units of the `currency` field. The amount is positive if it
            # is added to the amount (such as an ATM surcharge fee) and negative if it is
            # subtracted from the amount (such as a discount).
            sig { returns(Integer) }
            attr_accessor :amount

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
            # amount's currency.
            sig { returns(String) }
            attr_accessor :currency

            # The part of this transaction amount that was for clinic-related services.
            sig do
              params(amount: Integer, currency: String).returns(
                T.attached_class
              )
            end
            def self.new(
              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              amount:,
              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              currency:
            )
            end

            sig { override.returns({ amount: Integer, currency: String }) }
            def to_hash
            end
          end

          class Dental < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Dental,
                  Increase::Internal::AnyHash
                )
              end

            # The amount in minor units of the `currency` field. The amount is positive if it
            # is added to the amount (such as an ATM surcharge fee) and negative if it is
            # subtracted from the amount (such as a discount).
            sig { returns(Integer) }
            attr_accessor :amount

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
            # amount's currency.
            sig { returns(String) }
            attr_accessor :currency

            # The part of this transaction amount that was for dental-related services.
            sig do
              params(amount: Integer, currency: String).returns(
                T.attached_class
              )
            end
            def self.new(
              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              amount:,
              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              currency:
            )
            end

            sig { override.returns({ amount: Integer, currency: String }) }
            def to_hash
            end
          end

          class Original < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Original,
                  Increase::Internal::AnyHash
                )
              end

            # The amount in minor units of the `currency` field. The amount is positive if it
            # is added to the amount (such as an ATM surcharge fee) and negative if it is
            # subtracted from the amount (such as a discount).
            sig { returns(Integer) }
            attr_accessor :amount

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
            # amount's currency.
            sig { returns(String) }
            attr_accessor :currency

            # The original pre-authorized amount.
            sig do
              params(amount: Integer, currency: String).returns(
                T.attached_class
              )
            end
            def self.new(
              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              amount:,
              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              currency:
            )
            end

            sig { override.returns({ amount: Integer, currency: String }) }
            def to_hash
            end
          end

          class Prescription < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Prescription,
                  Increase::Internal::AnyHash
                )
              end

            # The amount in minor units of the `currency` field. The amount is positive if it
            # is added to the amount (such as an ATM surcharge fee) and negative if it is
            # subtracted from the amount (such as a discount).
            sig { returns(Integer) }
            attr_accessor :amount

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
            # amount's currency.
            sig { returns(String) }
            attr_accessor :currency

            # The part of this transaction amount that was for healthcare prescriptions.
            sig do
              params(amount: Integer, currency: String).returns(
                T.attached_class
              )
            end
            def self.new(
              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              amount:,
              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              currency:
            )
            end

            sig { override.returns({ amount: Integer, currency: String }) }
            def to_hash
            end
          end

          class Surcharge < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Surcharge,
                  Increase::Internal::AnyHash
                )
              end

            # The amount in minor units of the `currency` field. The amount is positive if it
            # is added to the amount (such as an ATM surcharge fee) and negative if it is
            # subtracted from the amount (such as a discount).
            sig { returns(Integer) }
            attr_accessor :amount

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
            # amount's currency.
            sig { returns(String) }
            attr_accessor :currency

            # The surcharge amount charged for this transaction by the merchant.
            sig do
              params(amount: Integer, currency: String).returns(
                T.attached_class
              )
            end
            def self.new(
              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              amount:,
              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              currency:
            )
            end

            sig { override.returns({ amount: Integer, currency: String }) }
            def to_hash
            end
          end

          class TotalCumulative < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::TotalCumulative,
                  Increase::Internal::AnyHash
                )
              end

            # The amount in minor units of the `currency` field. The amount is positive if it
            # is added to the amount (such as an ATM surcharge fee) and negative if it is
            # subtracted from the amount (such as a discount).
            sig { returns(Integer) }
            attr_accessor :amount

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
            # amount's currency.
            sig { returns(String) }
            attr_accessor :currency

            # The total amount of a series of incremental authorizations, optionally provided.
            sig do
              params(amount: Integer, currency: String).returns(
                T.attached_class
              )
            end
            def self.new(
              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              amount:,
              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              currency:
            )
            end

            sig { override.returns({ amount: Integer, currency: String }) }
            def to_hash
            end
          end

          class TotalHealthcare < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::TotalHealthcare,
                  Increase::Internal::AnyHash
                )
              end

            # The amount in minor units of the `currency` field. The amount is positive if it
            # is added to the amount (such as an ATM surcharge fee) and negative if it is
            # subtracted from the amount (such as a discount).
            sig { returns(Integer) }
            attr_accessor :amount

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
            # amount's currency.
            sig { returns(String) }
            attr_accessor :currency

            # The total amount of healthcare-related additional amounts.
            sig do
              params(amount: Integer, currency: String).returns(
                T.attached_class
              )
            end
            def self.new(
              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              amount:,
              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              currency:
            )
            end

            sig { override.returns({ amount: Integer, currency: String }) }
            def to_hash
            end
          end

          class Transit < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Transit,
                  Increase::Internal::AnyHash
                )
              end

            # The amount in minor units of the `currency` field. The amount is positive if it
            # is added to the amount (such as an ATM surcharge fee) and negative if it is
            # subtracted from the amount (such as a discount).
            sig { returns(Integer) }
            attr_accessor :amount

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
            # amount's currency.
            sig { returns(String) }
            attr_accessor :currency

            # The part of this transaction amount that was for transit-related services.
            sig do
              params(amount: Integer, currency: String).returns(
                T.attached_class
              )
            end
            def self.new(
              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              amount:,
              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              currency:
            )
            end

            sig { override.returns({ amount: Integer, currency: String }) }
            def to_hash
            end
          end

          class Unknown < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Unknown,
                  Increase::Internal::AnyHash
                )
              end

            # The amount in minor units of the `currency` field. The amount is positive if it
            # is added to the amount (such as an ATM surcharge fee) and negative if it is
            # subtracted from the amount (such as a discount).
            sig { returns(Integer) }
            attr_accessor :amount

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
            # amount's currency.
            sig { returns(String) }
            attr_accessor :currency

            # An unknown additional amount.
            sig do
              params(amount: Integer, currency: String).returns(
                T.attached_class
              )
            end
            def self.new(
              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              amount:,
              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              currency:
            )
            end

            sig { override.returns({ amount: Integer, currency: String }) }
            def to_hash
            end
          end

          class Vision < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardAuthorization::AdditionalAmounts::Vision,
                  Increase::Internal::AnyHash
                )
              end

            # The amount in minor units of the `currency` field. The amount is positive if it
            # is added to the amount (such as an ATM surcharge fee) and negative if it is
            # subtracted from the amount (such as a discount).
            sig { returns(Integer) }
            attr_accessor :amount

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
            # amount's currency.
            sig { returns(String) }
            attr_accessor :currency

            # The part of this transaction amount that was for vision-related services.
            sig do
              params(amount: Integer, currency: String).returns(
                T.attached_class
              )
            end
            def self.new(
              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              amount:,
              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              currency:
            )
            end

            sig { override.returns({ amount: Integer, currency: String }) }
            def to_hash
            end
          end
        end

        class Approval < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::RealTimeDecision::CardAuthorization::Approval,
                Increase::Internal::AnyHash
              )
            end

          # If the authorization was partially approved, this field contains the approved
          # amount in the minor unit of the settlement currency.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :partial_amount

          # Present if and only if `decision` is `approve`. Contains information related to
          # the approval of the authorization.
          sig do
            params(partial_amount: T.nilable(Integer)).returns(T.attached_class)
          end
          def self.new(
            # If the authorization was partially approved, this field contains the approved
            # amount in the minor unit of the settlement currency.
            partial_amount:
          )
          end

          sig { override.returns({ partial_amount: T.nilable(Integer) }) }
          def to_hash
          end
        end

        # Whether or not the authorization was approved.
        module Decision
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::RealTimeDecision::CardAuthorization::Decision
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Approve the authorization.
          APPROVE =
            T.let(
              :approve,
              Increase::RealTimeDecision::CardAuthorization::Decision::TaggedSymbol
            )

          # Decline the authorization.
          DECLINE =
            T.let(
              :decline,
              Increase::RealTimeDecision::CardAuthorization::Decision::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::RealTimeDecision::CardAuthorization::Decision::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Decline < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::RealTimeDecision::CardAuthorization::Decline,
                Increase::Internal::AnyHash
              )
            end

          # The reason the authorization was declined.
          sig do
            returns(
              Increase::RealTimeDecision::CardAuthorization::Decline::Reason::TaggedSymbol
            )
          end
          attr_accessor :reason

          # Present if and only if `decision` is `decline`. Contains information related to
          # the reason the authorization was declined.
          sig do
            params(
              reason:
                Increase::RealTimeDecision::CardAuthorization::Decline::Reason::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The reason the authorization was declined.
            reason:
          )
          end

          sig do
            override.returns(
              {
                reason:
                  Increase::RealTimeDecision::CardAuthorization::Decline::Reason::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          # The reason the authorization was declined.
          module Reason
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::RealTimeDecision::CardAuthorization::Decline::Reason
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # The cardholder does not have sufficient funds to cover the transaction. The merchant may attempt to process the transaction again.
            INSUFFICIENT_FUNDS =
              T.let(
                :insufficient_funds,
                Increase::RealTimeDecision::CardAuthorization::Decline::Reason::TaggedSymbol
              )

            # This type of transaction is not allowed for this card. This transaction should not be retried.
            TRANSACTION_NEVER_ALLOWED =
              T.let(
                :transaction_never_allowed,
                Increase::RealTimeDecision::CardAuthorization::Decline::Reason::TaggedSymbol
              )

            # The transaction amount exceeds the cardholder's approval limit. The merchant may attempt to process the transaction again.
            EXCEEDS_APPROVAL_LIMIT =
              T.let(
                :exceeds_approval_limit,
                Increase::RealTimeDecision::CardAuthorization::Decline::Reason::TaggedSymbol
              )

            # The card has been temporarily disabled or not yet activated. The merchant may attempt to process the transaction again.
            CARD_TEMPORARILY_DISABLED =
              T.let(
                :card_temporarily_disabled,
                Increase::RealTimeDecision::CardAuthorization::Decline::Reason::TaggedSymbol
              )

            # The transaction is suspected to be fraudulent. The merchant may attempt to process the transaction again.
            SUSPECTED_FRAUD =
              T.let(
                :suspected_fraud,
                Increase::RealTimeDecision::CardAuthorization::Decline::Reason::TaggedSymbol
              )

            # The transaction was declined for another reason. The merchant may attempt to process the transaction again. This should be used sparingly.
            OTHER =
              T.let(
                :other,
                Increase::RealTimeDecision::CardAuthorization::Decline::Reason::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::RealTimeDecision::CardAuthorization::Decline::Reason::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end

        # The direction describes the direction the funds will move, either from the
        # cardholder to the merchant or from the merchant to the cardholder.
        module Direction
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::RealTimeDecision::CardAuthorization::Direction
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # A regular card authorization where funds are debited from the cardholder.
          SETTLEMENT =
            T.let(
              :settlement,
              Increase::RealTimeDecision::CardAuthorization::Direction::TaggedSymbol
            )

          # A refund card authorization, sometimes referred to as a credit voucher authorization, where funds are credited to the cardholder.
          REFUND =
            T.let(
              :refund,
              Increase::RealTimeDecision::CardAuthorization::Direction::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::RealTimeDecision::CardAuthorization::Direction::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class NetworkDetails < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::RealTimeDecision::CardAuthorization::NetworkDetails,
                Increase::Internal::AnyHash
              )
            end

          # The payment network used to process this card authorization.
          sig do
            returns(
              Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Category::TaggedSymbol
            )
          end
          attr_accessor :category

          # Fields specific to the `pulse` network.
          sig do
            returns(
              T.nilable(
                Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Pulse
              )
            )
          end
          attr_reader :pulse

          sig do
            params(
              pulse:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Pulse::OrHash
                )
            ).void
          end
          attr_writer :pulse

          # Fields specific to the `visa` network.
          sig do
            returns(
              T.nilable(
                Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa
              )
            )
          end
          attr_reader :visa

          sig do
            params(
              visa:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::OrHash
                )
            ).void
          end
          attr_writer :visa

          # Fields specific to the `network`.
          sig do
            params(
              category:
                Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Category::OrSymbol,
              pulse:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Pulse::OrHash
                ),
              visa:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # The payment network used to process this card authorization.
            category:,
            # Fields specific to the `pulse` network.
            pulse:,
            # Fields specific to the `visa` network.
            visa:
          )
          end

          sig do
            override.returns(
              {
                category:
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Category::TaggedSymbol,
                pulse:
                  T.nilable(
                    Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Pulse
                  ),
                visa:
                  T.nilable(
                    Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa
                  )
              }
            )
          end
          def to_hash
          end

          # The payment network used to process this card authorization.
          module Category
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Category
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Visa
            VISA =
              T.let(
                :visa,
                Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Category::TaggedSymbol
              )

            # Pulse
            PULSE =
              T.let(
                :pulse,
                Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Category::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Category::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Pulse < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Pulse,
                  Increase::Internal::AnyHash
                )
              end

            # Fields specific to the `pulse` network.
            sig { returns(T.attached_class) }
            def self.new
            end

            sig { override.returns({}) }
            def to_hash
            end
          end

          class Visa < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa,
                  Increase::Internal::AnyHash
                )
              end

            # For electronic commerce transactions, this identifies the level of security used
            # in obtaining the customer's payment credential. For mail or telephone order
            # transactions, identifies the type of mail or telephone order.
            sig do
              returns(
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                )
              )
            end
            attr_accessor :electronic_commerce_indicator

            # The method used to enter the cardholder's primary account number and card
            # expiration date.
            sig do
              returns(
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                )
              )
            end
            attr_accessor :point_of_service_entry_mode

            # Only present when `actioner: network`. Describes why a card authorization was
            # approved or declined by Visa through stand-in processing.
            sig do
              returns(
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                )
              )
            end
            attr_accessor :stand_in_processing_reason

            # The capability of the terminal being used to read the card. Shows whether a
            # terminal can e.g., accept chip cards or if it only supports magnetic stripe
            # reads. This reflects the highest capability of the terminal — for example, a
            # terminal that supports both chip and magnetic stripe will be identified as
            # chip-capable.
            sig do
              returns(
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::TerminalEntryCapability::TaggedSymbol
                )
              )
            end
            attr_accessor :terminal_entry_capability

            # Fields specific to the `visa` network.
            sig do
              params(
                electronic_commerce_indicator:
                  T.nilable(
                    Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::OrSymbol
                  ),
                point_of_service_entry_mode:
                  T.nilable(
                    Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::OrSymbol
                  ),
                stand_in_processing_reason:
                  T.nilable(
                    Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::OrSymbol
                  ),
                terminal_entry_capability:
                  T.nilable(
                    Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::TerminalEntryCapability::OrSymbol
                  )
              ).returns(T.attached_class)
            end
            def self.new(
              # For electronic commerce transactions, this identifies the level of security used
              # in obtaining the customer's payment credential. For mail or telephone order
              # transactions, identifies the type of mail or telephone order.
              electronic_commerce_indicator:,
              # The method used to enter the cardholder's primary account number and card
              # expiration date.
              point_of_service_entry_mode:,
              # Only present when `actioner: network`. Describes why a card authorization was
              # approved or declined by Visa through stand-in processing.
              stand_in_processing_reason:,
              # The capability of the terminal being used to read the card. Shows whether a
              # terminal can e.g., accept chip cards or if it only supports magnetic stripe
              # reads. This reflects the highest capability of the terminal — for example, a
              # terminal that supports both chip and magnetic stripe will be identified as
              # chip-capable.
              terminal_entry_capability:
            )
            end

            sig do
              override.returns(
                {
                  electronic_commerce_indicator:
                    T.nilable(
                      Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                    ),
                  point_of_service_entry_mode:
                    T.nilable(
                      Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                    ),
                  stand_in_processing_reason:
                    T.nilable(
                      Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                    ),
                  terminal_entry_capability:
                    T.nilable(
                      Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::TerminalEntryCapability::TaggedSymbol
                    )
                }
              )
            end
            def to_hash
            end

            # For electronic commerce transactions, this identifies the level of security used
            # in obtaining the customer's payment credential. For mail or telephone order
            # transactions, identifies the type of mail or telephone order.
            module ElectronicCommerceIndicator
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Single transaction of a mail/phone order: Use to indicate that the transaction is a mail/phone order purchase, not a recurring transaction or installment payment. For domestic transactions in the US region, this value may also indicate one bill payment transaction in the card-present or card-absent environments.
              MAIL_PHONE_ORDER =
                T.let(
                  :mail_phone_order,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                )

              # Recurring transaction: Payment indicator used to indicate a recurring transaction that originates from an acquirer in the US region.
              RECURRING =
                T.let(
                  :recurring,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                )

              # Installment payment: Payment indicator used to indicate one purchase of goods or services that is billed to the account in multiple charges over a period of time agreed upon by the cardholder and merchant from transactions that originate from an acquirer in the US region.
              INSTALLMENT =
                T.let(
                  :installment,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                )

              # Unknown classification: other mail order: Use to indicate that the type of mail/telephone order is unknown.
              UNKNOWN_MAIL_PHONE_ORDER =
                T.let(
                  :unknown_mail_phone_order,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                )

              # Secure electronic commerce transaction: Use to indicate that the electronic commerce transaction has been authenticated using e.g., 3-D Secure
              SECURE_ELECTRONIC_COMMERCE =
                T.let(
                  :secure_electronic_commerce,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                )

              # Non-authenticated security transaction at a 3-D Secure-capable merchant, and merchant attempted to authenticate the cardholder using 3-D Secure: Use to identify an electronic commerce transaction where the merchant attempted to authenticate the cardholder using 3-D Secure, but was unable to complete the authentication because the issuer or cardholder does not participate in the 3-D Secure program.
              NON_AUTHENTICATED_SECURITY_TRANSACTION_AT_3DS_CAPABLE_MERCHANT =
                T.let(
                  :non_authenticated_security_transaction_at_3ds_capable_merchant,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                )

              # Non-authenticated security transaction: Use to identify an electronic commerce transaction that uses data encryption for security however, cardholder authentication is not performed using 3-D Secure.
              NON_AUTHENTICATED_SECURITY_TRANSACTION =
                T.let(
                  :non_authenticated_security_transaction,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                )

              # Non-secure transaction: Use to identify an electronic commerce transaction that has no data protection.
              NON_SECURE_TRANSACTION =
                T.let(
                  :non_secure_transaction,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            # The method used to enter the cardholder's primary account number and card
            # expiration date.
            module PointOfServiceEntryMode
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Unknown
              UNKNOWN =
                T.let(
                  :unknown,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                )

              # Manual key entry
              MANUAL =
                T.let(
                  :manual,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                )

              # Magnetic stripe read, without card verification value
              MAGNETIC_STRIPE_NO_CVV =
                T.let(
                  :magnetic_stripe_no_cvv,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                )

              # Optical code
              OPTICAL_CODE =
                T.let(
                  :optical_code,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                )

              # Contact chip card
              INTEGRATED_CIRCUIT_CARD =
                T.let(
                  :integrated_circuit_card,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                )

              # Contactless read of chip card
              CONTACTLESS =
                T.let(
                  :contactless,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                )

              # Transaction initiated using a credential that has previously been stored on file
              CREDENTIAL_ON_FILE =
                T.let(
                  :credential_on_file,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                )

              # Magnetic stripe read
              MAGNETIC_STRIPE =
                T.let(
                  :magnetic_stripe,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                )

              # Contactless read of magnetic stripe data
              CONTACTLESS_MAGNETIC_STRIPE =
                T.let(
                  :contactless_magnetic_stripe,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                )

              # Contact chip card, without card verification value
              INTEGRATED_CIRCUIT_CARD_NO_CVV =
                T.let(
                  :integrated_circuit_card_no_cvv,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            # Only present when `actioner: network`. Describes why a card authorization was
            # approved or declined by Visa through stand-in processing.
            module StandInProcessingReason
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Increase failed to process the authorization in a timely manner.
              ISSUER_ERROR =
                T.let(
                  :issuer_error,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                )

              # The physical card read had an invalid CVV or dCVV.
              INVALID_PHYSICAL_CARD =
                T.let(
                  :invalid_physical_card,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                )

              # The card's authorization request cryptogram was invalid. The cryptogram can be from a physical card or a Digital Wallet Token purchase.
              INVALID_CRYPTOGRAM =
                T.let(
                  :invalid_cryptogram,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                )

              # The 3DS cardholder authentication verification value was invalid.
              INVALID_CARDHOLDER_AUTHENTICATION_VERIFICATION_VALUE =
                T.let(
                  :invalid_cardholder_authentication_verification_value,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                )

              # An internal Visa error occurred. Visa uses this reason code for certain expected occurrences as well, such as Application Transaction Counter (ATC) replays.
              INTERNAL_VISA_ERROR =
                T.let(
                  :internal_visa_error,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                )

              # The merchant has enabled Visa's Transaction Advisory Service and requires further authentication to perform the transaction. In practice this is often utilized at fuel pumps to tell the cardholder to see the cashier.
              MERCHANT_TRANSACTION_ADVISORY_SERVICE_AUTHENTICATION_REQUIRED =
                T.let(
                  :merchant_transaction_advisory_service_authentication_required,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                )

              # The transaction was blocked by Visa's Payment Fraud Disruption service due to fraudulent Acquirer behavior, such as card testing.
              PAYMENT_FRAUD_DISRUPTION_ACQUIRER_BLOCK =
                T.let(
                  :payment_fraud_disruption_acquirer_block,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                )

              # An unspecific reason for stand-in processing.
              OTHER =
                T.let(
                  :other,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            # The capability of the terminal being used to read the card. Shows whether a
            # terminal can e.g., accept chip cards or if it only supports magnetic stripe
            # reads. This reflects the highest capability of the terminal — for example, a
            # terminal that supports both chip and magnetic stripe will be identified as
            # chip-capable.
            module TerminalEntryCapability
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::TerminalEntryCapability
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Unknown
              UNKNOWN =
                T.let(
                  :unknown,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::TerminalEntryCapability::TaggedSymbol
                )

              # No terminal was used for this transaction.
              TERMINAL_NOT_USED =
                T.let(
                  :terminal_not_used,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::TerminalEntryCapability::TaggedSymbol
                )

              # The terminal can only read magnetic stripes and does not have chip or contactless reading capability.
              MAGNETIC_STRIPE =
                T.let(
                  :magnetic_stripe,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::TerminalEntryCapability::TaggedSymbol
                )

              # The terminal can only read barcodes.
              BARCODE =
                T.let(
                  :barcode,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::TerminalEntryCapability::TaggedSymbol
                )

              # The terminal can only read cards via Optical Character Recognition.
              OPTICAL_CHARACTER_RECOGNITION =
                T.let(
                  :optical_character_recognition,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::TerminalEntryCapability::TaggedSymbol
                )

              # The terminal supports contact chip cards and can also read the magnetic stripe. If contact chip is supported, this value is used regardless of whether contactless is also supported.
              CHIP_OR_CONTACTLESS =
                T.let(
                  :chip_or_contactless,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::TerminalEntryCapability::TaggedSymbol
                )

              # The terminal supports contactless reads but does not support contact chip. Only used when the terminal lacks contact chip capability.
              CONTACTLESS_ONLY =
                T.let(
                  :contactless_only,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::TerminalEntryCapability::TaggedSymbol
                )

              # The terminal has no card reading capability.
              NO_CAPABILITY =
                T.let(
                  :no_capability,
                  Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::TerminalEntryCapability::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::RealTimeDecision::CardAuthorization::NetworkDetails::Visa::TerminalEntryCapability::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end

        class NetworkIdentifiers < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::RealTimeDecision::CardAuthorization::NetworkIdentifiers,
                Increase::Internal::AnyHash
              )
            end

          # The randomly generated 6-character Authorization Identification Response code
          # sent back to the acquirer in an approved response.
          sig { returns(T.nilable(String)) }
          attr_accessor :authorization_identification_response

          # A life-cycle identifier used across e.g., an authorization and a reversal.
          # Expected to be unique per acquirer within a window of time. For some card
          # networks the retrieval reference number includes the trace counter.
          sig { returns(T.nilable(String)) }
          attr_accessor :retrieval_reference_number

          # A counter used to verify an individual authorization. Expected to be unique per
          # acquirer within a window of time.
          sig { returns(T.nilable(String)) }
          attr_accessor :trace_number

          # A globally unique transaction identifier provided by the card network, used
          # across multiple life-cycle requests.
          sig { returns(T.nilable(String)) }
          attr_accessor :transaction_id

          # Network-specific identifiers for a specific request or transaction.
          sig do
            params(
              authorization_identification_response: T.nilable(String),
              retrieval_reference_number: T.nilable(String),
              trace_number: T.nilable(String),
              transaction_id: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # The randomly generated 6-character Authorization Identification Response code
            # sent back to the acquirer in an approved response.
            authorization_identification_response:,
            # A life-cycle identifier used across e.g., an authorization and a reversal.
            # Expected to be unique per acquirer within a window of time. For some card
            # networks the retrieval reference number includes the trace counter.
            retrieval_reference_number:,
            # A counter used to verify an individual authorization. Expected to be unique per
            # acquirer within a window of time.
            trace_number:,
            # A globally unique transaction identifier provided by the card network, used
            # across multiple life-cycle requests.
            transaction_id:
          )
          end

          sig do
            override.returns(
              {
                authorization_identification_response: T.nilable(String),
                retrieval_reference_number: T.nilable(String),
                trace_number: T.nilable(String),
                transaction_id: T.nilable(String)
              }
            )
          end
          def to_hash
          end
        end

        # Whether or not the authorization supports partial approvals.
        module PartialApprovalCapability
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::RealTimeDecision::CardAuthorization::PartialApprovalCapability
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # This transaction supports partial approvals.
          SUPPORTED =
            T.let(
              :supported,
              Increase::RealTimeDecision::CardAuthorization::PartialApprovalCapability::TaggedSymbol
            )

          # This transaction does not support partial approvals.
          NOT_SUPPORTED =
            T.let(
              :not_supported,
              Increase::RealTimeDecision::CardAuthorization::PartialApprovalCapability::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::RealTimeDecision::CardAuthorization::PartialApprovalCapability::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # The processing category describes the intent behind the authorization, such as
        # whether it was used for bill payments or an automatic fuel dispenser.
        module ProcessingCategory
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::RealTimeDecision::CardAuthorization::ProcessingCategory
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Account funding transactions are transactions used to e.g., fund an account or transfer funds between accounts.
          ACCOUNT_FUNDING =
            T.let(
              :account_funding,
              Increase::RealTimeDecision::CardAuthorization::ProcessingCategory::TaggedSymbol
            )

          # Automatic fuel dispenser authorizations occur when a card is used at a gas pump, prior to the actual transaction amount being known. They are followed by an advice message that updates the amount of the pending transaction.
          AUTOMATIC_FUEL_DISPENSER =
            T.let(
              :automatic_fuel_dispenser,
              Increase::RealTimeDecision::CardAuthorization::ProcessingCategory::TaggedSymbol
            )

          # A transaction used to pay a bill.
          BILL_PAYMENT =
            T.let(
              :bill_payment,
              Increase::RealTimeDecision::CardAuthorization::ProcessingCategory::TaggedSymbol
            )

          # Original credit transactions are used to send money to a cardholder.
          ORIGINAL_CREDIT =
            T.let(
              :original_credit,
              Increase::RealTimeDecision::CardAuthorization::ProcessingCategory::TaggedSymbol
            )

          # A regular purchase.
          PURCHASE =
            T.let(
              :purchase,
              Increase::RealTimeDecision::CardAuthorization::ProcessingCategory::TaggedSymbol
            )

          # Quasi-cash transactions represent purchases of items which may be convertible to cash.
          QUASI_CASH =
            T.let(
              :quasi_cash,
              Increase::RealTimeDecision::CardAuthorization::ProcessingCategory::TaggedSymbol
            )

          # A refund card authorization, sometimes referred to as a credit voucher authorization, where funds are credited to the cardholder.
          REFUND =
            T.let(
              :refund,
              Increase::RealTimeDecision::CardAuthorization::ProcessingCategory::TaggedSymbol
            )

          # Cash disbursement transactions are used to withdraw cash from an ATM or a point of sale.
          CASH_DISBURSEMENT =
            T.let(
              :cash_disbursement,
              Increase::RealTimeDecision::CardAuthorization::ProcessingCategory::TaggedSymbol
            )

          # A balance inquiry transaction is used to check the balance of an account associated with a card.
          BALANCE_INQUIRY =
            T.let(
              :balance_inquiry,
              Increase::RealTimeDecision::CardAuthorization::ProcessingCategory::TaggedSymbol
            )

          # The processing category is unknown.
          UNKNOWN =
            T.let(
              :unknown,
              Increase::RealTimeDecision::CardAuthorization::ProcessingCategory::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::RealTimeDecision::CardAuthorization::ProcessingCategory::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class RequestDetails < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::RealTimeDecision::CardAuthorization::RequestDetails,
                Increase::Internal::AnyHash
              )
            end

          # The type of this request (e.g., an initial authorization or an incremental
          # authorization).
          sig do
            returns(
              Increase::RealTimeDecision::CardAuthorization::RequestDetails::Category::TaggedSymbol
            )
          end
          attr_accessor :category

          # Fields specific to the category `incremental_authorization`.
          sig do
            returns(
              T.nilable(
                Increase::RealTimeDecision::CardAuthorization::RequestDetails::IncrementalAuthorization
              )
            )
          end
          attr_reader :incremental_authorization

          sig do
            params(
              incremental_authorization:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::RequestDetails::IncrementalAuthorization::OrHash
                )
            ).void
          end
          attr_writer :incremental_authorization

          # Fields specific to the category `initial_authorization`.
          sig do
            returns(
              T.nilable(
                Increase::RealTimeDecision::CardAuthorization::RequestDetails::InitialAuthorization
              )
            )
          end
          attr_reader :initial_authorization

          sig do
            params(
              initial_authorization:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::RequestDetails::InitialAuthorization::OrHash
                )
            ).void
          end
          attr_writer :initial_authorization

          # Fields specific to the type of request, such as an incremental authorization.
          sig do
            params(
              category:
                Increase::RealTimeDecision::CardAuthorization::RequestDetails::Category::OrSymbol,
              incremental_authorization:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::RequestDetails::IncrementalAuthorization::OrHash
                ),
              initial_authorization:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::RequestDetails::InitialAuthorization::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # The type of this request (e.g., an initial authorization or an incremental
            # authorization).
            category:,
            # Fields specific to the category `incremental_authorization`.
            incremental_authorization:,
            # Fields specific to the category `initial_authorization`.
            initial_authorization:
          )
          end

          sig do
            override.returns(
              {
                category:
                  Increase::RealTimeDecision::CardAuthorization::RequestDetails::Category::TaggedSymbol,
                incremental_authorization:
                  T.nilable(
                    Increase::RealTimeDecision::CardAuthorization::RequestDetails::IncrementalAuthorization
                  ),
                initial_authorization:
                  T.nilable(
                    Increase::RealTimeDecision::CardAuthorization::RequestDetails::InitialAuthorization
                  )
              }
            )
          end
          def to_hash
          end

          # The type of this request (e.g., an initial authorization or an incremental
          # authorization).
          module Category
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::RealTimeDecision::CardAuthorization::RequestDetails::Category
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # A regular, standalone authorization.
            INITIAL_AUTHORIZATION =
              T.let(
                :initial_authorization,
                Increase::RealTimeDecision::CardAuthorization::RequestDetails::Category::TaggedSymbol
              )

            # An incremental request to increase the amount of an existing authorization.
            INCREMENTAL_AUTHORIZATION =
              T.let(
                :incremental_authorization,
                Increase::RealTimeDecision::CardAuthorization::RequestDetails::Category::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::RealTimeDecision::CardAuthorization::RequestDetails::Category::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class IncrementalAuthorization < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardAuthorization::RequestDetails::IncrementalAuthorization,
                  Increase::Internal::AnyHash
                )
              end

            # The card payment for this authorization and increment.
            sig { returns(String) }
            attr_accessor :card_payment_id

            # The identifier of the card authorization this request is attempting to
            # increment.
            sig { returns(String) }
            attr_accessor :original_card_authorization_id

            # Fields specific to the category `incremental_authorization`.
            sig do
              params(
                card_payment_id: String,
                original_card_authorization_id: String
              ).returns(T.attached_class)
            end
            def self.new(
              # The card payment for this authorization and increment.
              card_payment_id:,
              # The identifier of the card authorization this request is attempting to
              # increment.
              original_card_authorization_id:
            )
            end

            sig do
              override.returns(
                {
                  card_payment_id: String,
                  original_card_authorization_id: String
                }
              )
            end
            def to_hash
            end
          end

          class InitialAuthorization < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardAuthorization::RequestDetails::InitialAuthorization,
                  Increase::Internal::AnyHash
                )
              end

            # Fields specific to the category `initial_authorization`.
            sig { returns(T.attached_class) }
            def self.new
            end

            sig { override.returns({}) }
            def to_hash
            end
          end
        end

        class Verification < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::RealTimeDecision::CardAuthorization::Verification,
                Increase::Internal::AnyHash
              )
            end

          # Fields related to verification of the Card Verification Code, a 3-digit code on
          # the back of the card.
          sig do
            returns(
              Increase::RealTimeDecision::CardAuthorization::Verification::CardVerificationCode
            )
          end
          attr_reader :card_verification_code

          sig do
            params(
              card_verification_code:
                Increase::RealTimeDecision::CardAuthorization::Verification::CardVerificationCode::OrHash
            ).void
          end
          attr_writer :card_verification_code

          # Cardholder address provided in the authorization request and the address on file
          # we verified it against.
          sig do
            returns(
              Increase::RealTimeDecision::CardAuthorization::Verification::CardholderAddress
            )
          end
          attr_reader :cardholder_address

          sig do
            params(
              cardholder_address:
                Increase::RealTimeDecision::CardAuthorization::Verification::CardholderAddress::OrHash
            ).void
          end
          attr_writer :cardholder_address

          # Cardholder name provided in the authorization request.
          sig do
            returns(
              T.nilable(
                Increase::RealTimeDecision::CardAuthorization::Verification::CardholderName
              )
            )
          end
          attr_reader :cardholder_name

          sig do
            params(
              cardholder_name:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::Verification::CardholderName::OrHash
                )
            ).void
          end
          attr_writer :cardholder_name

          # Fields related to verification of cardholder-provided values.
          sig do
            params(
              card_verification_code:
                Increase::RealTimeDecision::CardAuthorization::Verification::CardVerificationCode::OrHash,
              cardholder_address:
                Increase::RealTimeDecision::CardAuthorization::Verification::CardholderAddress::OrHash,
              cardholder_name:
                T.nilable(
                  Increase::RealTimeDecision::CardAuthorization::Verification::CardholderName::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # Fields related to verification of the Card Verification Code, a 3-digit code on
            # the back of the card.
            card_verification_code:,
            # Cardholder address provided in the authorization request and the address on file
            # we verified it against.
            cardholder_address:,
            # Cardholder name provided in the authorization request.
            cardholder_name:
          )
          end

          sig do
            override.returns(
              {
                card_verification_code:
                  Increase::RealTimeDecision::CardAuthorization::Verification::CardVerificationCode,
                cardholder_address:
                  Increase::RealTimeDecision::CardAuthorization::Verification::CardholderAddress,
                cardholder_name:
                  T.nilable(
                    Increase::RealTimeDecision::CardAuthorization::Verification::CardholderName
                  )
              }
            )
          end
          def to_hash
          end

          class CardVerificationCode < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardAuthorization::Verification::CardVerificationCode,
                  Increase::Internal::AnyHash
                )
              end

            # The result of verifying the Card Verification Code.
            sig do
              returns(
                Increase::RealTimeDecision::CardAuthorization::Verification::CardVerificationCode::Result::TaggedSymbol
              )
            end
            attr_accessor :result

            # Fields related to verification of the Card Verification Code, a 3-digit code on
            # the back of the card.
            sig do
              params(
                result:
                  Increase::RealTimeDecision::CardAuthorization::Verification::CardVerificationCode::Result::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              # The result of verifying the Card Verification Code.
              result:
            )
            end

            sig do
              override.returns(
                {
                  result:
                    Increase::RealTimeDecision::CardAuthorization::Verification::CardVerificationCode::Result::TaggedSymbol
                }
              )
            end
            def to_hash
            end

            # The result of verifying the Card Verification Code.
            module Result
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::RealTimeDecision::CardAuthorization::Verification::CardVerificationCode::Result
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # No card verification code was provided in the authorization request.
              NOT_CHECKED =
                T.let(
                  :not_checked,
                  Increase::RealTimeDecision::CardAuthorization::Verification::CardVerificationCode::Result::TaggedSymbol
                )

              # The card verification code matched the one on file.
              MATCH =
                T.let(
                  :match,
                  Increase::RealTimeDecision::CardAuthorization::Verification::CardVerificationCode::Result::TaggedSymbol
                )

              # The card verification code did not match the one on file.
              NO_MATCH =
                T.let(
                  :no_match,
                  Increase::RealTimeDecision::CardAuthorization::Verification::CardVerificationCode::Result::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::RealTimeDecision::CardAuthorization::Verification::CardVerificationCode::Result::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class CardholderAddress < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardAuthorization::Verification::CardholderAddress,
                  Increase::Internal::AnyHash
                )
              end

            # Line 1 of the address on file for the cardholder.
            sig { returns(T.nilable(String)) }
            attr_accessor :actual_line1

            # The postal code of the address on file for the cardholder.
            sig { returns(T.nilable(String)) }
            attr_accessor :actual_postal_code

            # The cardholder address line 1 provided for verification in the authorization
            # request.
            sig { returns(T.nilable(String)) }
            attr_accessor :provided_line1

            # The postal code provided for verification in the authorization request.
            sig { returns(T.nilable(String)) }
            attr_accessor :provided_postal_code

            # The address verification result returned to the card network.
            sig do
              returns(
                Increase::RealTimeDecision::CardAuthorization::Verification::CardholderAddress::Result::TaggedSymbol
              )
            end
            attr_accessor :result

            # Cardholder address provided in the authorization request and the address on file
            # we verified it against.
            sig do
              params(
                actual_line1: T.nilable(String),
                actual_postal_code: T.nilable(String),
                provided_line1: T.nilable(String),
                provided_postal_code: T.nilable(String),
                result:
                  Increase::RealTimeDecision::CardAuthorization::Verification::CardholderAddress::Result::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Line 1 of the address on file for the cardholder.
              actual_line1:,
              # The postal code of the address on file for the cardholder.
              actual_postal_code:,
              # The cardholder address line 1 provided for verification in the authorization
              # request.
              provided_line1:,
              # The postal code provided for verification in the authorization request.
              provided_postal_code:,
              # The address verification result returned to the card network.
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
                    Increase::RealTimeDecision::CardAuthorization::Verification::CardholderAddress::Result::TaggedSymbol
                }
              )
            end
            def to_hash
            end

            # The address verification result returned to the card network.
            module Result
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::RealTimeDecision::CardAuthorization::Verification::CardholderAddress::Result
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # No address information was provided in the authorization request.
              NOT_CHECKED =
                T.let(
                  :not_checked,
                  Increase::RealTimeDecision::CardAuthorization::Verification::CardholderAddress::Result::TaggedSymbol
                )

              # Postal code matches, but the street address does not match or was not provided.
              POSTAL_CODE_MATCH_ADDRESS_NO_MATCH =
                T.let(
                  :postal_code_match_address_no_match,
                  Increase::RealTimeDecision::CardAuthorization::Verification::CardholderAddress::Result::TaggedSymbol
                )

              # Postal code does not match, but the street address matches or was not provided.
              POSTAL_CODE_NO_MATCH_ADDRESS_MATCH =
                T.let(
                  :postal_code_no_match_address_match,
                  Increase::RealTimeDecision::CardAuthorization::Verification::CardholderAddress::Result::TaggedSymbol
                )

              # Postal code and street address match.
              MATCH =
                T.let(
                  :match,
                  Increase::RealTimeDecision::CardAuthorization::Verification::CardholderAddress::Result::TaggedSymbol
                )

              # Postal code and street address do not match.
              NO_MATCH =
                T.let(
                  :no_match,
                  Increase::RealTimeDecision::CardAuthorization::Verification::CardholderAddress::Result::TaggedSymbol
                )

              # Postal code matches, but the street address was not verified. (deprecated)
              POSTAL_CODE_MATCH_ADDRESS_NOT_CHECKED =
                T.let(
                  :postal_code_match_address_not_checked,
                  Increase::RealTimeDecision::CardAuthorization::Verification::CardholderAddress::Result::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::RealTimeDecision::CardAuthorization::Verification::CardholderAddress::Result::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class CardholderName < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardAuthorization::Verification::CardholderName,
                  Increase::Internal::AnyHash
                )
              end

            # The first name provided for verification in the authorization request.
            sig { returns(T.nilable(String)) }
            attr_accessor :provided_first_name

            # The last name provided for verification in the authorization request.
            sig { returns(T.nilable(String)) }
            attr_accessor :provided_last_name

            # The middle name provided for verification in the authorization request.
            sig { returns(T.nilable(String)) }
            attr_accessor :provided_middle_name

            # Cardholder name provided in the authorization request.
            sig do
              params(
                provided_first_name: T.nilable(String),
                provided_last_name: T.nilable(String),
                provided_middle_name: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              # The first name provided for verification in the authorization request.
              provided_first_name:,
              # The last name provided for verification in the authorization request.
              provided_last_name:,
              # The middle name provided for verification in the authorization request.
              provided_middle_name:
            )
            end

            sig do
              override.returns(
                {
                  provided_first_name: T.nilable(String),
                  provided_last_name: T.nilable(String),
                  provided_middle_name: T.nilable(String)
                }
              )
            end
            def to_hash
            end
          end
        end
      end

      class CardBalanceInquiry < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::RealTimeDecision::CardBalanceInquiry,
              Increase::Internal::AnyHash
            )
          end

        # The identifier of the Account the authorization will debit.
        sig { returns(String) }
        attr_accessor :account_id

        # Additional amounts associated with the card authorization, such as ATM
        # surcharges fees. These are usually a subset of the `amount` field and are used
        # to provide more detailed information about the transaction.
        sig do
          returns(
            Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts
          )
        end
        attr_reader :additional_amounts

        sig do
          params(
            additional_amounts:
              Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::OrHash
          ).void
        end
        attr_writer :additional_amounts

        # Present if and only if `decision` is `approve`. Contains information related to
        # the approval of the balance inquiry.
        sig do
          returns(
            T.nilable(Increase::RealTimeDecision::CardBalanceInquiry::Approval)
          )
        end
        attr_reader :approval

        sig do
          params(
            approval:
              T.nilable(
                Increase::RealTimeDecision::CardBalanceInquiry::Approval::OrHash
              )
          ).void
        end
        attr_writer :approval

        # The identifier of the Card that is being authorized.
        sig { returns(String) }
        attr_accessor :card_id

        # Whether or not the authorization was approved.
        sig do
          returns(
            T.nilable(
              Increase::RealTimeDecision::CardBalanceInquiry::Decision::TaggedSymbol
            )
          )
        end
        attr_accessor :decision

        # If the authorization was made via a Digital Wallet Token (such as an Apple Pay
        # purchase), the identifier of the token that was used.
        sig { returns(T.nilable(String)) }
        attr_accessor :digital_wallet_token_id

        # The merchant identifier (commonly abbreviated as MID) of the merchant the card
        # is transacting with.
        sig { returns(String) }
        attr_accessor :merchant_acceptor_id

        # The Merchant Category Code (commonly abbreviated as MCC) of the merchant the
        # card is transacting with.
        sig { returns(String) }
        attr_accessor :merchant_category_code

        # The city the merchant resides in.
        sig { returns(T.nilable(String)) }
        attr_accessor :merchant_city

        # The country the merchant resides in.
        sig { returns(String) }
        attr_accessor :merchant_country

        # The merchant descriptor of the merchant the card is transacting with.
        sig { returns(String) }
        attr_accessor :merchant_descriptor

        # The merchant's postal code. For US merchants this is either a 5-digit or 9-digit
        # ZIP code, where the first 5 and last 4 are separated by a dash.
        sig { returns(T.nilable(String)) }
        attr_accessor :merchant_postal_code

        # The state the merchant resides in.
        sig { returns(T.nilable(String)) }
        attr_accessor :merchant_state

        # Fields specific to the `network`.
        sig do
          returns(
            Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails
          )
        end
        attr_reader :network_details

        sig do
          params(
            network_details:
              Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::OrHash
          ).void
        end
        attr_writer :network_details

        # Network-specific identifiers for a specific request or transaction.
        sig do
          returns(
            Increase::RealTimeDecision::CardBalanceInquiry::NetworkIdentifiers
          )
        end
        attr_reader :network_identifiers

        sig do
          params(
            network_identifiers:
              Increase::RealTimeDecision::CardBalanceInquiry::NetworkIdentifiers::OrHash
          ).void
        end
        attr_writer :network_identifiers

        # The risk score generated by the card network. For Visa this is the Visa Advanced
        # Authorization risk score, from 0 to 99, where 99 is the riskiest. For Pulse the
        # score is from 0 to 999, where 999 is the riskiest.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :network_risk_score

        # If the authorization was made in-person with a physical card, the Physical Card
        # that was used.
        sig { returns(T.nilable(String)) }
        attr_accessor :physical_card_id

        # The terminal identifier (commonly abbreviated as TID) of the terminal the card
        # is transacting with.
        sig { returns(T.nilable(String)) }
        attr_accessor :terminal_id

        # The identifier of the Card Payment this authorization will belong to. Available
        # in the API once the card authorization has completed.
        sig { returns(String) }
        attr_accessor :upcoming_card_payment_id

        # Fields related to verification of cardholder-provided values.
        sig do
          returns(Increase::RealTimeDecision::CardBalanceInquiry::Verification)
        end
        attr_reader :verification

        sig do
          params(
            verification:
              Increase::RealTimeDecision::CardBalanceInquiry::Verification::OrHash
          ).void
        end
        attr_writer :verification

        # Fields related to a card balance inquiry.
        sig do
          params(
            account_id: String,
            additional_amounts:
              Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::OrHash,
            approval:
              T.nilable(
                Increase::RealTimeDecision::CardBalanceInquiry::Approval::OrHash
              ),
            card_id: String,
            decision:
              T.nilable(
                Increase::RealTimeDecision::CardBalanceInquiry::Decision::OrSymbol
              ),
            digital_wallet_token_id: T.nilable(String),
            merchant_acceptor_id: String,
            merchant_category_code: String,
            merchant_city: T.nilable(String),
            merchant_country: String,
            merchant_descriptor: String,
            merchant_postal_code: T.nilable(String),
            merchant_state: T.nilable(String),
            network_details:
              Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::OrHash,
            network_identifiers:
              Increase::RealTimeDecision::CardBalanceInquiry::NetworkIdentifiers::OrHash,
            network_risk_score: T.nilable(Integer),
            physical_card_id: T.nilable(String),
            terminal_id: T.nilable(String),
            upcoming_card_payment_id: String,
            verification:
              Increase::RealTimeDecision::CardBalanceInquiry::Verification::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # The identifier of the Account the authorization will debit.
          account_id:,
          # Additional amounts associated with the card authorization, such as ATM
          # surcharges fees. These are usually a subset of the `amount` field and are used
          # to provide more detailed information about the transaction.
          additional_amounts:,
          # Present if and only if `decision` is `approve`. Contains information related to
          # the approval of the balance inquiry.
          approval:,
          # The identifier of the Card that is being authorized.
          card_id:,
          # Whether or not the authorization was approved.
          decision:,
          # If the authorization was made via a Digital Wallet Token (such as an Apple Pay
          # purchase), the identifier of the token that was used.
          digital_wallet_token_id:,
          # The merchant identifier (commonly abbreviated as MID) of the merchant the card
          # is transacting with.
          merchant_acceptor_id:,
          # The Merchant Category Code (commonly abbreviated as MCC) of the merchant the
          # card is transacting with.
          merchant_category_code:,
          # The city the merchant resides in.
          merchant_city:,
          # The country the merchant resides in.
          merchant_country:,
          # The merchant descriptor of the merchant the card is transacting with.
          merchant_descriptor:,
          # The merchant's postal code. For US merchants this is either a 5-digit or 9-digit
          # ZIP code, where the first 5 and last 4 are separated by a dash.
          merchant_postal_code:,
          # The state the merchant resides in.
          merchant_state:,
          # Fields specific to the `network`.
          network_details:,
          # Network-specific identifiers for a specific request or transaction.
          network_identifiers:,
          # The risk score generated by the card network. For Visa this is the Visa Advanced
          # Authorization risk score, from 0 to 99, where 99 is the riskiest. For Pulse the
          # score is from 0 to 999, where 999 is the riskiest.
          network_risk_score:,
          # If the authorization was made in-person with a physical card, the Physical Card
          # that was used.
          physical_card_id:,
          # The terminal identifier (commonly abbreviated as TID) of the terminal the card
          # is transacting with.
          terminal_id:,
          # The identifier of the Card Payment this authorization will belong to. Available
          # in the API once the card authorization has completed.
          upcoming_card_payment_id:,
          # Fields related to verification of cardholder-provided values.
          verification:
        )
        end

        sig do
          override.returns(
            {
              account_id: String,
              additional_amounts:
                Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts,
              approval:
                T.nilable(
                  Increase::RealTimeDecision::CardBalanceInquiry::Approval
                ),
              card_id: String,
              decision:
                T.nilable(
                  Increase::RealTimeDecision::CardBalanceInquiry::Decision::TaggedSymbol
                ),
              digital_wallet_token_id: T.nilable(String),
              merchant_acceptor_id: String,
              merchant_category_code: String,
              merchant_city: T.nilable(String),
              merchant_country: String,
              merchant_descriptor: String,
              merchant_postal_code: T.nilable(String),
              merchant_state: T.nilable(String),
              network_details:
                Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails,
              network_identifiers:
                Increase::RealTimeDecision::CardBalanceInquiry::NetworkIdentifiers,
              network_risk_score: T.nilable(Integer),
              physical_card_id: T.nilable(String),
              terminal_id: T.nilable(String),
              upcoming_card_payment_id: String,
              verification:
                Increase::RealTimeDecision::CardBalanceInquiry::Verification
            }
          )
        end
        def to_hash
        end

        class AdditionalAmounts < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts,
                Increase::Internal::AnyHash
              )
            end

          # The part of this transaction amount that was for clinic-related services.
          sig do
            returns(
              T.nilable(
                Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Clinic
              )
            )
          end
          attr_reader :clinic

          sig do
            params(
              clinic:
                T.nilable(
                  Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Clinic::OrHash
                )
            ).void
          end
          attr_writer :clinic

          # The part of this transaction amount that was for dental-related services.
          sig do
            returns(
              T.nilable(
                Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Dental
              )
            )
          end
          attr_reader :dental

          sig do
            params(
              dental:
                T.nilable(
                  Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Dental::OrHash
                )
            ).void
          end
          attr_writer :dental

          # The original pre-authorized amount.
          sig do
            returns(
              T.nilable(
                Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Original
              )
            )
          end
          attr_reader :original

          sig do
            params(
              original:
                T.nilable(
                  Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Original::OrHash
                )
            ).void
          end
          attr_writer :original

          # The part of this transaction amount that was for healthcare prescriptions.
          sig do
            returns(
              T.nilable(
                Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Prescription
              )
            )
          end
          attr_reader :prescription

          sig do
            params(
              prescription:
                T.nilable(
                  Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Prescription::OrHash
                )
            ).void
          end
          attr_writer :prescription

          # The surcharge amount charged for this transaction by the merchant.
          sig do
            returns(
              T.nilable(
                Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Surcharge
              )
            )
          end
          attr_reader :surcharge

          sig do
            params(
              surcharge:
                T.nilable(
                  Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Surcharge::OrHash
                )
            ).void
          end
          attr_writer :surcharge

          # The total amount of a series of incremental authorizations, optionally provided.
          sig do
            returns(
              T.nilable(
                Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::TotalCumulative
              )
            )
          end
          attr_reader :total_cumulative

          sig do
            params(
              total_cumulative:
                T.nilable(
                  Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::TotalCumulative::OrHash
                )
            ).void
          end
          attr_writer :total_cumulative

          # The total amount of healthcare-related additional amounts.
          sig do
            returns(
              T.nilable(
                Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::TotalHealthcare
              )
            )
          end
          attr_reader :total_healthcare

          sig do
            params(
              total_healthcare:
                T.nilable(
                  Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::TotalHealthcare::OrHash
                )
            ).void
          end
          attr_writer :total_healthcare

          # The part of this transaction amount that was for transit-related services.
          sig do
            returns(
              T.nilable(
                Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Transit
              )
            )
          end
          attr_reader :transit

          sig do
            params(
              transit:
                T.nilable(
                  Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Transit::OrHash
                )
            ).void
          end
          attr_writer :transit

          # An unknown additional amount.
          sig do
            returns(
              T.nilable(
                Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Unknown
              )
            )
          end
          attr_reader :unknown

          sig do
            params(
              unknown:
                T.nilable(
                  Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Unknown::OrHash
                )
            ).void
          end
          attr_writer :unknown

          # The part of this transaction amount that was for vision-related services.
          sig do
            returns(
              T.nilable(
                Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Vision
              )
            )
          end
          attr_reader :vision

          sig do
            params(
              vision:
                T.nilable(
                  Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Vision::OrHash
                )
            ).void
          end
          attr_writer :vision

          # Additional amounts associated with the card authorization, such as ATM
          # surcharges fees. These are usually a subset of the `amount` field and are used
          # to provide more detailed information about the transaction.
          sig do
            params(
              clinic:
                T.nilable(
                  Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Clinic::OrHash
                ),
              dental:
                T.nilable(
                  Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Dental::OrHash
                ),
              original:
                T.nilable(
                  Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Original::OrHash
                ),
              prescription:
                T.nilable(
                  Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Prescription::OrHash
                ),
              surcharge:
                T.nilable(
                  Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Surcharge::OrHash
                ),
              total_cumulative:
                T.nilable(
                  Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::TotalCumulative::OrHash
                ),
              total_healthcare:
                T.nilable(
                  Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::TotalHealthcare::OrHash
                ),
              transit:
                T.nilable(
                  Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Transit::OrHash
                ),
              unknown:
                T.nilable(
                  Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Unknown::OrHash
                ),
              vision:
                T.nilable(
                  Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Vision::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # The part of this transaction amount that was for clinic-related services.
            clinic:,
            # The part of this transaction amount that was for dental-related services.
            dental:,
            # The original pre-authorized amount.
            original:,
            # The part of this transaction amount that was for healthcare prescriptions.
            prescription:,
            # The surcharge amount charged for this transaction by the merchant.
            surcharge:,
            # The total amount of a series of incremental authorizations, optionally provided.
            total_cumulative:,
            # The total amount of healthcare-related additional amounts.
            total_healthcare:,
            # The part of this transaction amount that was for transit-related services.
            transit:,
            # An unknown additional amount.
            unknown:,
            # The part of this transaction amount that was for vision-related services.
            vision:
          )
          end

          sig do
            override.returns(
              {
                clinic:
                  T.nilable(
                    Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Clinic
                  ),
                dental:
                  T.nilable(
                    Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Dental
                  ),
                original:
                  T.nilable(
                    Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Original
                  ),
                prescription:
                  T.nilable(
                    Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Prescription
                  ),
                surcharge:
                  T.nilable(
                    Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Surcharge
                  ),
                total_cumulative:
                  T.nilable(
                    Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::TotalCumulative
                  ),
                total_healthcare:
                  T.nilable(
                    Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::TotalHealthcare
                  ),
                transit:
                  T.nilable(
                    Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Transit
                  ),
                unknown:
                  T.nilable(
                    Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Unknown
                  ),
                vision:
                  T.nilable(
                    Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Vision
                  )
              }
            )
          end
          def to_hash
          end

          class Clinic < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Clinic,
                  Increase::Internal::AnyHash
                )
              end

            # The amount in minor units of the `currency` field. The amount is positive if it
            # is added to the amount (such as an ATM surcharge fee) and negative if it is
            # subtracted from the amount (such as a discount).
            sig { returns(Integer) }
            attr_accessor :amount

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
            # amount's currency.
            sig { returns(String) }
            attr_accessor :currency

            # The part of this transaction amount that was for clinic-related services.
            sig do
              params(amount: Integer, currency: String).returns(
                T.attached_class
              )
            end
            def self.new(
              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              amount:,
              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              currency:
            )
            end

            sig { override.returns({ amount: Integer, currency: String }) }
            def to_hash
            end
          end

          class Dental < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Dental,
                  Increase::Internal::AnyHash
                )
              end

            # The amount in minor units of the `currency` field. The amount is positive if it
            # is added to the amount (such as an ATM surcharge fee) and negative if it is
            # subtracted from the amount (such as a discount).
            sig { returns(Integer) }
            attr_accessor :amount

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
            # amount's currency.
            sig { returns(String) }
            attr_accessor :currency

            # The part of this transaction amount that was for dental-related services.
            sig do
              params(amount: Integer, currency: String).returns(
                T.attached_class
              )
            end
            def self.new(
              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              amount:,
              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              currency:
            )
            end

            sig { override.returns({ amount: Integer, currency: String }) }
            def to_hash
            end
          end

          class Original < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Original,
                  Increase::Internal::AnyHash
                )
              end

            # The amount in minor units of the `currency` field. The amount is positive if it
            # is added to the amount (such as an ATM surcharge fee) and negative if it is
            # subtracted from the amount (such as a discount).
            sig { returns(Integer) }
            attr_accessor :amount

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
            # amount's currency.
            sig { returns(String) }
            attr_accessor :currency

            # The original pre-authorized amount.
            sig do
              params(amount: Integer, currency: String).returns(
                T.attached_class
              )
            end
            def self.new(
              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              amount:,
              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              currency:
            )
            end

            sig { override.returns({ amount: Integer, currency: String }) }
            def to_hash
            end
          end

          class Prescription < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Prescription,
                  Increase::Internal::AnyHash
                )
              end

            # The amount in minor units of the `currency` field. The amount is positive if it
            # is added to the amount (such as an ATM surcharge fee) and negative if it is
            # subtracted from the amount (such as a discount).
            sig { returns(Integer) }
            attr_accessor :amount

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
            # amount's currency.
            sig { returns(String) }
            attr_accessor :currency

            # The part of this transaction amount that was for healthcare prescriptions.
            sig do
              params(amount: Integer, currency: String).returns(
                T.attached_class
              )
            end
            def self.new(
              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              amount:,
              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              currency:
            )
            end

            sig { override.returns({ amount: Integer, currency: String }) }
            def to_hash
            end
          end

          class Surcharge < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Surcharge,
                  Increase::Internal::AnyHash
                )
              end

            # The amount in minor units of the `currency` field. The amount is positive if it
            # is added to the amount (such as an ATM surcharge fee) and negative if it is
            # subtracted from the amount (such as a discount).
            sig { returns(Integer) }
            attr_accessor :amount

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
            # amount's currency.
            sig { returns(String) }
            attr_accessor :currency

            # The surcharge amount charged for this transaction by the merchant.
            sig do
              params(amount: Integer, currency: String).returns(
                T.attached_class
              )
            end
            def self.new(
              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              amount:,
              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              currency:
            )
            end

            sig { override.returns({ amount: Integer, currency: String }) }
            def to_hash
            end
          end

          class TotalCumulative < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::TotalCumulative,
                  Increase::Internal::AnyHash
                )
              end

            # The amount in minor units of the `currency` field. The amount is positive if it
            # is added to the amount (such as an ATM surcharge fee) and negative if it is
            # subtracted from the amount (such as a discount).
            sig { returns(Integer) }
            attr_accessor :amount

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
            # amount's currency.
            sig { returns(String) }
            attr_accessor :currency

            # The total amount of a series of incremental authorizations, optionally provided.
            sig do
              params(amount: Integer, currency: String).returns(
                T.attached_class
              )
            end
            def self.new(
              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              amount:,
              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              currency:
            )
            end

            sig { override.returns({ amount: Integer, currency: String }) }
            def to_hash
            end
          end

          class TotalHealthcare < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::TotalHealthcare,
                  Increase::Internal::AnyHash
                )
              end

            # The amount in minor units of the `currency` field. The amount is positive if it
            # is added to the amount (such as an ATM surcharge fee) and negative if it is
            # subtracted from the amount (such as a discount).
            sig { returns(Integer) }
            attr_accessor :amount

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
            # amount's currency.
            sig { returns(String) }
            attr_accessor :currency

            # The total amount of healthcare-related additional amounts.
            sig do
              params(amount: Integer, currency: String).returns(
                T.attached_class
              )
            end
            def self.new(
              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              amount:,
              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              currency:
            )
            end

            sig { override.returns({ amount: Integer, currency: String }) }
            def to_hash
            end
          end

          class Transit < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Transit,
                  Increase::Internal::AnyHash
                )
              end

            # The amount in minor units of the `currency` field. The amount is positive if it
            # is added to the amount (such as an ATM surcharge fee) and negative if it is
            # subtracted from the amount (such as a discount).
            sig { returns(Integer) }
            attr_accessor :amount

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
            # amount's currency.
            sig { returns(String) }
            attr_accessor :currency

            # The part of this transaction amount that was for transit-related services.
            sig do
              params(amount: Integer, currency: String).returns(
                T.attached_class
              )
            end
            def self.new(
              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              amount:,
              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              currency:
            )
            end

            sig { override.returns({ amount: Integer, currency: String }) }
            def to_hash
            end
          end

          class Unknown < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Unknown,
                  Increase::Internal::AnyHash
                )
              end

            # The amount in minor units of the `currency` field. The amount is positive if it
            # is added to the amount (such as an ATM surcharge fee) and negative if it is
            # subtracted from the amount (such as a discount).
            sig { returns(Integer) }
            attr_accessor :amount

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
            # amount's currency.
            sig { returns(String) }
            attr_accessor :currency

            # An unknown additional amount.
            sig do
              params(amount: Integer, currency: String).returns(
                T.attached_class
              )
            end
            def self.new(
              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              amount:,
              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              currency:
            )
            end

            sig { override.returns({ amount: Integer, currency: String }) }
            def to_hash
            end
          end

          class Vision < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardBalanceInquiry::AdditionalAmounts::Vision,
                  Increase::Internal::AnyHash
                )
              end

            # The amount in minor units of the `currency` field. The amount is positive if it
            # is added to the amount (such as an ATM surcharge fee) and negative if it is
            # subtracted from the amount (such as a discount).
            sig { returns(Integer) }
            attr_accessor :amount

            # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
            # amount's currency.
            sig { returns(String) }
            attr_accessor :currency

            # The part of this transaction amount that was for vision-related services.
            sig do
              params(amount: Integer, currency: String).returns(
                T.attached_class
              )
            end
            def self.new(
              # The amount in minor units of the `currency` field. The amount is positive if it
              # is added to the amount (such as an ATM surcharge fee) and negative if it is
              # subtracted from the amount (such as a discount).
              amount:,
              # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the additional
              # amount's currency.
              currency:
            )
            end

            sig { override.returns({ amount: Integer, currency: String }) }
            def to_hash
            end
          end
        end

        class Approval < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::RealTimeDecision::CardBalanceInquiry::Approval,
                Increase::Internal::AnyHash
              )
            end

          # If the balance inquiry was approved, this field contains the balance in the
          # minor unit of the settlement currency.
          sig { returns(Integer) }
          attr_accessor :balance

          # Present if and only if `decision` is `approve`. Contains information related to
          # the approval of the balance inquiry.
          sig { params(balance: Integer).returns(T.attached_class) }
          def self.new(
            # If the balance inquiry was approved, this field contains the balance in the
            # minor unit of the settlement currency.
            balance:
          )
          end

          sig { override.returns({ balance: Integer }) }
          def to_hash
          end
        end

        # Whether or not the authorization was approved.
        module Decision
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::RealTimeDecision::CardBalanceInquiry::Decision
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Approve the authorization.
          APPROVE =
            T.let(
              :approve,
              Increase::RealTimeDecision::CardBalanceInquiry::Decision::TaggedSymbol
            )

          # Decline the authorization.
          DECLINE =
            T.let(
              :decline,
              Increase::RealTimeDecision::CardBalanceInquiry::Decision::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::RealTimeDecision::CardBalanceInquiry::Decision::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class NetworkDetails < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails,
                Increase::Internal::AnyHash
              )
            end

          # The payment network used to process this card authorization.
          sig do
            returns(
              Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Category::TaggedSymbol
            )
          end
          attr_accessor :category

          # Fields specific to the `pulse` network.
          sig do
            returns(
              T.nilable(
                Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Pulse
              )
            )
          end
          attr_reader :pulse

          sig do
            params(
              pulse:
                T.nilable(
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Pulse::OrHash
                )
            ).void
          end
          attr_writer :pulse

          # Fields specific to the `visa` network.
          sig do
            returns(
              T.nilable(
                Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa
              )
            )
          end
          attr_reader :visa

          sig do
            params(
              visa:
                T.nilable(
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::OrHash
                )
            ).void
          end
          attr_writer :visa

          # Fields specific to the `network`.
          sig do
            params(
              category:
                Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Category::OrSymbol,
              pulse:
                T.nilable(
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Pulse::OrHash
                ),
              visa:
                T.nilable(
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # The payment network used to process this card authorization.
            category:,
            # Fields specific to the `pulse` network.
            pulse:,
            # Fields specific to the `visa` network.
            visa:
          )
          end

          sig do
            override.returns(
              {
                category:
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Category::TaggedSymbol,
                pulse:
                  T.nilable(
                    Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Pulse
                  ),
                visa:
                  T.nilable(
                    Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa
                  )
              }
            )
          end
          def to_hash
          end

          # The payment network used to process this card authorization.
          module Category
            extend Increase::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Category
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # Visa
            VISA =
              T.let(
                :visa,
                Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Category::TaggedSymbol
              )

            # Pulse
            PULSE =
              T.let(
                :pulse,
                Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Category::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Category::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          class Pulse < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Pulse,
                  Increase::Internal::AnyHash
                )
              end

            # Fields specific to the `pulse` network.
            sig { returns(T.attached_class) }
            def self.new
            end

            sig { override.returns({}) }
            def to_hash
            end
          end

          class Visa < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa,
                  Increase::Internal::AnyHash
                )
              end

            # For electronic commerce transactions, this identifies the level of security used
            # in obtaining the customer's payment credential. For mail or telephone order
            # transactions, identifies the type of mail or telephone order.
            sig do
              returns(
                T.nilable(
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                )
              )
            end
            attr_accessor :electronic_commerce_indicator

            # The method used to enter the cardholder's primary account number and card
            # expiration date.
            sig do
              returns(
                T.nilable(
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                )
              )
            end
            attr_accessor :point_of_service_entry_mode

            # Only present when `actioner: network`. Describes why a card authorization was
            # approved or declined by Visa through stand-in processing.
            sig do
              returns(
                T.nilable(
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                )
              )
            end
            attr_accessor :stand_in_processing_reason

            # The capability of the terminal being used to read the card. Shows whether a
            # terminal can e.g., accept chip cards or if it only supports magnetic stripe
            # reads. This reflects the highest capability of the terminal — for example, a
            # terminal that supports both chip and magnetic stripe will be identified as
            # chip-capable.
            sig do
              returns(
                T.nilable(
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::TerminalEntryCapability::TaggedSymbol
                )
              )
            end
            attr_accessor :terminal_entry_capability

            # Fields specific to the `visa` network.
            sig do
              params(
                electronic_commerce_indicator:
                  T.nilable(
                    Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::ElectronicCommerceIndicator::OrSymbol
                  ),
                point_of_service_entry_mode:
                  T.nilable(
                    Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::PointOfServiceEntryMode::OrSymbol
                  ),
                stand_in_processing_reason:
                  T.nilable(
                    Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::StandInProcessingReason::OrSymbol
                  ),
                terminal_entry_capability:
                  T.nilable(
                    Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::TerminalEntryCapability::OrSymbol
                  )
              ).returns(T.attached_class)
            end
            def self.new(
              # For electronic commerce transactions, this identifies the level of security used
              # in obtaining the customer's payment credential. For mail or telephone order
              # transactions, identifies the type of mail or telephone order.
              electronic_commerce_indicator:,
              # The method used to enter the cardholder's primary account number and card
              # expiration date.
              point_of_service_entry_mode:,
              # Only present when `actioner: network`. Describes why a card authorization was
              # approved or declined by Visa through stand-in processing.
              stand_in_processing_reason:,
              # The capability of the terminal being used to read the card. Shows whether a
              # terminal can e.g., accept chip cards or if it only supports magnetic stripe
              # reads. This reflects the highest capability of the terminal — for example, a
              # terminal that supports both chip and magnetic stripe will be identified as
              # chip-capable.
              terminal_entry_capability:
            )
            end

            sig do
              override.returns(
                {
                  electronic_commerce_indicator:
                    T.nilable(
                      Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                    ),
                  point_of_service_entry_mode:
                    T.nilable(
                      Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                    ),
                  stand_in_processing_reason:
                    T.nilable(
                      Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                    ),
                  terminal_entry_capability:
                    T.nilable(
                      Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::TerminalEntryCapability::TaggedSymbol
                    )
                }
              )
            end
            def to_hash
            end

            # For electronic commerce transactions, this identifies the level of security used
            # in obtaining the customer's payment credential. For mail or telephone order
            # transactions, identifies the type of mail or telephone order.
            module ElectronicCommerceIndicator
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::ElectronicCommerceIndicator
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Single transaction of a mail/phone order: Use to indicate that the transaction is a mail/phone order purchase, not a recurring transaction or installment payment. For domestic transactions in the US region, this value may also indicate one bill payment transaction in the card-present or card-absent environments.
              MAIL_PHONE_ORDER =
                T.let(
                  :mail_phone_order,
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                )

              # Recurring transaction: Payment indicator used to indicate a recurring transaction that originates from an acquirer in the US region.
              RECURRING =
                T.let(
                  :recurring,
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                )

              # Installment payment: Payment indicator used to indicate one purchase of goods or services that is billed to the account in multiple charges over a period of time agreed upon by the cardholder and merchant from transactions that originate from an acquirer in the US region.
              INSTALLMENT =
                T.let(
                  :installment,
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                )

              # Unknown classification: other mail order: Use to indicate that the type of mail/telephone order is unknown.
              UNKNOWN_MAIL_PHONE_ORDER =
                T.let(
                  :unknown_mail_phone_order,
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                )

              # Secure electronic commerce transaction: Use to indicate that the electronic commerce transaction has been authenticated using e.g., 3-D Secure
              SECURE_ELECTRONIC_COMMERCE =
                T.let(
                  :secure_electronic_commerce,
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                )

              # Non-authenticated security transaction at a 3-D Secure-capable merchant, and merchant attempted to authenticate the cardholder using 3-D Secure: Use to identify an electronic commerce transaction where the merchant attempted to authenticate the cardholder using 3-D Secure, but was unable to complete the authentication because the issuer or cardholder does not participate in the 3-D Secure program.
              NON_AUTHENTICATED_SECURITY_TRANSACTION_AT_3DS_CAPABLE_MERCHANT =
                T.let(
                  :non_authenticated_security_transaction_at_3ds_capable_merchant,
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                )

              # Non-authenticated security transaction: Use to identify an electronic commerce transaction that uses data encryption for security however, cardholder authentication is not performed using 3-D Secure.
              NON_AUTHENTICATED_SECURITY_TRANSACTION =
                T.let(
                  :non_authenticated_security_transaction,
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                )

              # Non-secure transaction: Use to identify an electronic commerce transaction that has no data protection.
              NON_SECURE_TRANSACTION =
                T.let(
                  :non_secure_transaction,
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::ElectronicCommerceIndicator::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            # The method used to enter the cardholder's primary account number and card
            # expiration date.
            module PointOfServiceEntryMode
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::PointOfServiceEntryMode
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Unknown
              UNKNOWN =
                T.let(
                  :unknown,
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                )

              # Manual key entry
              MANUAL =
                T.let(
                  :manual,
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                )

              # Magnetic stripe read, without card verification value
              MAGNETIC_STRIPE_NO_CVV =
                T.let(
                  :magnetic_stripe_no_cvv,
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                )

              # Optical code
              OPTICAL_CODE =
                T.let(
                  :optical_code,
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                )

              # Contact chip card
              INTEGRATED_CIRCUIT_CARD =
                T.let(
                  :integrated_circuit_card,
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                )

              # Contactless read of chip card
              CONTACTLESS =
                T.let(
                  :contactless,
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                )

              # Transaction initiated using a credential that has previously been stored on file
              CREDENTIAL_ON_FILE =
                T.let(
                  :credential_on_file,
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                )

              # Magnetic stripe read
              MAGNETIC_STRIPE =
                T.let(
                  :magnetic_stripe,
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                )

              # Contactless read of magnetic stripe data
              CONTACTLESS_MAGNETIC_STRIPE =
                T.let(
                  :contactless_magnetic_stripe,
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                )

              # Contact chip card, without card verification value
              INTEGRATED_CIRCUIT_CARD_NO_CVV =
                T.let(
                  :integrated_circuit_card_no_cvv,
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::PointOfServiceEntryMode::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            # Only present when `actioner: network`. Describes why a card authorization was
            # approved or declined by Visa through stand-in processing.
            module StandInProcessingReason
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::StandInProcessingReason
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Increase failed to process the authorization in a timely manner.
              ISSUER_ERROR =
                T.let(
                  :issuer_error,
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                )

              # The physical card read had an invalid CVV or dCVV.
              INVALID_PHYSICAL_CARD =
                T.let(
                  :invalid_physical_card,
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                )

              # The card's authorization request cryptogram was invalid. The cryptogram can be from a physical card or a Digital Wallet Token purchase.
              INVALID_CRYPTOGRAM =
                T.let(
                  :invalid_cryptogram,
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                )

              # The 3DS cardholder authentication verification value was invalid.
              INVALID_CARDHOLDER_AUTHENTICATION_VERIFICATION_VALUE =
                T.let(
                  :invalid_cardholder_authentication_verification_value,
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                )

              # An internal Visa error occurred. Visa uses this reason code for certain expected occurrences as well, such as Application Transaction Counter (ATC) replays.
              INTERNAL_VISA_ERROR =
                T.let(
                  :internal_visa_error,
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                )

              # The merchant has enabled Visa's Transaction Advisory Service and requires further authentication to perform the transaction. In practice this is often utilized at fuel pumps to tell the cardholder to see the cashier.
              MERCHANT_TRANSACTION_ADVISORY_SERVICE_AUTHENTICATION_REQUIRED =
                T.let(
                  :merchant_transaction_advisory_service_authentication_required,
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                )

              # The transaction was blocked by Visa's Payment Fraud Disruption service due to fraudulent Acquirer behavior, such as card testing.
              PAYMENT_FRAUD_DISRUPTION_ACQUIRER_BLOCK =
                T.let(
                  :payment_fraud_disruption_acquirer_block,
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                )

              # An unspecific reason for stand-in processing.
              OTHER =
                T.let(
                  :other,
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::StandInProcessingReason::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            # The capability of the terminal being used to read the card. Shows whether a
            # terminal can e.g., accept chip cards or if it only supports magnetic stripe
            # reads. This reflects the highest capability of the terminal — for example, a
            # terminal that supports both chip and magnetic stripe will be identified as
            # chip-capable.
            module TerminalEntryCapability
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::TerminalEntryCapability
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # Unknown
              UNKNOWN =
                T.let(
                  :unknown,
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::TerminalEntryCapability::TaggedSymbol
                )

              # No terminal was used for this transaction.
              TERMINAL_NOT_USED =
                T.let(
                  :terminal_not_used,
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::TerminalEntryCapability::TaggedSymbol
                )

              # The terminal can only read magnetic stripes and does not have chip or contactless reading capability.
              MAGNETIC_STRIPE =
                T.let(
                  :magnetic_stripe,
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::TerminalEntryCapability::TaggedSymbol
                )

              # The terminal can only read barcodes.
              BARCODE =
                T.let(
                  :barcode,
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::TerminalEntryCapability::TaggedSymbol
                )

              # The terminal can only read cards via Optical Character Recognition.
              OPTICAL_CHARACTER_RECOGNITION =
                T.let(
                  :optical_character_recognition,
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::TerminalEntryCapability::TaggedSymbol
                )

              # The terminal supports contact chip cards and can also read the magnetic stripe. If contact chip is supported, this value is used regardless of whether contactless is also supported.
              CHIP_OR_CONTACTLESS =
                T.let(
                  :chip_or_contactless,
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::TerminalEntryCapability::TaggedSymbol
                )

              # The terminal supports contactless reads but does not support contact chip. Only used when the terminal lacks contact chip capability.
              CONTACTLESS_ONLY =
                T.let(
                  :contactless_only,
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::TerminalEntryCapability::TaggedSymbol
                )

              # The terminal has no card reading capability.
              NO_CAPABILITY =
                T.let(
                  :no_capability,
                  Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::TerminalEntryCapability::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::RealTimeDecision::CardBalanceInquiry::NetworkDetails::Visa::TerminalEntryCapability::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end
        end

        class NetworkIdentifiers < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::RealTimeDecision::CardBalanceInquiry::NetworkIdentifiers,
                Increase::Internal::AnyHash
              )
            end

          # The randomly generated 6-character Authorization Identification Response code
          # sent back to the acquirer in an approved response.
          sig { returns(T.nilable(String)) }
          attr_accessor :authorization_identification_response

          # A life-cycle identifier used across e.g., an authorization and a reversal.
          # Expected to be unique per acquirer within a window of time. For some card
          # networks the retrieval reference number includes the trace counter.
          sig { returns(T.nilable(String)) }
          attr_accessor :retrieval_reference_number

          # A counter used to verify an individual authorization. Expected to be unique per
          # acquirer within a window of time.
          sig { returns(T.nilable(String)) }
          attr_accessor :trace_number

          # A globally unique transaction identifier provided by the card network, used
          # across multiple life-cycle requests.
          sig { returns(T.nilable(String)) }
          attr_accessor :transaction_id

          # Network-specific identifiers for a specific request or transaction.
          sig do
            params(
              authorization_identification_response: T.nilable(String),
              retrieval_reference_number: T.nilable(String),
              trace_number: T.nilable(String),
              transaction_id: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # The randomly generated 6-character Authorization Identification Response code
            # sent back to the acquirer in an approved response.
            authorization_identification_response:,
            # A life-cycle identifier used across e.g., an authorization and a reversal.
            # Expected to be unique per acquirer within a window of time. For some card
            # networks the retrieval reference number includes the trace counter.
            retrieval_reference_number:,
            # A counter used to verify an individual authorization. Expected to be unique per
            # acquirer within a window of time.
            trace_number:,
            # A globally unique transaction identifier provided by the card network, used
            # across multiple life-cycle requests.
            transaction_id:
          )
          end

          sig do
            override.returns(
              {
                authorization_identification_response: T.nilable(String),
                retrieval_reference_number: T.nilable(String),
                trace_number: T.nilable(String),
                transaction_id: T.nilable(String)
              }
            )
          end
          def to_hash
          end
        end

        class Verification < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::RealTimeDecision::CardBalanceInquiry::Verification,
                Increase::Internal::AnyHash
              )
            end

          # Fields related to verification of the Card Verification Code, a 3-digit code on
          # the back of the card.
          sig do
            returns(
              Increase::RealTimeDecision::CardBalanceInquiry::Verification::CardVerificationCode
            )
          end
          attr_reader :card_verification_code

          sig do
            params(
              card_verification_code:
                Increase::RealTimeDecision::CardBalanceInquiry::Verification::CardVerificationCode::OrHash
            ).void
          end
          attr_writer :card_verification_code

          # Cardholder address provided in the authorization request and the address on file
          # we verified it against.
          sig do
            returns(
              Increase::RealTimeDecision::CardBalanceInquiry::Verification::CardholderAddress
            )
          end
          attr_reader :cardholder_address

          sig do
            params(
              cardholder_address:
                Increase::RealTimeDecision::CardBalanceInquiry::Verification::CardholderAddress::OrHash
            ).void
          end
          attr_writer :cardholder_address

          # Cardholder name provided in the authorization request.
          sig do
            returns(
              T.nilable(
                Increase::RealTimeDecision::CardBalanceInquiry::Verification::CardholderName
              )
            )
          end
          attr_reader :cardholder_name

          sig do
            params(
              cardholder_name:
                T.nilable(
                  Increase::RealTimeDecision::CardBalanceInquiry::Verification::CardholderName::OrHash
                )
            ).void
          end
          attr_writer :cardholder_name

          # Fields related to verification of cardholder-provided values.
          sig do
            params(
              card_verification_code:
                Increase::RealTimeDecision::CardBalanceInquiry::Verification::CardVerificationCode::OrHash,
              cardholder_address:
                Increase::RealTimeDecision::CardBalanceInquiry::Verification::CardholderAddress::OrHash,
              cardholder_name:
                T.nilable(
                  Increase::RealTimeDecision::CardBalanceInquiry::Verification::CardholderName::OrHash
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # Fields related to verification of the Card Verification Code, a 3-digit code on
            # the back of the card.
            card_verification_code:,
            # Cardholder address provided in the authorization request and the address on file
            # we verified it against.
            cardholder_address:,
            # Cardholder name provided in the authorization request.
            cardholder_name:
          )
          end

          sig do
            override.returns(
              {
                card_verification_code:
                  Increase::RealTimeDecision::CardBalanceInquiry::Verification::CardVerificationCode,
                cardholder_address:
                  Increase::RealTimeDecision::CardBalanceInquiry::Verification::CardholderAddress,
                cardholder_name:
                  T.nilable(
                    Increase::RealTimeDecision::CardBalanceInquiry::Verification::CardholderName
                  )
              }
            )
          end
          def to_hash
          end

          class CardVerificationCode < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardBalanceInquiry::Verification::CardVerificationCode,
                  Increase::Internal::AnyHash
                )
              end

            # The result of verifying the Card Verification Code.
            sig do
              returns(
                Increase::RealTimeDecision::CardBalanceInquiry::Verification::CardVerificationCode::Result::TaggedSymbol
              )
            end
            attr_accessor :result

            # Fields related to verification of the Card Verification Code, a 3-digit code on
            # the back of the card.
            sig do
              params(
                result:
                  Increase::RealTimeDecision::CardBalanceInquiry::Verification::CardVerificationCode::Result::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              # The result of verifying the Card Verification Code.
              result:
            )
            end

            sig do
              override.returns(
                {
                  result:
                    Increase::RealTimeDecision::CardBalanceInquiry::Verification::CardVerificationCode::Result::TaggedSymbol
                }
              )
            end
            def to_hash
            end

            # The result of verifying the Card Verification Code.
            module Result
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::RealTimeDecision::CardBalanceInquiry::Verification::CardVerificationCode::Result
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # No card verification code was provided in the authorization request.
              NOT_CHECKED =
                T.let(
                  :not_checked,
                  Increase::RealTimeDecision::CardBalanceInquiry::Verification::CardVerificationCode::Result::TaggedSymbol
                )

              # The card verification code matched the one on file.
              MATCH =
                T.let(
                  :match,
                  Increase::RealTimeDecision::CardBalanceInquiry::Verification::CardVerificationCode::Result::TaggedSymbol
                )

              # The card verification code did not match the one on file.
              NO_MATCH =
                T.let(
                  :no_match,
                  Increase::RealTimeDecision::CardBalanceInquiry::Verification::CardVerificationCode::Result::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::RealTimeDecision::CardBalanceInquiry::Verification::CardVerificationCode::Result::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class CardholderAddress < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardBalanceInquiry::Verification::CardholderAddress,
                  Increase::Internal::AnyHash
                )
              end

            # Line 1 of the address on file for the cardholder.
            sig { returns(T.nilable(String)) }
            attr_accessor :actual_line1

            # The postal code of the address on file for the cardholder.
            sig { returns(T.nilable(String)) }
            attr_accessor :actual_postal_code

            # The cardholder address line 1 provided for verification in the authorization
            # request.
            sig { returns(T.nilable(String)) }
            attr_accessor :provided_line1

            # The postal code provided for verification in the authorization request.
            sig { returns(T.nilable(String)) }
            attr_accessor :provided_postal_code

            # The address verification result returned to the card network.
            sig do
              returns(
                Increase::RealTimeDecision::CardBalanceInquiry::Verification::CardholderAddress::Result::TaggedSymbol
              )
            end
            attr_accessor :result

            # Cardholder address provided in the authorization request and the address on file
            # we verified it against.
            sig do
              params(
                actual_line1: T.nilable(String),
                actual_postal_code: T.nilable(String),
                provided_line1: T.nilable(String),
                provided_postal_code: T.nilable(String),
                result:
                  Increase::RealTimeDecision::CardBalanceInquiry::Verification::CardholderAddress::Result::OrSymbol
              ).returns(T.attached_class)
            end
            def self.new(
              # Line 1 of the address on file for the cardholder.
              actual_line1:,
              # The postal code of the address on file for the cardholder.
              actual_postal_code:,
              # The cardholder address line 1 provided for verification in the authorization
              # request.
              provided_line1:,
              # The postal code provided for verification in the authorization request.
              provided_postal_code:,
              # The address verification result returned to the card network.
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
                    Increase::RealTimeDecision::CardBalanceInquiry::Verification::CardholderAddress::Result::TaggedSymbol
                }
              )
            end
            def to_hash
            end

            # The address verification result returned to the card network.
            module Result
              extend Increase::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Increase::RealTimeDecision::CardBalanceInquiry::Verification::CardholderAddress::Result
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              # No address information was provided in the authorization request.
              NOT_CHECKED =
                T.let(
                  :not_checked,
                  Increase::RealTimeDecision::CardBalanceInquiry::Verification::CardholderAddress::Result::TaggedSymbol
                )

              # Postal code matches, but the street address does not match or was not provided.
              POSTAL_CODE_MATCH_ADDRESS_NO_MATCH =
                T.let(
                  :postal_code_match_address_no_match,
                  Increase::RealTimeDecision::CardBalanceInquiry::Verification::CardholderAddress::Result::TaggedSymbol
                )

              # Postal code does not match, but the street address matches or was not provided.
              POSTAL_CODE_NO_MATCH_ADDRESS_MATCH =
                T.let(
                  :postal_code_no_match_address_match,
                  Increase::RealTimeDecision::CardBalanceInquiry::Verification::CardholderAddress::Result::TaggedSymbol
                )

              # Postal code and street address match.
              MATCH =
                T.let(
                  :match,
                  Increase::RealTimeDecision::CardBalanceInquiry::Verification::CardholderAddress::Result::TaggedSymbol
                )

              # Postal code and street address do not match.
              NO_MATCH =
                T.let(
                  :no_match,
                  Increase::RealTimeDecision::CardBalanceInquiry::Verification::CardholderAddress::Result::TaggedSymbol
                )

              # Postal code matches, but the street address was not verified. (deprecated)
              POSTAL_CODE_MATCH_ADDRESS_NOT_CHECKED =
                T.let(
                  :postal_code_match_address_not_checked,
                  Increase::RealTimeDecision::CardBalanceInquiry::Verification::CardholderAddress::Result::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Increase::RealTimeDecision::CardBalanceInquiry::Verification::CardholderAddress::Result::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end
          end

          class CardholderName < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::RealTimeDecision::CardBalanceInquiry::Verification::CardholderName,
                  Increase::Internal::AnyHash
                )
              end

            # The first name provided for verification in the authorization request.
            sig { returns(T.nilable(String)) }
            attr_accessor :provided_first_name

            # The last name provided for verification in the authorization request.
            sig { returns(T.nilable(String)) }
            attr_accessor :provided_last_name

            # The middle name provided for verification in the authorization request.
            sig { returns(T.nilable(String)) }
            attr_accessor :provided_middle_name

            # Cardholder name provided in the authorization request.
            sig do
              params(
                provided_first_name: T.nilable(String),
                provided_last_name: T.nilable(String),
                provided_middle_name: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              # The first name provided for verification in the authorization request.
              provided_first_name:,
              # The last name provided for verification in the authorization request.
              provided_last_name:,
              # The middle name provided for verification in the authorization request.
              provided_middle_name:
            )
            end

            sig do
              override.returns(
                {
                  provided_first_name: T.nilable(String),
                  provided_last_name: T.nilable(String),
                  provided_middle_name: T.nilable(String)
                }
              )
            end
            def to_hash
            end
          end
        end
      end

      # The category of the Real-Time Decision.
      module Category
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::RealTimeDecision::Category) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # A card is being authorized.
        CARD_AUTHORIZATION_REQUESTED =
          T.let(
            :card_authorization_requested,
            Increase::RealTimeDecision::Category::TaggedSymbol
          )

        # A balance inquiry is being made on a card.
        CARD_BALANCE_INQUIRY_REQUESTED =
          T.let(
            :card_balance_inquiry_requested,
            Increase::RealTimeDecision::Category::TaggedSymbol
          )

        # 3DS authentication is requested.
        CARD_AUTHENTICATION_REQUESTED =
          T.let(
            :card_authentication_requested,
            Increase::RealTimeDecision::Category::TaggedSymbol
          )

        # 3DS authentication challenge requires cardholder involvement.
        CARD_AUTHENTICATION_CHALLENGE_REQUESTED =
          T.let(
            :card_authentication_challenge_requested,
            Increase::RealTimeDecision::Category::TaggedSymbol
          )

        # A card is being loaded into a digital wallet.
        DIGITAL_WALLET_TOKEN_REQUESTED =
          T.let(
            :digital_wallet_token_requested,
            Increase::RealTimeDecision::Category::TaggedSymbol
          )

        # A card is being loaded into a digital wallet and requires cardholder authentication.
        DIGITAL_WALLET_AUTHENTICATION_REQUESTED =
          T.let(
            :digital_wallet_authentication_requested,
            Increase::RealTimeDecision::Category::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::RealTimeDecision::Category::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class DigitalWalletAuthentication < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::RealTimeDecision::DigitalWalletAuthentication,
              Increase::Internal::AnyHash
            )
          end

        # The identifier of the Card that is being tokenized.
        sig { returns(String) }
        attr_accessor :card_id

        # The channel to send the card user their one-time passcode.
        sig do
          returns(
            Increase::RealTimeDecision::DigitalWalletAuthentication::Channel::TaggedSymbol
          )
        end
        attr_accessor :channel

        # The digital wallet app being used.
        sig do
          returns(
            Increase::RealTimeDecision::DigitalWalletAuthentication::DigitalWallet::TaggedSymbol
          )
        end
        attr_accessor :digital_wallet

        # The email to send the one-time passcode to if `channel` is equal to `email`.
        sig { returns(T.nilable(String)) }
        attr_accessor :email

        # The one-time passcode to send the card user.
        sig { returns(String) }
        attr_accessor :one_time_passcode

        # The phone number to send the one-time passcode to if `channel` is equal to
        # `sms`.
        sig { returns(T.nilable(String)) }
        attr_accessor :phone

        # Whether your application successfully delivered the one-time passcode.
        sig do
          returns(
            T.nilable(
              Increase::RealTimeDecision::DigitalWalletAuthentication::Result::TaggedSymbol
            )
          )
        end
        attr_accessor :result

        # Fields related to a digital wallet authentication attempt.
        sig do
          params(
            card_id: String,
            channel:
              Increase::RealTimeDecision::DigitalWalletAuthentication::Channel::OrSymbol,
            digital_wallet:
              Increase::RealTimeDecision::DigitalWalletAuthentication::DigitalWallet::OrSymbol,
            email: T.nilable(String),
            one_time_passcode: String,
            phone: T.nilable(String),
            result:
              T.nilable(
                Increase::RealTimeDecision::DigitalWalletAuthentication::Result::OrSymbol
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # The identifier of the Card that is being tokenized.
          card_id:,
          # The channel to send the card user their one-time passcode.
          channel:,
          # The digital wallet app being used.
          digital_wallet:,
          # The email to send the one-time passcode to if `channel` is equal to `email`.
          email:,
          # The one-time passcode to send the card user.
          one_time_passcode:,
          # The phone number to send the one-time passcode to if `channel` is equal to
          # `sms`.
          phone:,
          # Whether your application successfully delivered the one-time passcode.
          result:
        )
        end

        sig do
          override.returns(
            {
              card_id: String,
              channel:
                Increase::RealTimeDecision::DigitalWalletAuthentication::Channel::TaggedSymbol,
              digital_wallet:
                Increase::RealTimeDecision::DigitalWalletAuthentication::DigitalWallet::TaggedSymbol,
              email: T.nilable(String),
              one_time_passcode: String,
              phone: T.nilable(String),
              result:
                T.nilable(
                  Increase::RealTimeDecision::DigitalWalletAuthentication::Result::TaggedSymbol
                )
            }
          )
        end
        def to_hash
        end

        # The channel to send the card user their one-time passcode.
        module Channel
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::RealTimeDecision::DigitalWalletAuthentication::Channel
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Send one-time passcodes over SMS.
          SMS =
            T.let(
              :sms,
              Increase::RealTimeDecision::DigitalWalletAuthentication::Channel::TaggedSymbol
            )

          # Send one-time passcodes over email.
          EMAIL =
            T.let(
              :email,
              Increase::RealTimeDecision::DigitalWalletAuthentication::Channel::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::RealTimeDecision::DigitalWalletAuthentication::Channel::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # The digital wallet app being used.
        module DigitalWallet
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::RealTimeDecision::DigitalWalletAuthentication::DigitalWallet
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Apple Pay
          APPLE_PAY =
            T.let(
              :apple_pay,
              Increase::RealTimeDecision::DigitalWalletAuthentication::DigitalWallet::TaggedSymbol
            )

          # Google Pay
          GOOGLE_PAY =
            T.let(
              :google_pay,
              Increase::RealTimeDecision::DigitalWalletAuthentication::DigitalWallet::TaggedSymbol
            )

          # Samsung Pay
          SAMSUNG_PAY =
            T.let(
              :samsung_pay,
              Increase::RealTimeDecision::DigitalWalletAuthentication::DigitalWallet::TaggedSymbol
            )

          # Unknown
          UNKNOWN =
            T.let(
              :unknown,
              Increase::RealTimeDecision::DigitalWalletAuthentication::DigitalWallet::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::RealTimeDecision::DigitalWalletAuthentication::DigitalWallet::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # Whether your application successfully delivered the one-time passcode.
        module Result
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::RealTimeDecision::DigitalWalletAuthentication::Result
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Your application successfully delivered the one-time passcode to the cardholder.
          SUCCESS =
            T.let(
              :success,
              Increase::RealTimeDecision::DigitalWalletAuthentication::Result::TaggedSymbol
            )

          # Your application failed to deliver the one-time passcode to the cardholder.
          FAILURE =
            T.let(
              :failure,
              Increase::RealTimeDecision::DigitalWalletAuthentication::Result::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::RealTimeDecision::DigitalWalletAuthentication::Result::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class DigitalWalletToken < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::RealTimeDecision::DigitalWalletToken,
              Increase::Internal::AnyHash
            )
          end

        # The identifier of the Card that is being tokenized.
        sig { returns(String) }
        attr_accessor :card_id

        # Whether or not the provisioning request was approved. This will be null until
        # the real time decision is responded to.
        sig do
          returns(
            T.nilable(
              Increase::RealTimeDecision::DigitalWalletToken::Decision::TaggedSymbol
            )
          )
        end
        attr_accessor :decision

        # Device that is being used to provision the digital wallet token.
        sig { returns(Increase::RealTimeDecision::DigitalWalletToken::Device) }
        attr_reader :device

        sig do
          params(
            device:
              Increase::RealTimeDecision::DigitalWalletToken::Device::OrHash
          ).void
        end
        attr_writer :device

        # The digital wallet app being used.
        sig do
          returns(
            Increase::RealTimeDecision::DigitalWalletToken::DigitalWallet::TaggedSymbol
          )
        end
        attr_accessor :digital_wallet

        # Fields related to a digital wallet token provisioning attempt.
        sig do
          params(
            card_id: String,
            decision:
              T.nilable(
                Increase::RealTimeDecision::DigitalWalletToken::Decision::OrSymbol
              ),
            device:
              Increase::RealTimeDecision::DigitalWalletToken::Device::OrHash,
            digital_wallet:
              Increase::RealTimeDecision::DigitalWalletToken::DigitalWallet::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The identifier of the Card that is being tokenized.
          card_id:,
          # Whether or not the provisioning request was approved. This will be null until
          # the real time decision is responded to.
          decision:,
          # Device that is being used to provision the digital wallet token.
          device:,
          # The digital wallet app being used.
          digital_wallet:
        )
        end

        sig do
          override.returns(
            {
              card_id: String,
              decision:
                T.nilable(
                  Increase::RealTimeDecision::DigitalWalletToken::Decision::TaggedSymbol
                ),
              device: Increase::RealTimeDecision::DigitalWalletToken::Device,
              digital_wallet:
                Increase::RealTimeDecision::DigitalWalletToken::DigitalWallet::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # Whether or not the provisioning request was approved. This will be null until
        # the real time decision is responded to.
        module Decision
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::RealTimeDecision::DigitalWalletToken::Decision
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Approve the provisioning request.
          APPROVE =
            T.let(
              :approve,
              Increase::RealTimeDecision::DigitalWalletToken::Decision::TaggedSymbol
            )

          # Decline the provisioning request.
          DECLINE =
            T.let(
              :decline,
              Increase::RealTimeDecision::DigitalWalletToken::Decision::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::RealTimeDecision::DigitalWalletToken::Decision::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Device < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::RealTimeDecision::DigitalWalletToken::Device,
                Increase::Internal::AnyHash
              )
            end

          # ID assigned to the device by the digital wallet provider.
          sig { returns(T.nilable(String)) }
          attr_accessor :identifier

          # Device that is being used to provision the digital wallet token.
          sig do
            params(identifier: T.nilable(String)).returns(T.attached_class)
          end
          def self.new(
            # ID assigned to the device by the digital wallet provider.
            identifier:
          )
          end

          sig { override.returns({ identifier: T.nilable(String) }) }
          def to_hash
          end
        end

        # The digital wallet app being used.
        module DigitalWallet
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::RealTimeDecision::DigitalWalletToken::DigitalWallet
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Apple Pay
          APPLE_PAY =
            T.let(
              :apple_pay,
              Increase::RealTimeDecision::DigitalWalletToken::DigitalWallet::TaggedSymbol
            )

          # Google Pay
          GOOGLE_PAY =
            T.let(
              :google_pay,
              Increase::RealTimeDecision::DigitalWalletToken::DigitalWallet::TaggedSymbol
            )

          # Samsung Pay
          SAMSUNG_PAY =
            T.let(
              :samsung_pay,
              Increase::RealTimeDecision::DigitalWalletToken::DigitalWallet::TaggedSymbol
            )

          # Unknown
          UNKNOWN =
            T.let(
              :unknown,
              Increase::RealTimeDecision::DigitalWalletToken::DigitalWallet::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::RealTimeDecision::DigitalWalletToken::DigitalWallet::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # The status of the Real-Time Decision.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::RealTimeDecision::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The decision is pending action via real-time webhook.
        PENDING =
          T.let(:pending, Increase::RealTimeDecision::Status::TaggedSymbol)

        # Your webhook actioned the real-time decision.
        RESPONDED =
          T.let(:responded, Increase::RealTimeDecision::Status::TaggedSymbol)

        # Your webhook failed to respond to the authorization in time.
        TIMED_OUT =
          T.let(:timed_out, Increase::RealTimeDecision::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::RealTimeDecision::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `real_time_decision`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::RealTimeDecision::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        REAL_TIME_DECISION =
          T.let(
            :real_time_decision,
            Increase::RealTimeDecision::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::RealTimeDecision::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
