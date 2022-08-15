defmodule YtFetcher.Application do
  use Application

  @impl true
  @spec start(any, any) :: {:error, any} | {:ok, pid}
  def start(_type, _args) do
    children = [
      {
        Plug.Cowboy,
        scheme: :http,
        plug: YtFetcher.Router,
        options: [port: (System.get_env("PORT") || Application.get_env(:ytfetcher, :port))]
      }
    ]

    opts = [strategy: :one_for_one, name: YtFetcher.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
