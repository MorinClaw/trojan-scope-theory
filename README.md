# TrojanScope Theory — Lean 4 Formalization

Formal verification of the theoretical analysis from **TrojanScope**, a multimodal Trojan detection method using trigger recovery via inverse optimization.

## Repository Structure

```
├── TrojanScopeTheory/
│   ├── Basic.lean       # Core theorems (Theorems 1-3, corollary)
│   └── Advanced.lean    # Extended results (compression, concentration)
├── README.md
├── lakefile.toml
└── lean-toolchain
```

## Theorems Formalized

| Theorem | Status | Description |
|---------|--------|-------------|
| **Thm 1** (Detection Consistency) | ⚠️ Partial | Bound well-formedness ✓; asymptotic positivity uses `sorry` (Bernstein concentration) |
| **Thm 2** (Trigger Recovery Accuracy) | ⚠️ Partial | Structure complete; `sorry` for κ≥1 derivation and monotonicity step |
| **Thm 3** (Convergence to Perfect Recovery) | ⚠️ Partial | Non-negativity uses `sorry`; vanishing case fully proved via `ring` |
| **Corollary** (ε-Accuracy Conditions) | ⚠️ Partial | Statement and structure complete; `sorry` for arithmetic derivation |
| **Multimodal Fusion** | ⚠️ Statement | `p_fp^k < p_fp` for k≥2 modalities |
| **Trigger Uniqueness** | ⚠️ Statement | Strong convexity ⇒ unique minimizer |
| **Finite-Sample Bound** | ⚠️ Statement | Hoeffding-style detection bound |
| **Compression** | ✅ Proved | Detection after γ-compression |
| **Empirical Concentration** | ✅ Proved | Loss concentration bound |
| **Gradient Bound** | ✅ Proved | Non-negativity of gradient bound |

## Status Legend

- ✅ **Fully proved** — no `sorry` used
- ⚠️ **Partial / Statement** — theorem stated correctly, proof uses `sorry` for intermediate steps

## Build

```bash
# Requires Lean 4 + Mathlib (lake will handle dependencies)
lake build
```

## Paper Reference

TrojanScope: Multimodal Trojan Detection via Trigger Recovery using Inverse Optimization.

## Notes

- The `sorry` annotations mark places where the mathematical argument is clear but requires additional Mathlib infrastructure (e.g., Bernstein's inequality, specific division lemmas) that would significantly increase proof length.
- The theorem *statements* are exact formalizations of the paper's results.
- Key identity verified algebraically: `(2κ/μ)(με/(4κ)) = ε/2` (via `field_simp; ring`).
