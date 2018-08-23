defmodule ElixirPdgWeb.ShiftController do
  use ElixirPdgWeb, :controller

  import Ecto

  def index(conn, _params) do
    shifts = ElixirPdg.Repo.all(Shift)
    render conn, "index.html", shifts: shifts
  end

  def new(conn, _params) do
    worker = ElixirPdg.Repo.get!(Worker, _params["worker_id"])

    changeset = Shift.changeset(%Shift{}, %{})
    render conn, changeset: changeset, worker: worker
  end

  def create(conn, %{"shift" => shift_params, "worker_id" => worker_id}) do 
    alias ElixirPdg.Repo

    worker = ElixirPdg.Repo.get!(Worker, worker_id)

    [year, month, day] = [shift_params["start_date"]["year"], shift_params["start_date"]["month"], shift_params["start_date"]["day"]]

    {year, _r} = Integer.parse(year)
    {month, _r} = Integer.parse(month)
    {day, _r} = Integer.parse(day)

    {:ok, date} = Date.new(year, month, day)

    date

    attrs = %{ start_date: date, worker_id: String.to_integer(worker_id) }

    %Shift{}
    |> Shift.changeset(attrs)
    |> Repo.insert()
    |> case do
      {:ok, shift} ->
      conn
      |> put_flash(:info, "Shift added successfully.")
      |> redirect(to: worker_path(conn, :show, worker))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    shift = ElixirPdg.Repo.get!(Shift, id)
    worker = ElixirPdg.Repo.get!(Worker, shift.worker_id)

    {:ok, _shift} = ElixirPdg.Repo.delete(shift)

    conn
    |> put_flash(:info, "Shift deleted successfully.")
    |> redirect(to: worker_path(conn, :show, worker))
  end

end
