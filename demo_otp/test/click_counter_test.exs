defmodule DemoOtp.ClickCounterTest do
  use ExUnit.Case, async: true

  test "counter start value is 0" do
    {:ok, counter} = DemoOtp.ClickCounter.start_link([])
    assert DemoOtp.ClickCounter.get_click_count(counter) == 0
  end

  test "counter increments click counter with 1" do
    {:ok, counter} = DemoOtp.ClickCounter.start_link([])
    DemoOtp.ClickCounter.register_click(counter)
    assert DemoOtp.ClickCounter.get_click_count(counter) == 1
  end

  test "counter resets to 0" do
    {:ok, counter} = DemoOtp.ClickCounter.start_link([])

    DemoOtp.ClickCounter.register_click(counter)
    DemoOtp.ClickCounter.register_click(counter)
    DemoOtp.ClickCounter.register_click(counter)
    assert DemoOtp.ClickCounter.get_click_count(counter) == 3

    DemoOtp.ClickCounter.reset(counter)
    assert DemoOtp.ClickCounter.get_click_count(counter) == 0
  end
end
