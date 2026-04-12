# ノルム (Norm)

## 数学的定義

$\mathbb{K}$（$= \mathbb{R}$ または $\mathbb{C}$）上のベクトル空間 $V$ に対し，関数 $\|\cdot\| : V \to \mathbb{R}$ が**ノルム**であるとは，以下の公理をすべて満たすことをいう：

| 公理 | 記述 |
|------|------|
| **正定値性 (Positive definiteness)** | $\forall v \in V,\quad \lVert v \rVert \geq 0$，かつ $\lVert v \rVert = 0 \Leftrightarrow v = 0$ |
| **絶対同次性 (Absolute homogeneity)** | $\forall c \in \mathbb{K},\ \forall v \in V,\quad \lVert c \cdot v \rVert = \lvert c \rvert\,\lVert v \rVert$ |
| **三角不等式 (Triangle inequality)** | $\forall v, w \in V,\quad \lVert v + w \rVert \leq \lVert v \rVert + \lVert w \rVert$ |

## 半ノルム (Seminorm)

正定値性の「$\|v\| = 0 \Rightarrow v = 0$」部分を**外した**ものを**半ノルム**という：

| 公理 | 記述 |
|------|------|
| **非負性 (Non-negativity)** | $\forall v \in V,\quad \lVert v \rVert \geq 0$ |
| **絶対同次性** | $\forall c \in \mathbb{K},\ \forall v \in V,\quad \lVert c \cdot v \rVert = \lvert c \rvert\,\lVert v \rVert$ |
| **三角不等式** | $\forall v, w \in V,\quad \lVert v + w \rVert \leq \lVert v \rVert + \lVert w \rVert$ |

> 半ノルムでは $\|v\| = 0$ であっても $v \neq 0$ が許される（零化性を要求しない）。

## 具体例

| 空間 | ノルム | 定義 |
|------|--------|------|
| $\mathbb{R}^n$ | $\ell^2$-ノルム（ユークリッドノルム） | $\lVert x \rVert_2 = \sqrt{x_1^2 + \cdots + x_n^2}$ |
| $\mathbb{R}^n$ | $\ell^p$-ノルム | $\lVert x \rVert_p = \left(\sum_i \lvert x_i \rvert^p\right)^{1/p}$ |
| $\mathbb{R}^n$ | $\ell^\infty$-ノルム | $\lVert x \rVert_\infty = \max_i \lvert x_i \rvert$ |
| $C([0,1])$ | $L^\infty$-ノルム | $\lVert f \rVert_\infty = \sup_{t \in [0,1]} \lvert f(t) \rvert$ |
| $C([0,1])$ | 半ノルムの例 | $p(f) = \lvert f(0) \rvert$（$f \equiv 0$ でなくても $p(f) = 0$ になりうる） |

## Mathlib での定義

| 型クラス / 構造体 | Mathlib4 Docs | 説明 |
|----------------|--------------|------|
| `Norm E` | [Norm](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Norm/Basic.html#Norm) | `‖·‖ : E → ℝ` 関数を提供するクラス |
| `NormedAddCommGroup E` | [NormedAddCommGroup](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/Normed/Group/Defs.html#NormedAddCommGroup) | `Norm E` + `AddCommGroup E` + `MetricSpace E`，`dist x y = ‖-x + y‖` |
| `SeminormedAddCommGroup E` | [SeminormedAddCommGroup](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/Normed/Group/Defs.html#SeminormedAddCommGroup) | `Norm E` + `AddCommGroup E` + `PseudoMetricSpace E` |
| `Seminorm 𝕜 E` | [Seminorm](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/Seminorm.html#Seminorm) | ベクトル空間上の半ノルムを表す構造体 |

- `NormedAddCommGroup` はノルムから誘導される距離で `MetricSpace`（真の距離空間）になる
- `SeminormedAddCommGroup` は半ノルムから誘導される距離で `PseudoMetricSpace`（擬距離空間）になる

## 参考

- [MathWorld: Vector Norm](https://mathworld.wolfram.com/VectorNorm.html)
- [MathWorld: Seminorm](https://mathworld.wolfram.com/Seminorm.html)
- [Mathlib4 Docs: NormedAddCommGroup](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/Normed/Group/Defs.html#NormedAddCommGroup)
- [Mathlib4 Docs: Seminorm](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Analysis/Seminorm.html#Seminorm)
