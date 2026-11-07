# typed: strong

module Increase
  module Models
    class CheckbookCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Increase::CheckbookCreateParams, Increase::Internal::AnyHash)
        end

      # The identifier of the Account Number that the checks will draw from. The Account
      # Number must be active.
      sig { returns(String) }
      attr_accessor :account_number_id

      # The destination address that the Checkbook will be mailed to.
      sig { returns(Increase::CheckbookCreateParams::MailingAddress) }
      attr_reader :mailing_address

      sig do
        params(
          mailing_address:
            Increase::CheckbookCreateParams::MailingAddress::OrHash
        ).void
      end
      attr_writer :mailing_address

      # The payer of the checks. This will be printed on the top-left corner of each
      # check. This should be an array of up to 4 elements, each of which represents a
      # line of the payer.
      sig { returns(T::Array[Increase::CheckbookCreateParams::Payer]) }
      attr_accessor :payer

      sig do
        params(
          account_number_id: String,
          mailing_address:
            Increase::CheckbookCreateParams::MailingAddress::OrHash,
          payer: T::Array[Increase::CheckbookCreateParams::Payer::OrHash],
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The identifier of the Account Number that the checks will draw from. The Account
        # Number must be active.
        account_number_id:,
        # The destination address that the Checkbook will be mailed to.
        mailing_address:,
        # The payer of the checks. This will be printed on the top-left corner of each
        # check. This should be an array of up to 4 elements, each of which represents a
        # line of the payer.
        payer:,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            account_number_id: String,
            mailing_address: Increase::CheckbookCreateParams::MailingAddress,
            payer: T::Array[Increase::CheckbookCreateParams::Payer],
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      class MailingAddress < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CheckbookCreateParams::MailingAddress,
              Increase::Internal::AnyHash
            )
          end

        # The city of the destination address.
        sig { returns(String) }
        attr_accessor :city

        # The first line of the destination address.
        sig { returns(String) }
        attr_accessor :line1

        # The recipient at the destination address.
        sig { returns(String) }
        attr_accessor :name

        # The postal code of the destination address.
        sig { returns(String) }
        attr_accessor :postal_code

        # The US state of the destination address.
        sig { returns(String) }
        attr_accessor :state

        # The second line of the destination address.
        sig { returns(T.nilable(String)) }
        attr_reader :line2

        sig { params(line2: String).void }
        attr_writer :line2

        # The destination address that the Checkbook will be mailed to.
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
          # The city of the destination address.
          city:,
          # The first line of the destination address.
          line1:,
          # The recipient at the destination address.
          name:,
          # The postal code of the destination address.
          postal_code:,
          # The US state of the destination address.
          state:,
          # The second line of the destination address.
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

      class Payer < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::CheckbookCreateParams::Payer,
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
    end
  end
end
