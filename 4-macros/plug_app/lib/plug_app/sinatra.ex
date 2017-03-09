# lib/plug_app/sinatra.ex

defmodule PlugApp.Sinatra do
  use PlugApp.Router

  get "hello" do
    conn |> send_resp(200, "Hello World")
  end
end
