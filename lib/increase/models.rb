# frozen_string_literal: true

module Increase
  [Increase::Internal::Type::BaseModel, *Increase::Internal::Type::BaseModel.subclasses].each do |cls|
    cls.define_sorbet_constant!(:OrHash) { T.type_alias { T.any(cls, Increase::Internal::AnyHash) } }
  end

  Increase::Internal::Util.walk_namespaces(Increase::Models).each do |mod|
    case mod
    in Increase::Internal::Type::Enum | Increase::Internal::Type::Union
      mod.constants.each do |name|
        case mod.const_get(name)
        in true | false
          mod.define_sorbet_constant!(:TaggedBoolean) { T.type_alias { T::Boolean } }
          mod.define_sorbet_constant!(:OrBoolean) { T.type_alias { T::Boolean } }
        in Integer
          mod.define_sorbet_constant!(:TaggedInteger) { T.type_alias { Integer } }
          mod.define_sorbet_constant!(:OrInteger) { T.type_alias { Integer } }
        in Float
          mod.define_sorbet_constant!(:TaggedFloat) { T.type_alias { Float } }
          mod.define_sorbet_constant!(:OrFloat) { T.type_alias { Float } }
        in Symbol
          mod.define_sorbet_constant!(:TaggedSymbol) { T.type_alias { Symbol } }
          mod.define_sorbet_constant!(:OrSymbol) { T.type_alias { T.any(Symbol, String) } }
        else
        end
      end
    else
    end
  end

  Increase::Internal::Util.walk_namespaces(Increase::Models)
                          .lazy
                          .grep(Increase::Internal::Type::Union)
                          .each do |mod|
    const = :Variants
    next if mod.sorbet_constant_defined?(const)

    mod.define_sorbet_constant!(const) { T.type_alias { mod.to_sorbet_type } }
  end

  Account = Increase::Models::Account

  AccountBalanceParams = Increase::Models::AccountBalanceParams

  AccountCloseParams = Increase::Models::AccountCloseParams

  AccountCreateParams = Increase::Models::AccountCreateParams

  AccountListParams = Increase::Models::AccountListParams

  AccountNumber = Increase::Models::AccountNumber

  AccountNumberCreateParams = Increase::Models::AccountNumberCreateParams

  AccountNumberListParams = Increase::Models::AccountNumberListParams

  AccountNumberRetrieveParams = Increase::Models::AccountNumberRetrieveParams

  AccountNumberUpdateParams = Increase::Models::AccountNumberUpdateParams

  AccountRetrieveParams = Increase::Models::AccountRetrieveParams

  AccountStatement = Increase::Models::AccountStatement

  AccountStatementListParams = Increase::Models::AccountStatementListParams

  AccountStatementRetrieveParams = Increase::Models::AccountStatementRetrieveParams

  AccountTransfer = Increase::Models::AccountTransfer

  AccountTransferApproveParams = Increase::Models::AccountTransferApproveParams

  AccountTransferCancelParams = Increase::Models::AccountTransferCancelParams

  AccountTransferCreateParams = Increase::Models::AccountTransferCreateParams

  AccountTransferListParams = Increase::Models::AccountTransferListParams

  AccountTransferRetrieveParams = Increase::Models::AccountTransferRetrieveParams

  AccountUpdateParams = Increase::Models::AccountUpdateParams

  ACHPrenotification = Increase::Models::ACHPrenotification

  ACHPrenotificationCreateParams = Increase::Models::ACHPrenotificationCreateParams

  ACHPrenotificationListParams = Increase::Models::ACHPrenotificationListParams

  ACHPrenotificationRetrieveParams = Increase::Models::ACHPrenotificationRetrieveParams

  ACHTransfer = Increase::Models::ACHTransfer

  ACHTransferApproveParams = Increase::Models::ACHTransferApproveParams

  ACHTransferCancelParams = Increase::Models::ACHTransferCancelParams

  ACHTransferCreateParams = Increase::Models::ACHTransferCreateParams

  ACHTransferListParams = Increase::Models::ACHTransferListParams

  ACHTransferRetrieveParams = Increase::Models::ACHTransferRetrieveParams

  BalanceLookup = Increase::Models::BalanceLookup

  BookkeepingAccount = Increase::Models::BookkeepingAccount

  BookkeepingAccountBalanceParams = Increase::Models::BookkeepingAccountBalanceParams

  BookkeepingAccountCreateParams = Increase::Models::BookkeepingAccountCreateParams

  BookkeepingAccountListParams = Increase::Models::BookkeepingAccountListParams

  BookkeepingAccountUpdateParams = Increase::Models::BookkeepingAccountUpdateParams

  BookkeepingBalanceLookup = Increase::Models::BookkeepingBalanceLookup

  BookkeepingEntry = Increase::Models::BookkeepingEntry

  BookkeepingEntryListParams = Increase::Models::BookkeepingEntryListParams

  BookkeepingEntryRetrieveParams = Increase::Models::BookkeepingEntryRetrieveParams

  BookkeepingEntrySet = Increase::Models::BookkeepingEntrySet

  BookkeepingEntrySetCreateParams = Increase::Models::BookkeepingEntrySetCreateParams

  BookkeepingEntrySetListParams = Increase::Models::BookkeepingEntrySetListParams

  BookkeepingEntrySetRetrieveParams = Increase::Models::BookkeepingEntrySetRetrieveParams

  Card = Increase::Models::Card

  CardCreateDetailsIframeParams = Increase::Models::CardCreateDetailsIframeParams

  CardCreateParams = Increase::Models::CardCreateParams

  CardDetails = Increase::Models::CardDetails

  CardDetailsParams = Increase::Models::CardDetailsParams

  CardDispute = Increase::Models::CardDispute

  CardDisputeCreateParams = Increase::Models::CardDisputeCreateParams

  CardDisputeListParams = Increase::Models::CardDisputeListParams

  CardDisputeRetrieveParams = Increase::Models::CardDisputeRetrieveParams

  CardDisputeSubmitUserSubmissionParams = Increase::Models::CardDisputeSubmitUserSubmissionParams

  CardDisputeWithdrawParams = Increase::Models::CardDisputeWithdrawParams

  CardIframeURL = Increase::Models::CardIframeURL

  CardListParams = Increase::Models::CardListParams

  CardPayment = Increase::Models::CardPayment

  CardPaymentListParams = Increase::Models::CardPaymentListParams

  CardPaymentRetrieveParams = Increase::Models::CardPaymentRetrieveParams

  CardPurchaseSupplement = Increase::Models::CardPurchaseSupplement

  CardPurchaseSupplementListParams = Increase::Models::CardPurchaseSupplementListParams

  CardPurchaseSupplementRetrieveParams = Increase::Models::CardPurchaseSupplementRetrieveParams

  CardPushTransfer = Increase::Models::CardPushTransfer

  CardPushTransferApproveParams = Increase::Models::CardPushTransferApproveParams

  CardPushTransferCancelParams = Increase::Models::CardPushTransferCancelParams

  CardPushTransferCreateParams = Increase::Models::CardPushTransferCreateParams

  CardPushTransferListParams = Increase::Models::CardPushTransferListParams

  CardPushTransferRetrieveParams = Increase::Models::CardPushTransferRetrieveParams

  CardRetrieveParams = Increase::Models::CardRetrieveParams

  CardToken = Increase::Models::CardToken

  CardTokenCapabilities = Increase::Models::CardTokenCapabilities

  CardTokenCapabilitiesParams = Increase::Models::CardTokenCapabilitiesParams

  CardTokenListParams = Increase::Models::CardTokenListParams

  CardTokenRetrieveParams = Increase::Models::CardTokenRetrieveParams

  CardUpdateParams = Increase::Models::CardUpdateParams

  CardUpdatePinParams = Increase::Models::CardUpdatePinParams

  CardValidation = Increase::Models::CardValidation

  CardValidationCreateParams = Increase::Models::CardValidationCreateParams

  CardValidationListParams = Increase::Models::CardValidationListParams

  CardValidationRetrieveParams = Increase::Models::CardValidationRetrieveParams

  CheckDeposit = Increase::Models::CheckDeposit

  CheckDepositCreateParams = Increase::Models::CheckDepositCreateParams

  CheckDepositListParams = Increase::Models::CheckDepositListParams

  CheckDepositRetrieveParams = Increase::Models::CheckDepositRetrieveParams

  CheckTransfer = Increase::Models::CheckTransfer

  CheckTransferApproveParams = Increase::Models::CheckTransferApproveParams

  CheckTransferCancelParams = Increase::Models::CheckTransferCancelParams

  CheckTransferCreateParams = Increase::Models::CheckTransferCreateParams

  CheckTransferListParams = Increase::Models::CheckTransferListParams

  CheckTransferRetrieveParams = Increase::Models::CheckTransferRetrieveParams

  CheckTransferStopPaymentParams = Increase::Models::CheckTransferStopPaymentParams

  DeclinedTransaction = Increase::Models::DeclinedTransaction

  DeclinedTransactionListParams = Increase::Models::DeclinedTransactionListParams

  DeclinedTransactionRetrieveParams = Increase::Models::DeclinedTransactionRetrieveParams

  DigitalCardProfile = Increase::Models::DigitalCardProfile

  DigitalCardProfileArchiveParams = Increase::Models::DigitalCardProfileArchiveParams

  DigitalCardProfileCloneParams = Increase::Models::DigitalCardProfileCloneParams

  DigitalCardProfileCreateParams = Increase::Models::DigitalCardProfileCreateParams

  DigitalCardProfileListParams = Increase::Models::DigitalCardProfileListParams

  DigitalCardProfileRetrieveParams = Increase::Models::DigitalCardProfileRetrieveParams

  DigitalWalletToken = Increase::Models::DigitalWalletToken

  DigitalWalletTokenListParams = Increase::Models::DigitalWalletTokenListParams

  DigitalWalletTokenRetrieveParams = Increase::Models::DigitalWalletTokenRetrieveParams

  Document = Increase::Models::Document

  DocumentCreateParams = Increase::Models::DocumentCreateParams

  DocumentListParams = Increase::Models::DocumentListParams

  DocumentRetrieveParams = Increase::Models::DocumentRetrieveParams

  Entity = Increase::Models::Entity

  EntityArchiveBeneficialOwnerParams = Increase::Models::EntityArchiveBeneficialOwnerParams

  EntityArchiveParams = Increase::Models::EntityArchiveParams

  EntityConfirmParams = Increase::Models::EntityConfirmParams

  EntityCreateBeneficialOwnerParams = Increase::Models::EntityCreateBeneficialOwnerParams

  EntityCreateParams = Increase::Models::EntityCreateParams

  EntityListParams = Increase::Models::EntityListParams

  EntityRetrieveParams = Increase::Models::EntityRetrieveParams

  EntitySupplementalDocument = Increase::Models::EntitySupplementalDocument

  EntityUpdateAddressParams = Increase::Models::EntityUpdateAddressParams

  EntityUpdateBeneficialOwnerAddressParams = Increase::Models::EntityUpdateBeneficialOwnerAddressParams

  EntityUpdateIndustryCodeParams = Increase::Models::EntityUpdateIndustryCodeParams

  EntityUpdateParams = Increase::Models::EntityUpdateParams

  Event = Increase::Models::Event

  EventListParams = Increase::Models::EventListParams

  EventRetrieveParams = Increase::Models::EventRetrieveParams

  EventSubscription = Increase::Models::EventSubscription

  EventSubscriptionCreateParams = Increase::Models::EventSubscriptionCreateParams

  EventSubscriptionListParams = Increase::Models::EventSubscriptionListParams

  EventSubscriptionRetrieveParams = Increase::Models::EventSubscriptionRetrieveParams

  EventSubscriptionUpdateParams = Increase::Models::EventSubscriptionUpdateParams

  Export = Increase::Models::Export

  ExportCreateParams = Increase::Models::ExportCreateParams

  ExportListParams = Increase::Models::ExportListParams

  ExportRetrieveParams = Increase::Models::ExportRetrieveParams

  ExternalAccount = Increase::Models::ExternalAccount

  ExternalAccountCreateParams = Increase::Models::ExternalAccountCreateParams

  ExternalAccountListParams = Increase::Models::ExternalAccountListParams

  ExternalAccountRetrieveParams = Increase::Models::ExternalAccountRetrieveParams

  ExternalAccountUpdateParams = Increase::Models::ExternalAccountUpdateParams

  FednowTransfer = Increase::Models::FednowTransfer

  FednowTransferApproveParams = Increase::Models::FednowTransferApproveParams

  FednowTransferCancelParams = Increase::Models::FednowTransferCancelParams

  FednowTransferCreateParams = Increase::Models::FednowTransferCreateParams

  FednowTransferListParams = Increase::Models::FednowTransferListParams

  FednowTransferRetrieveParams = Increase::Models::FednowTransferRetrieveParams

  File = Increase::Models::File

  FileCreateParams = Increase::Models::FileCreateParams

  FileLink = Increase::Models::FileLink

  FileLinkCreateParams = Increase::Models::FileLinkCreateParams

  FileListParams = Increase::Models::FileListParams

  FileRetrieveParams = Increase::Models::FileRetrieveParams

  Group = Increase::Models::Group

  GroupRetrieveParams = Increase::Models::GroupRetrieveParams

  InboundACHTransfer = Increase::Models::InboundACHTransfer

  InboundACHTransferCreateNotificationOfChangeParams =
    Increase::Models::InboundACHTransferCreateNotificationOfChangeParams

  InboundACHTransferDeclineParams = Increase::Models::InboundACHTransferDeclineParams

  InboundACHTransferListParams = Increase::Models::InboundACHTransferListParams

  InboundACHTransferRetrieveParams = Increase::Models::InboundACHTransferRetrieveParams

  InboundACHTransferTransferReturnParams = Increase::Models::InboundACHTransferTransferReturnParams

  InboundCheckDeposit = Increase::Models::InboundCheckDeposit

  InboundCheckDepositDeclineParams = Increase::Models::InboundCheckDepositDeclineParams

  InboundCheckDepositListParams = Increase::Models::InboundCheckDepositListParams

  InboundCheckDepositRetrieveParams = Increase::Models::InboundCheckDepositRetrieveParams

  InboundCheckDepositReturnParams = Increase::Models::InboundCheckDepositReturnParams

  InboundFednowTransfer = Increase::Models::InboundFednowTransfer

  InboundFednowTransferListParams = Increase::Models::InboundFednowTransferListParams

  InboundFednowTransferRetrieveParams = Increase::Models::InboundFednowTransferRetrieveParams

  InboundMailItem = Increase::Models::InboundMailItem

  InboundMailItemActionParams = Increase::Models::InboundMailItemActionParams

  InboundMailItemListParams = Increase::Models::InboundMailItemListParams

  InboundMailItemRetrieveParams = Increase::Models::InboundMailItemRetrieveParams

  InboundRealTimePaymentsTransfer = Increase::Models::InboundRealTimePaymentsTransfer

  InboundRealTimePaymentsTransferListParams = Increase::Models::InboundRealTimePaymentsTransferListParams

  InboundRealTimePaymentsTransferRetrieveParams =
    Increase::Models::InboundRealTimePaymentsTransferRetrieveParams

  InboundWireDrawdownRequest = Increase::Models::InboundWireDrawdownRequest

  InboundWireDrawdownRequestListParams = Increase::Models::InboundWireDrawdownRequestListParams

  InboundWireDrawdownRequestRetrieveParams = Increase::Models::InboundWireDrawdownRequestRetrieveParams

  InboundWireTransfer = Increase::Models::InboundWireTransfer

  InboundWireTransferListParams = Increase::Models::InboundWireTransferListParams

  InboundWireTransferRetrieveParams = Increase::Models::InboundWireTransferRetrieveParams

  InboundWireTransferReverseParams = Increase::Models::InboundWireTransferReverseParams

  IntrafiAccountEnrollment = Increase::Models::IntrafiAccountEnrollment

  IntrafiAccountEnrollmentCreateParams = Increase::Models::IntrafiAccountEnrollmentCreateParams

  IntrafiAccountEnrollmentListParams = Increase::Models::IntrafiAccountEnrollmentListParams

  IntrafiAccountEnrollmentRetrieveParams = Increase::Models::IntrafiAccountEnrollmentRetrieveParams

  IntrafiAccountEnrollmentUnenrollParams = Increase::Models::IntrafiAccountEnrollmentUnenrollParams

  IntrafiBalance = Increase::Models::IntrafiBalance

  IntrafiBalanceIntrafiBalanceParams = Increase::Models::IntrafiBalanceIntrafiBalanceParams

  IntrafiExclusion = Increase::Models::IntrafiExclusion

  IntrafiExclusionArchiveParams = Increase::Models::IntrafiExclusionArchiveParams

  IntrafiExclusionCreateParams = Increase::Models::IntrafiExclusionCreateParams

  IntrafiExclusionListParams = Increase::Models::IntrafiExclusionListParams

  IntrafiExclusionRetrieveParams = Increase::Models::IntrafiExclusionRetrieveParams

  Lockbox = Increase::Models::Lockbox

  LockboxCreateParams = Increase::Models::LockboxCreateParams

  LockboxListParams = Increase::Models::LockboxListParams

  LockboxRetrieveParams = Increase::Models::LockboxRetrieveParams

  LockboxUpdateParams = Increase::Models::LockboxUpdateParams

  OAuthApplication = Increase::Models::OAuthApplication

  OAuthApplicationListParams = Increase::Models::OAuthApplicationListParams

  OAuthApplicationRetrieveParams = Increase::Models::OAuthApplicationRetrieveParams

  OAuthConnection = Increase::Models::OAuthConnection

  OAuthConnectionListParams = Increase::Models::OAuthConnectionListParams

  OAuthConnectionRetrieveParams = Increase::Models::OAuthConnectionRetrieveParams

  OAuthToken = Increase::Models::OAuthToken

  OAuthTokenCreateParams = Increase::Models::OAuthTokenCreateParams

  PendingTransaction = Increase::Models::PendingTransaction

  PendingTransactionCreateParams = Increase::Models::PendingTransactionCreateParams

  PendingTransactionListParams = Increase::Models::PendingTransactionListParams

  PendingTransactionReleaseParams = Increase::Models::PendingTransactionReleaseParams

  PendingTransactionRetrieveParams = Increase::Models::PendingTransactionRetrieveParams

  PhysicalCard = Increase::Models::PhysicalCard

  PhysicalCardCreateParams = Increase::Models::PhysicalCardCreateParams

  PhysicalCardListParams = Increase::Models::PhysicalCardListParams

  PhysicalCardProfile = Increase::Models::PhysicalCardProfile

  PhysicalCardProfileArchiveParams = Increase::Models::PhysicalCardProfileArchiveParams

  PhysicalCardProfileCloneParams = Increase::Models::PhysicalCardProfileCloneParams

  PhysicalCardProfileCreateParams = Increase::Models::PhysicalCardProfileCreateParams

  PhysicalCardProfileListParams = Increase::Models::PhysicalCardProfileListParams

  PhysicalCardProfileRetrieveParams = Increase::Models::PhysicalCardProfileRetrieveParams

  PhysicalCardRetrieveParams = Increase::Models::PhysicalCardRetrieveParams

  PhysicalCardUpdateParams = Increase::Models::PhysicalCardUpdateParams

  Program = Increase::Models::Program

  ProgramListParams = Increase::Models::ProgramListParams

  ProgramRetrieveParams = Increase::Models::ProgramRetrieveParams

  RealTimeDecision = Increase::Models::RealTimeDecision

  RealTimeDecisionActionParams = Increase::Models::RealTimeDecisionActionParams

  RealTimeDecisionRetrieveParams = Increase::Models::RealTimeDecisionRetrieveParams

  RealTimePaymentsTransfer = Increase::Models::RealTimePaymentsTransfer

  RealTimePaymentsTransferApproveParams = Increase::Models::RealTimePaymentsTransferApproveParams

  RealTimePaymentsTransferCancelParams = Increase::Models::RealTimePaymentsTransferCancelParams

  RealTimePaymentsTransferCreateParams = Increase::Models::RealTimePaymentsTransferCreateParams

  RealTimePaymentsTransferListParams = Increase::Models::RealTimePaymentsTransferListParams

  RealTimePaymentsTransferRetrieveParams = Increase::Models::RealTimePaymentsTransferRetrieveParams

  RoutingNumberListParams = Increase::Models::RoutingNumberListParams

  Simulations = Increase::Models::Simulations

  SupplementalDocumentCreateParams = Increase::Models::SupplementalDocumentCreateParams

  SupplementalDocumentListParams = Increase::Models::SupplementalDocumentListParams

  Transaction = Increase::Models::Transaction

  TransactionListParams = Increase::Models::TransactionListParams

  TransactionRetrieveParams = Increase::Models::TransactionRetrieveParams

  WireDrawdownRequest = Increase::Models::WireDrawdownRequest

  WireDrawdownRequestCreateParams = Increase::Models::WireDrawdownRequestCreateParams

  WireDrawdownRequestListParams = Increase::Models::WireDrawdownRequestListParams

  WireDrawdownRequestRetrieveParams = Increase::Models::WireDrawdownRequestRetrieveParams

  WireTransfer = Increase::Models::WireTransfer

  WireTransferApproveParams = Increase::Models::WireTransferApproveParams

  WireTransferCancelParams = Increase::Models::WireTransferCancelParams

  WireTransferCreateParams = Increase::Models::WireTransferCreateParams

  WireTransferListParams = Increase::Models::WireTransferListParams

  WireTransferRetrieveParams = Increase::Models::WireTransferRetrieveParams
end
