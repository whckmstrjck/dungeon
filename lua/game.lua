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

  player_acted = function(_ENV)
    monsters_to_act = {}

    for monster in all(monsters) do
      monster.acting = monster.acting_max
      add(monsters_to_act, monster)
    end
  end,

  monster_is_done = function(_ENV, monster)
    del(monsters_to_act, monster)
    if #monsters_to_act == 0 then
      monsters_to_act = nil
    end
  end,

  monsters = {},
  monsters_to_act = nil
})