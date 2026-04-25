# TrojanScope Theory — Lean 4 Formalization

A formal verification of the theoretical guarantees for **multi-modal backdoor detection and trigger recovery** (TrojanScope), mechanized in [Lean 4](https://lean-lang.org/) with [Mathlib](https://github.com/leanprover-community/mathlib4).

## Paper Reference

> **TrojanScope**: Multi-Modal Backdoor Detection and Trigger Recovery Framework

## What's Formalized

### Assumptions (Section 2)
| Assumption | Status | Description |
|---|---|---|
| A1: Backdoor Trigger Properties | ✅ Formalized | Bounded norm trigger with persistent activation changes |
| A2: Visual Signature Distinctiveness | ✅ Formalized | Trigger anomalies exceed clean variability by factor > 3 |
| A3: Clean Data Regularity | ✅ Formalized | Sub-exponential clean data with bounded parameters |
| A4: Optimization Landscape | ✅ Formalized | μ-strongly convex objective with L-Lipschitz gradients |

### Main Theorems
| Theorem | Status | Description |
|---|---|---|
| Thm 1: Detection Consistency | ⚠️ Stated + partial proof | P(detect) ≥ 1 - 3·exp(-c²T/8σ²) - O(TC⁻¹). Full proof requires Bernstein's inequality formalization. |
| Thm 2: Trigger Recovery Accuracy | ✅ **Fully proved** | ‖δ̂ - δ‖ ≤ (2κ/μ)(ε + ρ·‖M-M*‖/√TC) |
| Thm 3: Convergence to Perfect Recovery | ✅ **Fully proved** | Recovery error → 0 as mask accuracy and optimization improve |

### Additional Non-Trivial Results
| Theorem | Status | Description |
|---|---|---|
| Multi-Modal Fusion Improvement | ✅ **Fully proved** | k ≥ 2 modalities reduce false positive rate exponentially |
| Trigger Uniqueness | ✅ **Fully proved** | Strong convexity guarantees unique trigger minimizer |
| Finite-Sample Detection | ✅ **Fully proved** | Explicit detection bound for finite samples |
| Sufficient Conditions for ε-Accuracy | ✅ **Fully proved** | Explicit conditions for guaranteed recovery precision |
| Detection Finite Precision | ✅ **Fully proved** | Detection under finite-precision arithmetic |
| Mask Error Bound (FDR) | ✅ **Fully proved** | Mask estimation error via false discovery rate |
| Recovery Stability Under Noise | ✅ **Fully proved** | Recovery error bound with observation noise |
| Collective Detection Strength | ✅ **Fully proved** | Three modalities provide collective detection advantage |
| Robustness to Compression | ⚠️ Partial | Graceful degradation under model compression |

## Proof Highlights

### Theorem 2 (Trigger Recovery Accuracy)
Proof proceeds in three steps:
1. **Ideal case**: With exact mask M = M*, strong convexity gives ‖δ̂* - δ‖ ≤ 2ε/μ (Lemma 2)
2. **Perturbation analysis**: Imperfect mask introduces gradient perturbation bounded by βρ‖M-M*‖/√TC
3. **Triangle inequality**: Combining via `calc` gives the stated bound with condition number κ = L/μ

### Theorem 3 (Convergence to Perfect Recovery)
Direct consequence of Thm 2: as mask error and optimization error → 0, the bound vanishes since κ and ρ are finite.

### Trigger Uniqueness (Non-Trivial)
Shows that strong convexity of the objective guarantees the true trigger is the **unique** minimizer — no other pattern can achieve the same objective value. Proof by contradiction using the strict convexity gap.

### Sufficient Conditions for ε-Accuracy (Corollary)
Provides explicit, verifiable conditions under which recovery achieves any desired accuracy ε:
- Optimization error ≤ με/(4κ)
- Mask estimation error ≤ ε√(TC)/(4ρ)

## Build & Verify

```bash
# Requires: Lean 4 (via elan) + Mathlib
lake build
```

All files compile successfully with Lean 4.30.0-rc2 + Mathlib.

## Project Structure

```
├── lakefile.toml              # Lean 4 project configuration (Mathlib dependency)
├── README.md                  # This file
├── TrojanScopeTheory.lean     # Root module
└── TrojanScopeTheory/
    ├── Basic.lean             # Core: definitions, assumptions, Thm 1-3, supporting lemmas
    └── Advanced.lean          # Additional non-trivial results
```

## License

MIT
