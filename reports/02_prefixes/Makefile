DATES=2003-01-01 2004-01-01 2005-01-01 2006-01-01 2007-01-01 2008-01-01 2009-01-01 2009-04-23

PDF=01_bgp_prefixes.pdf 01_bgp_prefixes_zoom.pdf \
	rir_prefixes.txt 02_ip_prefixes.pdf 02_ip_prefixes_zoom.pdf

#01_bgp_ip_size.pdf 02_bgp_max_vs_ip.pdf 02_bgp_max_vs_ip_space.pdf 03_bgp_ip_space.pdf 04_bgp_ratio.pdf \
#	$(patsubst %,05_ip_%.pdf,$(DATES))\
#	$(patsubst %,05_isize_%.pdf,$(DATES))\
#	$(patsubst %,05_bgp_%.pdf,$(DATES)) \
#	$(patsubst %,05_bsize_%.pdf,$(DATES)) \
#	$(patsubst %,bgp_%.js,$(DATES)) \
#	$(patsubst %,ip_%.js,$(DATES))
#

all: pdf

pdf: $(PDF)

%.pdf: %.plt
	gnuplot $< > $@

rir_prefixes.txt: _ipv4.php
	php _ipv4.php > rir_prefixes.txt
	rm 02_ip_prefixes.pdf 02_ip_prefixes_zoom.pdf
