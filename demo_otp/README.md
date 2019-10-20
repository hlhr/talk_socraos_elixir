# DemoOtp

Start `iex -S mix`

```
iex(1)> DemoOtp.ClickCounterRegistry.create(DemoOtp.ClickCounterRegistry, "google.de")
:ok
iex(2)> {:ok, pid} = DemoOtp.ClickCounterRegistry.lookup(DemoOtp.ClickCounterRegistry, "google.de")
{:ok, #PID<0.137.0>}
iex(3)> DemoOtp.ClickCounter.get_click_count(pid)
0
iex(4)> DemoOtp.ClickCounter.register_click(pid)
:ok
iex(5)> DemoOtp.ClickCounter.register_click(pid)
:ok
iex(6)> DemoOtp.ClickCounter.register_click(pid)
:ok
iex(7)> DemoOtp.ClickCounter.get_click_count(pid)
3
```
