defmodule Hushchat do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Hushchat.Server, [2200])
    ]

    opts = [strategy: :one_for_one, name: Hushchat.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
