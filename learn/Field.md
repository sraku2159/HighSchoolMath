# 体 (Field)

## 数学的定義

集合 $K$ と二つの二項演算 $+ : K \times K \to K$，$\cdot : K \times K \to K$ の組 $(K, +, \cdot)$ が**体**であるとは，以下の公理をすべて満たすことをいう：

### 加法に関する公理

| 公理 | 記述 |
|------|------|
| **結合法則** | $\forall a, b, c \in K,\quad (a + b) + c = a + (b + c)$ |
| **交換法則** | $\forall a, b \in K,\quad a + b = b + a$ |
| **零元の存在** | $\exists 0 \in K,\ \forall a \in K,\quad 0 + a = a$ |
| **加法逆元の存在** | $\forall a \in K,\ \exists {-a} \in K,\quad a + ({-a}) = 0$ |

### 乗法に関する公理

| 公理 | 記述 |
|------|------|
| **結合法則** | $\forall a, b, c \in K,\quad (a \cdot b) \cdot c = a \cdot (b \cdot c)$ |
| **交換法則** | $\forall a, b \in K,\quad a \cdot b = b \cdot a$ |
| **単位元の存在** | $\exists 1 \in K,\ \forall a \in K,\quad 1 \cdot a = a$ |
| **乗法逆元の存在** | $\forall a \in K,\ a \neq 0 \Rightarrow \exists a^{-1} \in K,\quad a \cdot a^{-1} = 1$ |

### 分配法則

| 公理 | 記述 |
|------|------|
| **分配法則** | $\forall a, b, c \in K,\quad a \cdot (b + c) = a \cdot b + a \cdot c$ |

### 非自明性

$$0 \neq 1$$

> **可換環との違い**：体では $0$ でない元すべてが乗法逆元を持つ。また乗法交換法則も要求する（= 可換環 + 乗法逆元）。

## 具体例

| 集合 | 備考 |
|------|------|
| $\mathbb{Q}$ | 有理数体 |
| $\mathbb{R}$ | 実数体 |
| $\mathbb{C}$ | 複素数体 |
| $\mathbb{Z}/p\mathbb{Z}$（$p$ 素数） | 有限体（ガロア体）$\mathbb{F}_p$ |
| $\mathbb{Z}$ | 体ではない（例：$2$ の逆元が存在しない） |

## Mathlib での定義

| 型クラス | Mathlib4 Docs | 継承元 |
|---------|--------------|--------|
| `Field K` | [Field](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Field/Defs.html#Field) | `CommRing K`，`DivisionRing K`（非零元の乗法逆元） |

- `DivisionRing` が `inv : K → K` と `div_def`，`mul_inv_cancel` を提供する
- `Field` は `CommRing` と `DivisionRing` の組み合わせで新たな公理は追加しない

## 参考

- [MathWorld: Field](https://mathworld.wolfram.com/Field.html)
- [MathWorld: Field Axioms](https://mathworld.wolfram.com/FieldAxioms.html)
- [Mathlib4 Docs: Field](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Field/Defs.html#Field)
- [Mathlib4 Docs: DivisionRing](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Field/Defs.html#DivisionRing)
