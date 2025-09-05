# typed: strong

module Increase
  class Client < Increase::Internal::Transport::BaseClient
    DEFAULT_MAX_RETRIES = 2

    DEFAULT_TIMEOUT_IN_SECONDS = T.let(60.0, Float)

    DEFAULT_INITIAL_RETRY_DELAY = T.let(0.5, Float)

    DEFAULT_MAX_RETRY_DELAY = T.let(8.0, Float)

    ENVIRONMENTS =
      T.let(
        {
          production: "https://api.increase.com",
          sandbox: "https://sandbox.increase.com"
        },
        T::Hash[Symbol, String]
      )

    sig { returns(String) }
    attr_reader :api_key

    sig { returns(Increase::Resources::Accounts) }
    attr_reader :accounts

    sig { returns(Increase::Resources::AccountNumbers) }
    attr_reader :account_numbers

    sig { returns(Increase::Resources::AccountTransfers) }
    attr_reader :account_transfers

    sig { returns(Increase::Resources::Cards) }
    attr_reader :cards

    sig { returns(Increase::Resources::CardPayments) }
    attr_reader :card_payments

    sig { returns(Increase::Resources::CardPurchaseSupplements) }
    attr_reader :card_purchase_supplements

    sig { returns(Increase::Resources::CardDisputes) }
    attr_reader :card_disputes

    sig { returns(Increase::Resources::PhysicalCards) }
    attr_reader :physical_cards

    sig { returns(Increase::Resources::DigitalCardProfiles) }
    attr_reader :digital_card_profiles

    sig { returns(Increase::Resources::PhysicalCardProfiles) }
    attr_reader :physical_card_profiles

    sig { returns(Increase::Resources::DigitalWalletTokens) }
    attr_reader :digital_wallet_tokens

    sig { returns(Increase::Resources::Transactions) }
    attr_reader :transactions

    sig { returns(Increase::Resources::PendingTransactions) }
    attr_reader :pending_transactions

    sig { returns(Increase::Resources::DeclinedTransactions) }
    attr_reader :declined_transactions

    sig { returns(Increase::Resources::ACHTransfers) }
    attr_reader :ach_transfers

    sig { returns(Increase::Resources::ACHPrenotifications) }
    attr_reader :ach_prenotifications

    sig { returns(Increase::Resources::InboundACHTransfers) }
    attr_reader :inbound_ach_transfers

    sig { returns(Increase::Resources::WireTransfers) }
    attr_reader :wire_transfers

    sig { returns(Increase::Resources::InboundWireTransfers) }
    attr_reader :inbound_wire_transfers

    sig { returns(Increase::Resources::WireDrawdownRequests) }
    attr_reader :wire_drawdown_requests

    sig { returns(Increase::Resources::InboundWireDrawdownRequests) }
    attr_reader :inbound_wire_drawdown_requests

    sig { returns(Increase::Resources::CheckTransfers) }
    attr_reader :check_transfers

    sig { returns(Increase::Resources::InboundCheckDeposits) }
    attr_reader :inbound_check_deposits

    sig { returns(Increase::Resources::RealTimePaymentsTransfers) }
    attr_reader :real_time_payments_transfers

    sig { returns(Increase::Resources::InboundRealTimePaymentsTransfers) }
    attr_reader :inbound_real_time_payments_transfers

    sig { returns(Increase::Resources::CheckDeposits) }
    attr_reader :check_deposits

    sig { returns(Increase::Resources::Lockboxes) }
    attr_reader :lockboxes

    sig { returns(Increase::Resources::InboundMailItems) }
    attr_reader :inbound_mail_items

    sig { returns(Increase::Resources::RoutingNumbers) }
    attr_reader :routing_numbers

    sig { returns(Increase::Resources::ExternalAccounts) }
    attr_reader :external_accounts

    sig { returns(Increase::Resources::Entities) }
    attr_reader :entities

    sig { returns(Increase::Resources::SupplementalDocuments) }
    attr_reader :supplemental_documents

    sig { returns(Increase::Resources::Programs) }
    attr_reader :programs

    sig { returns(Increase::Resources::AccountStatements) }
    attr_reader :account_statements

    sig { returns(Increase::Resources::Files) }
    attr_reader :files

    sig { returns(Increase::Resources::FileLinks) }
    attr_reader :file_links

    sig { returns(Increase::Resources::Documents) }
    attr_reader :documents

    sig { returns(Increase::Resources::Exports) }
    attr_reader :exports

    sig { returns(Increase::Resources::Events) }
    attr_reader :events

    sig { returns(Increase::Resources::EventSubscriptions) }
    attr_reader :event_subscriptions

    sig { returns(Increase::Resources::RealTimeDecisions) }
    attr_reader :real_time_decisions

    sig { returns(Increase::Resources::BookkeepingAccounts) }
    attr_reader :bookkeeping_accounts

    sig { returns(Increase::Resources::BookkeepingEntrySets) }
    attr_reader :bookkeeping_entry_sets

    sig { returns(Increase::Resources::BookkeepingEntries) }
    attr_reader :bookkeeping_entries

    sig { returns(Increase::Resources::Groups) }
    attr_reader :groups

    sig { returns(Increase::Resources::OAuthApplications) }
    attr_reader :oauth_applications

    sig { returns(Increase::Resources::OAuthConnections) }
    attr_reader :oauth_connections

    sig { returns(Increase::Resources::OAuthTokens) }
    attr_reader :oauth_tokens

    sig { returns(Increase::Resources::IntrafiAccountEnrollments) }
    attr_reader :intrafi_account_enrollments

    sig { returns(Increase::Resources::IntrafiBalances) }
    attr_reader :intrafi_balances

    sig { returns(Increase::Resources::IntrafiExclusions) }
    attr_reader :intrafi_exclusions

    sig { returns(Increase::Resources::CardTokens) }
    attr_reader :card_tokens

    sig { returns(Increase::Resources::CardPushTransfers) }
    attr_reader :card_push_transfers

    sig { returns(Increase::Resources::CardValidations) }
    attr_reader :card_validations

    sig { returns(Increase::Resources::Simulations) }
    attr_reader :simulations

    # @api private
    sig { override.returns(T::Hash[String, String]) }
    private def auth_headers
    end

    # Creates and returns a new client for interacting with the API.
    sig do
      params(
        api_key: T.nilable(String),
        environment: T.nilable(T.any(Symbol, String)),
        base_url: T.nilable(String),
        max_retries: Integer,
        timeout: Float,
        initial_retry_delay: Float,
        max_retry_delay: Float,
        idempotency_header: String
      ).returns(T.attached_class)
    end
    def self.new(
      # Defaults to `ENV["INCREASE_API_KEY"]`
      api_key: ENV["INCREASE_API_KEY"],
      # Specifies the environment to use for the API.
      #
      # Each environment maps to a different base URL:
      #
      # - `production` corresponds to `https://api.increase.com`
      # - `sandbox` corresponds to `https://sandbox.increase.com`
      environment: nil,
      # Override the default base URL for the API, e.g.,
      # `"https://api.example.com/v2/"`. Defaults to `ENV["INCREASE_BASE_URL"]`
      base_url: ENV["INCREASE_BASE_URL"],
      # Max number of retries to attempt after a failed retryable request.
      max_retries: Increase::Client::DEFAULT_MAX_RETRIES,
      timeout: Increase::Client::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: Increase::Client::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: Increase::Client::DEFAULT_MAX_RETRY_DELAY,
      idempotency_header: "Idempotency-Key"
    )
    end
  end
end
