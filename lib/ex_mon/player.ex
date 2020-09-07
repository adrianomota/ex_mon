defmodule ExMon.Player do
  @max_life 100
  @require_keys [:life, :name, :move_rnd, :move_avg, :move_heal]
  @msg_game_started "The game is started"

  alias ExMon.Game

  @enforce_keys @require_keys
  defstruct @require_keys

  def create_player(name, move_rnd, move_avg, move_heal) do
    %ExMon.Player{
      name: name,
      move_rnd: move_rnd,
      move_avg: move_avg,
      move_heal: move_heal,
      life: @max_life
    }
  end

  def start_game(warrior_name, player) do
    warrior_name
    |> create_player(:punch, :kick, :heal)
    |> Game.start(player)

    print_status_game()
  end

  defp print_status_game() do
    IO.puts("\n======= #{@msg_game_started} =======\n")
    Game.info() |> IO.inspect()
    IO.puts("\n====================================\n")
  end
end
