defmodule MasonMoney.ChangesetView do
  use MasonMoney.Web, :view

  def render("error.json", changeset) do
    %{errors: Enum.into(changeset.errors, %{})}
  end
end
