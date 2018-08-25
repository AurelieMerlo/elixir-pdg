defmodule Shift do
  use Ecto.Schema
  import Ecto.Changeset

  schema "shifts" do
  	field :start_date, :date
    belongs_to :worker, Worker, foreign_key: :worker_id

    timestamps()
  end

  def changeset(%Shift{} = shift, attrs) do
    shift
    |> cast(attrs, [:start_date, :worker_id])
    |> validate_required([:start_date, :worker_id])
  end
end