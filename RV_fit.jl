function fit()
  function func(x, p::Vector)
    return p[1] .* cos(x)
  end
  global time
  global rv
  global err
  if time == nothing
    println("You must set RV time grid using RV.set_time()")
  end
  if rv == nothing
    println("You must set RV data using RV.set_rv()")
  end
  if err == nothing
    println("You must set RV error using RV.set_err()")
  end
  if time != nothing && rv != nothing && err != nothing
    best = curve_fit(func, time, rv, 1.0./err.^2.,[90.0])
    return best
  end
end
