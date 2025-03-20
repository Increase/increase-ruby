# typed: strong

module Increase
  module Models
    class InboundACHTransferListParams < Increase::BaseModel
      extend Increase::RequestParameters::Converter
      include Increase::RequestParameters

      # Filter Inbound ACH Transfers to ones belonging to the specified Account.
      sig { returns(T.nilable(String)) }
      def account_id
      end

      sig { params(_: String).returns(String) }
      def account_id=(_)
      end

      # Filter Inbound ACH Transfers to ones belonging to the specified Account Number.
      sig { returns(T.nilable(String)) }
      def account_number_id
      end

      sig { params(_: String).returns(String) }
      def account_number_id=(_)
      end

      sig { returns(T.nilable(Increase::Models::InboundACHTransferListParams::CreatedAt)) }
      def created_at
      end

      sig do
        params(_: T.any(Increase::Models::InboundACHTransferListParams::CreatedAt, Increase::Util::AnyHash))
          .returns(T.any(Increase::Models::InboundACHTransferListParams::CreatedAt, Increase::Util::AnyHash))
      end
      def created_at=(_)
      end

      # Return the page of entries after this one.
      sig { returns(T.nilable(String)) }
      def cursor
      end

      sig { params(_: String).returns(String) }
      def cursor=(_)
      end

      # Limit the size of the list that is returned. The default (and maximum) is 100
      #   objects.
      sig { returns(T.nilable(Integer)) }
      def limit
      end

      sig { params(_: Integer).returns(Integer) }
      def limit=(_)
      end

      sig { returns(T.nilable(Increase::Models::InboundACHTransferListParams::Status)) }
      def status
      end

      sig do
        params(_: T.any(Increase::Models::InboundACHTransferListParams::Status, Increase::Util::AnyHash))
          .returns(T.any(Increase::Models::InboundACHTransferListParams::Status, Increase::Util::AnyHash))
      end
      def status=(_)
      end

      sig do
        params(
          account_id: String,
          account_number_id: String,
          created_at: Increase::Models::InboundACHTransferListParams::CreatedAt,
          cursor: String,
          limit: Integer,
          status: Increase::Models::InboundACHTransferListParams::Status,
          request_options: T.any(Increase::RequestOptions, T::Hash[Symbol, T.anything])
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

      class CreatedAt < Increase::BaseModel
        # Return results after this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
        #   timestamp.
        sig { returns(T.nilable(Time)) }
        def after
        end

        sig { params(_: Time).returns(Time) }
        def after=(_)
        end

        # Return results before this [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601)
        #   timestamp.
        sig { returns(T.nilable(Time)) }
        def before
        end

        sig { params(_: Time).returns(Time) }
        def before=(_)
        end

        # Return results on or after this
        #   [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
        sig { returns(T.nilable(Time)) }
        def on_or_after
        end

        sig { params(_: Time).returns(Time) }
        def on_or_after=(_)
        end

        # Return results on or before this
        #   [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) timestamp.
        sig { returns(T.nilable(Time)) }
        def on_or_before
        end

        sig { params(_: Time).returns(Time) }
        def on_or_before=(_)
        end

        sig do
          params(after: Time, before: Time, on_or_after: Time, on_or_before: Time).returns(T.attached_class)
        end
        def self.new(after: nil, before: nil, on_or_after: nil, on_or_before: nil)
        end

        sig { override.returns({after: Time, before: Time, on_or_after: Time, on_or_before: Time}) }
        def to_hash
        end
      end

      class Status < Increase::BaseModel
        # Filter Inbound ACH Transfers to those with the specified status. For GET
        #   requests, this should be encoded as a comma-delimited string, such as
        #   `?in=one,two,three`.
        sig { returns(T.nilable(T::Array[Increase::Models::InboundACHTransferListParams::Status::In::OrSymbol])) }
        def in_
        end

        sig do
          params(_: T::Array[Increase::Models::InboundACHTransferListParams::Status::In::OrSymbol])
            .returns(T::Array[Increase::Models::InboundACHTransferListParams::Status::In::OrSymbol])
        end
        def in_=(_)
        end

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
          extend Increase::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, Increase::Models::InboundACHTransferListParams::Status::In) }
          OrSymbol =
            T.type_alias { T.any(Symbol, Increase::Models::InboundACHTransferListParams::Status::In::TaggedSymbol) }

          # The Inbound ACH Transfer is awaiting action, will transition automatically if no action is taken.
          PENDING = T.let(:pending, Increase::Models::InboundACHTransferListParams::Status::In::TaggedSymbol)

          # The Inbound ACH Transfer has been declined.
          DECLINED = T.let(:declined, Increase::Models::InboundACHTransferListParams::Status::In::TaggedSymbol)

          # The Inbound ACH Transfer is accepted.
          ACCEPTED = T.let(:accepted, Increase::Models::InboundACHTransferListParams::Status::In::TaggedSymbol)

          # The Inbound ACH Transfer has been returned.
          RETURNED = T.let(:returned, Increase::Models::InboundACHTransferListParams::Status::In::TaggedSymbol)

          class << self
            sig { override.returns(T::Array[Increase::Models::InboundACHTransferListParams::Status::In::TaggedSymbol]) }
            def values
            end
          end
        end
      end
    end
  end
end
