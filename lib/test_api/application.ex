defmodule TestApi.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: TestApi.Router, options: [port: 8080]}
    ]

    opts = [strategy: :one_for_one, name: TestApi.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
