defmodule HelloPhoenix.AccountView do
  use HelloPhoenix.Web, :view

  def render("show.json", %{balance: balance}) do
    Protobufs.Account.encode(Protobufs.Account.new(balance: balance))
  end
end
