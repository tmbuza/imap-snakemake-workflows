# Images to include in report
rule imap_snakemake_workflows:
	output:
		imap=report("images/imap_part00.png", caption="../report/imap.rst", category="IMAP Project Preface"),
		part1=report("images/imap_part01.svg", caption="../report/software.rst", category="Basic Software"),
		part2=report("images/imap_part02.svg", caption="../report/srametadata.rst", category="Sample Metadata"),
		part3=report("images/imap_part03.svg", caption="../report/srareads.rst", category="Fastq Reads"),
		part4=report("images/imap_part04.svg", caption="../report/readqc.rst", category="Read QC"),
		part5=report("images/imap_part05.svg", caption="../report/mothur.rst", category="Mothur Pipeline"),
		part6=report("images/imap_part06.svg", caption="../report/qiime2.rst", category="QIIME2 Pipeline"),
		part7=report("images/imap_part07.svg", caption="../report/process.rst", category="Process Bioinfo Output"),
		part8=report("images/imap_part08.svg", caption="../report/explore.rst", category="Explore Processed Data"),
		part9=report("images/imap_part09.svg", caption="../report/visualize.rst", category="Visualize Data"),
		part10=report("images/imap_part10.svg", caption="../report/alphadiv.rst", category="Alpha Diversity"),
		part11=report("images/imap_part11.svg", caption="../report/betadiv.rst", category="Beta Diversity"),
		# part12=report("images/imap_part12.svg", caption="../report/.rst", category=""),
		# part13=report("images/imap_part13.svg", caption="../report/.rst", category=""),
		# part14=report("images/imap_part14.svg", caption="../report/.rst", category=""),
		# part15=report("images/imap_part15.svg", caption="../report/.rst", category=""),
	shell:
		"bash workflow/scripts/smk_workflows.sh"
