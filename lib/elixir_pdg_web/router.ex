defmodule ElixirPdgWeb.Router do
  use ElixirPdgWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", ElixirPdgWeb do
    pipe_through :browser # Use the default browser stack

    get "/", WorkerController, :index
    resources "/workers", WorkerController
  end

  # Other scopes may use custom stacks.
  # scope "/api", ElixirPdgWeb do
  #   pipe_through :api
  # end
end
