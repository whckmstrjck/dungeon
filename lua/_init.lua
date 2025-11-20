G = _ENV

function _init()
  poke(0x5f2e, 1)
  pal({ [0] = 0, -15, 2, -11, 3, 5, 6, 4, 8, 9, 10, 11, 12, 13, 14, 7 }, 1)

  game = Game:new()
end