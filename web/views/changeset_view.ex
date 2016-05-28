defmodule HumanMoney.ChangesetView do
  use HumanMoney.Web, :view

  def render("error.json", %{changeset: changeset}) do
    changeset.errors
      |> render_errors
      |> merge_errors
      |> wrap_errors

  end

  def wrap_errors(errors) do
    %{errors: errors}
  end

  def merge_errors(errors) do
    Enum.reduce(errors, %{}, fn({key, value}, acc) ->
      if acc[key] do
        Map.put(acc, key, acc[key] |> List.insert_at(1, value))
      else
        Map.put(acc, key, [value])
      end
    end)
  end

  def render_errors(errors) do
    Enum.map(errors, fn {k,v} -> {k, render_error(v)} end)
  end

  def render_error({message, values}) do
    Enum.reduce values, message, fn {k, v}, acc ->
      String.replace(acc, "%{#{k}}", to_string(v))
    end
  end

  def render_error(v), do: v
end
