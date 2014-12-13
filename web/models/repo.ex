defmodule KcmwebPhoenix.Repo do
  use Ecto.Repo, adapter: Ecto.Adapters.Postgres

  def conf do
    parse_url "ecto://kyle:Tolkien!22@knightcapllc.com/to_dos"
  end

  def priv do
    app_dir(:kcmweb_phoenix, "priv/repo")
  end
end
