#~/.juliarc.jl

module Sundial

global latitude = 52

export latitude, get_lat, set_lat, use_lat

function get_lat()
   println("in Sundial.get_lat, latitude is $latitude")
end

function set_lat(lat)
   global latitude
   latitude = lat
   println("in Sundial.set_lat, latitude is now $latitude")
end

function use_lat_fail()
   try
     println("in Sundial.use_lat_fail, latitude is $latitude")
   catch
     println("couldn't find it")
   end

   latitude = 0
   println("in Sundial.use_lat_fail, latitude was set to 0, is $latitude")
end

function use_lat()
   global latitude
   try
     println("in Sundial.use_lat, latitude is $latitude")
   catch
     println("couldn't find it")
   end

   latitude = 0
   println("in Sundial.use_lat, latitude was set to 0, is $latitude")
end

end
