.PHONY: simulate figures paper all clean

simulate:
	amm simulations/scala/simulation_mc.sc

figures:
	python3 analysis/python/mc_charts.py
	python3 analysis/python/mc_welfare.py
	python3 analysis/python/sweep_analysis.py
	python3 analysis/python/diptest_analysis.py
	python3 analysis/python/gus_charts.py

paper:
	cd latex && xelatex -interaction=nonstopmode esej.tex && bibtex esej && xelatex -interaction=nonstopmode esej.tex && xelatex -interaction=nonstopmode esej.tex

all: simulate figures paper

clean:
	rm -f latex/*.aux latex/*.bbl latex/*.blg latex/*.log latex/*.out latex/*.run.xml latex/*.toc latex/*.bcf latex/*-blx.bib
