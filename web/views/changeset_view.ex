defmodule HelloPhoenix.ChangesetView do
  use HelloPhoenix.Web, :view

  def render("error.json", changeset) do
    %{errors: Enum.into(changeset.errors, %{})}
  end
end
