set -e

INDEX=0
for i in *.stl; do
  T=__tmp__$i
  b=`basename $i`
  echo import\(\"$i\"\)\; >$T
  for x in 0 45 90
  do
    for y in 0 45 90
    do
      for z in 0 45 90
      do
        /Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD -o images/$b.$x\_$y\_$z.png --viewall --render --colorscheme=Nature --camera=0,0,0,$x,$y,$z,20 --autocenter --imgsize=640,640 $T
        echo "$INDEX 0.5 0.5 1 1" > labels/$b.$x\_$y\_$z.txt
        # convert images/$b.$x\_$y\_$z.png images/$b.$x\_$y\_$z.jpg
        # rm images/$b.$x\_$y\_$z.png
      done
    done
  done
  rm $T
  let INDEX=${INDEX}+1
done