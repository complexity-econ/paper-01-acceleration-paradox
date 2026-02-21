# The Acceleration Paradox

**UBI as Automation Catalyst in a Small Open Economy: An SFC-ABM Approach**

Mateusz Maciaszek, 2026

## Abstract

We reverse the standard causality: Universal Basic Income does not respond to automation — it *causes* it. Through a double cost shock (rising reservation wages + rising interest rates), UBI makes labor-intensive business models mathematically unsustainable, forcing firms into a nonlinear technological leap. The resulting "Endogenous Technological Deflation" — where AI-driven productivity growth outpaces monetary expansion — resolves the inflationary dilemma of Modern Monetary Theory.

## Key Results

| Scenario | AI Adoption | Inflation | Unemployment |
|----------|------------|-----------|--------------|
| UBI = 0 PLN | 12.9% | −22.6% | 78.7% |
| UBI = 2,000 PLN | 61.9% ± 16.4% | −13.4% | 39.6% |
| UBI = 3,000 PLN | 32.8% | +19.4% | 19.4% |

Bimodality at UBI = 2,000 PLN confirmed (Hartigan dip test: p = 1.7 × 10⁻⁵), indicating a phase transition with three attractor states.

## Model

- **SFC-ABM**: 10,000 heterogeneous firms across 4 sectors (6 in GUS 2024 calibration)
- **Network**: Watts-Strogatz small-world (k=6, p=0.10)
- **Monte Carlo**: 100 seeds × 3 scenarios × 120 months
- **Balance sheets**: Full stock-flow consistency across 6 accounting blocks

## Reproduce

```bash
# Run simulation (~45 min)
make simulate

# Generate figures
make figures

# Compile paper
make paper

# Or all at once
make all
```

## Structure

```
├── simulations/
│   ├── scala/           ← SFC-ABM simulation (Ammonite/Scala)
│   ├── scripts/         ← Sweep runner
│   └── results/         ← Monte Carlo output (CSV)
├── analysis/
│   └── python/          ← Charts, statistical tests
├── figures/             ← Generated plots
├── latex/               ← Paper source + compiled PDF
└── Makefile
```

## Related

- [complexity-econ/core](https://github.com/complexity-econ/core) — Extracted simulation engine (in progress)

## License

MIT
