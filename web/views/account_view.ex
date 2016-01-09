defmodule HelloPhoenix.AccountView do
  use HelloPhoenix.Web, :view

  def render("show.json", %{data: data}) do
    data
  end
end
