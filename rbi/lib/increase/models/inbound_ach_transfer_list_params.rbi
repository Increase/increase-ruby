# typed: strong

module Increase
  module Models
    class InboundACHTransferListParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      # Filter Inbound ACH Transfers to ones belonging to the specified Account.
      sig { returns(T.nilable(String)) }
      attr_reader :account_id

      sig { params(account_id: String).void }
      attr_writer :account_id

      # Filter Inbound ACH Transfers to ones belonging to the specified Account Number.
      sig { returns(T.nilable(String)) }
      attr_reader :account_number_id

      sig { params(account_number_id: String).void }
      attr_writer :account_number_id

      sig { returns(T.nilable(Increase::Models::InboundACHTransferListParams::CreatedAt)) }
      attr_reader :created_at

      sig do
        params(
          created_at: T.any(Increase::Models::InboundACHTransferListParams::CreatedAt, Increase::Internal::AnyHash)
        )
          .void
      end
      attr_writer :created_at

      # Return the page of entries after this one.
      sig { returns(T.nilable(String)) }
      attr_reader :cursor

      sig { params(cursor: String).void }
      attr_writer :cursor

      # Limit the size of the list that is returned. The default (and maximum) is 100
      #   objects.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      sig { returns(T.nilable(Increase::Models::InboundACHTransferListParams::Status)) }
      attr_reader :status

      sig do
        params(status: T.any(Increase::Models::InboundACHTransferListParams::Status, Increase::Internal::AnyHash))
          .void
      end
      attr_writer :status

      sig do
        params(
          account_id: String,
          account_number_id: String,
          created_at: T.any(Increase::Models::InboundACHTransferListParams::CreatedAt, Increase::Internal::AnyHash),
          cursor: String,
          limit: Integer,
          status: T.any(Increase::Models::InboundACHTransferListParams::Status, Increase::Internal::AnyHash),
          request_options: T.any(Increase::RequestOptions, Increase::Internal::AnyHash)
        )
          .returns(T.attached_class)
      end
      def self.new(
        account_id: nil,
        account_number_id: nil,
        created_at: nil,
        cursor: nil,
        limit: nil,
        status: nil,
        request_options: {}
      )
      end

      sig do
        override
          .returns(
            {
              account_id: String,
              account_number_id: String,
              created_at: Increase::Models::InboundACHTransferListParams::CreatedAt,
              cursor: String,
              limit: Integer,
              status: Increase::Models::InboundACHTransferListParams::Status,
              request_options: Increase::RequestOptions
            }
          )
      end
      def to_hash
      end

      class CreatedAt < Increase::Internal::Type::BaseModel
        # Return results after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
        #   timestamp.
        sig { returns(T.nilable(Time)) }
        attr_reader :after

        sig { params(after: Time).void }
        attr_writer :after

        # Return results before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
        #   timestamp.
        sig { returns(T.nilable(Time)) }
        attr_reader :before

        sig { params(before: Time).void }
        attr_writer :before

        # Return results on or after this
        #   [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
        sig { returns(T.nilable(Time)) }
        attr_reader :on_or_after

        sig { params(on_or_after: Time).void }
        attr_writer :on_or_after

        # Return results on or before this
        #   [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
        sig { returns(T.nilable(Time)) }
        attr_reader :on_or_before

        sig { params(on_or_before: Time).void }
        attr_writer :on_or_before

        sig do
          params(after: Time, before: Time, on_or_after: Time, on_or_before: Time).returns(T.attached_class)
        end
        def self.new(after: nil, before: nil, on_or_after: nil, on_or_before: nil)
        end

        sig { override.returns({after: Time, before: Time, on_or_after: Time, on_or_before: Time}) }
        def to_hash
        end
      end

      class Status < Increase::Internal::Type::BaseModel
        # Filter Inbound ACH Transfers to those with the specified status. For GET
        #   requests, this should be encoded as a comma-delimited string, such as
        #   `?in=one,two,three`.
        sig { returns(T.nilable(T::Array[Increase::Models::InboundACHTransferListParams::Status::In::OrSymbol])) }
        attr_reader :in_

        sig { params(in_: T::Array[Increase::Models::InboundACHTransferListParams::Status::In::OrSymbol]).void }
        attr_writer :in_

        sig do
          params(in_: T::Array[Increase::Models::InboundACHTransferListParams::Status::In::OrSymbol])
            .returns(T.attached_class)
        end
        def self.new(in_: nil)
        end

        sig { override.returns({in_: T::Array[Increase::Models::InboundACHTransferListParams::Status::In::OrSymbol]}) }
        def to_hash
        end

        module In
          extend Increase::Internal::Type::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::InboundACHTransferListParams::Status::In) }
          OrSymbol =
            T.type_alias { T.any(Symbol, String, Increase::Models::InboundACHTransferListParams::Status::In::TaggedSymbol) }

          # The Inbound ACH Transfer is awaiting action, will transition automatically if no action is taken.
          PENDING = T.let(:pending, Increase::Models::InboundACHTransferListParams::Status::In::TaggedSymbol)

          # The Inbound ACH Transfer has been declined.
          DECLINED = T.let(:declined, Increase::Models::InboundACHTransferListParams::Status::In::TaggedSymbol)

          # The Inbound ACH Transfer is accepted.
          ACCEPTED = T.let(:accepted, Increase::Models::InboundACHTransferListParams::Status::In::TaggedSymbol)

          # The Inbound ACH Transfer has been returned.
          RETURNED = T.let(:returned, Increase::Models::InboundACHTransferListParams::Status::In::TaggedSymbol)

          sig { override.returns(T::Array[Increase::Models::InboundACHTransferListParams::Status::In::TaggedSymbol]) }
          def self.values
          end
        end
      end
    end
  end
end
