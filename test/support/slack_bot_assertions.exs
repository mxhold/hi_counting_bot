defmodule SlackBotAssertions do
  import ExUnit.Assertions
  import Mock

  def assert_slackbot_response(
    bot: bot,
    initial_state: initial_state,
    message_text: message_text,
    expected_state: expected_state,
    expected_response: expected_response,
  ) do
    channel = :fake_channel
    socket = :fake_socket
    slack = %{socket: socket}
    message = message(message_text, channel)
    expected_response_json = message_json(expected_response, channel)

    assert_websocket_sent(expected_response_json, socket, fn ->
      {:ok, state} = bot.handle_message(message, slack, initial_state)
      assert state == expected_state
    end)
  end

  defp message(text, channel) do
    %{channel: channel, text: text, type: "message"}
  end

  defp message_json(text, channel) do
    {:ok, json} = JSX.encode(message(text, channel))
    json
  end

  defp assert_websocket_sent(expected_json, socket, fun) do
    with_mock :websocket_client, [send: fn(_, _) -> nil end] do
      fun.()

      assert called :websocket_client.send({:text, expected_json}, socket)
    end
  end
end

