import Mathlib

-- # 半環の例（Semiring.md 対応）

-- ----------------------------------------------------------------
-- § 1. よく知られた型の instance を確認する
-- ----------------------------------------------------------------

#check (inferInstance : Semiring ℕ)       -- ℕ は半環
#check (inferInstance : CommSemiring ℕ)   -- ℕ は可換半環
#check (inferInstance : CommSemiring ℤ)   -- ℤ は可換半環
#check (inferInstance : CommSemiring ℝ)   -- ℝ は可換半環

-- ----------------------------------------------------------------
-- § 2. 自前で CommSemiring instance を定義する：Unit（自明な半環）
-- Unit は 0 = 1 = () の自明な半環
-- ----------------------------------------------------------------

instance : CommSemiring Unit where
  add _ _             := ()
  zero                := ()
  mul _ _             := ()
  one                 := ()
  natCast _           := ()
  add_assoc _ _ _     := rfl
  add_comm _ _        := rfl
  zero_add _          := rfl
  add_zero _          := rfl
  mul_assoc _ _ _     := rfl
  one_mul _           := rfl
  mul_one _           := rfl
  zero_mul _          := rfl
  mul_zero _          := rfl
  left_distrib _ _ _  := rfl
  right_distrib _ _ _ := rfl
  mul_comm _ _        := rfl
  natCast_zero        := rfl
  natCast_succ _      := rfl
  nsmul _ _           := ()
  nsmul_zero _        := rfl
  nsmul_succ _ _      := rfl
