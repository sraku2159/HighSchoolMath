import Mathlib

-- # 群の例（Group.md 対応）

-- ----------------------------------------------------------------
-- § 1. よく知られた型の instance を確認する
-- ----------------------------------------------------------------

#check (inferInstance : AddCommGroup ℤ)  -- ℤ は加法アーベル群
#check (inferInstance : AddCommGroup ℚ)  -- ℚ は加法アーベル群
#check (inferInstance : AddCommGroup ℝ)  -- ℝ は加法アーベル群

-- ----------------------------------------------------------------
-- § 2. 自前で CommGroup instance を定義する：Unit（自明な群）
-- Unit は要素が () ひとつだけの自明な群
-- ----------------------------------------------------------------

instance : CommGroup Unit where
  mul _ _          := ()
  one              := ()
  inv _            := ()
  mul_assoc _ _ _  := rfl
  one_mul _        := rfl
  mul_one _        := rfl
  inv_mul_cancel _ := rfl
  mul_comm _ _     := rfl

-- ----------------------------------------------------------------
-- § 3. 自前で CommGroup instance を定義する：Bool の排他的論理和
-- (Bool, XOR, false) は位数 2 の可換群
-- 各元が自己逆元：a XOR a = false
-- ----------------------------------------------------------------

instance myBoolXorGroup : CommGroup Bool where
  mul          := Bool.xor
  one          := false
  inv          := id
  mul_assoc    := by decide
  one_mul      := by decide
  mul_one      := by decide
  inv_mul_cancel := by decide
  mul_comm     := by decide
