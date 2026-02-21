# The Acceleration Paradox

**UBI as Automation Catalyst in a Small Open Economy: An SFC-ABM Approach**

Mateusz Maciaszek, 2026

## Abstract

We reverse the standard causality: Universal Basic Income does not respond to automation — it *causes* it. Through a double cost shock (rising reservation wages + rising interest rates), UBI makes labor-intensive business models mathematically unsustainable, forcing firms into a nonlinear technological leap. The resulting "Endogenous Technological Deflation" — where AI-driven productivity growth outpaces monetary expansion — resolves the inflationary dilemma of Modern Monetary Theory.

## Key Results

| Metric | UBI = 0 PLN | UBI = 2 000 PLN | UBI = 3 000 PLN |
|--------|:-----------:|:---------------:|:---------------:|
| AI + Hybrid adoption | 12.9% | 61.9% ± 16.4% | 32.8% |
| Inflation (r/r) | −22.6% | −13.4% | +19.4% |
| Unemployment | 78.7% | 39.6% | 19.4% |
| Exchange rate PLN/EUR | 3.29 | 4.66 | 5.08 |
| Market wage | 4 000 PLN | 5 331 PLN | 6 487 PLN |
| Public debt | −0.83 mld | 12.58 mld | 15.23 mld |

**Bimodality** at UBI = 2 000 PLN confirmed (Hartigan dip test: p = 1.7 × 10⁻⁵), indicating a phase transition with three attractor states identified by GMM (K=3, BIC-optimal).

## Model

- **SFC-ABM**: 10 000 heterogeneous firms across 6 sectors (GUS 2024 calibration)
- **Network**: Watts-Strogatz small-world (k=6, p=0.10) — demonstration effect diffusion
- **Monte Carlo**: 100 seeds × 3 scenarios × 120 months
- **Balance sheets**: Full stock-flow consistency across 6 accounting blocks
- **Sectors**: BPO/SSC (σ=50), Manufacturing (σ=10), Retail/Services (σ=5), Healthcare (σ=2), Agriculture (σ=3), Public (σ=1)

## Structure

```
├── simulations/
│   ├── scala/
│   │   └── simulation_mc.sc      # Ammonite SFC-ABM simulation (865 lines)
│   ├── scripts/
│   │   └── run_sweep.sh          # Parameter sweep runner (21 UBI levels)
│   └── results/
│       ├── baseline_*.csv        # UBI = 2 000 PLN (N=100)
│       ├── nobdp_*.csv           # UBI = 0 PLN (N=100)
│       ├── bdp3000_*.csv         # UBI = 3 000 PLN (N=100)
│       ├── gus/                  # GUS-calibrated runs
│       └── sweep/                # 21-point parameter sweep (0–5 000 PLN)
├── analysis/
│   └── python/
│       ├── mc_charts.py          # Main Monte Carlo panel (6 subplots)
│       ├── mc_welfare.py         # Welfare analysis charts
│       ├── sweep_analysis.py     # Bifurcation diagram + inverted-U
│       ├── diptest_analysis.py   # Hartigan dip test + GMM bimodality
│       └── gus_charts.py         # GUS dual paradox + sector comparison
├── figures/                      # 9 generated plots (PNG)
├── latex/
│   ├── esej.tex                  # Paper source (XeLaTeX + biblatex)
│   ├── esej.pdf                  # Compiled paper (~50 pages)
│   ├── references.bib            # Bibliography
│   └── figures/                  # Figures embedded in paper
├── Makefile
└── LICENSE
```

## Reproduce

### Prerequisites

- [Ammonite](https://ammonite.io/) (Scala scripting)
- Python 3 + matplotlib, seaborn, scipy, scikit-learn, pandas
- XeLaTeX + biblatex (for paper compilation)

### Run

```bash
# Full pipeline: simulation → figures → paper
make all

# Or step by step:
make simulate    # ~45 min (3 × 100 seeds × 10 000 firms × 120 months)
make figures     # Generate all plots from CSVs
make paper       # Compile LaTeX → PDF
```

### Quick single run

```bash
cd simulations/scala
BDP=2000 SEEDS=10 PREFIX=quick amm simulation_mc.sc
```

## Figures

| Figure | Description |
|--------|-------------|
| `v5_mc_panel6` | Main panel: inflation, unemployment, adoption, exchange rate, wage, debt |
| `v5_mc_bifurcation` | Bifurcation diagram across 21 UBI levels |
| `v5_mc_bimodal` | Bimodality: histogram + GMM fit (K=3) |
| `v5_mc_diptest` | Hartigan dip test visualization |
| `v5_mc_nonlinear` | Inverted-U relationship: UBI level vs adoption |
| `v5_mc_sectors` | Per-sector adoption dynamics |
| `v5_mc_welfare` | Welfare analysis across scenarios |
| `v6_gus_dual_paradox` | GUS-calibrated dual paradox visualization |
| `v6_gus_sector_comparison` | Sector comparison with GUS data |

## Related

- [`complexity-econ/core`](https://github.com/complexity-econ/core) — Modularized Scala 3 simulation engine extracted from this project. This repo is **self-contained** (includes its own `simulation_mc.sc`); `core` is the reusable version for future papers.

## License

MIT
