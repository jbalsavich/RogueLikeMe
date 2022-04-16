NoiseMap = class( PlainMap )

function NoiseMap:init( x, y, w, h, c1, c2, c3, c4 )
  PlainMap.init(self, x, y, w, h)
  self.data = {}
  self:divide( x, y, self.width+1, self.height+1, c1, c2, c3, c4 )
end

function NoiseMap:displace( v )
  local max = v / (self.width + self.height) * 3
  return (math.random() - 0.5) * max
end

function NoiseMap:divide( x, y, w, h, c1, c2, c3, c4 )
  if w > 2 or h > 2 then
    local nW = w/2
    local nH = h/2
    local mid = ( c1 + c2 + c3 + c4 ) / 4 + self:displace(nW, nH)
    if mid < 0 then mid = 0 elseif mid > 1 then mid = 1 end

    local edge1 = (c1 + c2) / 2
    local edge2 = (c2 + c3) / 2
    local edge3 = (c3 + c4) / 2
    local edge4 = (c4 + c1) / 2

    self:divide(x, y, nW, nH, c1, edge1, mid, edge4);
    self:divide(x + nW, y, nW, nH, edge1, c2, edge2, mid);
    self:divide(x + nW, y + nH, nW, nH, mid, edge2, c3, edge3);
    self:divide(x, y + nH, nW, nH, edge4, mid, edge3, c4);
  else
    local c = (c1+c2+c3+c4)/4
    self:set( math.floor(x), math.floor(y), c )
  end
end