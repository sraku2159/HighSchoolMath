import Mathlib.Tactic

-- (2)
example : x^2 ≠ x → x ≠ 1 := by
  -- 対偶を取るタクティク
  contrapose
  intro h
  rw [h]
  norm_num


-- (3) √2が無理数であることの証明
-- 方針：√2 = p/q（p, qは互いに素）と仮定
--       両辺を2乗して 2 = p²/q² → 2q² = p²
--       これよりpは偶数、qも偶数となり、互いに素という仮定に矛盾
example : ¬ ∃ (p q : ℕ), q ≠ 0 ∧ Nat.Coprime p q ∧ Real.sqrt 2 = p / q := by
  intro ⟨p, q, hq_pos, coprime, h⟩
  -- ここから背理法で矛盾を導く

  -- 両辺を2乗: 2 = p²/q²
  have h_sq : (2 : ℝ) = p ^ 2 / q ^ 2 := by
    have sqrt_sq : (Real.sqrt 2) ^ 2 = 2 := by
      exact Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 2)
    rw [h] at sqrt_sq
    rw [div_pow] at sqrt_sq
    exact sqrt_sq.symm

  -- 2q² = p²
  have h_eq_real : 2 * q ^ 2 = (p : ℝ) ^ 2 := by
    -- まず実数での等式を得る
    field_simp at h_sq
    exact h_sq

  have h_eq_nat : 2 * q ^ 2 = p ^ 2 := by
    have : ((2 * q ^ 2 : ℕ) : ℝ) = ((p ^ 2 : ℕ) : ℝ) := by
      push_cast  -- キャストを展開: (2 * q ^ 2 : ℕ) → 2 * (q : ℝ) ^ 2
      exact h_eq_real

    -- Nat.cast_injective を使って自然数の等式を得る
    exact Nat.cast_injective this

  -- p²は偶数なのでpも偶数
  have p_even : Even p := by
    have p_sq_even : Even <| p ^ 2 := by
      use q ^ 2
      rw [two_mul] at h_eq_nat
      exact h_eq_nat.symm
    -- p² が偶数なら p も偶数（素数2の性質を使う）
    -- Even を ∣ (divides) に変換
    have : 2 ∣ p ^ 2 := even_iff_two_dvd.mp p_sq_even
    -- 2は素数で、2 ∣ p^2 なので 2 ∣ p
    have : 2 ∣ p := Nat.Prime.dvd_of_dvd_pow Nat.prime_two this
    -- ∣ を Even に戻す
    exact even_iff_two_dvd.mpr this

  -- p = 2k とおく
  obtain ⟨k, hk⟩ := p_even

  -- 2q² = (2k)² = 4k² より q² = 2k²
  have q_sq_eq : q ^ 2 = 2 * k ^ 2 := by
    -- p = 2k を h_eq_nat に代入
    rw [hk] at h_eq_nat
    -- (2k)^2 = 4k^2 を計算
    ring_nf at h_eq_nat
    -- 2q^2 = 4k^2 の両辺を2で割る
    omega

  -- q²は偶数なのでqも偶数
  have q_even : Even q := by
    -- q^2 = 2 * k^2 より q^2 は偶数
    have q_sq_even : Even (q ^ 2) := ⟨k ^ 2, by omega⟩
    -- p の場合と同じく、素数2の性質を使う
    have : 2 ∣ q ^ 2 := even_iff_two_dvd.mp q_sq_even
    have : 2 ∣ q := Nat.Prime.dvd_of_dvd_pow Nat.prime_two this
    exact even_iff_two_dvd.mpr this

  -- pもqも偶数なので、2が公約数となり互いに素という仮定に矛盾
  -- p = k + k より 2 ∣ p
  have two_dvd_p : 2 ∣ p := by
    use k
    rw [hk]
    ring

  -- q も偶数より 2 ∣ q
  have two_dvd_q : 2 ∣ q := even_iff_two_dvd.mp q_even

  -- 2 ∣ p かつ 2 ∣ q なので 2 ∣ gcd p q
  have two_dvd_gcd : 2 ∣ Nat.gcd p q := Nat.dvd_gcd two_dvd_p two_dvd_q

  -- しかし coprime より gcd p q = 1 なので矛盾
  have gcd_eq_one : Nat.gcd p q = 1 := coprime
  rw [gcd_eq_one] at two_dvd_gcd
  -- 2 ∣ 1 は偽
  omega
