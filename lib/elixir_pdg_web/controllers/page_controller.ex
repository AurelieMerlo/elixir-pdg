defmodule ElixirPdgWeb.PageController do
  use ElixirPdgWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
