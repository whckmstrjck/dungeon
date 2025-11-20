Player = Actor:new({
  buffered_dx = nil,
  buffered_dy = nil,
  check_collision = function(_ENV, new_x, new_y)
    if fget(mget(new_x, new_y)) == 1 then return 'wall' end
    if fget(mget(new_x, new_y)) == 2 then return 'door' end

    return nil
  end,
  open_door = function(_ENV, door_x, door_y)
    local door_tile = mget(door_x, door_y)
    if door_tile == 19 then
      mset(door_x, door_y, 20)
      sfx(2)
    elseif door_tile == 35 then
      mset(door_x, door_y, 36)
      sfx(2)
    end
  end,
  move = function(_ENV, dx, dy)
    if moving > 0 then
      buffered_dx = dx
      buffered_dy = dy
      return
    end

    moving = moving_max
    if dx < 0 then flipped = true end
    if dx > 0 then flipped = false end
    local collission = check_collision(_ENV, x + dx, y + dy)

    if collission then
      last_x = x + dx * .32
      last_y = y + dy * .32
    end

    if collission == 'wall' then
      sfx(1)
    elseif collission == 'door' then
      open_door(_ENV, x + dx, y + dy)
    else
      sfx(0)
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

    if moving == 0 and (buffered_dx or buffered_dy) then
      move(_ENV, buffered_dx, buffered_dy)
      buffered_dx = nil
      buffered_dy = nil
      return
    end

    if btnp(⬇️) then move(_ENV, 0, 1) end
    if btnp(⬆️) then move(_ENV, 0, -1) end
    if btnp(➡️) then move(_ENV, 1, 0) end
    if btnp(⬅️) then move(_ENV, -1, 0) end
  end
})