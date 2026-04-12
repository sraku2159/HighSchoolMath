# 群 (Group)

## 数学的定義

集合 $G$ と二項演算 $\cdot : G \times G \to G$ の組 $(G, \cdot)$ が**群**であるとは，以下の公理をすべて満たすことをいう：

| 公理 | 記述 |
|------|------|
| **結合法則 (Associativity)** | $\forall a, b, c \in G,\quad (a \cdot b) \cdot c = a \cdot (b \cdot c)$ |
| **単位元の存在 (Identity)** | $\exists e \in G,\ \forall a \in G,\quad e \cdot a = a \cdot e = a$ |
| **逆元の存在 (Inverse)** | $\forall a \in G,\ \exists a^{-1} \in G,\quad a^{-1} \cdot a = a \cdot a^{-1} = e$ |

> **モノイドとの違い**：群では各元の逆元の存在を要求する。

## アーベル群 (Abelian Group / Commutative Group)

群 $(G, \cdot)$ においてさらに次の公理を満たすものを**アーベル群**（可換群）という：

| 公理 | 記述 |
|------|------|
| **交換法則 (Commutativity)** | $\forall a, b \in G,\quad a \cdot b = b \cdot a$ |

## 具体例

| 集合 | 演算 | 単位元 | アーベル？ |
|------|------|--------|-----------|
| $\mathbb{Z}$ | $+$ | $0$ | ✓ |
| $\mathbb{Q} \setminus \{0\}$ | $\times$ | $1$ | ✓ |
| $\mathbb{R} \setminus \{0\}$ | $\times$ | $1$ | ✓ |
| $GL_n(\mathbb{R})$（正則行列） | 行列積 | $I_n$ | ✗（$n \geq 2$） |
| $\{0, 1\}$（XOR） | $\oplus$ | $0$ | ✓ |

## Mathlib での定義

| 型クラス | Mathlib4 Docs | 継承元 |
|---------|--------------|--------|
| `Group G` | [Group](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Group/Defs.html#Group) | `DivInvMonoid G`（= `Monoid` + `Inv` + `Div`），追加公理：`mul_left_inv` |
| `CommGroup G` | [CommGroup](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Group/Defs.html#CommGroup) | `Group G`，`CommMonoid G` |

### 加法版

`@[to_additive]` により加法版の `AddGroup`，`AddCommGroup` も自動生成される：

- 乗法 `*` → 加法 `+`，逆元 `a⁻¹` → 加法逆元 `-a`

## 参考

- [MathWorld: Group](https://mathworld.wolfram.com/Group.html)
- [MathWorld: Abelian Group](https://mathworld.wolfram.com/AbelianGroup.html)
- [Mathlib4 Docs: Group](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Group/Defs.html#Group)
- [Mathlib4 Docs: CommGroup](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Algebra/Group/Defs.html#CommGroup)
