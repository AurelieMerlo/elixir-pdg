defmodule Worker do
  use Ecto.Schema
  import Ecto.Changeset

  schema "workers" do
    field :first_name, :string
    field :status, :string
    field :price_per_shift, :integer
    has_many :shifts, Shift

    timestamps()
  end

  def changeset(%Worker{} = worker, attrs) do
    worker
    |> cast(attrs, [:first_name, :status, :price_per_shift])
  end
end