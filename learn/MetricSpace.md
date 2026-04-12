# 距離空間 (Metric Space)

## 数学的定義

集合 $X$ と関数 $d : X \times X \to \mathbb{R}$ の組 $(X, d)$ が**距離空間**であるとは，以下の公理をすべて満たすことをいう：

| 公理 | 記述 |
|------|------|
| **非負性** | $\forall x, y \in X,\quad d(x, y) \geq 0$ |
| **同一性 (Identity of indiscernibles)** | $\forall x, y \in X,\quad d(x, y) = 0 \Leftrightarrow x = y$ |
| **対称性 (Symmetry)** | $\forall x, y \in X,\quad d(x, y) = d(y, x)$ |
| **三角不等式 (Triangle inequality)** | $\forall x, y, z \in X,\quad d(x, z) \leq d(x, y) + d(y, z)$ |

> 非負性は同一性と三角不等式から導出できるため，省略する定義もある。

## 擬距離空間 (Pseudometric Space)

同一性の「$d(x, y) = 0 \Rightarrow x = y$」部分を**外した**ものを**擬距離空間**という：

| 公理 | 記述 |
|------|------|
| **非負性** | $\forall x, y \in X,\quad d(x, y) \geq 0$ |
| **自己距離 (Self-distance)** | $\forall x \in X,\quad d(x, x) = 0$ |
| **対称性** | $\forall x, y \in X,\quad d(x, y) = d(y, x)$ |
| **三角不等式** | $\forall x, y, z \in X,\quad d(x, z) \leq d(x, y) + d(y, z)$ |

> 擬距離空間では $d(x, y) = 0$ であっても $x \neq y$ が許される。

## 空間の階層

$$\text{MetricSpace} \subset \text{PseudoMetricSpace}$$

半ノルムは擬距離空間を誘導し，ノルムは（真の）距離空間を誘導する：

$$d(x, y) := \|x - y\|$$

## 具体例

| 空間 | 距離 | 種別 |
|------|------|------|
| $\mathbb{R}^n$ | $d(x, y) = \|x - y\|_2$ | 距離空間 |
| $\mathbb{R}$ | $d(x, y) = \|x - y\|$ | 距離空間 |
| $C([0,1])$ | $d(f, g) = \sup_t |f(t) - g(t)|$ | 距離空間 |
| $C([0,1])$ | $d(f, g) = |f(0) - g(0)|$ | 擬距離空間（$f \neq g$ でも $d = 0$ になりうる） |

## Mathlib での定義

| 型クラス | Mathlib4 Docs | 継承元 |
|---------|--------------|--------|
| `PseudoMetricSpace α` | [PseudoMetricSpace](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Topology/MetricSpace/Defs.html#PseudoMetricSpace) | `Dist α`，`UniformSpace α`，等 |
| `MetricSpace α` | [MetricSpace](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Topology/MetricSpace/Defs.html#MetricSpace) | `PseudoMetricSpace α`，追加公理：`eq_of_dist_eq_zero` |

- `PseudoMetricSpace`：`dist_self`，`dist_comm`，`dist_triangle` を提供
- `MetricSpace`：`eq_of_dist_eq_zero : dist x y = 0 → x = y` を追加

## 参考

- [MathWorld: Metric Space](https://mathworld.wolfram.com/MetricSpace.html)
- [MathWorld: Pseudometric](https://mathworld.wolfram.com/Pseudometric.html)
- [Mathlib4 Docs: MetricSpace](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Topology/MetricSpace/Defs.html#MetricSpace)
- [Mathlib4 Docs: PseudoMetricSpace](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Topology/MetricSpace/Defs.html#PseudoMetricSpace)
