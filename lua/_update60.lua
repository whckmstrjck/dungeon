function _update60()
  game.player:update()

  if game.monsters_to_act then
    game.monsters_to_act[1]:update()
  end
end