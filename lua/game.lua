Game = Class:new({
  new = function(_ENV, tbl)
    tbl = tbl or {}
    tbl.player = Player:new({ x = 5, y = 3 })
    tbl.camera = Camera:new({ player = tbl.player })
    tbl.monsters = {
      Goblin:new({ x = 10, y = 9 })
    }

    return setmetatable(tbl or {}, { __index = _ENV })
  end,

  player = nil,
  player_moved = false,
  monsters_moving = false,
  monsters = {}
})