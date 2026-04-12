# 環 (Ring)

## 数学的定義

集合 $R$ と二つの二項演算 $+ : R \times R \to R$，$\cdot : R \times R \to R$ の組 $(R, +, \cdot)$ が**環**であるとは，以下の公理をすべて満たすことをいう：

### 加法に関する公理（加法アーベル群）

| 公理 | 記述 |
|------|------|
| **結合法則** | $\forall a, b, c \in R,\quad (a + b) + c = a + (b + c)$ |
| **交換法則** | $\forall a, b \in R,\quad a + b = b + a$ |
| **零元の存在** | $\exists 0 \in R,\ \forall a \in R,\quad 0 + a = a$ |
| **加法逆元の存在** | $\forall a \in R,\ \exists {-a} \in R,\quad a + ({-a}) = 0$ |

### 乗法に関する公理

| 公理 | 記述 |
|------|------|
| **結合法則** | $\forall a, b, c \in R,\quad (a \cdot b) \cdot c = a \cdot (b \cdot c)$ |
| **単位元の存在** | $\exists 1 \in R,\ \forall a \in R,\quad 1 \cdot a = a \cdot 1 = a$ |

### 分配法則

| 公理 | 記述 |
|------|------|
| **左分配法則** | $\forall a, b, c \in R,\quad a \cdot (b + c) = a \cdot b + a \cdot c$ |
| **右分配法則** | $\forall a, b, c \in R,\quad (a + b) \cdot c = a \cdot c + b \cdot c$ |

> **半環との違い**：環では加法逆元 $-a$ の存在を要求する。$(R, +)$ が加法アーベル群をなす。

## 可換環 (Commutative Ring)

環 $(R, +, \cdot)$ においてさらに次の公理を満たすものを**可換環**という：

| 公理 | 記述 |
|------|------|
| **乗法交換法則** | $\forall a, b \in R,\quad a \cdot b = b \cdot a$ |

## 具体例

| 集合 | 可換？ | 備考 |
|------|--------|------|
| $\mathbb{Z}$ | ✓ | 体ではない（乗法逆元が常に存在しない） |
| $\mathbb{Q},\ \mathbb{R},\ \mathbb{C}$ | ✓ | 体でもある |
| $\mathbb{Z}/n\mathbb{Z}$ | ✓ | $n$ が素数のとき体になる |
| $M_n(\mathbb{R})$（$n \times n$ 行列） | ✗（$n \geq 2$） | 正則でない行列は乗法逆元を持たない |

## Mathlib での定義

| 型クラス | Mathlib4 Docs | 継承元 |
|---------|--------------|--------|
| `Ring R` | [Ring](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Ring/Defs.html#Ring) | `Semiring R`，`AddCommGroup R`（加法逆元を追加） |
| `CommRing R` | [CommRing](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Ring/Defs.html#CommRing) | `Ring R`，`CommMonoid R` |

## 参考

- [MathWorld: Ring](https://mathworld.wolfram.com/Ring.html)
- [Mathlib4 Docs: Ring](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Ring/Defs.html#Ring)
- [Mathlib4 Docs: CommRing](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Ring/Defs.html#CommRing)
