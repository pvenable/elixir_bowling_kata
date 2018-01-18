defmodule Game do
  defstruct rolls: []

  def roll(game, pins) do
    %{game | rolls: game.rolls ++ [pins]}
  end

  def score(game) do
    score_frames(10, game.rolls)
  end

  defp score_frames(0, _) do
    0
  end

  defp score_frames(count, rolls) do
    first = Enum.at(rolls, 0)
    second = Enum.at(rolls, 1)

    cond do
      first == 10 ->
        10 + Enum.at(rolls, 1) + Enum.at(rolls, 2) + score_frames(count - 1, Enum.drop(rolls, 1))

      first + second == 10 ->
        10 + Enum.at(rolls, 2) + score_frames(count - 1, Enum.drop(rolls, 2))

      true ->
        first + second + score_frames(count - 1, Enum.drop(rolls, 2))
    end
  end
end
