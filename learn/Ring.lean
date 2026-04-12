import Mathlib

-- # 環の例（Ring.md 対応）

-- ----------------------------------------------------------------
-- § 1. よく知られた型の instance を確認する
-- ----------------------------------------------------------------

#check (inferInstance : Ring ℤ)        -- ℤ は環
#check (inferInstance : CommRing ℤ)    -- ℤ は可換環
#check (inferInstance : CommRing ℚ)    -- ℚ は可換環
#check (inferInstance : CommRing ℝ)    -- ℝ は可換環
#check (inferInstance : CommRing (ZMod 7))  -- ℤ/7ℤ は可換環（7は素数なので体でもある）

-- ----------------------------------------------------------------
-- § 2. 自前で CommRing instance を定義する：Unit（自明な環）
-- Unit は 0 = 1 = () の自明な環（零環）
-- ----------------------------------------------------------------

instance : CommRing Unit where
  add _ _             := ()
  zero                := ()
  neg _               := ()
  mul _ _             := ()
  one                 := ()
  natCast _           := ()
  intCast _           := ()
  add_assoc _ _ _     := rfl
  add_comm _ _        := rfl
  zero_add _          := rfl
  add_zero _          := rfl
  neg_add_cancel _    := rfl
  nsmul _ _           := ()
  nsmul_zero _        := rfl
  nsmul_succ _ _      := rfl
  zsmul _ _           := ()
  zsmul_zero' _       := rfl
  zsmul_succ' _ _     := rfl
  zsmul_neg' _ _      := rfl
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
  intCast_ofNat _     := rfl
  intCast_negSucc _   := rfl
