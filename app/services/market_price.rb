# frozen_string_literal: true

module MarketPrice
  class << self
    def marketPrice(currency)
      if currency == "bitcoin"
        HTTParty.get("https://api.bitfinex.com/v1/pubticker/btceur")["last_price"].to_f
      elsif currency == "ripple"
        xrp_btc = HTTParty.get("https://api.bitfinex.com/v1/pubticker/xrpbtc")["last_price"].to_f
        btc_eur = HTTParty.get("https://api.bitfinex.com/v1/pubticker/btceur")["last_price"].to_f
        xrp_btc * btc_eur
      else
        HTTParty.get("https://api.bitfinex.com/v1/pubticker/etheur")["last_price"].to_f
      end
    end
  end
end
