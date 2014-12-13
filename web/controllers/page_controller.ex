defmodule KcmwebPhoenix.PageController do
  use Phoenix.Controller
  alias KcmwebPhoenix.Repo
  alias KcmwebPhoenix.Tradier

  plug :action

  def index(conn, _params) do
    render conn, "index"
  end

  def watchlists(conn, _params) do
    watchlists = Tradier.get_watchlists |> Tradier.get_watchlist_tickers
    watchlists = JSX.encode! watchlists
    json conn, watchlists
  end

  def not_found(conn, _params) do
    render conn, "not_found"
  end

  def error(conn, _params) do
    render conn, "error"
  end
end
