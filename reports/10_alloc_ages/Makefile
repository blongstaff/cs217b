DATES=2003-01-01 2004-01-01 2005-01-01 2006-01-01 2007-01-01 2008-01-01 2009-01-01 2009-04-23

PDF=alloc_total.pdf \
	$(patsubst %,alloc-%.pdf,$(DATES)) \
	$(patsubst %,size-%.pdf,$(DATES))
#alloc_per_year.pdf  alloc_per_year-2003.pdf

#01_bgp_ip_size.pdf 02_bgp_max_vs_ip.pdf 02_bgp_max_vs_ip_space.pdf 03_bgp_ip_space.pdf 04_bgp_ratio.pdf \
#	$(patsubst %,05_ip_%.pdf,$(DATES))\
#	$(patsubst %,05_isize_%.pdf,$(DATES))\
#	$(patsubst %,05_bgp_%.pdf,$(DATES)) \
#	$(patsubst %,05_bsize_%.pdf,$(DATES)) \
#	$(patsubst %,bgp_%.js,$(DATES)) \
#	$(patsubst %,ip_%.js,$(DATES))
#

alloc-%.pdf: alloc_per_year.plt _ipv4.php
	#php _ipv4.php $* > stat-$*.txt
	cp stat-$*.txt stat.txt
	gnuplot $< > $@

size-%.pdf: size.plt _ipv4.php
	#php _ipv4.php $* > stat-$*.txt
	cp stat-$*.txt stat.txt
	gnuplot $< > $@

all: pdf

pdf: $(PDF)

%.pdf: %.plt
	gnuplot $< > $@

