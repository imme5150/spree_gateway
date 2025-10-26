module Spree
  class Gateway::Eway < Gateway
    preference :login, :string

    # Note: EWay supports purchase method only (no authorize method).
    def auto_capture?
      true
    end

    def provider_class
      ActiveMerchant::Billing::EwayGateway
    end

    def options_with_test_preference
      options_without_test_preference.merge(:test => self.preferred_test_mode)
    end

    alias_method :options_without_test_preference, :options
    alias_method :options, :options_with_test_preference
  end
end
