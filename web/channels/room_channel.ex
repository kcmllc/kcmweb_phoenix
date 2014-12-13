defmodule KcmwebPhoenix.RoomChannel do
  use Phoenix.Channel
  alias KcmwebPhoenix.Repo
  alias KcmwebPhoenix.Tradier

  def join(socket, "lobby", message) do
    IO.puts "JOIN #{socket.channel}: #{socket.topic}"
    reply socket, "join", %{status: "connected"}
    broadcast socket, "user:entered", %{user: message["user"]}
    {:ok, socket}
  end

  def join(socket, _private_topic, _message) do
    {:error, socket, :unauthorized}
  end

  def event(socket, "new:msg", message) do
    broadcast socket, "new:msg", message
    socket
  end
  def event(socket, "get:watchlists", message) do
    watchlists = Tradier.get_watchlists |> Tradier.get_watchlist_tickers
    reply socket, "watchlists", %{watchlists: watchlists}
  end
end
