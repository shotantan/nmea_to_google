# NMEA to Google Map 

g = ARGV[0].split(",")

mod_lat = 1
mod_lon = 1

g.delete("N")
g.delete("E")
mod_lat = -1 if g.delete("S")
mod_lon = -1 if g.delete("W")

g[0] = g[0].to_f
g[1] = g[1].to_f

lat_p = g[0]
lon_p = g[1]
lat_d = g[0].floor
lon_d = g[1].floor

lat_m =  ((lat_d/100.to_f - (lat_d/100).floor)*100).floor/60.to_f
#lat_mm = (lat_p - lat_d)/36.to_f
lat_mm = (lat_p - lat_d)/60.to_f
lat = mod_lat * ((lat_d/100).floor + lat_m.round(8) + lat_mm.round(8)).round(8)

lon_m =  ((lon_d/100.to_f - (lon_d/100).floor)*100).floor/60.to_f
#lon_mm = (lon_p - lon_d)/36.to_f
lon_mm = (lon_p - lon_d)/60.to_f
lon = mod_lon * ((lon_d/100).floor + lon_m.round(8) + lon_mm.round(8)).round(8)

print "#{lat},#{lon}\n"