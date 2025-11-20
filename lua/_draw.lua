function _draw()
  cls()
  map()
  game.camera:update()
  game.player:draw()
  for monster in all(game.monsters) do
    monster:draw()
  end
end