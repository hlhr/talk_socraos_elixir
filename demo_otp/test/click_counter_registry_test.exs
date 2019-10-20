defmodule DemoOtp.ClickCounterRegistryTest do
  use ExUnit.Case, async: true

  alias DemoOtp.ClickCounterRegistry

  setup do
    registry = start_supervised!(ClickCounterRegistry)
    %{registry: registry}
  end

  test "lookup returns :error if not found", %{registry: registry} do
    assert ClickCounterRegistry.lookup(registry, "google.de") == :error
  end

  test "spawns counter", %{registry: registry} do
    ClickCounterRegistry.create(registry, "google.de")
    assert {:ok, counter} = ClickCounterRegistry.lookup(registry, "google.de")
  end
end
