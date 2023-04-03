# Images to include in report
rule get_files4smk_report:
	output:
		part1=report("images/imap_part01.svg", caption="../report/software.rst", category="Basic Software"),
		part2=report("images/imap_part02.svg", caption="../report/srametadata.rst", category="SRA Metadata Download"),
		part3=report("images/imap_part03.svg", caption="../report/srareads.rst", category="SRA FastQ Download"),
		part4=report("images/imap_part04.svg", caption="../report/readqc.rst", category="Read QC Analysis"),
		part5=report("images/imap_part05.svg", caption="../report/mothur.rst", category="Mothur 16S Analysis"),
		part6=report("images/imap_part06.svg", caption="../report/qiime2.rst", category="QIIME2 16S Analysis"),
		part7=report("images/imap_part07.svg", caption="../report/process.rst", category="Process Data"),
		part8=report("images/imap_part08.svg", caption="../report/explore.rst", category="Explore Data"),
		imap=report("images/imap.png", caption="../report/imap.rst", category="IMAP Parts"),
	shell:
		"bash workflow/scripts/files4smk_report.sh"


# Get dot rule graphs
rule get_dot_rulegraph:
	output:
		"dags/rulegraph.svg",
		"dags/rulegraph.png",
	conda:
		"../envs/environment.yml"	
	shell:
		"bash workflow/scripts/rules_dag.sh"


# Get project tree
rule project_tree:
	output:
		tree="results/project_tree.txt",
	conda:
		"../envs/environment.yml"
	shell:
		"""
		bash workflow/scripts/tree.sh
		"""

# Get smk html report
rule snakemake_html_report:
	output:
		smkhtml="report.html",
		smkpng="images/smkreport/screenshot.png",
	conda:
		"../envs/environment.yml"
	shell:
		"""
		bash workflow/scripts/smk_html_report.sh
		"""


# User styled report for GHPages
rule deploy_to_github_pages:
	input:
		rulegraph="dags/rulegraph.svg",
		tree="results/project_tree.txt",
		# smkpng="images/smkreport/screenshot.png",
		# "images/imap_part01.svg",
		# "images/imap_part02.svg",
		# "images/imap_part03.svg",
		# "images/imap_part04.svg",
		# "images/imap_part05.svg",
		# "images/imap_part06.svg",
		# "images/imap_part07.svg",
		img="images/imap_part08.svg",
	output:
		doc="index.html",
	conda:
		"../envs/environment.yml"
	shell:
		"""
		R -e "library(rmarkdown); render('index.Rmd')"
		"""