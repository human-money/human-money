defmodule HumanMoney.TransactionChannel do
  use Phoenix.Channel

  def join("transactions:*", auth_message, socket) do
    {:ok, socket}
  end
end
