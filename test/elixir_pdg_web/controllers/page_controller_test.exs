defmodule ElixirPdgWeb.PageControllerTest do
  use ElixirPdgWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to PDG"
  end
end
