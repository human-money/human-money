defmodule HumanMoney.Repo.Migrations.CreateAccount do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add :address, :binary

      timestamps
    end

  end
end
