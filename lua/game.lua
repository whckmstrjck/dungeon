Game = Class:new({
  new = function(_ENV, tbl)
    tbl = tbl or {}
    tbl.player = Player:new()
    tbl.camera = Camera:new({ player = tbl.player })

    return setmetatable(
      tbl or {}, {
        __index = _ENV
      }
    )
  end,

  player = nil,
  monsters = {}
})