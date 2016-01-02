defmodule HelloPhoenix.Transaction do
  use Ecto.Model

  schema "transactions" do
    field :to_address
    field :to_public_key
    field :from_address
    field :from_public_key
    field :amount

    timestamps
  end
end
