defmodule HumanMoney.Transaction do
  use Ecto.Model

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_fields ~w(source destination amount)
  @optional_fields ~w()
  schema "transactions" do
    field :source, :string
    field :destination, :string
    field :amount, :integer

    timestamps
  end

  def changeset(transaction, params \\ :empty) do
    transaction
    |> cast(params, @required_fields, @optional_fields)
  end
end
