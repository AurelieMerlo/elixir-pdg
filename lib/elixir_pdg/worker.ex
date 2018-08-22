defmodule Worker do
  use Ecto.Schema

  schema "workers" do
    field :first_name, :string
    field :status, :string
    field :price_per_shift, :integer
    has_many :shifts, Shift
  end
end