# モノイド (Monoid)

## 数学的定義

集合 $M$ と二項演算 $\cdot : M \times M \to M$ の組 $(M, \cdot)$ が**モノイド**であるとは，以下の公理をすべて満たすことをいう：

| 公理 | 記述 |
|------|------|
| **結合法則 (Associativity)** | $\forall a, b, c \in M,\quad (a \cdot b) \cdot c = a \cdot (b \cdot c)$ |
| **単位元の存在 (Identity)** | $\exists e \in M,\ \forall a \in M,\quad e \cdot a = a \cdot e = a$ |

> **群との違い**：モノイドでは各元の逆元の存在を要求しない。

## 可換モノイド (Commutative Monoid)

モノイド $(M, \cdot)$ においてさらに次の公理を満たすものを**可換モノイド**という：

| 公理 | 記述 |
|------|------|
| **交換法則 (Commutativity)** | $\forall a, b \in M,\quad a \cdot b = b \cdot a$ |

## 具体例

| 集合 | 演算 | 単位元 | 可換？ |
|------|------|--------|--------|
| $\mathbb{N}$ | $+$ | $0$ | ✓ |
| $\mathbb{N}$ | $\times$ | $1$ | ✓ |
| $\mathbb{Z}$ | $\times$ | $1$ | ✓ |
| $\{0,1\}^*$（文字列） | 連結 | $\varepsilon$ | ✗ |

## Mathlib での定義

| 型クラス | Mathlib4 Docs | 継承元 |
|---------|--------------|--------|
| `Monoid M` | [Monoid](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Group/Defs.html#Monoid) | `Semigroup M`（結合法則），`MulOneClass M`（単位元） |
| `CommMonoid M` | [CommMonoid](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Group/Defs.html#CommMonoid) | `Monoid M`，`CommSemigroup M`（交換法則） |

### 加法版

`@[to_additive]` により加法版の `AddMonoid`，`AddCommMonoid` も自動生成される：

- 乗法 `*` → 加法 `+`，単位元 `1` → 零元 `0`

## 参考

- [MathWorld: Monoid](https://mathworld.wolfram.com/Monoid.html)
- [Mathlib4 Docs: Monoid](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Group/Defs.html#Monoid)
- [Mathlib4 Docs: CommMonoid](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Group/Defs.html#CommMonoid)