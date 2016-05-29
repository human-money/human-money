defmodule HumanMoney.Transaction do
  use HumanMoney.Web, :model

  alias HumanMoney.Queries.Account

  schema "transactions" do
    field :amount, :integer
    belongs_to :source, HumanMoney.Account
    belongs_to :destination, HumanMoney.Account

    timestamps
  end

  @required_fields ~w(amount)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(transaction, params \\ :empty) do
    transaction
    |> cast(params, @required_fields, @optional_fields)
    |> validate_number(:amount, greater_than: 0)
    |> validate_amount(:amount, params[:source_id])
  end

  def validate_amount(changeset, field, source_id) do
    validate_change changeset, field, fn _, value ->
      if Account.balance(source_id) < value do
        [{field, "Source address does not have enough funds to make this transaction"}]
      else
        []
      end
    end
  end
end
