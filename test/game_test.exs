defmodule GameTest do
  use ExUnit.Case
  doctest Game

  test "scores a gutter game" do
    game = Enum.reduce(1..20, fn(_, game) -> Game.roll(game, 0) end)

    assert Game.score(game) == 0
  end
end
