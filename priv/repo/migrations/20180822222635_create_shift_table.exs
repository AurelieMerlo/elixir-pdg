defmodule ElixirPdg.Repo.Migrations.CreateShiftTable do
  use Ecto.Migration

  def change do
  	create table(:shifts) do
  	  add :worker_id, references(:workers)
      add :start_date, :date
      
      timestamps()
    end
  end
end



