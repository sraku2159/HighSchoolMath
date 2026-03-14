import Mathlib.Data.Nat.Basic
import Mathlib.Data.Real.Sqrt

lemma sq_eq_of_nonneg (a b : ℝ) (ha : 0 ≤ a) (hb : 0 ≤ b) (h : a^2 = b^2) : a = b := by
  sorry

-- 二重根号を外す公式：a = m + n, b = mn (m > n > 0) のとき等式が成り立つ
example (a b m n : ℝ) (hmn : m > n) (hn : n ≥ 0) (ha : a = m + n) (hb : b = m * n) :
  Real.sqrt (a + 2 * Real.sqrt b) = Real.sqrt m + Real.sqrt n := by
  -- a > 0 ∧ b > 0 ∧ a = b → Real.sqrt a = Real.sqrt b
  apply sq_eq_of_nonneg (Real.sqrt (a + 2 * Real.sqrt b)) (Real.sqrt m + Real.sqrt n)
  ·
    exact Real.sqrt_nonneg (a + 2 * √b)
  ·
    refine Left.add_nonneg ?_ ?_
    · exact Real.sqrt_nonneg m
    · exact Real.sqrt_nonneg n
  ·
    -- 両辺を2乗で展開
    rw [Real.sq_sqrt, add_sq, Real.sq_sqrt, Real.sq_sqrt]
    · rw [ha, hb]
      have : Real.sqrt (m * n) = Real.sqrt m * Real.sqrt n := by
        rw [Real.sqrt_mul]
        · linarith
      rw [this]
      ring
    -- Real.sq_sqrtで生成されたサブゴール
    · exact hn
    · linarith
    ·
      refine Left.add_nonneg ?_ ?_
      ·
        rw [ha]
        refine Left.add_nonneg ?_ ?_
        · linarith
        · linarith
      ·
        rw [hb]
        apply mul_nonneg
        · linarith
        · exact Real.sqrt_nonneg (m * n)
