Actor = Class:new({
  new = function(_ENV, tbl)
    tbl = tbl or {}
    tbl.last_x = tbl.x
    tbl.last_y = tbl.y

    return setmetatable(tbl or {}, { __index = _ENV })
  end,

  type = "actor",
  spr_no = 0,
  x = 0,
  y = 0,
  last_x = 0,
  last_y = 0,
  flipped = false,

  acting = 0,
  acting_previous = 0,
  acting_max = 12,

  update = function(_ENV)
    if before_update then
      before_update(_ENV)
    end

    acting_previous = acting
    acting = max(0, acting - 1)

    if acting == 0 then
      last_x = x
      last_y = y
    end

    if after_update then
      after_update(_ENV)
    end
  end,

  draw = function(_ENV)
    local spr_x, spr_y = 0
    local t = 0
    local t_bounce = 1
    local y_offset = 0

    if acting > 0 then
      t = (acting_max - acting) / acting_max
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

    print(acting, spr_x - 4, spr_y - 10)
  end
})