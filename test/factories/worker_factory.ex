defmodule ElixirPdg.WorkerFactory do
  defmacro __using__(_opts) do
    quote do
      def worker_factory do
        %ElixirPdg.Worker{
          first_name: "John",
          statuc: "medic",
          price_per_shift: 100
        }
      end
    end
  end
end