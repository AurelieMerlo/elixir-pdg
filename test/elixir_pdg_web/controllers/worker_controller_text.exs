defmodule ElixirPdgWeb.WorkerControllerTest do
  use ElixirPdgWeb.ConnCase

  import App.WorkerFactory

  worker = insert(:worker)

  describe "index/" do

  	test "responds with all Workers", %{conn: conn} do

 			response =
      	conn
      	|> get(worker_path(conn, :index))
      	|> json_response(200)

    	expected = %{
      	"data" => [
        	%{ "first_name" => worker.first_name, "status" => worker.status, "price_per_shift" => worker.price_per_shift }
      	]
    	}

    	assert response == expected
  	end

  end

  describe "show/" do

  	test "Responds with user info if the user is found", %{conn: conn, worker: worker} do

    	response =
      	conn
      	|> get(worker_path(conn, :show, worker.id))
      	|> json_response(200)

    	expected = %{"data" => %{"first_name" => worker.first_name, "status" => worker.status, "price_per_shift" => worker.price_per_shift}}

    	assert response == expected
  	end

  end

end
