# typed: strong

module Increase
  module Models
    class WireDrawdownRequest < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::WireDrawdownRequest, Increase::Internal::AnyHash)
        end

      # The Wire drawdown request identifier.
      sig { returns(String) }
      attr_accessor :id

      # The Account Number to which the debtor—the recipient of this request—is being
      # requested to send funds.
      sig { returns(String) }
      attr_accessor :account_number_id

      # The amount being requested in cents.
      sig { returns(Integer) }
      attr_accessor :amount

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      # the wire drawdown request was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # The creditor's address.
      sig { returns(Increase::WireDrawdownRequest::CreditorAddress) }
      attr_reader :creditor_address

      sig do
        params(
          creditor_address:
            Increase::WireDrawdownRequest::CreditorAddress::OrHash
        ).void
      end
      attr_writer :creditor_address

      # The creditor's name.
      sig { returns(String) }
      attr_accessor :creditor_name

      # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the amount being
      # requested. Will always be "USD".
      sig { returns(String) }
      attr_accessor :currency

      # The debtor's account number.
      sig { returns(String) }
      attr_accessor :debtor_account_number

      # The debtor's address.
      sig { returns(Increase::WireDrawdownRequest::DebtorAddress) }
      attr_reader :debtor_address

      sig do
        params(
          debtor_address: Increase::WireDrawdownRequest::DebtorAddress::OrHash
        ).void
      end
      attr_writer :debtor_address

      # The debtor's external account identifier.
      sig { returns(T.nilable(String)) }
      attr_accessor :debtor_external_account_id

      # The debtor's name.
      sig { returns(String) }
      attr_accessor :debtor_name

      # The debtor's routing number.
      sig { returns(String) }
      attr_accessor :debtor_routing_number

      # If the recipient fulfills the drawdown request by sending funds, then this will
      # be the identifier of the corresponding Transaction.
      sig { returns(T.nilable(String)) }
      attr_accessor :fulfillment_inbound_wire_transfer_id

      # The idempotency key you chose for this object. This value is unique across
      # Increase and is used to ensure that a request is only processed once. Learn more
      # about [idempotency](https://increase.com/documentation/idempotency-keys).
      sig { returns(T.nilable(String)) }
      attr_accessor :idempotency_key

      # The lifecycle status of the drawdown request.
      sig { returns(Increase::WireDrawdownRequest::Status::TaggedSymbol) }
      attr_accessor :status

      # After the drawdown request is submitted to Fedwire, this will contain
      # supplemental details.
      sig { returns(T.nilable(Increase::WireDrawdownRequest::Submission)) }
      attr_reader :submission

      sig do
        params(
          submission:
            T.nilable(Increase::WireDrawdownRequest::Submission::OrHash)
        ).void
      end
      attr_writer :submission

      # A constant representing the object's type. For this resource it will always be
      # `wire_drawdown_request`.
      sig { returns(Increase::WireDrawdownRequest::Type::TaggedSymbol) }
      attr_accessor :type

      # Remittance information the debtor will see as part of the drawdown request.
      sig { returns(String) }
      attr_accessor :unstructured_remittance_information

      # Wire drawdown requests enable you to request that someone else send you a wire.
      # Because there is nuance to making sure your counterparty's bank processes these
      # correctly, we ask that you reach out to
      # [support@increase.com](mailto:support@increase.com) to enable this feature so we
      # can help you plan your integration. For more information, see our
      # [Wire Drawdown Requests documentation](/documentation/wire-drawdown-requests).
      sig do
        params(
          id: String,
          account_number_id: String,
          amount: Integer,
          created_at: Time,
          creditor_address:
            Increase::WireDrawdownRequest::CreditorAddress::OrHash,
          creditor_name: String,
          currency: String,
          debtor_account_number: String,
          debtor_address: Increase::WireDrawdownRequest::DebtorAddress::OrHash,
          debtor_external_account_id: T.nilable(String),
          debtor_name: String,
          debtor_routing_number: String,
          fulfillment_inbound_wire_transfer_id: T.nilable(String),
          idempotency_key: T.nilable(String),
          status: Increase::WireDrawdownRequest::Status::OrSymbol,
          submission:
            T.nilable(Increase::WireDrawdownRequest::Submission::OrHash),
          type: Increase::WireDrawdownRequest::Type::OrSymbol,
          unstructured_remittance_information: String
        ).returns(T.attached_class)
      end
      def self.new(
        # The Wire drawdown request identifier.
        id:,
        # The Account Number to which the debtor—the recipient of this request—is being
        # requested to send funds.
        account_number_id:,
        # The amount being requested in cents.
        amount:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the wire drawdown request was created.
        created_at:,
        # The creditor's address.
        creditor_address:,
        # The creditor's name.
        creditor_name:,
        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) code for the amount being
        # requested. Will always be "USD".
        currency:,
        # The debtor's account number.
        debtor_account_number:,
        # The debtor's address.
        debtor_address:,
        # The debtor's external account identifier.
        debtor_external_account_id:,
        # The debtor's name.
        debtor_name:,
        # The debtor's routing number.
        debtor_routing_number:,
        # If the recipient fulfills the drawdown request by sending funds, then this will
        # be the identifier of the corresponding Transaction.
        fulfillment_inbound_wire_transfer_id:,
        # The idempotency key you chose for this object. This value is unique across
        # Increase and is used to ensure that a request is only processed once. Learn more
        # about [idempotency](https://increase.com/documentation/idempotency-keys).
        idempotency_key:,
        # The lifecycle status of the drawdown request.
        status:,
        # After the drawdown request is submitted to Fedwire, this will contain
        # supplemental details.
        submission:,
        # A constant representing the object's type. For this resource it will always be
        # `wire_drawdown_request`.
        type:,
        # Remittance information the debtor will see as part of the drawdown request.
        unstructured_remittance_information:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            account_number_id: String,
            amount: Integer,
            created_at: Time,
            creditor_address: Increase::WireDrawdownRequest::CreditorAddress,
            creditor_name: String,
            currency: String,
            debtor_account_number: String,
            debtor_address: Increase::WireDrawdownRequest::DebtorAddress,
            debtor_external_account_id: T.nilable(String),
            debtor_name: String,
            debtor_routing_number: String,
            fulfillment_inbound_wire_transfer_id: T.nilable(String),
            idempotency_key: T.nilable(String),
            status: Increase::WireDrawdownRequest::Status::TaggedSymbol,
            submission: T.nilable(Increase::WireDrawdownRequest::Submission),
            type: Increase::WireDrawdownRequest::Type::TaggedSymbol,
            unstructured_remittance_information: String
          }
        )
      end
      def to_hash
      end

      class CreditorAddress < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::WireDrawdownRequest::CreditorAddress,
              Increase::Internal::AnyHash
            )
          end

        # The city, district, town, or village of the address.
        sig { returns(String) }
        attr_accessor :city

        # The two-letter
        # [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) code for
        # the country of the address.
        sig { returns(String) }
        attr_accessor :country

        # The first line of the address.
        sig { returns(String) }
        attr_accessor :line1

        # The second line of the address.
        sig { returns(T.nilable(String)) }
        attr_accessor :line2

        # The ZIP code of the address.
        sig { returns(T.nilable(String)) }
        attr_accessor :postal_code

        # The address state.
        sig { returns(T.nilable(String)) }
        attr_accessor :state

        # The creditor's address.
        sig do
          params(
            city: String,
            country: String,
            line1: String,
            line2: T.nilable(String),
            postal_code: T.nilable(String),
            state: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # The city, district, town, or village of the address.
          city:,
          # The two-letter
          # [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) code for
          # the country of the address.
          country:,
          # The first line of the address.
          line1:,
          # The second line of the address.
          line2:,
          # The ZIP code of the address.
          postal_code:,
          # The address state.
          state:
        )
        end

        sig do
          override.returns(
            {
              city: String,
              country: String,
              line1: String,
              line2: T.nilable(String),
              postal_code: T.nilable(String),
              state: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end

      class DebtorAddress < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::WireDrawdownRequest::DebtorAddress,
              Increase::Internal::AnyHash
            )
          end

        # The city, district, town, or village of the address.
        sig { returns(String) }
        attr_accessor :city

        # The two-letter
        # [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) code for
        # the country of the address.
        sig { returns(String) }
        attr_accessor :country

        # The first line of the address.
        sig { returns(String) }
        attr_accessor :line1

        # The second line of the address.
        sig { returns(T.nilable(String)) }
        attr_accessor :line2

        # The ZIP code of the address.
        sig { returns(T.nilable(String)) }
        attr_accessor :postal_code

        # The address state.
        sig { returns(T.nilable(String)) }
        attr_accessor :state

        # The debtor's address.
        sig do
          params(
            city: String,
            country: String,
            line1: String,
            line2: T.nilable(String),
            postal_code: T.nilable(String),
            state: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # The city, district, town, or village of the address.
          city:,
          # The two-letter
          # [ISO 3166-1 alpha-2](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2) code for
          # the country of the address.
          country:,
          # The first line of the address.
          line1:,
          # The second line of the address.
          line2:,
          # The ZIP code of the address.
          postal_code:,
          # The address state.
          state:
        )
        end

        sig do
          override.returns(
            {
              city: String,
              country: String,
              line1: String,
              line2: T.nilable(String),
              postal_code: T.nilable(String),
              state: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end

      # The lifecycle status of the drawdown request.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::WireDrawdownRequest::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The drawdown request is queued to be submitted to Fedwire.
        PENDING_SUBMISSION =
          T.let(
            :pending_submission,
            Increase::WireDrawdownRequest::Status::TaggedSymbol
          )

        # The drawdown request has been sent and the recipient should respond in some way.
        PENDING_RESPONSE =
          T.let(
            :pending_response,
            Increase::WireDrawdownRequest::Status::TaggedSymbol
          )

        # The drawdown request has been fulfilled by the recipient.
        FULFILLED =
          T.let(:fulfilled, Increase::WireDrawdownRequest::Status::TaggedSymbol)

        # The drawdown request has been refused by the recipient.
        REFUSED =
          T.let(:refused, Increase::WireDrawdownRequest::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::WireDrawdownRequest::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class Submission < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::WireDrawdownRequest::Submission,
              Increase::Internal::AnyHash
            )
          end

        # The input message accountability data (IMAD) uniquely identifying the submission
        # with Fedwire.
        sig { returns(String) }
        attr_accessor :input_message_accountability_data

        # After the drawdown request is submitted to Fedwire, this will contain
        # supplemental details.
        sig do
          params(input_message_accountability_data: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # The input message accountability data (IMAD) uniquely identifying the submission
          # with Fedwire.
          input_message_accountability_data:
        )
        end

        sig { override.returns({ input_message_accountability_data: String }) }
        def to_hash
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `wire_drawdown_request`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::WireDrawdownRequest::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        WIRE_DRAWDOWN_REQUEST =
          T.let(
            :wire_drawdown_request,
            Increase::WireDrawdownRequest::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::WireDrawdownRequest::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
