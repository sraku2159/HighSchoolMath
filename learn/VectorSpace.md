# ベクトル空間 (Vector Space)

## 数学的定義

体 $\mathbb{K}$ 上の**ベクトル空間**とは，集合 $V$ と以下の演算の組 $(V, +, \cdot)$ であって，8つの公理をすべて満たすものをいう：

- $+ : V \times V \to V$（ベクトルの加法）
- $\cdot : \mathbb{K} \times V \to V$（スカラー乗法）

### ベクトル加法に関する公理（加法アーベル群）

| 公理 | 記述 |
|------|------|
| **交換法則** | $\forall u, v \in V,\quad u + v = v + u$ |
| **結合法則** | $\forall u, v, w \in V,\quad (u + v) + w = u + (v + w)$ |
| **零ベクトルの存在** | $\exists \mathbf{0} \in V,\ \forall v \in V,\quad \mathbf{0} + v = v$ |
| **加法逆元の存在** | $\forall v \in V,\ \exists {-v} \in V,\quad v + ({-v}) = \mathbf{0}$ |

### スカラー乗法に関する公理

| 公理 | 記述 |
|------|------|
| **スカラー乗法の結合法則** | $\forall r, s \in \mathbb{K},\ \forall v \in V,\quad r \cdot (s \cdot v) = (rs) \cdot v$ |
| **スカラー乗法の単位元** | $\forall v \in V,\quad 1 \cdot v = v$ |
| **スカラーの分配法則** | $\forall r, s \in \mathbb{K},\ \forall v \in V,\quad (r + s) \cdot v = r \cdot v + s \cdot v$ |
| **ベクトルの分配法則** | $\forall r \in \mathbb{K},\ \forall u, v \in V,\quad r \cdot (u + v) = r \cdot u + r \cdot v$ |

## 具体例

| 空間 | スカラー体 | 備考 |
|------|-----------|------|
| $\mathbb{R}^n$ | $\mathbb{R}$ | 標準的なユークリッド空間 |
| $\mathbb{C}^n$ | $\mathbb{C}$ | 複素ベクトル空間 |
| $\mathbb{R}[x]$（多項式） | $\mathbb{R}$ | 無限次元 |
| $C([0,1])$（連続関数） | $\mathbb{R}$ | 無限次元 |
| $\mathbb{R}^{m \times n}$（行列） | $\mathbb{R}$ | $mn$ 次元 |

## Mathlib での定義

Mathlib では，ベクトル空間を体 $\mathbb{K}$ 上の**加群 (Module)** として統一的に扱う：

| 型クラス | Mathlib4 Docs | 説明 |
|---------|--------------|------|
| `Module R M` | [Module](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Module/Defs.html#Module) | `R` が半環，`M` が加法可換モノイドの場合の加群 |

- `R` が体（`Field`），`M` が `AddCommGroup` のとき，`Module R M` がベクトル空間に対応する
- `Module extends DistribMulAction R M`
- 追加公理：`add_smul : (r + s) • x = r • x + s • x`，`zero_smul : 0 • x = 0`

### ベクトル空間のエイリアス

```
VectorSpace K V := Module K V  -- K は Field，V は AddCommGroup
```

実際には `Module K V` に体の `instance [Field K] [AddCommGroup V] [Module K V]` を与えることで定義される。

## 参考

- [MathWorld: Vector Space](https://mathworld.wolfram.com/VectorSpace.html)
- [Mathlib4 Docs: Module](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Module/Defs.html#Module)
- [Mathlib4 Docs: DistribMulAction](https://leanprover-community.github.io/mathlib4_docs/Mathlib/GroupTheory/GroupAction/Defs.html#DistribMulAction)
