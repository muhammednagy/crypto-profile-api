# frozen_string_literal: true

class Trade < ApplicationRecord
  enum currency: %i[bitcoin ripple ethereum]

  def as_json(options)
    super(options).merge(
      'Current market value' => (amount * MarketPrice.marketPrice(currency)).to_s + " EUR"
    )
  end

end
