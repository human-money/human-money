defmodule HumanMoney.Transaction do
  use Ecto.Model

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_fields ~w(amount)
  @optional_fields ~w(to_address to_public_key from_address from_public_key)
  schema "transactions" do
    field :to_address, :string
    field :to_public_key, :string
    field :from_address, :string
    field :from_public_key, :string
    field :amount, :integer

    timestamps
  end

  def changeset(transaction, params \\ :empty) do
    transaction
    |> cast(params, @required_fields, @optional_fields)
  end
end
