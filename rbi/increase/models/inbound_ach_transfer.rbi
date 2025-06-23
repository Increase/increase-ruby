# typed: strong

module Increase
  module Models
    class InboundACHTransfer < Increase::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Increase::InboundACHTransfer, Increase::Internal::AnyHash)
        end

      # The inbound ACH transfer's identifier.
      sig { returns(String) }
      attr_accessor :id

      # If your transfer is accepted, this will contain details of the acceptance.
      sig { returns(T.nilable(Increase::InboundACHTransfer::Acceptance)) }
      attr_reader :acceptance

      sig do
        params(
          acceptance:
            T.nilable(Increase::InboundACHTransfer::Acceptance::OrHash)
        ).void
      end
      attr_writer :acceptance

      # The Account to which the transfer belongs.
      sig { returns(String) }
      attr_accessor :account_id

      # The identifier of the Account Number to which this transfer was sent.
      sig { returns(String) }
      attr_accessor :account_number_id

      # Additional information sent from the originator.
      sig { returns(T.nilable(Increase::InboundACHTransfer::Addenda)) }
      attr_reader :addenda

      sig do
        params(
          addenda: T.nilable(Increase::InboundACHTransfer::Addenda::OrHash)
        ).void
      end
      attr_writer :addenda

      # The transfer amount in USD cents.
      sig { returns(Integer) }
      attr_accessor :amount

      # The time at which the transfer will be automatically resolved.
      sig { returns(Time) }
      attr_accessor :automatically_resolves_at

      # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
      # the inbound ACH transfer was created.
      sig { returns(Time) }
      attr_accessor :created_at

      # If your transfer is declined, this will contain details of the decline.
      sig { returns(T.nilable(Increase::InboundACHTransfer::Decline)) }
      attr_reader :decline

      sig do
        params(
          decline: T.nilable(Increase::InboundACHTransfer::Decline::OrHash)
        ).void
      end
      attr_writer :decline

      # The direction of the transfer.
      sig { returns(Increase::InboundACHTransfer::Direction::TaggedSymbol) }
      attr_accessor :direction

      # The effective date of the transfer. This is sent by the sending bank and is a
      # factor in determining funds availability.
      sig { returns(Date) }
      attr_accessor :effective_date

      # If the Inbound ACH Transfer has a Standard Entry Class Code of IAT, this will
      # contain fields pertaining to the International ACH Transaction.
      sig do
        returns(T.nilable(Increase::InboundACHTransfer::InternationalAddenda))
      end
      attr_reader :international_addenda

      sig do
        params(
          international_addenda:
            T.nilable(
              Increase::InboundACHTransfer::InternationalAddenda::OrHash
            )
        ).void
      end
      attr_writer :international_addenda

      # If you initiate a notification of change in response to the transfer, this will
      # contain its details.
      sig do
        returns(T.nilable(Increase::InboundACHTransfer::NotificationOfChange))
      end
      attr_reader :notification_of_change

      sig do
        params(
          notification_of_change:
            T.nilable(
              Increase::InboundACHTransfer::NotificationOfChange::OrHash
            )
        ).void
      end
      attr_writer :notification_of_change

      # The descriptive date of the transfer.
      sig { returns(T.nilable(String)) }
      attr_accessor :originator_company_descriptive_date

      # The additional information included with the transfer.
      sig { returns(T.nilable(String)) }
      attr_accessor :originator_company_discretionary_data

      # The description of the transfer.
      sig { returns(String) }
      attr_accessor :originator_company_entry_description

      # The id of the company that initiated the transfer.
      sig { returns(String) }
      attr_accessor :originator_company_id

      # The name of the company that initiated the transfer.
      sig { returns(String) }
      attr_accessor :originator_company_name

      # The American Banking Association (ABA) routing number of the bank originating
      # the transfer.
      sig { returns(String) }
      attr_accessor :originator_routing_number

      # The id of the receiver of the transfer.
      sig { returns(T.nilable(String)) }
      attr_accessor :receiver_id_number

      # The name of the receiver of the transfer.
      sig { returns(T.nilable(String)) }
      attr_accessor :receiver_name

      # A subhash containing information about when and how the transfer settled at the
      # Federal Reserve.
      sig { returns(Increase::InboundACHTransfer::Settlement) }
      attr_reader :settlement

      sig do
        params(
          settlement: Increase::InboundACHTransfer::Settlement::OrHash
        ).void
      end
      attr_writer :settlement

      # The Standard Entry Class (SEC) code of the transfer.
      sig do
        returns(
          Increase::InboundACHTransfer::StandardEntryClassCode::TaggedSymbol
        )
      end
      attr_accessor :standard_entry_class_code

      # The status of the transfer.
      sig { returns(Increase::InboundACHTransfer::Status::TaggedSymbol) }
      attr_accessor :status

      # A 15 digit number set by the sending bank and transmitted to the receiving bank.
      # Along with the amount, date, and originating routing number, this can be used to
      # identify the ACH transfer. ACH trace numbers are not unique, but are
      # [used to correlate returns](https://increase.com/documentation/ach-returns#ach-returns).
      sig { returns(String) }
      attr_accessor :trace_number

      # If your transfer is returned, this will contain details of the return.
      sig { returns(T.nilable(Increase::InboundACHTransfer::TransferReturn)) }
      attr_reader :transfer_return

      sig do
        params(
          transfer_return:
            T.nilable(Increase::InboundACHTransfer::TransferReturn::OrHash)
        ).void
      end
      attr_writer :transfer_return

      # A constant representing the object's type. For this resource it will always be
      # `inbound_ach_transfer`.
      sig { returns(Increase::InboundACHTransfer::Type::TaggedSymbol) }
      attr_accessor :type

      # An Inbound ACH Transfer is an ACH transfer initiated outside of Increase to your
      # account.
      sig do
        params(
          id: String,
          acceptance:
            T.nilable(Increase::InboundACHTransfer::Acceptance::OrHash),
          account_id: String,
          account_number_id: String,
          addenda: T.nilable(Increase::InboundACHTransfer::Addenda::OrHash),
          amount: Integer,
          automatically_resolves_at: Time,
          created_at: Time,
          decline: T.nilable(Increase::InboundACHTransfer::Decline::OrHash),
          direction: Increase::InboundACHTransfer::Direction::OrSymbol,
          effective_date: Date,
          international_addenda:
            T.nilable(
              Increase::InboundACHTransfer::InternationalAddenda::OrHash
            ),
          notification_of_change:
            T.nilable(
              Increase::InboundACHTransfer::NotificationOfChange::OrHash
            ),
          originator_company_descriptive_date: T.nilable(String),
          originator_company_discretionary_data: T.nilable(String),
          originator_company_entry_description: String,
          originator_company_id: String,
          originator_company_name: String,
          originator_routing_number: String,
          receiver_id_number: T.nilable(String),
          receiver_name: T.nilable(String),
          settlement: Increase::InboundACHTransfer::Settlement::OrHash,
          standard_entry_class_code:
            Increase::InboundACHTransfer::StandardEntryClassCode::OrSymbol,
          status: Increase::InboundACHTransfer::Status::OrSymbol,
          trace_number: String,
          transfer_return:
            T.nilable(Increase::InboundACHTransfer::TransferReturn::OrHash),
          type: Increase::InboundACHTransfer::Type::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # The inbound ACH transfer's identifier.
        id:,
        # If your transfer is accepted, this will contain details of the acceptance.
        acceptance:,
        # The Account to which the transfer belongs.
        account_id:,
        # The identifier of the Account Number to which this transfer was sent.
        account_number_id:,
        # Additional information sent from the originator.
        addenda:,
        # The transfer amount in USD cents.
        amount:,
        # The time at which the transfer will be automatically resolved.
        automatically_resolves_at:,
        # The [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) date and time at which
        # the inbound ACH transfer was created.
        created_at:,
        # If your transfer is declined, this will contain details of the decline.
        decline:,
        # The direction of the transfer.
        direction:,
        # The effective date of the transfer. This is sent by the sending bank and is a
        # factor in determining funds availability.
        effective_date:,
        # If the Inbound ACH Transfer has a Standard Entry Class Code of IAT, this will
        # contain fields pertaining to the International ACH Transaction.
        international_addenda:,
        # If you initiate a notification of change in response to the transfer, this will
        # contain its details.
        notification_of_change:,
        # The descriptive date of the transfer.
        originator_company_descriptive_date:,
        # The additional information included with the transfer.
        originator_company_discretionary_data:,
        # The description of the transfer.
        originator_company_entry_description:,
        # The id of the company that initiated the transfer.
        originator_company_id:,
        # The name of the company that initiated the transfer.
        originator_company_name:,
        # The American Banking Association (ABA) routing number of the bank originating
        # the transfer.
        originator_routing_number:,
        # The id of the receiver of the transfer.
        receiver_id_number:,
        # The name of the receiver of the transfer.
        receiver_name:,
        # A subhash containing information about when and how the transfer settled at the
        # Federal Reserve.
        settlement:,
        # The Standard Entry Class (SEC) code of the transfer.
        standard_entry_class_code:,
        # The status of the transfer.
        status:,
        # A 15 digit number set by the sending bank and transmitted to the receiving bank.
        # Along with the amount, date, and originating routing number, this can be used to
        # identify the ACH transfer. ACH trace numbers are not unique, but are
        # [used to correlate returns](https://increase.com/documentation/ach-returns#ach-returns).
        trace_number:,
        # If your transfer is returned, this will contain details of the return.
        transfer_return:,
        # A constant representing the object's type. For this resource it will always be
        # `inbound_ach_transfer`.
        type:
      )
      end

      sig do
        override.returns(
          {
            id: String,
            acceptance: T.nilable(Increase::InboundACHTransfer::Acceptance),
            account_id: String,
            account_number_id: String,
            addenda: T.nilable(Increase::InboundACHTransfer::Addenda),
            amount: Integer,
            automatically_resolves_at: Time,
            created_at: Time,
            decline: T.nilable(Increase::InboundACHTransfer::Decline),
            direction: Increase::InboundACHTransfer::Direction::TaggedSymbol,
            effective_date: Date,
            international_addenda:
              T.nilable(Increase::InboundACHTransfer::InternationalAddenda),
            notification_of_change:
              T.nilable(Increase::InboundACHTransfer::NotificationOfChange),
            originator_company_descriptive_date: T.nilable(String),
            originator_company_discretionary_data: T.nilable(String),
            originator_company_entry_description: String,
            originator_company_id: String,
            originator_company_name: String,
            originator_routing_number: String,
            receiver_id_number: T.nilable(String),
            receiver_name: T.nilable(String),
            settlement: Increase::InboundACHTransfer::Settlement,
            standard_entry_class_code:
              Increase::InboundACHTransfer::StandardEntryClassCode::TaggedSymbol,
            status: Increase::InboundACHTransfer::Status::TaggedSymbol,
            trace_number: String,
            transfer_return:
              T.nilable(Increase::InboundACHTransfer::TransferReturn),
            type: Increase::InboundACHTransfer::Type::TaggedSymbol
          }
        )
      end
      def to_hash
      end

      class Acceptance < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::InboundACHTransfer::Acceptance,
              Increase::Internal::AnyHash
            )
          end

        # The time at which the transfer was accepted.
        sig { returns(Time) }
        attr_accessor :accepted_at

        # The id of the transaction for the accepted transfer.
        sig { returns(String) }
        attr_accessor :transaction_id

        # If your transfer is accepted, this will contain details of the acceptance.
        sig do
          params(accepted_at: Time, transaction_id: String).returns(
            T.attached_class
          )
        end
        def self.new(
          # The time at which the transfer was accepted.
          accepted_at:,
          # The id of the transaction for the accepted transfer.
          transaction_id:
        )
        end

        sig { override.returns({ accepted_at: Time, transaction_id: String }) }
        def to_hash
        end
      end

      class Addenda < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::InboundACHTransfer::Addenda,
              Increase::Internal::AnyHash
            )
          end

        # The type of addendum.
        sig do
          returns(Increase::InboundACHTransfer::Addenda::Category::TaggedSymbol)
        end
        attr_accessor :category

        # Unstructured `payment_related_information` passed through by the originator.
        sig do
          returns(T.nilable(Increase::InboundACHTransfer::Addenda::Freeform))
        end
        attr_reader :freeform

        sig do
          params(
            freeform:
              T.nilable(Increase::InboundACHTransfer::Addenda::Freeform::OrHash)
          ).void
        end
        attr_writer :freeform

        # Additional information sent from the originator.
        sig do
          params(
            category: Increase::InboundACHTransfer::Addenda::Category::OrSymbol,
            freeform:
              T.nilable(Increase::InboundACHTransfer::Addenda::Freeform::OrHash)
          ).returns(T.attached_class)
        end
        def self.new(
          # The type of addendum.
          category:,
          # Unstructured `payment_related_information` passed through by the originator.
          freeform:
        )
        end

        sig do
          override.returns(
            {
              category:
                Increase::InboundACHTransfer::Addenda::Category::TaggedSymbol,
              freeform:
                T.nilable(Increase::InboundACHTransfer::Addenda::Freeform)
            }
          )
        end
        def to_hash
        end

        # The type of addendum.
        module Category
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::InboundACHTransfer::Addenda::Category)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Unstructured addendum.
          FREEFORM =
            T.let(
              :freeform,
              Increase::InboundACHTransfer::Addenda::Category::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::InboundACHTransfer::Addenda::Category::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        class Freeform < Increase::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Increase::InboundACHTransfer::Addenda::Freeform,
                Increase::Internal::AnyHash
              )
            end

          # Each entry represents an addendum received from the originator.
          sig do
            returns(
              T::Array[Increase::InboundACHTransfer::Addenda::Freeform::Entry]
            )
          end
          attr_accessor :entries

          # Unstructured `payment_related_information` passed through by the originator.
          sig do
            params(
              entries:
                T::Array[
                  Increase::InboundACHTransfer::Addenda::Freeform::Entry::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(
            # Each entry represents an addendum received from the originator.
            entries:
          )
          end

          sig do
            override.returns(
              {
                entries:
                  T::Array[
                    Increase::InboundACHTransfer::Addenda::Freeform::Entry
                  ]
              }
            )
          end
          def to_hash
          end

          class Entry < Increase::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Increase::InboundACHTransfer::Addenda::Freeform::Entry,
                  Increase::Internal::AnyHash
                )
              end

            # The payment related information passed in the addendum.
            sig { returns(String) }
            attr_accessor :payment_related_information

            sig do
              params(payment_related_information: String).returns(
                T.attached_class
              )
            end
            def self.new(
              # The payment related information passed in the addendum.
              payment_related_information:
            )
            end

            sig { override.returns({ payment_related_information: String }) }
            def to_hash
            end
          end
        end
      end

      class Decline < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::InboundACHTransfer::Decline,
              Increase::Internal::AnyHash
            )
          end

        # The time at which the transfer was declined.
        sig { returns(Time) }
        attr_accessor :declined_at

        # The id of the transaction for the declined transfer.
        sig { returns(String) }
        attr_accessor :declined_transaction_id

        # The reason for the transfer decline.
        sig do
          returns(Increase::InboundACHTransfer::Decline::Reason::TaggedSymbol)
        end
        attr_accessor :reason

        # If your transfer is declined, this will contain details of the decline.
        sig do
          params(
            declined_at: Time,
            declined_transaction_id: String,
            reason: Increase::InboundACHTransfer::Decline::Reason::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The time at which the transfer was declined.
          declined_at:,
          # The id of the transaction for the declined transfer.
          declined_transaction_id:,
          # The reason for the transfer decline.
          reason:
        )
        end

        sig do
          override.returns(
            {
              declined_at: Time,
              declined_transaction_id: String,
              reason:
                Increase::InboundACHTransfer::Decline::Reason::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # The reason for the transfer decline.
        module Reason
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Increase::InboundACHTransfer::Decline::Reason)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The account number is canceled.
          ACH_ROUTE_CANCELED =
            T.let(
              :ach_route_canceled,
              Increase::InboundACHTransfer::Decline::Reason::TaggedSymbol
            )

          # The account number is disabled.
          ACH_ROUTE_DISABLED =
            T.let(
              :ach_route_disabled,
              Increase::InboundACHTransfer::Decline::Reason::TaggedSymbol
            )

          # The transaction would cause an Increase limit to be exceeded.
          BREACHES_LIMIT =
            T.let(
              :breaches_limit,
              Increase::InboundACHTransfer::Decline::Reason::TaggedSymbol
            )

          # The account's entity is not active.
          ENTITY_NOT_ACTIVE =
            T.let(
              :entity_not_active,
              Increase::InboundACHTransfer::Decline::Reason::TaggedSymbol
            )

          # Your account is inactive.
          GROUP_LOCKED =
            T.let(
              :group_locked,
              Increase::InboundACHTransfer::Decline::Reason::TaggedSymbol
            )

          # The transaction is not allowed per Increase's terms.
          TRANSACTION_NOT_ALLOWED =
            T.let(
              :transaction_not_allowed,
              Increase::InboundACHTransfer::Decline::Reason::TaggedSymbol
            )

          # Your integration declined this transfer via the API.
          USER_INITIATED =
            T.let(
              :user_initiated,
              Increase::InboundACHTransfer::Decline::Reason::TaggedSymbol
            )

          # Your account contains insufficient funds.
          INSUFFICIENT_FUNDS =
            T.let(
              :insufficient_funds,
              Increase::InboundACHTransfer::Decline::Reason::TaggedSymbol
            )

          # The originating financial institution asked for this transfer to be returned. The receiving bank is complying with the request.
          RETURNED_PER_ODFI_REQUEST =
            T.let(
              :returned_per_odfi_request,
              Increase::InboundACHTransfer::Decline::Reason::TaggedSymbol
            )

          # The customer no longer authorizes this transaction.
          AUTHORIZATION_REVOKED_BY_CUSTOMER =
            T.let(
              :authorization_revoked_by_customer,
              Increase::InboundACHTransfer::Decline::Reason::TaggedSymbol
            )

          # The customer asked for the payment to be stopped.
          PAYMENT_STOPPED =
            T.let(
              :payment_stopped,
              Increase::InboundACHTransfer::Decline::Reason::TaggedSymbol
            )

          # The customer advises that the debit was unauthorized.
          CUSTOMER_ADVISED_UNAUTHORIZED_IMPROPER_INELIGIBLE_OR_INCOMPLETE =
            T.let(
              :customer_advised_unauthorized_improper_ineligible_or_incomplete,
              Increase::InboundACHTransfer::Decline::Reason::TaggedSymbol
            )

          # The payee is deceased.
          REPRESENTATIVE_PAYEE_DECEASED_OR_UNABLE_TO_CONTINUE_IN_THAT_CAPACITY =
            T.let(
              :representative_payee_deceased_or_unable_to_continue_in_that_capacity,
              Increase::InboundACHTransfer::Decline::Reason::TaggedSymbol
            )

          # The account holder is deceased.
          BENEFICIARY_OR_ACCOUNT_HOLDER_DECEASED =
            T.let(
              :beneficiary_or_account_holder_deceased,
              Increase::InboundACHTransfer::Decline::Reason::TaggedSymbol
            )

          # The customer refused a credit entry.
          CREDIT_ENTRY_REFUSED_BY_RECEIVER =
            T.let(
              :credit_entry_refused_by_receiver,
              Increase::InboundACHTransfer::Decline::Reason::TaggedSymbol
            )

          # The account holder identified this transaction as a duplicate.
          DUPLICATE_ENTRY =
            T.let(
              :duplicate_entry,
              Increase::InboundACHTransfer::Decline::Reason::TaggedSymbol
            )

          # The corporate customer no longer authorizes this transaction.
          CORPORATE_CUSTOMER_ADVISED_NOT_AUTHORIZED =
            T.let(
              :corporate_customer_advised_not_authorized,
              Increase::InboundACHTransfer::Decline::Reason::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::InboundACHTransfer::Decline::Reason::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # The direction of the transfer.
      module Direction
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::InboundACHTransfer::Direction)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # Credit
        CREDIT =
          T.let(:credit, Increase::InboundACHTransfer::Direction::TaggedSymbol)

        # Debit
        DEBIT =
          T.let(:debit, Increase::InboundACHTransfer::Direction::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::InboundACHTransfer::Direction::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class InternationalAddenda < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::InboundACHTransfer::InternationalAddenda,
              Increase::Internal::AnyHash
            )
          end

        # The [ISO 3166](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2), Alpha-2
        # country code of the destination country.
        sig { returns(String) }
        attr_accessor :destination_country_code

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency code for the
        # destination bank account.
        sig { returns(String) }
        attr_accessor :destination_currency_code

        # A description of how the foreign exchange rate was calculated.
        sig do
          returns(
            Increase::InboundACHTransfer::InternationalAddenda::ForeignExchangeIndicator::TaggedSymbol
          )
        end
        attr_accessor :foreign_exchange_indicator

        # Depending on the `foreign_exchange_reference_indicator`, an exchange rate or a
        # reference to a well-known rate.
        sig { returns(T.nilable(String)) }
        attr_accessor :foreign_exchange_reference

        # An instruction of how to interpret the `foreign_exchange_reference` field for
        # this Transaction.
        sig do
          returns(
            Increase::InboundACHTransfer::InternationalAddenda::ForeignExchangeReferenceIndicator::TaggedSymbol
          )
        end
        attr_accessor :foreign_exchange_reference_indicator

        # The amount in the minor unit of the foreign payment currency. For dollars, for
        # example, this is cents.
        sig { returns(Integer) }
        attr_accessor :foreign_payment_amount

        # A reference number in the foreign banking infrastructure.
        sig { returns(T.nilable(String)) }
        attr_accessor :foreign_trace_number

        # The type of transfer. Set by the originator.
        sig do
          returns(
            Increase::InboundACHTransfer::InternationalAddenda::InternationalTransactionTypeCode::TaggedSymbol
          )
        end
        attr_accessor :international_transaction_type_code

        # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency code for the
        # originating bank account.
        sig { returns(String) }
        attr_accessor :originating_currency_code

        # The [ISO 3166](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2), Alpha-2
        # country code of the originating branch country.
        sig { returns(String) }
        attr_accessor :originating_depository_financial_institution_branch_country

        # An identifier for the originating bank. One of an International Bank Account
        # Number (IBAN) bank identifier, SWIFT Bank Identification Code (BIC), or a
        # domestic identifier like a US Routing Number.
        sig { returns(String) }
        attr_accessor :originating_depository_financial_institution_id

        # An instruction of how to interpret the
        # `originating_depository_financial_institution_id` field for this Transaction.
        sig do
          returns(
            Increase::InboundACHTransfer::InternationalAddenda::OriginatingDepositoryFinancialInstitutionIDQualifier::TaggedSymbol
          )
        end
        attr_accessor :originating_depository_financial_institution_id_qualifier

        # The name of the originating bank. Sometimes this will refer to an American bank
        # and obscure the correspondent foreign bank.
        sig { returns(String) }
        attr_accessor :originating_depository_financial_institution_name

        # A portion of the originator address. This may be incomplete.
        sig { returns(String) }
        attr_accessor :originator_city

        # A portion of the originator address. The
        # [ISO 3166](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2), Alpha-2 country
        # code of the originator country.
        sig { returns(String) }
        attr_accessor :originator_country

        # An identifier for the originating company. This is generally stable across
        # multiple ACH transfers.
        sig { returns(String) }
        attr_accessor :originator_identification

        # Either the name of the originator or an intermediary money transmitter.
        sig { returns(String) }
        attr_accessor :originator_name

        # A portion of the originator address. This may be incomplete.
        sig { returns(T.nilable(String)) }
        attr_accessor :originator_postal_code

        # A portion of the originator address. This may be incomplete.
        sig { returns(T.nilable(String)) }
        attr_accessor :originator_state_or_province

        # A portion of the originator address. This may be incomplete.
        sig { returns(String) }
        attr_accessor :originator_street_address

        # A description field set by the originator.
        sig { returns(T.nilable(String)) }
        attr_accessor :payment_related_information

        # A description field set by the originator.
        sig { returns(T.nilable(String)) }
        attr_accessor :payment_related_information2

        # A portion of the receiver address. This may be incomplete.
        sig { returns(String) }
        attr_accessor :receiver_city

        # A portion of the receiver address. The
        # [ISO 3166](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2), Alpha-2 country
        # code of the receiver country.
        sig { returns(String) }
        attr_accessor :receiver_country

        # An identification number the originator uses for the receiver.
        sig { returns(T.nilable(String)) }
        attr_accessor :receiver_identification_number

        # A portion of the receiver address. This may be incomplete.
        sig { returns(T.nilable(String)) }
        attr_accessor :receiver_postal_code

        # A portion of the receiver address. This may be incomplete.
        sig { returns(T.nilable(String)) }
        attr_accessor :receiver_state_or_province

        # A portion of the receiver address. This may be incomplete.
        sig { returns(String) }
        attr_accessor :receiver_street_address

        # The name of the receiver of the transfer. This is not verified by Increase.
        sig { returns(String) }
        attr_accessor :receiving_company_or_individual_name

        # The [ISO 3166](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2), Alpha-2
        # country code of the receiving bank country.
        sig { returns(String) }
        attr_accessor :receiving_depository_financial_institution_country

        # An identifier for the receiving bank. One of an International Bank Account
        # Number (IBAN) bank identifier, SWIFT Bank Identification Code (BIC), or a
        # domestic identifier like a US Routing Number.
        sig { returns(String) }
        attr_accessor :receiving_depository_financial_institution_id

        # An instruction of how to interpret the
        # `receiving_depository_financial_institution_id` field for this Transaction.
        sig do
          returns(
            Increase::InboundACHTransfer::InternationalAddenda::ReceivingDepositoryFinancialInstitutionIDQualifier::TaggedSymbol
          )
        end
        attr_accessor :receiving_depository_financial_institution_id_qualifier

        # The name of the receiving bank, as set by the sending financial institution.
        sig { returns(String) }
        attr_accessor :receiving_depository_financial_institution_name

        # If the Inbound ACH Transfer has a Standard Entry Class Code of IAT, this will
        # contain fields pertaining to the International ACH Transaction.
        sig do
          params(
            destination_country_code: String,
            destination_currency_code: String,
            foreign_exchange_indicator:
              Increase::InboundACHTransfer::InternationalAddenda::ForeignExchangeIndicator::OrSymbol,
            foreign_exchange_reference: T.nilable(String),
            foreign_exchange_reference_indicator:
              Increase::InboundACHTransfer::InternationalAddenda::ForeignExchangeReferenceIndicator::OrSymbol,
            foreign_payment_amount: Integer,
            foreign_trace_number: T.nilable(String),
            international_transaction_type_code:
              Increase::InboundACHTransfer::InternationalAddenda::InternationalTransactionTypeCode::OrSymbol,
            originating_currency_code: String,
            originating_depository_financial_institution_branch_country: String,
            originating_depository_financial_institution_id: String,
            originating_depository_financial_institution_id_qualifier:
              Increase::InboundACHTransfer::InternationalAddenda::OriginatingDepositoryFinancialInstitutionIDQualifier::OrSymbol,
            originating_depository_financial_institution_name: String,
            originator_city: String,
            originator_country: String,
            originator_identification: String,
            originator_name: String,
            originator_postal_code: T.nilable(String),
            originator_state_or_province: T.nilable(String),
            originator_street_address: String,
            payment_related_information: T.nilable(String),
            payment_related_information2: T.nilable(String),
            receiver_city: String,
            receiver_country: String,
            receiver_identification_number: T.nilable(String),
            receiver_postal_code: T.nilable(String),
            receiver_state_or_province: T.nilable(String),
            receiver_street_address: String,
            receiving_company_or_individual_name: String,
            receiving_depository_financial_institution_country: String,
            receiving_depository_financial_institution_id: String,
            receiving_depository_financial_institution_id_qualifier:
              Increase::InboundACHTransfer::InternationalAddenda::ReceivingDepositoryFinancialInstitutionIDQualifier::OrSymbol,
            receiving_depository_financial_institution_name: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The [ISO 3166](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2), Alpha-2
          # country code of the destination country.
          destination_country_code:,
          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency code for the
          # destination bank account.
          destination_currency_code:,
          # A description of how the foreign exchange rate was calculated.
          foreign_exchange_indicator:,
          # Depending on the `foreign_exchange_reference_indicator`, an exchange rate or a
          # reference to a well-known rate.
          foreign_exchange_reference:,
          # An instruction of how to interpret the `foreign_exchange_reference` field for
          # this Transaction.
          foreign_exchange_reference_indicator:,
          # The amount in the minor unit of the foreign payment currency. For dollars, for
          # example, this is cents.
          foreign_payment_amount:,
          # A reference number in the foreign banking infrastructure.
          foreign_trace_number:,
          # The type of transfer. Set by the originator.
          international_transaction_type_code:,
          # The [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) currency code for the
          # originating bank account.
          originating_currency_code:,
          # The [ISO 3166](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2), Alpha-2
          # country code of the originating branch country.
          originating_depository_financial_institution_branch_country:,
          # An identifier for the originating bank. One of an International Bank Account
          # Number (IBAN) bank identifier, SWIFT Bank Identification Code (BIC), or a
          # domestic identifier like a US Routing Number.
          originating_depository_financial_institution_id:,
          # An instruction of how to interpret the
          # `originating_depository_financial_institution_id` field for this Transaction.
          originating_depository_financial_institution_id_qualifier:,
          # The name of the originating bank. Sometimes this will refer to an American bank
          # and obscure the correspondent foreign bank.
          originating_depository_financial_institution_name:,
          # A portion of the originator address. This may be incomplete.
          originator_city:,
          # A portion of the originator address. The
          # [ISO 3166](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2), Alpha-2 country
          # code of the originator country.
          originator_country:,
          # An identifier for the originating company. This is generally stable across
          # multiple ACH transfers.
          originator_identification:,
          # Either the name of the originator or an intermediary money transmitter.
          originator_name:,
          # A portion of the originator address. This may be incomplete.
          originator_postal_code:,
          # A portion of the originator address. This may be incomplete.
          originator_state_or_province:,
          # A portion of the originator address. This may be incomplete.
          originator_street_address:,
          # A description field set by the originator.
          payment_related_information:,
          # A description field set by the originator.
          payment_related_information2:,
          # A portion of the receiver address. This may be incomplete.
          receiver_city:,
          # A portion of the receiver address. The
          # [ISO 3166](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2), Alpha-2 country
          # code of the receiver country.
          receiver_country:,
          # An identification number the originator uses for the receiver.
          receiver_identification_number:,
          # A portion of the receiver address. This may be incomplete.
          receiver_postal_code:,
          # A portion of the receiver address. This may be incomplete.
          receiver_state_or_province:,
          # A portion of the receiver address. This may be incomplete.
          receiver_street_address:,
          # The name of the receiver of the transfer. This is not verified by Increase.
          receiving_company_or_individual_name:,
          # The [ISO 3166](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2), Alpha-2
          # country code of the receiving bank country.
          receiving_depository_financial_institution_country:,
          # An identifier for the receiving bank. One of an International Bank Account
          # Number (IBAN) bank identifier, SWIFT Bank Identification Code (BIC), or a
          # domestic identifier like a US Routing Number.
          receiving_depository_financial_institution_id:,
          # An instruction of how to interpret the
          # `receiving_depository_financial_institution_id` field for this Transaction.
          receiving_depository_financial_institution_id_qualifier:,
          # The name of the receiving bank, as set by the sending financial institution.
          receiving_depository_financial_institution_name:
        )
        end

        sig do
          override.returns(
            {
              destination_country_code: String,
              destination_currency_code: String,
              foreign_exchange_indicator:
                Increase::InboundACHTransfer::InternationalAddenda::ForeignExchangeIndicator::TaggedSymbol,
              foreign_exchange_reference: T.nilable(String),
              foreign_exchange_reference_indicator:
                Increase::InboundACHTransfer::InternationalAddenda::ForeignExchangeReferenceIndicator::TaggedSymbol,
              foreign_payment_amount: Integer,
              foreign_trace_number: T.nilable(String),
              international_transaction_type_code:
                Increase::InboundACHTransfer::InternationalAddenda::InternationalTransactionTypeCode::TaggedSymbol,
              originating_currency_code: String,
              originating_depository_financial_institution_branch_country:
                String,
              originating_depository_financial_institution_id: String,
              originating_depository_financial_institution_id_qualifier:
                Increase::InboundACHTransfer::InternationalAddenda::OriginatingDepositoryFinancialInstitutionIDQualifier::TaggedSymbol,
              originating_depository_financial_institution_name: String,
              originator_city: String,
              originator_country: String,
              originator_identification: String,
              originator_name: String,
              originator_postal_code: T.nilable(String),
              originator_state_or_province: T.nilable(String),
              originator_street_address: String,
              payment_related_information: T.nilable(String),
              payment_related_information2: T.nilable(String),
              receiver_city: String,
              receiver_country: String,
              receiver_identification_number: T.nilable(String),
              receiver_postal_code: T.nilable(String),
              receiver_state_or_province: T.nilable(String),
              receiver_street_address: String,
              receiving_company_or_individual_name: String,
              receiving_depository_financial_institution_country: String,
              receiving_depository_financial_institution_id: String,
              receiving_depository_financial_institution_id_qualifier:
                Increase::InboundACHTransfer::InternationalAddenda::ReceivingDepositoryFinancialInstitutionIDQualifier::TaggedSymbol,
              receiving_depository_financial_institution_name: String
            }
          )
        end
        def to_hash
        end

        # A description of how the foreign exchange rate was calculated.
        module ForeignExchangeIndicator
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::InboundACHTransfer::InternationalAddenda::ForeignExchangeIndicator
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The originator chose an amount in their own currency. The settled amount in USD was converted using the exchange rate.
          FIXED_TO_VARIABLE =
            T.let(
              :fixed_to_variable,
              Increase::InboundACHTransfer::InternationalAddenda::ForeignExchangeIndicator::TaggedSymbol
            )

          # The originator chose an amount to settle in USD. The originator's amount was variable; known only after the foreign exchange conversion.
          VARIABLE_TO_FIXED =
            T.let(
              :variable_to_fixed,
              Increase::InboundACHTransfer::InternationalAddenda::ForeignExchangeIndicator::TaggedSymbol
            )

          # The amount was originated and settled as a fixed amount in USD. There is no foreign exchange conversion.
          FIXED_TO_FIXED =
            T.let(
              :fixed_to_fixed,
              Increase::InboundACHTransfer::InternationalAddenda::ForeignExchangeIndicator::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::InboundACHTransfer::InternationalAddenda::ForeignExchangeIndicator::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # An instruction of how to interpret the `foreign_exchange_reference` field for
        # this Transaction.
        module ForeignExchangeReferenceIndicator
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::InboundACHTransfer::InternationalAddenda::ForeignExchangeReferenceIndicator
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The ACH file contains a foreign exchange rate.
          FOREIGN_EXCHANGE_RATE =
            T.let(
              :foreign_exchange_rate,
              Increase::InboundACHTransfer::InternationalAddenda::ForeignExchangeReferenceIndicator::TaggedSymbol
            )

          # The ACH file contains a reference to a well-known foreign exchange rate.
          FOREIGN_EXCHANGE_REFERENCE_NUMBER =
            T.let(
              :foreign_exchange_reference_number,
              Increase::InboundACHTransfer::InternationalAddenda::ForeignExchangeReferenceIndicator::TaggedSymbol
            )

          # There is no foreign exchange for this transfer, so the `foreign_exchange_reference` field is blank.
          BLANK =
            T.let(
              :blank,
              Increase::InboundACHTransfer::InternationalAddenda::ForeignExchangeReferenceIndicator::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::InboundACHTransfer::InternationalAddenda::ForeignExchangeReferenceIndicator::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # The type of transfer. Set by the originator.
        module InternationalTransactionTypeCode
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::InboundACHTransfer::InternationalAddenda::InternationalTransactionTypeCode
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # Sent as `ANN` in the Nacha file.
          ANNUITY =
            T.let(
              :annuity,
              Increase::InboundACHTransfer::InternationalAddenda::InternationalTransactionTypeCode::TaggedSymbol
            )

          # Sent as `BUS` in the Nacha file.
          BUSINESS_OR_COMMERCIAL =
            T.let(
              :business_or_commercial,
              Increase::InboundACHTransfer::InternationalAddenda::InternationalTransactionTypeCode::TaggedSymbol
            )

          # Sent as `DEP` in the Nacha file.
          DEPOSIT =
            T.let(
              :deposit,
              Increase::InboundACHTransfer::InternationalAddenda::InternationalTransactionTypeCode::TaggedSymbol
            )

          # Sent as `LOA` in the Nacha file.
          LOAN =
            T.let(
              :loan,
              Increase::InboundACHTransfer::InternationalAddenda::InternationalTransactionTypeCode::TaggedSymbol
            )

          # Sent as `MIS` in the Nacha file.
          MISCELLANEOUS =
            T.let(
              :miscellaneous,
              Increase::InboundACHTransfer::InternationalAddenda::InternationalTransactionTypeCode::TaggedSymbol
            )

          # Sent as `MOR` in the Nacha file.
          MORTGAGE =
            T.let(
              :mortgage,
              Increase::InboundACHTransfer::InternationalAddenda::InternationalTransactionTypeCode::TaggedSymbol
            )

          # Sent as `PEN` in the Nacha file.
          PENSION =
            T.let(
              :pension,
              Increase::InboundACHTransfer::InternationalAddenda::InternationalTransactionTypeCode::TaggedSymbol
            )

          # Sent as `REM` in the Nacha file.
          REMITTANCE =
            T.let(
              :remittance,
              Increase::InboundACHTransfer::InternationalAddenda::InternationalTransactionTypeCode::TaggedSymbol
            )

          # Sent as `RLS` in the Nacha file.
          RENT_OR_LEASE =
            T.let(
              :rent_or_lease,
              Increase::InboundACHTransfer::InternationalAddenda::InternationalTransactionTypeCode::TaggedSymbol
            )

          # Sent as `SAL` in the Nacha file.
          SALARY_OR_PAYROLL =
            T.let(
              :salary_or_payroll,
              Increase::InboundACHTransfer::InternationalAddenda::InternationalTransactionTypeCode::TaggedSymbol
            )

          # Sent as `TAX` in the Nacha file.
          TAX =
            T.let(
              :tax,
              Increase::InboundACHTransfer::InternationalAddenda::InternationalTransactionTypeCode::TaggedSymbol
            )

          # Sent as `ARC` in the Nacha file.
          ACCOUNTS_RECEIVABLE =
            T.let(
              :accounts_receivable,
              Increase::InboundACHTransfer::InternationalAddenda::InternationalTransactionTypeCode::TaggedSymbol
            )

          # Sent as `BOC` in the Nacha file.
          BACK_OFFICE_CONVERSION =
            T.let(
              :back_office_conversion,
              Increase::InboundACHTransfer::InternationalAddenda::InternationalTransactionTypeCode::TaggedSymbol
            )

          # Sent as `MTE` in the Nacha file.
          MACHINE_TRANSFER =
            T.let(
              :machine_transfer,
              Increase::InboundACHTransfer::InternationalAddenda::InternationalTransactionTypeCode::TaggedSymbol
            )

          # Sent as `POP` in the Nacha file.
          POINT_OF_PURCHASE =
            T.let(
              :point_of_purchase,
              Increase::InboundACHTransfer::InternationalAddenda::InternationalTransactionTypeCode::TaggedSymbol
            )

          # Sent as `POS` in the Nacha file.
          POINT_OF_SALE =
            T.let(
              :point_of_sale,
              Increase::InboundACHTransfer::InternationalAddenda::InternationalTransactionTypeCode::TaggedSymbol
            )

          # Sent as `RCK` in the Nacha file.
          REPRESENTED_CHECK =
            T.let(
              :represented_check,
              Increase::InboundACHTransfer::InternationalAddenda::InternationalTransactionTypeCode::TaggedSymbol
            )

          # Sent as `SHR` in the Nacha file.
          SHARED_NETWORK_TRANSACTION =
            T.let(
              :shared_network_transaction,
              Increase::InboundACHTransfer::InternationalAddenda::InternationalTransactionTypeCode::TaggedSymbol
            )

          # Sent as `TEL` in the Nacha file.
          TELPHONE_INITIATED =
            T.let(
              :telphone_initiated,
              Increase::InboundACHTransfer::InternationalAddenda::InternationalTransactionTypeCode::TaggedSymbol
            )

          # Sent as `WEB` in the Nacha file.
          INTERNET_INITIATED =
            T.let(
              :internet_initiated,
              Increase::InboundACHTransfer::InternationalAddenda::InternationalTransactionTypeCode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::InboundACHTransfer::InternationalAddenda::InternationalTransactionTypeCode::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # An instruction of how to interpret the
        # `originating_depository_financial_institution_id` field for this Transaction.
        module OriginatingDepositoryFinancialInstitutionIDQualifier
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::InboundACHTransfer::InternationalAddenda::OriginatingDepositoryFinancialInstitutionIDQualifier
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # A domestic clearing system number. In the US, for example, this is the American Banking Association (ABA) routing number.
          NATIONAL_CLEARING_SYSTEM_NUMBER =
            T.let(
              :national_clearing_system_number,
              Increase::InboundACHTransfer::InternationalAddenda::OriginatingDepositoryFinancialInstitutionIDQualifier::TaggedSymbol
            )

          # The SWIFT Bank Identifier Code (BIC) of the bank.
          BIC_CODE =
            T.let(
              :bic_code,
              Increase::InboundACHTransfer::InternationalAddenda::OriginatingDepositoryFinancialInstitutionIDQualifier::TaggedSymbol
            )

          # An International Bank Account Number.
          IBAN =
            T.let(
              :iban,
              Increase::InboundACHTransfer::InternationalAddenda::OriginatingDepositoryFinancialInstitutionIDQualifier::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::InboundACHTransfer::InternationalAddenda::OriginatingDepositoryFinancialInstitutionIDQualifier::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        # An instruction of how to interpret the
        # `receiving_depository_financial_institution_id` field for this Transaction.
        module ReceivingDepositoryFinancialInstitutionIDQualifier
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::InboundACHTransfer::InternationalAddenda::ReceivingDepositoryFinancialInstitutionIDQualifier
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # A domestic clearing system number. In the US, for example, this is the American Banking Association (ABA) routing number.
          NATIONAL_CLEARING_SYSTEM_NUMBER =
            T.let(
              :national_clearing_system_number,
              Increase::InboundACHTransfer::InternationalAddenda::ReceivingDepositoryFinancialInstitutionIDQualifier::TaggedSymbol
            )

          # The SWIFT Bank Identifier Code (BIC) of the bank.
          BIC_CODE =
            T.let(
              :bic_code,
              Increase::InboundACHTransfer::InternationalAddenda::ReceivingDepositoryFinancialInstitutionIDQualifier::TaggedSymbol
            )

          # An International Bank Account Number.
          IBAN =
            T.let(
              :iban,
              Increase::InboundACHTransfer::InternationalAddenda::ReceivingDepositoryFinancialInstitutionIDQualifier::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::InboundACHTransfer::InternationalAddenda::ReceivingDepositoryFinancialInstitutionIDQualifier::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      class NotificationOfChange < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::InboundACHTransfer::NotificationOfChange,
              Increase::Internal::AnyHash
            )
          end

        # The new account number provided in the notification of change.
        sig { returns(T.nilable(String)) }
        attr_accessor :updated_account_number

        # The new account number provided in the notification of change.
        sig { returns(T.nilable(String)) }
        attr_accessor :updated_routing_number

        # If you initiate a notification of change in response to the transfer, this will
        # contain its details.
        sig do
          params(
            updated_account_number: T.nilable(String),
            updated_routing_number: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # The new account number provided in the notification of change.
          updated_account_number:,
          # The new account number provided in the notification of change.
          updated_routing_number:
        )
        end

        sig do
          override.returns(
            {
              updated_account_number: T.nilable(String),
              updated_routing_number: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end

      class Settlement < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::InboundACHTransfer::Settlement,
              Increase::Internal::AnyHash
            )
          end

        # When the funds for this transfer settle at the recipient bank at the Federal
        # Reserve.
        sig { returns(Time) }
        attr_accessor :settled_at

        # The settlement schedule this transfer follows.
        sig do
          returns(
            Increase::InboundACHTransfer::Settlement::SettlementSchedule::TaggedSymbol
          )
        end
        attr_accessor :settlement_schedule

        # A subhash containing information about when and how the transfer settled at the
        # Federal Reserve.
        sig do
          params(
            settled_at: Time,
            settlement_schedule:
              Increase::InboundACHTransfer::Settlement::SettlementSchedule::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # When the funds for this transfer settle at the recipient bank at the Federal
          # Reserve.
          settled_at:,
          # The settlement schedule this transfer follows.
          settlement_schedule:
        )
        end

        sig do
          override.returns(
            {
              settled_at: Time,
              settlement_schedule:
                Increase::InboundACHTransfer::Settlement::SettlementSchedule::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        # The settlement schedule this transfer follows.
        module SettlementSchedule
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::InboundACHTransfer::Settlement::SettlementSchedule
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The transfer is expected to settle same-day.
          SAME_DAY =
            T.let(
              :same_day,
              Increase::InboundACHTransfer::Settlement::SettlementSchedule::TaggedSymbol
            )

          # The transfer is expected to settle on a future date.
          FUTURE_DATED =
            T.let(
              :future_dated,
              Increase::InboundACHTransfer::Settlement::SettlementSchedule::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::InboundACHTransfer::Settlement::SettlementSchedule::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # The Standard Entry Class (SEC) code of the transfer.
      module StandardEntryClassCode
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Increase::InboundACHTransfer::StandardEntryClassCode)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # Corporate Credit and Debit (CCD).
        CORPORATE_CREDIT_OR_DEBIT =
          T.let(
            :corporate_credit_or_debit,
            Increase::InboundACHTransfer::StandardEntryClassCode::TaggedSymbol
          )

        # Corporate Trade Exchange (CTX).
        CORPORATE_TRADE_EXCHANGE =
          T.let(
            :corporate_trade_exchange,
            Increase::InboundACHTransfer::StandardEntryClassCode::TaggedSymbol
          )

        # Prearranged Payments and Deposits (PPD).
        PREARRANGED_PAYMENTS_AND_DEPOSIT =
          T.let(
            :prearranged_payments_and_deposit,
            Increase::InboundACHTransfer::StandardEntryClassCode::TaggedSymbol
          )

        # Internet Initiated (WEB).
        INTERNET_INITIATED =
          T.let(
            :internet_initiated,
            Increase::InboundACHTransfer::StandardEntryClassCode::TaggedSymbol
          )

        # Point of Sale (POS).
        POINT_OF_SALE =
          T.let(
            :point_of_sale,
            Increase::InboundACHTransfer::StandardEntryClassCode::TaggedSymbol
          )

        # Telephone Initiated (TEL).
        TELEPHONE_INITIATED =
          T.let(
            :telephone_initiated,
            Increase::InboundACHTransfer::StandardEntryClassCode::TaggedSymbol
          )

        # Customer Initiated (CIE).
        CUSTOMER_INITIATED =
          T.let(
            :customer_initiated,
            Increase::InboundACHTransfer::StandardEntryClassCode::TaggedSymbol
          )

        # Accounts Receivable (ARC).
        ACCOUNTS_RECEIVABLE =
          T.let(
            :accounts_receivable,
            Increase::InboundACHTransfer::StandardEntryClassCode::TaggedSymbol
          )

        # Machine Transfer (MTE).
        MACHINE_TRANSFER =
          T.let(
            :machine_transfer,
            Increase::InboundACHTransfer::StandardEntryClassCode::TaggedSymbol
          )

        # Shared Network Transaction (SHR).
        SHARED_NETWORK_TRANSACTION =
          T.let(
            :shared_network_transaction,
            Increase::InboundACHTransfer::StandardEntryClassCode::TaggedSymbol
          )

        # Represented Check (RCK).
        REPRESENTED_CHECK =
          T.let(
            :represented_check,
            Increase::InboundACHTransfer::StandardEntryClassCode::TaggedSymbol
          )

        # Back Office Conversion (BOC).
        BACK_OFFICE_CONVERSION =
          T.let(
            :back_office_conversion,
            Increase::InboundACHTransfer::StandardEntryClassCode::TaggedSymbol
          )

        # Point of Purchase (POP).
        POINT_OF_PURCHASE =
          T.let(
            :point_of_purchase,
            Increase::InboundACHTransfer::StandardEntryClassCode::TaggedSymbol
          )

        # Check Truncation (TRC).
        CHECK_TRUNCATION =
          T.let(
            :check_truncation,
            Increase::InboundACHTransfer::StandardEntryClassCode::TaggedSymbol
          )

        # Destroyed Check (XCK).
        DESTROYED_CHECK =
          T.let(
            :destroyed_check,
            Increase::InboundACHTransfer::StandardEntryClassCode::TaggedSymbol
          )

        # International ACH Transaction (IAT).
        INTERNATIONAL_ACH_TRANSACTION =
          T.let(
            :international_ach_transaction,
            Increase::InboundACHTransfer::StandardEntryClassCode::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Increase::InboundACHTransfer::StandardEntryClassCode::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end

      # The status of the transfer.
      module Status
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::InboundACHTransfer::Status) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        # The Inbound ACH Transfer is awaiting action, will transition automatically if no action is taken.
        PENDING =
          T.let(:pending, Increase::InboundACHTransfer::Status::TaggedSymbol)

        # The Inbound ACH Transfer has been declined.
        DECLINED =
          T.let(:declined, Increase::InboundACHTransfer::Status::TaggedSymbol)

        # The Inbound ACH Transfer is accepted.
        ACCEPTED =
          T.let(:accepted, Increase::InboundACHTransfer::Status::TaggedSymbol)

        # The Inbound ACH Transfer has been returned.
        RETURNED =
          T.let(:returned, Increase::InboundACHTransfer::Status::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Increase::InboundACHTransfer::Status::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      class TransferReturn < Increase::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Increase::InboundACHTransfer::TransferReturn,
              Increase::Internal::AnyHash
            )
          end

        # The reason for the transfer return.
        sig do
          returns(
            Increase::InboundACHTransfer::TransferReturn::Reason::TaggedSymbol
          )
        end
        attr_accessor :reason

        # The time at which the transfer was returned.
        sig { returns(Time) }
        attr_accessor :returned_at

        # The id of the transaction for the returned transfer.
        sig { returns(String) }
        attr_accessor :transaction_id

        # If your transfer is returned, this will contain details of the return.
        sig do
          params(
            reason:
              Increase::InboundACHTransfer::TransferReturn::Reason::OrSymbol,
            returned_at: Time,
            transaction_id: String
          ).returns(T.attached_class)
        end
        def self.new(
          # The reason for the transfer return.
          reason:,
          # The time at which the transfer was returned.
          returned_at:,
          # The id of the transaction for the returned transfer.
          transaction_id:
        )
        end

        sig do
          override.returns(
            {
              reason:
                Increase::InboundACHTransfer::TransferReturn::Reason::TaggedSymbol,
              returned_at: Time,
              transaction_id: String
            }
          )
        end
        def to_hash
        end

        # The reason for the transfer return.
        module Reason
          extend Increase::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Increase::InboundACHTransfer::TransferReturn::Reason
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          # The customer's account has insufficient funds. This reason is only allowed for debits. The Nacha return code is R01.
          INSUFFICIENT_FUNDS =
            T.let(
              :insufficient_funds,
              Increase::InboundACHTransfer::TransferReturn::Reason::TaggedSymbol
            )

          # The originating financial institution asked for this transfer to be returned. The receiving bank is complying with the request. The Nacha return code is R06.
          RETURNED_PER_ODFI_REQUEST =
            T.let(
              :returned_per_odfi_request,
              Increase::InboundACHTransfer::TransferReturn::Reason::TaggedSymbol
            )

          # The customer no longer authorizes this transaction. The Nacha return code is R07.
          AUTHORIZATION_REVOKED_BY_CUSTOMER =
            T.let(
              :authorization_revoked_by_customer,
              Increase::InboundACHTransfer::TransferReturn::Reason::TaggedSymbol
            )

          # The customer asked for the payment to be stopped. This reason is only allowed for debits. The Nacha return code is R08.
          PAYMENT_STOPPED =
            T.let(
              :payment_stopped,
              Increase::InboundACHTransfer::TransferReturn::Reason::TaggedSymbol
            )

          # The customer advises that the debit was unauthorized. The Nacha return code is R10.
          CUSTOMER_ADVISED_UNAUTHORIZED_IMPROPER_INELIGIBLE_OR_INCOMPLETE =
            T.let(
              :customer_advised_unauthorized_improper_ineligible_or_incomplete,
              Increase::InboundACHTransfer::TransferReturn::Reason::TaggedSymbol
            )

          # The payee is deceased. The Nacha return code is R14.
          REPRESENTATIVE_PAYEE_DECEASED_OR_UNABLE_TO_CONTINUE_IN_THAT_CAPACITY =
            T.let(
              :representative_payee_deceased_or_unable_to_continue_in_that_capacity,
              Increase::InboundACHTransfer::TransferReturn::Reason::TaggedSymbol
            )

          # The account holder is deceased. The Nacha return code is R15.
          BENEFICIARY_OR_ACCOUNT_HOLDER_DECEASED =
            T.let(
              :beneficiary_or_account_holder_deceased,
              Increase::InboundACHTransfer::TransferReturn::Reason::TaggedSymbol
            )

          # The customer refused a credit entry. This reason is only allowed for credits. The Nacha return code is R23.
          CREDIT_ENTRY_REFUSED_BY_RECEIVER =
            T.let(
              :credit_entry_refused_by_receiver,
              Increase::InboundACHTransfer::TransferReturn::Reason::TaggedSymbol
            )

          # The account holder identified this transaction as a duplicate. The Nacha return code is R24.
          DUPLICATE_ENTRY =
            T.let(
              :duplicate_entry,
              Increase::InboundACHTransfer::TransferReturn::Reason::TaggedSymbol
            )

          # The corporate customer no longer authorizes this transaction. The Nacha return code is R29.
          CORPORATE_CUSTOMER_ADVISED_NOT_AUTHORIZED =
            T.let(
              :corporate_customer_advised_not_authorized,
              Increase::InboundACHTransfer::TransferReturn::Reason::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Increase::InboundACHTransfer::TransferReturn::Reason::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end

      # A constant representing the object's type. For this resource it will always be
      # `inbound_ach_transfer`.
      module Type
        extend Increase::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Increase::InboundACHTransfer::Type) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        INBOUND_ACH_TRANSFER =
          T.let(
            :inbound_ach_transfer,
            Increase::InboundACHTransfer::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Increase::InboundACHTransfer::Type::TaggedSymbol]
          )
        end
        def self.values
        end
      end
    end
  end
end
