# typed: strong

module Increase
  module Models
    class CheckTransferCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::CheckTransferCreateParams,
            Increase::Internal::AnyHash
          )
        end

      # The identifier for the account that will send the transfer.
      sig { returns(String) }
      attr_accessor :account_id

      # The transfer amount in USD cents.
      sig { returns(Integer) }
      attr_accessor :amount

      # Whether Increase will print and mail the check or if you will do it yourself.
      sig do
        returns(
          Increase::CheckTransferCreateParams::FulfillmentMethod::OrSymbol
        )
      end
      attr_accessor :fulfillment_method

      # The identifier of the Account Number from which to send the transfer and print
      # on the check.
      sig { returns(String) }
      attr_accessor :source_account_number_id

      # How the account's available balance should be checked. If omitted, the default
      # behavior is `balance_check: full`.
      sig do
        returns(
          T.nilable(Increase::CheckTransferCreateParams::BalanceCheck::OrSymbol)
        )
      end
      attr_reader :balance_check

      sig do
        params(
          balance_check:
            Increase::CheckTransferCreateParams::BalanceCheck::OrSymbol
        ).void
      end
      attr_writer :balance_check

      # The check number Increase should use for the check. This should not contain
      # leading zeroes and must be unique across the `source_account_number`. If this is
      # omitted, Increase will generate a check number for you.
      sig { returns(T.nilable(String)) }
      attr_reader :check_number

      sig { params(check_number: String).void }
      attr_writer :check_number

      # Details relating to the physical check that Increase will print and mail. This
      # is required if `fulfillment_method` is equal to `physical_check`. It must not be
      # included if any other `fulfillment_method` is provided.
      sig do
        returns(T.nilable(Increase::CheckTransferCreateParams::PhysicalCheck))
      end
      attr_reader :physical_check

      sig do
        params(
          physical_check:
            Increase::CheckTransferCreateParams::PhysicalCheck::OrHash
        ).void
      end
      attr_writer :physical_check

      # Whether the transfer requires explicit approval via the dashboard or API.
      sig { returns(T.nilable(T::Boolean)) }
      attr_reader :require_approval

      sig { params(require_approval: T::Boolean).void }
      attr_writer :require_approval

      # Details relating to the custom fulfillment you will perform. This is required if
      # `fulfillment_method` is equal to `third_party`. It must not be included if any
      # other `fulfillment_method` is provided.
      sig do
        returns(T.nilable(Increase::CheckTransferCreateParams::ThirdParty))
      end
      attr_reader :third_party

      sig do
        params(
          third_party: Increase::CheckTransferCreateParams::ThirdParty::OrHash
        ).void
      end
      attr_writer :third_party

      # If provided, the check will be valid on or before this date. After this date,
      # the check transfer will be automatically stopped and deposits will not be
      # accepted. For checks printed by Increase, this date is included on the check as
      # its expiry.
      sig { returns(T.nilable(Date)) }
      attr_reader :valid_until_date

      sig { params(valid_until_date: Date).void }
      attr_writer :valid_until_date

      sig do
        params(
          account_id: String,
          amount: Integer,
          fulfillment_method:
            Increase::CheckTransferCreateParams::FulfillmentMethod::OrSymbol,
          source_account_number_id: String,
          balance_check:
            Increase::CheckTransferCreateParams::BalanceCheck::OrSymbol,
          check_number: String,
          physical_check:
            Increase::CheckTransferCreateParams::PhysicalCheck::OrHash,
          require_approval: T::Boolean,
          third_party: Increase::CheckTransferCreateParams::ThirdParty::OrHash,
          valid_until_date: Date,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier for the account that will send the transfer.
        account_id:,
        # The transfer amount in USD cents.
        amount:,
        # Whether Increase will print and mail the check or if you will do it yourself.
        fulfillment_method:,
        # The identifier of the Account Number from which to send the transfer and print
        # on the check.
        source_account_number_id:,
        # How the account's available balance should be checked. If omitted, the default
        # behavior is `balance_check: full`.
        balance_check: nil,
        # The check number Increase should use for the check. This should not contain
        # leading zeroes and must be unique across the `source_account_number`. If this is
        # omitted, Increase will generate a check number for you.
        check_number: nil,
        # Details relating to the physical check that Increase will print and mail. This
        # is required if `fulfillment_method` is equal to `physical_check`. It must not be
        # included if any other `fulfillment_method` is provided.
        physical_check: nil,
        # Whether the transfer requires explicit approval via the dashboard or API.
        require_approval: nil,
        # Details relating to the custom fulfillment you will perform. This is required if
        # `fulfillment_method` is equal to `third_party`. It must not be included if any
        # other `fulfillment_method` is provided.
        third_party: nil,
        # If provided, the check will be valid on or before this date. After this date,
        # the check transfer will be automatically stopped and deposits will not be
        # accepted. For checks printed by Increase, this date is included on the check as
        # its expiry.
        valid_until_date: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            account_id: String,
            amount: Integer,
            fulfillment_method:
              Increase::CheckTransferCreateParams::FulfillmentMethod::OrSymbol,
            source_account_number_id: String,
            balance_check:
              Increase::CheckTransferCreateParams::BalanceCheck::OrSymbol,
            check_number: String,
            physical_check: Increase::CheckTransferCreateParams::PhysicalCheck,
            require_approval: T::Boolean,
            third_party: Increase::CheckTransferCreateParams::ThirdParty,
            valid_until_date: Date,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      # Whether Increase will print and mail the check or if you will do it yourself.
      module FulfillmentMethod
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              Increase::CheckTransferCreateParams::FulfillmentMethod
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # Increase will print and mail a physical check.
        PHYSICAL_CHECK =
          T.let(
            :physical_check,
            Increase::CheckTransferCreateParams::FulfillmentMethod::TaggedSymbol
          )

        # Increase will not print a check; you are responsible for printing and mailing a check with the provided account number, routing number, check number, and amount.
        THIRD_PARTY =
          T.let(
            :third_party,
            Increase::CheckTransferCreateParams::FulfillmentMethod::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Increase::CheckTransferCreateParams::FulfillmentMethod::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # How the account's available balance should be checked. If omitted, the default
      # behavior is `balance_check: full`.
      module BalanceCheck
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::CheckTransferCreateParams::BalanceCheck)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The available balance of the account must be at least the amount of the check, and a Pending Transaction will be created for the full amount. This is the default behavior if `balance_check` is omitted.
        FULL =
          T.let(
            :full,
            Increase::CheckTransferCreateParams::BalanceCheck::TaggedSymbol
          )

        # No balance check will performed when the check transfer is initiated. A zero-dollar Pending Transaction will be created. The balance will still be checked when the Inbound Check Deposit is created.
        NONE =
          T.let(
            :none,
            Increase::CheckTransferCreateParams::BalanceCheck::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Increase::CheckTransferCreateParams::BalanceCheck::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      class PhysicalCheck < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CheckTransferCreateParams::PhysicalCheck,
              Increase::Internal::AnyHash
            )
          end

        # Details for where Increase will mail the check.
        sig do
          returns(
            Increase::CheckTransferCreateParams::PhysicalCheck::MailingAddress
          )
        end
        attr_reader :mailing_address

        sig do
          params(
            mailing_address:
              Increase::CheckTransferCreateParams::PhysicalCheck::MailingAddress::OrHash
          ).void
        end
        attr_writer :mailing_address

        # The descriptor that will be printed on the memo field on the check.
        sig { returns(String) }
        attr_accessor :memo

        # The name that will be printed on the check in the 'To:' field.
        sig { returns(String) }
        attr_accessor :recipient_name

        # The ID of a File to be attached to the check. This must have
        # `purpose: check_attachment`. For details on pricing and restrictions, see
        # https://increase.com/documentation/originating-checks#printing-checks .
        sig { returns(T.nilable(String)) }
        attr_reader :attachment_file_id

        sig { params(attachment_file_id: String).void }
        attr_writer :attachment_file_id

        # The descriptor that will be printed on the letter included with the check.
        sig { returns(T.nilable(String)) }
        attr_reader :note

        sig { params(note: String).void }
        attr_writer :note

        # The payer of the check. This will be printed on the top-left portion of the
        # check and defaults to the return address if unspecified. This should be an array
        # of up to 4 elements, each of which represents a line of the payer.
        sig do
          returns(
            T.nilable(
              T::Array[
                Increase::CheckTransferCreateParams::PhysicalCheck::Payer
              ]
            )
          )
        end
        attr_reader :payer

        sig do
          params(
            payer:
              T::Array[
                Increase::CheckTransferCreateParams::PhysicalCheck::Payer::OrHash
              ]
          ).void
        end
        attr_writer :payer

        # The return address to be printed on the check. If omitted this will default to
        # an Increase-owned address that will mark checks as delivery failed and shred
        # them.
        sig do
          returns(
            T.nilable(
              Increase::CheckTransferCreateParams::PhysicalCheck::ReturnAddress
            )
          )
        end
        attr_reader :return_address

        sig do
          params(
            return_address:
              Increase::CheckTransferCreateParams::PhysicalCheck::ReturnAddress::OrHash
          ).void
        end
        attr_writer :return_address

        # How to ship the check. For details on pricing, timing, and restrictions, see
        # https://increase.com/documentation/originating-checks#printing-checks .
        sig do
          returns(
            T.nilable(
              Increase::CheckTransferCreateParams::PhysicalCheck::ShippingMethod::OrSymbol
            )
          )
        end
        attr_reader :shipping_method

        sig do
          params(
            shipping_method:
              Increase::CheckTransferCreateParams::PhysicalCheck::ShippingMethod::OrSymbol
          ).void
        end
        attr_writer :shipping_method

        # The text that will appear as the signature on the check in cursive font. If not
        # provided, the check will be printed with 'No signature required'.
        sig { returns(T.nilable(String)) }
        attr_reader :signature_text

        sig { params(signature_text: String).void }
        attr_writer :signature_text

        # Details relating to the physical check that Increase will print and mail. This
        # is required if `fulfillment_method` is equal to `physical_check`. It must not be
        # included if any other `fulfillment_method` is provided.
        sig do
          params(
            mailing_address:
              Increase::CheckTransferCreateParams::PhysicalCheck::MailingAddress::OrHash,
            memo: String,
            recipient_name: String,
            attachment_file_id: String,
            note: String,
            payer:
              T::Array[
                Increase::CheckTransferCreateParams::PhysicalCheck::Payer::OrHash
              ],
            return_address:
              Increase::CheckTransferCreateParams::PhysicalCheck::ReturnAddress::OrHash,
            shipping_method:
              Increase::CheckTransferCreateParams::PhysicalCheck::ShippingMethod::OrSymbol,
            signature_text: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Details for where Increase will mail the check.
          mailing_address:,
          # The descriptor that will be printed on the memo field on the check.
          memo:,
          # The name that will be printed on the check in the 'To:' field.
          recipient_name:,
          # The ID of a File to be attached to the check. This must have
          # `purpose: check_attachment`. For details on pricing and restrictions, see
          # https://increase.com/documentation/originating-checks#printing-checks .
          attachment_file_id: nil,
          # The descriptor that will be printed on the letter included with the check.
          note: nil,
          # The payer of the check. This will be printed on the top-left portion of the
          # check and defaults to the return address if unspecified. This should be an array
          # of up to 4 elements, each of which represents a line of the payer.
          payer: nil,
          # The return address to be printed on the check. If omitted this will default to
          # an Increase-owned address that will mark checks as delivery failed and shred
          # them.
          return_address: nil,
          # How to ship the check. For details on pricing, timing, and restrictions, see
          # https://increase.com/documentation/originating-checks#printing-checks .
          shipping_method: nil,
          # The text that will appear as the signature on the check in cursive font. If not
          # provided, the check will be printed with 'No signature required'.
          signature_text: nil
        )
        end

        sig do
          override.returns(
            {
              mailing_address:
                Increase::CheckTransferCreateParams::PhysicalCheck::MailingAddress,
              memo: String,
              recipient_name: String,
              attachment_file_id: String,
              note: String,
              payer:
                T::Array[
                  Increase::CheckTransferCreateParams::PhysicalCheck::Payer
                ],
              return_address:
                Increase::CheckTransferCreateParams::PhysicalCheck::ReturnAddress,
              shipping_method:
                Increase::CheckTransferCreateParams::PhysicalCheck::ShippingMethod::OrSymbol,
              signature_text: String
            }
          )
        end
        def to_hash
        end

        class MailingAddress < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CheckTransferCreateParams::PhysicalCheck::MailingAddress,
                Increase::Internal::AnyHash
              )
            end

          # The city component of the check's destination address.
          sig { returns(String) }
          attr_accessor :city

          # The first line of the address component of the check's destination address.
          sig { returns(String) }
          attr_accessor :line1

          # The postal code component of the check's destination address.
          sig { returns(String) }
          attr_accessor :postal_code

          # The US state component of the check's destination address.
          sig { returns(String) }
          attr_accessor :state

          # The second line of the address component of the check's destination address.
          sig { returns(T.nilable(String)) }
          attr_reader :line2

          sig { params(line2: String).void }
          attr_writer :line2

          # The name component of the check's destination address. Defaults to the provided
          # `recipient_name` parameter if `name` is not provided.
          sig { returns(T.nilable(String)) }
          attr_reader :name

          sig { params(name: String).void }
          attr_writer :name

          # Details for where Increase will mail the check.
          sig do
            params(
              city: String,
              line1: String,
              postal_code: String,
              state: String,
              line2: String,
              name: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The city component of the check's destination address.
            city:,
            # The first line of the address component of the check's destination address.
            line1:,
            # The postal code component of the check's destination address.
            postal_code:,
            # The US state component of the check's destination address.
            state:,
            # The second line of the address component of the check's destination address.
            line2: nil,
            # The name component of the check's destination address. Defaults to the provided
            # `recipient_name` parameter if `name` is not provided.
            name: nil
          )
          end

          sig do
            override.returns(
              {
                city: String,
                line1: String,
                postal_code: String,
                state: String,
                line2: String,
                name: String
              }
            )
          end
          def to_hash
          end
        end

        class Payer < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CheckTransferCreateParams::PhysicalCheck::Payer,
                Increase::Internal::AnyHash
              )
            end

          # The contents of the line.
          sig { returns(String) }
          attr_accessor :contents

          sig { params(contents: String).returns(T.attached_class) }
          def self.new(
            # The contents of the line.
            contents:
          )
          end

          sig { override.returns({ contents: String }) }
          def to_hash
          end
        end

        class ReturnAddress < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::CheckTransferCreateParams::PhysicalCheck::ReturnAddress,
                Increase::Internal::AnyHash
              )
            end

          # The city of the return address.
          sig { returns(String) }
          attr_accessor :city

          # The first line of the return address.
          sig { returns(String) }
          attr_accessor :line1

          # The name of the return address.
          sig { returns(String) }
          attr_accessor :name

          # The postal code of the return address.
          sig { returns(String) }
          attr_accessor :postal_code

          # The US state of the return address.
          sig { returns(String) }
          attr_accessor :state

          # The second line of the return address.
          sig { returns(T.nilable(String)) }
          attr_reader :line2

          sig { params(line2: String).void }
          attr_writer :line2

          # The return address to be printed on the check. If omitted this will default to
          # an Increase-owned address that will mark checks as delivery failed and shred
          # them.
          sig do
            params(
              city: String,
              line1: String,
              name: String,
              postal_code: String,
              state: String,
              line2: String
            ).returns(T.attached_class)
          end
          def self.new(
            # The city of the return address.
            city:,
            # The first line of the return address.
            line1:,
            # The name of the return address.
            name:,
            # The postal code of the return address.
            postal_code:,
            # The US state of the return address.
            state:,
            # The second line of the return address.
            line2: nil
          )
          end

          sig do
            override.returns(
              {
                city: String,
                line1: String,
                name: String,
                postal_code: String,
                state: String,
                line2: String
              }
            )
          end
          def to_hash
          end
        end

        # How to ship the check. For details on pricing, timing, and restrictions, see
        # https://increase.com/documentation/originating-checks#printing-checks .
        module ShippingMethod
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::CheckTransferCreateParams::PhysicalCheck::ShippingMethod
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # USPS First Class
          USPS_FIRST_CLASS =
            T.let(
              :usps_first_class,
              Increase::CheckTransferCreateParams::PhysicalCheck::ShippingMethod::TaggedSymbol
            )

          # FedEx Overnight
          FEDEX_OVERNIGHT =
            T.let(
              :fedex_overnight,
              Increase::CheckTransferCreateParams::PhysicalCheck::ShippingMethod::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::CheckTransferCreateParams::PhysicalCheck::ShippingMethod::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class ThirdParty < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CheckTransferCreateParams::ThirdParty,
              Increase::Internal::AnyHash
            )
          end

        # The pay-to name you will print on the check. If provided, this is used for
        # [Positive Pay](/documentation/positive-pay). If this is omitted, Increase will
        # be unable to validate the payer name when the check is deposited.
        sig { returns(T.nilable(String)) }
        attr_reader :recipient_name

        sig { params(recipient_name: String).void }
        attr_writer :recipient_name

        # Details relating to the custom fulfillment you will perform. This is required if
        # `fulfillment_method` is equal to `third_party`. It must not be included if any
        # other `fulfillment_method` is provided.
        sig { params(recipient_name: String).returns(T.attached_class) }
        def self.new(
          # The pay-to name you will print on the check. If provided, this is used for
          # [Positive Pay](/documentation/positive-pay). If this is omitted, Increase will
          # be unable to validate the payer name when the check is deposited.
          recipient_name: nil
        )
        end

        sig { override.returns({ recipient_name: String }) }
        def to_hash
        end
      end
    end
  end
end
