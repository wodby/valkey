.PHONY: flushall check-ready check-live

host ?= localhost
max_try ?= 1
wait_seconds ?= 1
delay_seconds ?= 0

default: check-ready

flushall:
	flush_all $(host)

check-ready:
	wait_for_valkey $(host) $(max_try) $(wait_seconds) $(delay_seconds)

check-live:
	@echo "OK"
