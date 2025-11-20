function _update60()
  game.player:update()
  for monster in all(game.monsters) do
    monster:update()
  end
end