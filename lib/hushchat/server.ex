defmodule Hushchat.Server do
  use GenServer

  alias Hushchat.Client

  def start_link(ssh_port) do
    GenServer.start_link(__MODULE__, ssh_port, name: __MODULE__)
  end

  def stop(server) do
    GenServer.call(server, :stop)
  end

  def init(ssh_port) do
    :ssh.start()
    :ssh.daemon(ssh_port,[
          system_dir: 'priv/sys_dir/',
          user_dir: 'priv/usr_dir/.ssh/',
          shell: &Hushchat.Client.create/2])
  end

  def handle_call(:stop, _from, daemon) do
    :ssh.stop(daemon)
    {:stop, :normal, :ok, nil}
  end
end
