defmodule ElixirPdgWeb.WorkerController do
  use ElixirPdgWeb, :controller

  import Ecto

  def index(conn, _params) do
  	workers = ElixirPdg.Repo.all(Worker)
  	render conn, "index.html", workers: workers
  end

  def new(conn, _params) do
  	changeset = Worker.changeset(%Worker{}, %{})
  	render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"worker" => worker_params}) do
  	alias ElixirPdg.Repo

  	%Worker{}
  	|> Worker.changeset(worker_params)
  	|> Repo.insert()
  	|> case do
    	{:ok, worker} ->
      conn
      |> put_flash(:info, "Worker created successfully.")
      |> redirect(to: worker_path(conn, :index))

    	{:error, %Ecto.Changeset{} = changeset} ->
      	render(conn, "new.html", changeset: changeset)
  	end
	end

	def show(conn, %{"id" => id}) do
  	worker = ElixirPdg.Repo.get!(Worker, id)
    shifts = ElixirPdg.Repo.all assoc(worker, :shifts)

  	render(conn, "show.html", worker: worker, shifts: shifts)
	end

	def edit(conn, %{"id" => id}) do
    worker = ElixirPdg.Repo.get!(Worker, id)

    changeset = Worker.changeset(%Worker{}, %{})
    render(conn, "edit.html", worker: worker, changeset: changeset)
  end

  def update(conn, %{"id" => id, "worker" => worker_params}) do
    worker = ElixirPdg.Repo.get!(Worker, id)

    worker
  	|> Worker.changeset(worker_params)
  	|> ElixirPdg.Repo.update()
  	|> case do
    	{:ok, worker} ->
      	conn
      	|> put_flash(:info, "Worker updated successfully.")
      	|> redirect(to: worker_path(conn, :show, worker))
    	{:error, %Ecto.Changeset{} = changeset} ->
      	render(conn, "edit.html", worker: worker, changeset: changeset)
  	end
  end

  def delete(conn, %{"id" => id}) do
  	worker = ElixirPdg.Repo.get!(Worker, id)

  	{:ok, _worker} = ElixirPdg.Repo.delete(worker)

  	conn
  	|> put_flash(:info, "Worker deleted successfully.")
  	|> redirect(to: worker_path(conn, :index))
	end
end