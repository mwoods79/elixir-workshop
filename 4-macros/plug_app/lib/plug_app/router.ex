# lib/plug_app/router.ex

defmodule PlugApp.Router do

  defmacro __using__(_opts) do
    quote do
      import Plug.Conn
      import PlugApp.Router

      def init(opts) do
        opts
      end

      def call(conn, _opts) do
        route(conn.method, conn.path_info, conn)
      end
    end
  end

  defmacro get(path, do: block) do
    quote do
      def route("GET", [unquote(path)], var!(conn)) do
        unquote(block)
      end
    end
  end

end
