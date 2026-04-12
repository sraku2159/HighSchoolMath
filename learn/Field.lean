import Mathlib

-- # 体の例（Field.md 対応）

-- ZMod p が Field になるには「p が素数である」という Fact が必要
instance : Fact (Nat.Prime 2) := ⟨by norm_num⟩
instance : Fact (Nat.Prime 7) := ⟨by norm_num⟩

-- ----------------------------------------------------------------
-- § 1. よく知られた型の instance を確認する
-- ----------------------------------------------------------------

#check (inferInstance : Field ℚ)          -- ℚ は体
#check (inferInstance : Field ℝ)          -- ℝ は体
#check (inferInstance : Field ℂ)          -- ℂ は体
#check (inferInstance : Field (ZMod 7))   -- ℤ/7ℤ は有限体（7 は素数）

-- ※ ℤ は Field にならない（2 の乗法逆元が ℤ に存在しない）
-- #check (inferInstance : Field ℤ)  -- エラーになる

-- ----------------------------------------------------------------
-- § 2. 自前で Field instance を定義する：ZMod 2（2元体 𝔽₂）
-- ZMod 2 = {0, 1}，すでに Mathlib に instance があるが，
-- ここでは Field の構造を体感するために確認する
-- ----------------------------------------------------------------

-- ZMod 2 が Field であることを Mathlib が知っていることを確認
#check (inferInstance : Field (ZMod 2))

-- 逆元の計算例
example : (1 : ZMod 7)⁻¹ = 1 := by decide
example : (2 : ZMod 7)⁻¹ = 4 := by decide   -- 2 * 4 = 8 ≡ 1 (mod 7)
example : (3 : ZMod 7)⁻¹ = 5 := by decide   -- 3 * 5 = 15 ≡ 1 (mod 7)
