defmodule KcmwebPhoenix.Router do
  use Phoenix.Router
  use Phoenix.Router.Socket, mount: "/ws"

  scope "/" do
    # Use the default browser stack.
    pipe_through :browser

    # get "/", KcmwebPhoenix.PageController, :index, as: :pages
    get "/", KcmwebPhoenix.PageController, :index, as: :root
    get "/watchlists", KcmwebPhoenix.PageController, :watchlists
    channel "to_dos", KcmwebPhoenix.ToDoChannel
    channel "room", KcmwebPhoenix.RoomChannel
    get "/httptest", KcmwebPhoenix.ToDosController, :httptest
  end

  # Other scopes may use custom stacks.
  # scope "/api" do
  #   pipe_through :api
  # end
end
