import Mathlib.Data.Real.Sqrt
import Mathlib.Tactic

theorem quadratic_solution_iff (a b c x : ℝ) (ha : a ≠ 0) (hd : b^2 - 4*a*c ≥ 0) :
    a * x^2 + b * x + c = 0 ↔
    (x = (-b - Real.sqrt (b^2 - 4*a*c)) / (2*a) ∨
      x = (-b + Real.sqrt (b^2 - 4*a*c)) / (2*a)) := by

  calc
  a * x^2 + b * x + c = 0 ↔ x^2 + (b/a) * x + c/a = 0 := by
    field_simp -- 体(*がアーベル群 + その他の定義は環と同じ)の定義を使う
    ring_nf
  _ ↔ x^2 + (b/a) * x = -c/a := by
    field_simp
    ring_nf
    exact Iff.symm eq_neg_iff_add_eq_zero
  _ ↔ (x + b/(2*a))^2 - (b^2 / (4 * a^2)) = -c/a := by
    have : (x + b / (2 * a)) ^ 2 - b ^ 2 / (4 * a^2) = x ^ 2 + b / a * x := calc
      _ = (x ^ 2 + b / a * x + b ^ 2 / (4 * a^2)) - b ^ 2 / (4 * a^2) := by
        field_simp
        ring
      _ = x ^ 2 + b / a * x := by ring
    rw [this]
  _ ↔ (x + b/(2*a))^2 = (b^2 - 4*a*c)/(4*a^2) := by
    field_simp
    ring_nf
    exact Iff.symm (add_left_inj (b ^ 2 * 4))
  _ ↔ x + b/(2*a) = (Real.sqrt (b^2 - 4*a*c)) / (2*a) ∨
      x + b/(2*a) = - (Real.sqrt (b^2 - 4*a*c)) / (2*a) := by
    -- 平方根を取る: y^2 = z → y = √z ∨ y = -√z
    constructor
    · intro h
      -- (x + b/(2a))^2 = (b^2 - 4ac)/(4a^2) から x + b/(2a) = ± √(...)/(2a) を導く
      have key : (x + b/(2*a))^2 = ((Real.sqrt (b^2 - 4*a*c)) / (2*a))^2 := by
        rw [h]
        rw [div_pow, Real.sq_sqrt hd]
        field_simp
        ring
      rw [sq_eq_sq_iff_eq_or_eq_neg] at key
      rcases key with h1 | h2
      · left; exact h1
      · right
        calc x + b/(2*a) = -(Real.sqrt (b^2 - 4*a*c) / (2*a)) := h2
          _ = -Real.sqrt (b^2 - 4*a*c) / (2*a) := by ring
    · intro h
      rcases h with h1 | h2
      · rw [h1]
        field_simp
        rw [Real.sq_sqrt hd]
        ring
      · rw [h2]
        field_simp
        rw [Real.sq_sqrt hd]
        ring
  _ ↔ (x = (-b - Real.sqrt (b^2 - 4*a*c)) / (2*a) ∨
        x = (-b + Real.sqrt (b^2 - 4*a*c)) / (2*a)) := by
    -- 移項: x + b/(2a) = k → x = k - b/(2a) = -b/(2a) + k
    constructor
    · intro h
      rcases h with h1 | h2
      · right
        field_simp at h1 ⊢
        linarith
      · left
        field_simp at h2 ⊢
        linarith
    · intro h
      rcases h with h1 | h2
      · right
        field_simp at h1 ⊢
        linarith
      · left
        field_simp at h2 ⊢
        linarith
