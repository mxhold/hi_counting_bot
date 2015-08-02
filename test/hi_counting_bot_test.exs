defmodule HiCountingBotTest do
  use ExUnit.Case, async: false # cannot be async due to mocks

  import SlackBotAssertions

  test "messages get an ok response, regardless of type" do
    assert HiCountingBot.handle_message(%{}, nil, nil) == {:ok, nil}
  end

  test "responds with the number of times Hi has been said when Hi is said" do
    assert_slackbot_response(
      bot: HiCountingBot,
      initial_state: 0,
      message_text: "Hi",
      expected_state: 1,
      expected_response: "Hi has been said 1 times",
    )
  end

  test "increments the number every time Hi is said" do
    assert_slackbot_response(
      bot: HiCountingBot,
      initial_state: 1,
      message_text: "Hi",
      expected_state: 2,
      expected_response: "Hi has been said 2 times",
    )
  end
end
