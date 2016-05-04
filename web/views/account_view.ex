defmodule HumanMoney.AccountView do
  use HumanMoney.Web, :view

  def render("show.json", %{data: data}) do
    data
  end
end
