defmodule ExMon do
  alias ExMon.{Game, Player}

  defdelegate create_player(name, move_rnd, move_avg, move_heal), to: Player
  defdelegate start_game(player), to: Player
  defdelegate player, to: Game
  defdelegate make_move(move), to: Player
end
