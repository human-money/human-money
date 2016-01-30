defmodule MasonMoney.AccountView do
  use MasonMoney.Web, :view

  def render("show.json", %{data: data}) do
    data
  end
end
