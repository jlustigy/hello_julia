module RV

using LsqFit

#include("types.jl")

global time = nothing
global rv = nothing
global err = nothing

function set_time(val)
   global time
   time = val
   println("Set RV.time")
end

function set_rv(val)
   global rv
   rv = val
   println("Set RV.rv")
end

function set_err(val)
   global err
   err = val
   println("Set RV.err")
end

# Include fitting functions
include("RV_fit.jl")

end
