defmodule ExMon.Player do
  @max_life 100
  @require_keys [:life, :moves, :name]

  alias ExMon.Game
  alias ExMon.Game.Actions
  alias ExMon.Game.Status

  @enforce_keys @require_keys
  defstruct @require_keys

  def create_player(name, move_rnd, move_avg, move_heal) do
    %ExMon.Player{
      life: @max_life,
      moves: %{
        move_rnd: move_rnd,
        move_avg: move_avg,
        move_heal: move_heal
      },
      name: name
    }
  end

  def start_game(warrior_name, player) do
    warrior_name
    |> create_player(:punch, :kick, :heal)
    |> Game.start(player)

    Status.print_round_message(Game.info())
  end

  def make_move(move) do
    move
    |> Actions.fetch_move()
    |> do_move()
  end

  defp do_move({:ok, move}) do
    case move do
      :move_heal -> "realiza a cura"
      move -> Actions.attack(move)
    end

    Game.info()
    |> Status.print_round_message()
  end

  defp do_move({:error, move}) do
    Status.print_wrong_move_message(move)
  end
end
