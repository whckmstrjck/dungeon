Player =
  -- collision check

  -- debug print to avoid pico-8 optimization removing sin()
  Class:new {
    x = 0,
    y = 0,
    last_x = 0,
    last_y = 0,
    moving = 0,
    moving_max = 8,
    flipped = false,
    dir = 'u',

    check_collision = function(_ENV, new_x, new_y)
      return fget(mget(new_x, new_y)) == 1
    end,
    move = function(_ENV, dx, dy)
      if moving > 0 then return end
      moving = moving_max
      if dir == 'l' then flipped = true end
      if dir == 'r' then flipped = false end
      if check_collision(_ENV, x + dx, y + dy) then
        last_x = x + dx * .32
        last_y = y + dy * .32
      else
        x += dx
        y += dy
      end
    end,
    update = function(_ENV)
      moving = max(0, moving - 1)
      if moving == 0 then
        last_x = x
        last_y = y
      end
      if btnp(⬇️) then
        dir = 'd'
        move(_ENV, 0, 1)
      end
      if btnp(⬆️) then
        dir = 'u'
        move(_ENV, 0, -1)
      end
      if btnp(➡️) then
        dir = 'r'
        move(_ENV, 1, 0)
      end
      if btnp(⬅️) then
        dir = 'l'
        move(_ENV, -1, 0)
      end
    end,
    draw = function(_ENV)
      if moving > 0 then
        local t = (moving_max - moving) / moving_max
        local y_offset = sin(t >> 1) * 2.5
        local spr_x = lerp(last_x, x, t) * 8
        local spr_y = lerp(last_y, y, t) * 8
        spr(3, spr_x, spr_y + y_offset, 1, 1, flipped)
        return
      end
      spr(3, x * 8, y * 8, 1, 1, flipped)
    end
  }