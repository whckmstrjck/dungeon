Actor = Class:new({
  x = 0,
  y = 0,
  last_x = 0,
  last_y = 0,
  moving = 0,
  moving_max = 12,
  flipped = false,
  update = function(_ENV)
    -- to be overridden by subclasses
  end,
  draw = function(_ENV)
    if moving > 0 then
      local t = (moving_max - moving) / moving_max
      local y_offset = sin(t >> 1) * 1.5
      local spr_x = lerp(last_x, x, t) * 8
      local spr_y = lerp(last_y, y, t) * 8
      spr(3, spr_x, spr_y + y_offset, 1, 1, flipped)
      return
    end
    spr(3, x * 8, y * 8, 1, 1, flipped)
  end
})