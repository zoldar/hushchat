defmodule Hushchat.Client do
  def create(user, ip_addr) do
    spawn(fn -> main_loop(user, ip_addr) end)
  end

  defp main_loop(user, ip_addr) do
    case get_input() do
      "exit" -> IO.puts("Bye!\n")
                {:ok, :exit}
                said -> :io.format("~s said: ~s~n", [user, said])
                        main_loop(user, ip_addr)
    end
  end

  defp get_input() do
    String.strip(to_string(IO.gets("Wha?! > ")))
  end
end
