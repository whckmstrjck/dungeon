Actor = Class:new({
  spr_no = 0,
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
    local spr_x, spr_y = 0
    local t = 0
    local t_bounce = 1
    local y_offset = 0

    if moving > 0 then
      t = (moving_max - moving) / moving_max
      t_bounce = sin((t + 1) >> 1)
      y_offset = t_bounce * -3

      spr_x = lerp(last_x, x, t) * 8
      spr_y = lerp(last_y, y, t) * 8
    else
      spr_x = x * 8
      spr_y = y * 8
    end

    sspr(
      spr_no % 16 * 8,
      flr(spr_no / 16),
      8,
      8,
      spr_x,
      spr_y + y_offset,
      8,
      8,
      flipped
    )
  end
})