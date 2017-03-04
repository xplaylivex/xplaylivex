class NewsletterSubscriptionsController < ApplicationController
  def create
    @newsletter_subscription = NewsletterSubscription.new(newsletter_subscription_params)
    if (@newsletter_subscription.save)
      redirect_to root_url, notice: I18n.t('flash.newsletter_subscription_done')
    else
      redirect_to root_url, alert: @newsletter_subscription.errors
    end
  end

  private
    def newsletter_subscription_params
      params.require(:newsletter_subscription).permit(:email)
    end
end
