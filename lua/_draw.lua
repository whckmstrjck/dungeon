function _draw()
  cls()

  game.camera:update()
  map()

  game.player:draw()
  for monster in all(game.monsters) do
    monster:draw()
  end
end