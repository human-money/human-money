defmodule HumanMoney.ChangesetView do
  use HumanMoney.Web, :view

  def render("error.json", changeset) do
    %{errors: Enum.into(changeset.errors, %{})}
  end
end
