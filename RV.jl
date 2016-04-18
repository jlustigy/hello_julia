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

function fit()
  function func(x, p::Vector)
    return p[1] .* cos(x)
  end
  global time
  global rv
  global err
  if RV.time == nothing
    println("You must set RV time grid using RV.set_time()")
  end
  if RV.rv == nothing
    println("You must set RV data using RV.set_rv()")
  end
  if RV.err == nothing
    println("You must set RV error using RV.set_err()")
  end
  if time != nothing && rv != nothing && err != nothing
    best = curve_fit(func, time, rv, 1.0./err.^2.,[90.0])
    return best
  end
end

end
