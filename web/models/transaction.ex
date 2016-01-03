defmodule HelloPhoenix.Transaction do
  use Ecto.Model

  schema "transactions" do
    field :to_address, :string
    field :to_public_key, :string
    field :from_address, :string
    field :from_public_key, :string
    field :amount, :integer

    timestamps
  end
end
