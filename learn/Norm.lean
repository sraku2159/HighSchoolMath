import Mathlib

-- # ノルムの例（Norm.md 対応）

-- ----------------------------------------------------------------
-- § 1. よく知られた型の instance を確認する
-- ----------------------------------------------------------------

#check (inferInstance : NormedAddCommGroup ℝ)     -- ℝ はノルム付き加法群
#check (inferInstance : NormedAddCommGroup ℂ)     -- ℂ はノルム付き加法群
#check (inferInstance : NormedAddCommGroup (EuclideanSpace ℝ (Fin 2)))  -- ℝ² のユークリッドノルム

-- ノルムの計算例
#eval ‖(3 : ℝ)‖          -- 3.0
#eval ‖(-2.5 : ℝ)‖       -- 2.5

-- ----------------------------------------------------------------
-- § 2. 自前で NormedAddCommGroup instance を定義する
-- ℝ × ℝ に L∞-ノルム（チェビシェフノルム）を与える
-- ‖(x, y)‖_∞ = max(|x|, |y|)
-- ----------------------------------------------------------------

-- ℝ × ℝ に L∞-ノルムを与えた型を定義
-- （Mathlib の Prod.instNorm とは別の instance として定義）
def myNorm : Norm (ℝ × ℝ) where
  norm p := max ‖p.1‖ ‖p.2‖

-- ‖(3, 4)‖_∞ = max(3, 4) = 4 を確認
example : @Norm.norm _ myNorm (3, 4) = 4 := by
  show max ‖(3 : ℝ)‖ ‖(4 : ℝ)‖ = 4
  norm_num

-- ----------------------------------------------------------------
-- § 3. 半ノルムの例：Seminorm 構造体を使う
-- p(f) = |f(0)| は C([0,1]) 上の半ノルム
-- ここでは ℝ → ℝ の関数空間の代わりに ℝ → ℝ 上で確認
-- ----------------------------------------------------------------

-- 点評価半ノルム：f ↦ |f(0)|
-- （これは ‖f‖ = 0 でも f ≠ 0 になりうるので真のノルムではない）
def evalSeminorm : Seminorm ℝ (BoundedContinuousFunction ℝ ℝ) where
  toFun f := ‖f 0‖
  map_zero' := by simp
  add_le' f g := by
    simp only [BoundedContinuousFunction.add_apply]
    exact norm_add_le _ _
  neg' f := by
    simp [BoundedContinuousFunction.neg_apply]
  smul' c f := by
    simp [BoundedContinuousFunction.smul_apply]
