#!/bin/bash

if [ "$1" != "" ]
then
  exec docker exec -it todo_app_elixir_1 bash -c "mix ecto.gen.migration '$1'"
fi