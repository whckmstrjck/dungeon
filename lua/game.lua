Game = Class:new({
  new = function(_ENV, tbl)
    tbl = tbl or {}
    tbl.player = Player:new({ x = 18, y = 14 })
    tbl.camera = Camera:new({ player = tbl.player })
    tbl.monsters = {
      Goblin:new({ x = 23, y = 20 }),
      Goblin:new({ x = 26, y = 20 })
    }

    return setmetatable(tbl or {}, { __index = _ENV })
  end,

  player = nil,
  player_moved = false,
  monsters_moving = false,
  monsters = {}
})