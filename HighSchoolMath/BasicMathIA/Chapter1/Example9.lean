import Mathlib.Data.Nat.Basic
import Mathlib.Data.Real.Sqrt

example : 3 < Real.sqrt 14 ∧ Real.sqrt 14 < 4 := by
  constructor
  case left =>
    apply Real.lt_sqrt_of_sq_lt
    norm_num
  case right =>
    refine (Real.sqrt_lt' ?_).mpr ?_
    · norm_num
    · norm_num


