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
    |> validate_number(:amount, greater_than: 0)
    |> validate_amount(:amount)
  end

  def validate_amount(changeset, field) do
    validate_change changeset, field, fn _, value ->
      if value > 0 do
        []
      else
        [{field, "Source address does not have enough funds to make this transaction"}]
      end
    end
  end
end
