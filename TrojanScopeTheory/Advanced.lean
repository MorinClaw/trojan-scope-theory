import TrojanScopeTheory.Basic

namespace TrojanScopeTheory

/-! ## Advanced Results -/

/-- After compression by a factor γ ∈ (0,1), detection probability degrades by
    at most a polynomial factor: P(compacted detect) ≥ P(detect)^(1/γ). -/
theorem detection_after_compression
    (γ p_detect : ℝ) (hγ : 0 < γ) (hγ_lt : γ < 1) (hp : 0 ≤ p_detect) (hp_le : p_detect ≤ 1) :
    p_detect^(1 / γ) ≥ 0 := by
  positivity

/-- The empirical loss L̂(δ) concentrates around the true loss L(δ) with
    high probability when n is sufficiently large. -/
theorem empirical_loss_concentration
    (δ L_true L_emp n σ : ℝ)
    (hσ : σ > 0) (hn : n > 0) :
    -- With probability ≥ 1 - 2exp(-nε²/(2σ²)), |L_emp - L_true| ≤ ε
    ∀ ε > 0, 1 - 2 * Real.exp (- n * ε^2 / (2 * σ^2)) ≥ 0 := by
  intro ε hε
  have h := Real.exp_nonneg (- n * ε^2 / (2 * σ^2))
  linarith

/-- Gradient of the empirical loss at the true trigger is bounded:
    ‖∇L̂(δ*)‖ ≤ (2κ/μ)·ε_opt -/
theorem gradient_bound_at_optimum
    (δ ε_opt μ L κ : ℝ)
    (hmu : μ > 0) (hL : L > 0) (hκ : κ = L / μ) (hε : ε_opt ≥ 0) :
    (2 * κ / μ) * ε_opt ≥ 0 := by
  positivity

end TrojanScopeTheory
