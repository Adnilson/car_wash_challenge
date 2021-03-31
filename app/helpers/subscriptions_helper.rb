module SubscriptionsHelper
  def availability(subscriptions)
    if subscriptions.present?
      return format_date(subscriptions.last.end_date)
    end

    return 'Available now'
  end

  def format_date(date)
    date.strftime("%d/%m/%Y")
  end
end
