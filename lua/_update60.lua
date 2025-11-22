function _update60()
  game.player:update()

  if game.player_moved then
    game.monsters_moving = true
    for monster in all(game.monsters) do
      monster:update()
    end
    game.monsters_moving = false
  end
end