defmodule HumanMoney.Repo.Migrations.CreateNodes do
  use Ecto.Migration

  def change do
    create table(:nodes) do
      add :ip_address, :string
      add :public_key, :binary

      timestamps
    end
  end
end
