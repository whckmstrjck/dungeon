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

    if moving > 0 then
      local t = (moving_max - moving) / moving_max
      local y_offset = sin(t >> 1) * 1.5
      spr_x = lerp(last_x, x, t) * 8
      spr_y = lerp(last_y, y, t) * 8 + y_offset
    else
      spr_x = x * 8
      spr_y = y * 8
    end

    -- spr_x = spr_x + (G.game.camera.x - flr(G.game.camera.x))
    -- spr_y = spr_y + (G.game.camera.y - flr(G.game.camera.y))

    -- spr(spr_no, spr_x, spr_y, 1, 1, flipped)
    sspr(
      spr_no % 16 * 8,
      flr(spr_no / 16),
      8,
      8,
      spr_x,
      spr_y,
      8,
      8,
      flipped
    )
  end
})