Monster = Actor:new({
  spr_no = 0,

  move = function(_ENV, dx, dy)
    acting = acting_max
    if dx < 0 then flipped = true end
    if dx > 0 then flipped = false end

    x += dx
    y += dy
  end,

  after_update = function(_ENV)
    if acting == 0 then
      G.game:monster_is_done(_ENV)
    end
  end
})