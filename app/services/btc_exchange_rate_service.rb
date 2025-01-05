class BtcExchangeRateService
    BASE_URL = "https://api.coinbase.com/v2"

    def fetch_rate
        response = Faraday.get("#{BASE_URL}/exchange-rates?currency=BTC")
        if response.success?
          data = JSON.parse(response.body)
          data['data']['rates']['USD'].to_f
        else
          raise "Error fetching exchange rate"
        end
      end
    end    