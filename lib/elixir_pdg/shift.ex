defmodule Shift do
  use Ecto.Schema

  schema "shifts" do
  	field :start_date, :date
    belongs_to :worker, Worker, foreign_key: :worker_id
  end
end