defmodule ElixirPdg.Repo.Migrations.CreateWorkerTable do
  use Ecto.Migration

  def change do
  	create table(:workers) do
      add :first_name, :string, null: false
      add :status, :string
      add :price_per_shift, :integer
      
      timestamps()
    end
  end
end