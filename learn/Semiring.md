# 半環 (Semiring)

## 数学的定義

集合 $R$ と二つの二項演算 $+ : R \times R \to R$，$\cdot : R \times R \to R$ の組 $(R, +, \cdot)$ が**半環**であるとは，以下の公理をすべて満たすことをいう：

### 加法に関する公理

| 公理 | 記述 |
|------|------|
| **結合法則** | $\forall a, b, c \in R,\quad (a + b) + c = a + (b + c)$ |
| **交換法則** | $\forall a, b \in R,\quad a + b = b + a$ |
| **零元の存在** | $\exists 0 \in R,\ \forall a \in R,\quad 0 + a = a + 0 = a$ |

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
| **零元の吸収** | $\forall a \in R,\quad 0 \cdot a = a \cdot 0 = 0$ |

> **環との違い**：半環では加法逆元（$-a$）の存在を要求しない。$\mathbb{N}$ は半環だが環ではない。

## 可換半環 (Commutative Semiring)

半環 $(R, +, \cdot)$ においてさらに次の公理を満たすものを**可換半環**という：

| 公理 | 記述 |
|------|------|
| **乗法交換法則** | $\forall a, b \in R,\quad a \cdot b = b \cdot a$ |

## 具体例

| 集合 | $+$ | $\cdot$ | 可換？ |
|------|-----|---------|--------|
| $\mathbb{N}$ | 通常の加法 | 通常の乗法 | ✓ |
| $\mathbb{Z}$ | 通常の加法 | 通常の乗法 | ✓ |
| $\{0, 1\}$（Bool） | $\vee$（OR） | $\wedge$（AND） | ✓ |
| $n \times n$ 行列 | 行列の和 | 行列積 | ✗（$n \geq 2$） |

## Mathlib での定義

| 型クラス | Mathlib4 Docs | 継承元 |
|---------|--------------|--------|
| `Semiring R` | [Semiring](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Ring/Defs.html#Semiring) | `NonUnitalSemiring R`，`NonAssocSemiring R`，`MonoidWithZero R` |
| `CommSemiring R` | [CommSemiring](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Ring/Defs.html#CommSemiring) | `Semiring R`，`CommMonoid R` |

## 参考

- [MathWorld: Semiring](https://mathworld.wolfram.com/Semiring.html)
- [Mathlib4 Docs: Semiring](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Ring/Defs.html#Semiring)
- [Mathlib4 Docs: CommSemiring](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Ring/Defs.html#CommSemiring)
