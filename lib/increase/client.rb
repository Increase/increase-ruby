# frozen_string_literal: true

module Increase
  class Client < Increase::Internal::Transport::BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Default per-request timeout.
    DEFAULT_TIMEOUT_IN_SECONDS = 60.0

    # Default initial retry delay in seconds.
    # Overall delay is calculated using exponential backoff + jitter.
    DEFAULT_INITIAL_RETRY_DELAY = 0.5

    # Default max retry delay in seconds.
    DEFAULT_MAX_RETRY_DELAY = 8.0

    # rubocop:disable Style/MutableConstant
    # @type [Hash{Symbol=>String}]
    ENVIRONMENTS = {production: "https://api.increase.com", sandbox: "https://sandbox.increase.com"}
    # rubocop:enable Style/MutableConstant

    # @return [String]
    attr_reader :api_key

    # @return [Increase::Resources::Accounts]
    attr_reader :accounts

    # @return [Increase::Resources::AccountNumbers]
    attr_reader :account_numbers

    # @return [Increase::Resources::AccountTransfers]
    attr_reader :account_transfers

    # @return [Increase::Resources::Cards]
    attr_reader :cards

    # @return [Increase::Resources::CardPayments]
    attr_reader :card_payments

    # @return [Increase::Resources::CardPurchaseSupplements]
    attr_reader :card_purchase_supplements

    # @return [Increase::Resources::CardDisputes]
    attr_reader :card_disputes

    # @return [Increase::Resources::PhysicalCards]
    attr_reader :physical_cards

    # @return [Increase::Resources::DigitalCardProfiles]
    attr_reader :digital_card_profiles

    # @return [Increase::Resources::PhysicalCardProfiles]
    attr_reader :physical_card_profiles

    # @return [Increase::Resources::DigitalWalletTokens]
    attr_reader :digital_wallet_tokens

    # @return [Increase::Resources::Transactions]
    attr_reader :transactions

    # @return [Increase::Resources::PendingTransactions]
    attr_reader :pending_transactions

    # @return [Increase::Resources::DeclinedTransactions]
    attr_reader :declined_transactions

    # @return [Increase::Resources::ACHTransfers]
    attr_reader :ach_transfers

    # @return [Increase::Resources::ACHPrenotifications]
    attr_reader :ach_prenotifications

    # @return [Increase::Resources::InboundACHTransfers]
    attr_reader :inbound_ach_transfers

    # @return [Increase::Resources::WireTransfers]
    attr_reader :wire_transfers

    # @return [Increase::Resources::InboundWireTransfers]
    attr_reader :inbound_wire_transfers

    # @return [Increase::Resources::WireDrawdownRequests]
    attr_reader :wire_drawdown_requests

    # @return [Increase::Resources::InboundWireDrawdownRequests]
    attr_reader :inbound_wire_drawdown_requests

    # @return [Increase::Resources::CheckTransfers]
    attr_reader :check_transfers

    # @return [Increase::Resources::InboundCheckDeposits]
    attr_reader :inbound_check_deposits

    # @return [Increase::Resources::RealTimePaymentsTransfers]
    attr_reader :real_time_payments_transfers

    # @return [Increase::Resources::InboundRealTimePaymentsTransfers]
    attr_reader :inbound_real_time_payments_transfers

    # @return [Increase::Resources::FednowTransfers]
    attr_reader :fednow_transfers

    # @return [Increase::Resources::InboundFednowTransfers]
    attr_reader :inbound_fednow_transfers

    # @return [Increase::Resources::CheckDeposits]
    attr_reader :check_deposits

    # @return [Increase::Resources::Lockboxes]
    attr_reader :lockboxes

    # @return [Increase::Resources::InboundMailItems]
    attr_reader :inbound_mail_items

    # @return [Increase::Resources::RoutingNumbers]
    attr_reader :routing_numbers

    # @return [Increase::Resources::ExternalAccounts]
    attr_reader :external_accounts

    # @return [Increase::Resources::Entities]
    attr_reader :entities

    # @return [Increase::Resources::SupplementalDocuments]
    attr_reader :supplemental_documents

    # @return [Increase::Resources::Programs]
    attr_reader :programs

    # @return [Increase::Resources::AccountStatements]
    attr_reader :account_statements

    # @return [Increase::Resources::Files]
    attr_reader :files

    # @return [Increase::Resources::FileLinks]
    attr_reader :file_links

    # @return [Increase::Resources::Exports]
    attr_reader :exports

    # @return [Increase::Resources::Events]
    attr_reader :events

    # @return [Increase::Resources::EventSubscriptions]
    attr_reader :event_subscriptions

    # @return [Increase::Resources::RealTimeDecisions]
    attr_reader :real_time_decisions

    # @return [Increase::Resources::BookkeepingAccounts]
    attr_reader :bookkeeping_accounts

    # @return [Increase::Resources::BookkeepingEntrySets]
    attr_reader :bookkeeping_entry_sets

    # @return [Increase::Resources::BookkeepingEntries]
    attr_reader :bookkeeping_entries

    # @return [Increase::Resources::Groups]
    attr_reader :groups

    # @return [Increase::Resources::OAuthApplications]
    attr_reader :oauth_applications

    # @return [Increase::Resources::OAuthConnections]
    attr_reader :oauth_connections

    # @return [Increase::Resources::OAuthTokens]
    attr_reader :oauth_tokens

    # @return [Increase::Resources::IntrafiAccountEnrollments]
    attr_reader :intrafi_account_enrollments

    # @return [Increase::Resources::IntrafiBalances]
    attr_reader :intrafi_balances

    # @return [Increase::Resources::IntrafiExclusions]
    attr_reader :intrafi_exclusions

    # @return [Increase::Resources::CardTokens]
    attr_reader :card_tokens

    # @return [Increase::Resources::CardPushTransfers]
    attr_reader :card_push_transfers

    # @return [Increase::Resources::CardValidations]
    attr_reader :card_validations

    # @return [Increase::Resources::Simulations]
    attr_reader :simulations

    # @api private
    #
    # @return [Hash{String=>String}]
    private def auth_headers
      return {} if @api_key.nil?

      {"authorization" => "Bearer #{@api_key}"}
    end

    # Creates and returns a new client for interacting with the API.
    #
    # @param api_key [String, nil] Defaults to `ENV["INCREASE_API_KEY"]`
    #
    # @param environment [:production, :sandbox, nil] Specifies the environment to use for the API.
    #
    # Each environment maps to a different base URL:
    #
    # - `production` corresponds to `https://api.increase.com`
    # - `sandbox` corresponds to `https://sandbox.increase.com`
    #
    # @param base_url [String, nil] Override the default base URL for the API, e.g.,
    # `"https://api.example.com/v2/"`. Defaults to `ENV["INCREASE_BASE_URL"]`
    #
    # @param max_retries [Integer] Max number of retries to attempt after a failed retryable request.
    #
    # @param timeout [Float]
    #
    # @param initial_retry_delay [Float]
    #
    # @param max_retry_delay [Float]
    #
    # @param idempotency_header [String]
    def initialize(
      api_key: ENV["INCREASE_API_KEY"],
      environment: nil,
      base_url: ENV["INCREASE_BASE_URL"],
      max_retries: self.class::DEFAULT_MAX_RETRIES,
      timeout: self.class::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: self.class::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: self.class::DEFAULT_MAX_RETRY_DELAY,
      idempotency_header: "Idempotency-Key"
    )
      base_url ||= Increase::Client::ENVIRONMENTS.fetch(environment&.to_sym || :production) do
        message = "environment must be one of #{Increase::Client::ENVIRONMENTS.keys}, got #{environment}"
        raise ArgumentError.new(message)
      end

      if api_key.nil?
        raise ArgumentError.new("api_key is required, and can be set via environ: \"INCREASE_API_KEY\"")
      end

      @api_key = api_key.to_s

      super(
        base_url: base_url,
        timeout: timeout,
        max_retries: max_retries,
        initial_retry_delay: initial_retry_delay,
        max_retry_delay: max_retry_delay,
        idempotency_header: idempotency_header
      )

      @accounts = Increase::Resources::Accounts.new(client: self)
      @account_numbers = Increase::Resources::AccountNumbers.new(client: self)
      @account_transfers = Increase::Resources::AccountTransfers.new(client: self)
      @cards = Increase::Resources::Cards.new(client: self)
      @card_payments = Increase::Resources::CardPayments.new(client: self)
      @card_purchase_supplements = Increase::Resources::CardPurchaseSupplements.new(client: self)
      @card_disputes = Increase::Resources::CardDisputes.new(client: self)
      @physical_cards = Increase::Resources::PhysicalCards.new(client: self)
      @digital_card_profiles = Increase::Resources::DigitalCardProfiles.new(client: self)
      @physical_card_profiles = Increase::Resources::PhysicalCardProfiles.new(client: self)
      @digital_wallet_tokens = Increase::Resources::DigitalWalletTokens.new(client: self)
      @transactions = Increase::Resources::Transactions.new(client: self)
      @pending_transactions = Increase::Resources::PendingTransactions.new(client: self)
      @declined_transactions = Increase::Resources::DeclinedTransactions.new(client: self)
      @ach_transfers = Increase::Resources::ACHTransfers.new(client: self)
      @ach_prenotifications = Increase::Resources::ACHPrenotifications.new(client: self)
      @inbound_ach_transfers = Increase::Resources::InboundACHTransfers.new(client: self)
      @wire_transfers = Increase::Resources::WireTransfers.new(client: self)
      @inbound_wire_transfers = Increase::Resources::InboundWireTransfers.new(client: self)
      @wire_drawdown_requests = Increase::Resources::WireDrawdownRequests.new(client: self)
      @inbound_wire_drawdown_requests = Increase::Resources::InboundWireDrawdownRequests.new(client: self)
      @check_transfers = Increase::Resources::CheckTransfers.new(client: self)
      @inbound_check_deposits = Increase::Resources::InboundCheckDeposits.new(client: self)
      @real_time_payments_transfers = Increase::Resources::RealTimePaymentsTransfers.new(client: self)
      @inbound_real_time_payments_transfers =
        Increase::Resources::InboundRealTimePaymentsTransfers.new(client: self)
      @fednow_transfers = Increase::Resources::FednowTransfers.new(client: self)
      @inbound_fednow_transfers = Increase::Resources::InboundFednowTransfers.new(client: self)
      @check_deposits = Increase::Resources::CheckDeposits.new(client: self)
      @lockboxes = Increase::Resources::Lockboxes.new(client: self)
      @inbound_mail_items = Increase::Resources::InboundMailItems.new(client: self)
      @routing_numbers = Increase::Resources::RoutingNumbers.new(client: self)
      @external_accounts = Increase::Resources::ExternalAccounts.new(client: self)
      @entities = Increase::Resources::Entities.new(client: self)
      @supplemental_documents = Increase::Resources::SupplementalDocuments.new(client: self)
      @programs = Increase::Resources::Programs.new(client: self)
      @account_statements = Increase::Resources::AccountStatements.new(client: self)
      @files = Increase::Resources::Files.new(client: self)
      @file_links = Increase::Resources::FileLinks.new(client: self)
      @exports = Increase::Resources::Exports.new(client: self)
      @events = Increase::Resources::Events.new(client: self)
      @event_subscriptions = Increase::Resources::EventSubscriptions.new(client: self)
      @real_time_decisions = Increase::Resources::RealTimeDecisions.new(client: self)
      @bookkeeping_accounts = Increase::Resources::BookkeepingAccounts.new(client: self)
      @bookkeeping_entry_sets = Increase::Resources::BookkeepingEntrySets.new(client: self)
      @bookkeeping_entries = Increase::Resources::BookkeepingEntries.new(client: self)
      @groups = Increase::Resources::Groups.new(client: self)
      @oauth_applications = Increase::Resources::OAuthApplications.new(client: self)
      @oauth_connections = Increase::Resources::OAuthConnections.new(client: self)
      @oauth_tokens = Increase::Resources::OAuthTokens.new(client: self)
      @intrafi_account_enrollments = Increase::Resources::IntrafiAccountEnrollments.new(client: self)
      @intrafi_balances = Increase::Resources::IntrafiBalances.new(client: self)
      @intrafi_exclusions = Increase::Resources::IntrafiExclusions.new(client: self)
      @card_tokens = Increase::Resources::CardTokens.new(client: self)
      @card_push_transfers = Increase::Resources::CardPushTransfers.new(client: self)
      @card_validations = Increase::Resources::CardValidations.new(client: self)
      @simulations = Increase::Resources::Simulations.new(client: self)
    end
  end
end
