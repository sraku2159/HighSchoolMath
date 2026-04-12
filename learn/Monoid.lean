import Mathlib

-- # モノイドの例（Monoid.md 対応）
set_option trace.Meta.synthInstance true
-- ----------------------------------------------------------------
-- § 1. よく知られた型の instance を確認する
-- ----------------------------------------------------------------

#check (inferInstance : Monoid ℕ)       -- ℕ は乗法モノイド
#check (inferInstance : AddMonoid ℕ)    -- ℕ は加法モノイド（加法版）
#check (inferInstance : CommMonoid ℕ)   -- ℕ は可換モノイド

-- ----------------------------------------------------------------
-- § 2. 自前で Monoid instance を定義する：Unit 型
-- Unit は要素が () ひとつだけの自明なモノイド
-- ----------------------------------------------------------------

instance : Monoid Unit where
  mul _ _       := ()
  one           := ()
  mul_assoc _ _ _ := rfl
  one_mul _       := rfl
  mul_one _       := rfl

-- ----------------------------------------------------------------
-- § 3. 自前で CommMonoid instance を定義する：Bool の論理積
-- (Bool, &&, true) は可換モノイド
-- ----------------------------------------------------------------

instance myBoolAndMonoid : CommMonoid Bool where
  mul       := (· && ·)
  one       := true
  mul_assoc := by decide
  one_mul   := by decide
  mul_one   := by decide
  mul_comm  := by decide
