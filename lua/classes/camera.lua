Camera = Class:new({
  x = 0,
  y = 0,
  player = nil,
  follow_threshold = 0.5,
  update = function(_ENV)
    local px = player.x * 8 - 64
    local py = player.y * 8 - 64

    if x >= px + follow_threshold or x <= px - follow_threshold then
      x = lerp(x, px, .08)
    else
      x = px
    end

    if y >= py + follow_threshold or y <= py - follow_threshold then
      y = lerp(y, py, .08)
    else
      y = py
    end

    camera(x, y)
  end
})