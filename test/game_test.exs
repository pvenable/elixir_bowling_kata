defmodule GameTest do
  use ExUnit.Case
  doctest Game

  test "scores a gutter game" do
    game = %Game{} |> roll_many(20, 0)

    assert Game.score(game) == 0
  end

  test "scores open frames" do
    game = %Game{} |> roll_many(20, 1)

    assert Game.score(game) == 20
  end

  test "scores a spare" do
    game = %Game{}
      |> Game.roll(1)
      |> Game.roll(9)
      |> roll_many(18, 1)

    assert Game.score(game) == 29
  end

  defp roll_many(game, times, pins) do
    Enum.reduce(1..times, game, fn(_, game) -> Game.roll(game, pins) end)
  end
end
