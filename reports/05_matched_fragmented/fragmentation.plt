set terminal pdf

#set border 3 front linetype -1 linewidth 1.000
#set boxwidth 1 absolute

set border 3 front linetype -1 linewidth 1.000
set boxwidth 0.75 absolute
set style fill   solid 1.00 border -1


#set style fill   solid 3.00 noborder
#set grid nopolar
#set grid noxtics nomxtics ytics nomytics noztics nomztics \
# nox2tics nomx2tics noy2tics nomy2tics nocbtics nomcbtics
#set grid layerdefault   linetype 0 linewidth 1.000,  linetype 0 linewidth 1.000
#set key bmargin center horizontal Left reverse enhanced autotitles columnhead nobox
#set datafile missing '-'
set style data histograms
#set style histogram rowstacked title  offset character 0, 0, 0

#columnstacked gap 1


#set pm3d
set style histogram clustered gap 1
#title offset 4,0.25
#set style fill solid noborder
#set boxwidth 0.95

#set key under nobox
set grid y
set auto y
#set logscale y

#set ytics border in scale 0,0 mirror norotate  offset character 0, 0, 0 autofreq 
#set ztics border in scale 0,0 nomirror norotate  offset character 0, 0, 0 autofreq 
#set cbtics border in scale 0,0 mirror norotate  offset character 0, 0, 0 autofreq 

set xtics nomirror rotate by -45 scale 0


plot 'stat.txt' using 2:xtic(1) title 'Matched', \
	 '' u 3 title 'Fragmented',\
	 '' u 4 title 'Aggregated'


