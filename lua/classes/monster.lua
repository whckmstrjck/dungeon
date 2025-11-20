Monster = Actor:new({
  spr_no = 0,
  move = function(_ENV, dx, dy)
    moving = moving_max
    if dx < 0 then flipped = true end
    if dx > 0 then flipped = false end

    x += dx
    y += dy
  end
})