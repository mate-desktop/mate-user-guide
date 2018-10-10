#!/bin/bash
# ---------------------------------------------------------------------------
# Copyright 2018, Robert Buj <rbuj@fedoraproject.org>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License at <http://www.gnu.org/licenses/> for
# more details.
# ---------------------------------------------------------------------------
FILE=org_mate_desktop_background_logical_view
TEXFILE=$FILE.tex

function browse_dir {
  echo "[$1"  >> $TEXFILE
  for directory in $(dconf list $2$1 | sort); do
    case "$directory" in
      */)
         if [ "$directory" == "background/" ]; \
         then
           browse_dir $directory "$2$1"
         else
           echo "[$directory"  >> $TEXFILE
           echo "]"  >> $TEXFILE
         fi
         ;;
       *)
         echo "[$directory]"  >> $TEXFILE
         ;;
     esac
  done
  echo "]"  >> $TEXFILE
}


cat << EOF > $TEXFILE
\documentclass[tikz, border=5pt, multi]{standalone}
\usepackage{forest}
\usetikzlibrary{arrows.meta}
\forestset{
  dir tree/.style={
    for tree={
      parent anchor=south west,
      child anchor=west,
      anchor=mid west,
      inner ysep=1pt,
      grow'=0,
      align=left,
      edge path={
        \noexpand\path [draw, \forestoption{edge}] (!u.parent anchor) ++(1em,0) |- (.child anchor)\forestoption{edge label};
      },
      font=\sffamily,
      if n children=0{}{
        delay={
          prepend={[,phantom, calign with current]}
        }
      },
      fit=band,
      before computing xy={
        l=2em
      }
    },
  }
}
\begin{document}
\begin{forest}
  dir tree
  [/
    [org/
      [mate/
EOF

for directory in $(dconf list '/org/mate/' | sort); do \
    case "$directory" in
      */)
         if [ "$directory" == "desktop/" ]; \
         then
           browse_dir $directory "/org/mate/"
         else
           echo "[$directory"  >> $TEXFILE
           echo "]"  >> $TEXFILE
         fi
         ;;
       *)
         echo "[$directory]"  >> $TEXFILE
         ;;
     esac
done

cat << EOF >> $TEXFILE
      ]
    ]
  ]
\end{forest}
\end{document}
EOF

pdflatex $TEXFILE
pdftocairo $FILE.pdf -png
convert $FILE-1.png -resize 75% $FILE.png
