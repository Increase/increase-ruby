# typed: strong

module Increase
  module Models
    class BookkeepingEntrySetCreateParams < Increase::Internal::Type::BaseModel
      extend Increase::Internal::Type::RequestParameters::Converter
      include Increase::Internal::Type::RequestParameters

      OrHash = T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

      # The bookkeeping entries.
      sig do
        returns(T::Array[Increase::BookkeepingEntrySetCreateParams::Entry])
      end
      attr_accessor :entries

      # The date of the transaction. Optional if `transaction_id` is provided, in which
      # case we use the `date` of that transaction. Required otherwise.
      sig { returns(T.nilable(Time)) }
      attr_reader :date

      sig { params(date: Time).void }
      attr_writer :date

      # The identifier of the Transaction related to this entry set, if any.
      sig { returns(T.nilable(String)) }
      attr_reader :transaction_id

      sig { params(transaction_id: String).void }
      attr_writer :transaction_id

      sig do
        params(
          entries:
            T::Array[Increase::BookkeepingEntrySetCreateParams::Entry::OrHash],
          date: Time,
          transaction_id: String,
          request_options: Increase::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # The bookkeeping entries.
        entries:,
        # The date of the transaction. Optional if `transaction_id` is provided, in which
        # case we use the `date` of that transaction. Required otherwise.
        date: nil,
        # The identifier of the Transaction related to this entry set, if any.
        transaction_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            entries: T::Array[Increase::BookkeepingEntrySetCreateParams::Entry],
            date: Time,
            transaction_id: String,
            request_options: Increase::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Entry < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias { T.any(T.self_type, Increase::Internal::AnyHash) }

        # The identifier for the Bookkeeping Account impacted by this entry.
        sig { returns(String) }
        attr_accessor :account_id

        # The entry amount in the minor unit of the account currency. For dollars, for
        # example, this is cents. Debit entries have positive amounts; credit entries have
        # negative amounts.
        sig { returns(Integer) }
        attr_accessor :amount

        sig do
          params(account_id: String, amount: Integer).returns(T.attached_class)
        end
        def self.new(
          # The identifier for the Bookkeeping Account impacted by this entry.
          account_id:,
          # The entry amount in the minor unit of the account currency. For dollars, for
          # example, this is cents. Debit entries have positive amounts; credit entries have
          # negative amounts.
          amount:
        )
        end

        sig { override.returns({ account_id: String, amount: Integer }) }
        def to_hash
        end
      end
    end
  end
end
