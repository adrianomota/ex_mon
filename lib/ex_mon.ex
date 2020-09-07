defmodule ExMon do
  alias ExMon.Player
  defdelegate create_player(name, move_rnd, move_avg, move_heal), to: Player
  defdelegate start_game(warrior_name, player), to: Player
end
