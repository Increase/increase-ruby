# typed: strong

module Increase
  module Models
    class PhysicalCheckBatchCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(
            Increase::PhysicalCheckBatchCreateParams,
            Increase::Internal::AnyHash
          )
        end

      # Details for where the parcel will be mailed.
      sig { returns(Increase::PhysicalCheckBatchCreateParams::MailingAddress) }
      attr_reader :mailing_address

      sig do
        params(
          mailing_address:
            Increase::PhysicalCheckBatchCreateParams::MailingAddress::OrHash
        ).void
      end
      attr_writer :mailing_address

      # Details for where the parcel should return if it is unable to be delivered.
      sig { returns(Increase::PhysicalCheckBatchCreateParams::ReturnAddress) }
      attr_reader :return_address

      sig do
        params(
          return_address:
            Increase::PhysicalCheckBatchCreateParams::ReturnAddress::OrHash
        ).void
      end
      attr_writer :return_address

      # How to ship the batch.
      #
      # Defaults to `usps_first_class`.
      sig do
        returns(
          T.nilable(
            Increase::PhysicalCheckBatchCreateParams::ShippingMethod::OrSymbol
          )
        )
      end
      attr_reader :shipping_method

      sig do
        params(
          shipping_method:
            Increase::PhysicalCheckBatchCreateParams::ShippingMethod::OrSymbol
        ).void
      end
      attr_writer :shipping_method

      sig do
        params(
          mailing_address:
            Increase::PhysicalCheckBatchCreateParams::MailingAddress::OrHash,
          return_address:
            Increase::PhysicalCheckBatchCreateParams::ReturnAddress::OrHash,
          shipping_method:
            Increase::PhysicalCheckBatchCreateParams::ShippingMethod::OrSymbol,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Details for where the parcel will be mailed.
        mailing_address:,
        # Details for where the parcel should return if it is unable to be delivered.
        return_address:,
        # How to ship the batch.
        #
        # Defaults to `usps_first_class`.
        shipping_method: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            mailing_address:
              Increase::PhysicalCheckBatchCreateParams::MailingAddress,
            return_address:
              Increase::PhysicalCheckBatchCreateParams::ReturnAddress,
            shipping_method:
              Increase::PhysicalCheckBatchCreateParams::ShippingMethod::OrSymbol,
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
              Increase::PhysicalCheckBatchCreateParams::MailingAddress,
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

        # The phone number used for delivery issues at the destination address. Only used
        # when `shipping_method` is `fedex_overnight`.
        sig { returns(T.nilable(String)) }
        attr_reader :phone

        sig { params(phone: String).void }
        attr_writer :phone

        # Details for where the parcel will be mailed.
        sig do
          params(
            city: String,
            line1: String,
            name: String,
            postal_code: String,
            state: String,
            line2: String,
            phone: String
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
          line2: nil,
          # The phone number used for delivery issues at the destination address. Only used
          # when `shipping_method` is `fedex_overnight`.
          phone: nil
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
              line2: String,
              phone: String
            }
          )
        end
        def to_hash
        end
      end

      class ReturnAddress < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::PhysicalCheckBatchCreateParams::ReturnAddress,
              Increase::Internal::AnyHash
            )
          end

        # The city of the return address.
        sig { returns(String) }
        attr_accessor :city

        # The first line of the return address.
        sig { returns(String) }
        attr_accessor :line1

        # The recipient at the return address.
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

        # The phone number used for delivery issues at the return address. Only used when
        # `shipping_method` is `fedex_overnight`.
        sig { returns(T.nilable(String)) }
        attr_reader :phone

        sig { params(phone: String).void }
        attr_writer :phone

        # Details for where the parcel should return if it is unable to be delivered.
        sig do
          params(
            city: String,
            line1: String,
            name: String,
            postal_code: String,
            state: String,
            line2: String,
            phone: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The city of the return address.
          city:,
          # The first line of the return address.
          line1:,
          # The recipient at the return address.
          name:,
          # The postal code of the return address.
          postal_code:,
          # The US state of the return address.
          state:,
          # The second line of the return address.
          line2: nil,
          # The phone number used for delivery issues at the return address. Only used when
          # `shipping_method` is `fedex_overnight`.
          phone: nil
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
              line2: String,
              phone: String
            }
          )
        end
        def to_hash
        end
      end

      # How to ship the batch.
      #
      # Defaults to `usps_first_class`.
      module ShippingMethod
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              Increase::PhysicalCheckBatchCreateParams::ShippingMethod
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # USPS First Class
        USPS_FIRST_CLASS =
          T.let(
            :usps_first_class,
            Increase::PhysicalCheckBatchCreateParams::ShippingMethod::TaggedSymbol
          )

        # FedEx Overnight
        FEDEX_OVERNIGHT =
          T.let(
            :fedex_overnight,
            Increase::PhysicalCheckBatchCreateParams::ShippingMethod::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Increase::PhysicalCheckBatchCreateParams::ShippingMethod::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
