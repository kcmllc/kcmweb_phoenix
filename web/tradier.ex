defmodule KcmwebPhoenix.Tradier do

  def get_watchlists do
    headers = %{"Authorization" => "Bearer oWcPihSd9yYBJAnBkmFK2Hsc8Ns4",
                "Accept" => "application/json"}
    response = HTTPoison.get!("https://api.tradier.com/v1/watchlists", headers)
    json = JSX.decode! response.body
    json = json["watchlists"]["watchlist"]
    json
  end
  def get_watchlist_tickers(watchlist) do
    headers = %{"Authorization" => "Bearer oWcPihSd9yYBJAnBkmFK2Hsc8Ns4",
    "Accept" => "application/json"}
    id = hd(tl(watchlist))["id"]
    response = HTTPoison.get!("https://api.tradier.com/v1/watchlists/"<>id, headers)
    json = JSX.decode! response.body
    json = json["watchlist"]["items"]["item"] 
  end
end
