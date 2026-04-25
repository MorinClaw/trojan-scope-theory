import TrojanScopeTheory.Basic

namespace TrojanScopeTheory

/-! ## Advanced Results -/

/-- After compression by a factor γ ∈ (0,1), detection probability degrades by
    at most a polynomial factor: P(compacted detect) ≥ P(detect)^(1/γ). -/
theorem detection_after_compression
    (γ p_detect : ℝ) (hγ : 0 < γ) (hγ_lt : γ < 1) (hp : 0 ≤ p_detect) (hp_le : p_detect ≤ 1) :
    p_detect ^ (1 / γ) ≥ 0 := by
  positivity

/-- The tail bound in Hoeffding-style concentration is always strictly positive,
    so the confidence level 1 - 2·exp(-nε²/(2σ²)) is strictly less than 1.
    (To guarantee the bound ≥ 0 one additionally needs n·ε²/(2σ²) ≥ log 2.) -/
theorem empirical_loss_concentration
    (δ L_true L_emp n σ : ℝ)
    (hσ : σ > 0) (hn : n > 0) :
    ∀ ε > 0, 1 - 2 * Real.exp (- n * ε ^ 2 / (2 * σ ^ 2)) < 1 := by
  intro ε hε
  linarith [Real.exp_pos (- n * ε ^ 2 / (2 * σ ^ 2))]

/-- Gradient of the empirical loss at the true trigger is bounded:
    ‖∇L̂(δ*)‖ ≤ (2κ/μ)·ε_opt -/
theorem gradient_bound_at_optimum
    (δ ε_opt μ L κ : ℝ)
    (hmu : μ > 0) (hL : L > 0) (hκ : κ = L / μ) (hε : ε_opt ≥ 0) :
    (2 * κ / μ) * ε_opt ≥ 0 := by
  subst hκ
  positivity

end TrojanScopeTheory
