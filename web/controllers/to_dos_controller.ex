defmodule KcmwebPhoenix.ToDosController do
  use Phoenix.Controller
  # use JSON
  alias KcmwebPhoenix.Repo
  alias KcmwebPhoenix.Tradier
  import Ecto.Query

  plug :action

  def index(conn, _params) do
    to_do_items = Repo.all(Item
                            |> where([item], item.done == false)
                            |> order_by([item], asc: item.position))

    done_items = Repo.all(Item
                            |> where([item], item.done == true)
                            |> order_by([item], asc: item.position))

    render conn, "index", to_do_items: to_do_items, done_items: done_items
  end
  def httptest(conn, _params) do
    to_do_items = Repo.all(Item
    |> where([item], item.done == false)
    |> order_by([item], asc: item.position))

    done_items = Repo.all(Item
    |> where([item], item.done == true)
    |> order_by([item], asc: item.position))


    watchlists = Tradier.get_watchlists |> Tradier.get_watchlist_tickers
    render conn, "index", to_do_items: to_do_items, done_items: done_items, tickers: watchlists
  end
end
