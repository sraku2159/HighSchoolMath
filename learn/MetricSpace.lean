import Mathlib

-- # 距離空間の例（MetricSpace.md 対応）

-- ----------------------------------------------------------------
-- § 1. よく知られた型の instance を確認する
-- ----------------------------------------------------------------

#check (inferInstance : MetricSpace ℝ)      -- ℝ は距離空間
#check (inferInstance : MetricSpace ℚ)      -- ℚ は距離空間
#check (inferInstance : MetricSpace ℂ)      -- ℂ は距離空間
#check (inferInstance : MetricSpace (EuclideanSpace ℝ (Fin 2)))  -- ℝ²

-- 距離の計算例
#eval dist (3 : ℝ) 7    -- 4.0
#eval dist (-1 : ℝ) 2   -- 3.0

-- ----------------------------------------------------------------
-- § 2. 自前で MetricSpace instance を定義する：ℤ の離散距離
-- 離散距離：d(x, y) = 0 if x = y, else 1
-- ----------------------------------------------------------------

def discreteDist (x y : ℤ) : ℝ := if x = y then 0 else 1

instance : MetricSpace ℤ where
  dist          := discreteDist
  dist_self     := by simp [discreteDist]
  dist_comm     := by
    intro x y
    simp only [discreteDist, eq_comm]
  dist_triangle := by
    intro x y z
    simp [discreteDist]
    split_ifs <;> norm_num; omega
  eq_of_dist_eq_zero := by
    intro x y h
    simp [discreteDist] at h
    exact h

-- ----------------------------------------------------------------
-- § 3. 擬距離空間の例：点評価擬距離
-- d(f, g) = |f(0) - g(0)| は擬距離（異なる関数でも d = 0 になりうる）
-- ----------------------------------------------------------------

-- BoundedContinuousFunction ℝ ℝ に点評価擬距離を与える例
-- （Mathlib の SeminormedAddCommGroup → PseudoMetricSpace の流れを確認）
#check (inferInstance : PseudoMetricSpace (BoundedContinuousFunction ℝ ℝ))
