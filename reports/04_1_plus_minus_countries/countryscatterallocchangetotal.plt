set terminal pdf
#set terminal windows
#set xdata time
#set timefmt "%Y-%m-%d"
#set format x ""
set logscale y
#set key left
set xlabel 'Countries'
set ylabel 'Number of new prefixes'
set title 'Geographic distribution of IP allocation dynamics (from 2003 to 2008)'

unset xtics
plot \
	'< grep "North America" ipv4datapercountrywithregionstotal.csv'	using 1:($5-$6) title 'North America'			ps 2 lw 3 pt 2, \
	'< grep "South America" ipv4datapercountrywithregionstotal.csv'	using 1:($5-$6) title 'South America'			ps 2 lw 3 pt 2, \
	'< grep "Europe" ipv4datapercountrywithregionstotal.csv'			using 1:($5-$6) title 'Europe'				ps 2 lw 3 pt 2, \
	'< grep "Asia" ipv4datapercountrywithregionstotal.csv'				using 1:($5-$6) title 'Asia-Pacific Region'	ps 2 lw 3 pt 2, \
	'< grep "Africa" ipv4datapercountrywithregionstotal.csv'			using 1:($5-$6) title 'Africa'				ps 2 lw 3 pt 2, \
	'< grep "Other" ipv4datapercountrywithregionstotal.csv'			using 1:($5-$6) title 'Other'					ps 2 lw 3 pt 2
