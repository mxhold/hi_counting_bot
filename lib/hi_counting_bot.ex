defmodule HiCountingBot do
  use Slack

  def handle_message(message = %{type: "message", text: "Hi"}, slack, state) do
    new_state = state + 1
    response = "Hi has been said #{new_state} times"
    send_message(response, message.channel, slack)

    {:ok, new_state}
  end

  def handle_message(_message, _slack, state) do
    {:ok, state}
  end
end
