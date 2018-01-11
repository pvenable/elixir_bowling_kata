defmodule Game do
  defstruct score: 0

  def roll(game, pins) do
    %{game | score: game.score + pins}
  end

  def score(game) do
    game.score
  end
end
