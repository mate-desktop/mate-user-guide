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
OUTPUT=gosdconfkeys.xml
if [ ! -d "mate-desktop" ]; then
  git clone https://github.com/mate-desktop/mate-desktop.git
fi
cat << EOF > $OUTPUT
<?xml version="1.0" encoding="utf-8"?>
<?db.chunk.max_depth 3?>
<section xmlns="http://docbook.org/ns/docbook"
         xmlns:db="http://docbook.org/ns/docbook"
         xmlns:xlink="http://www.w3.org/1999/xlink"
         xmlns:its="http://www.w3.org/2005/11/its"
         version="5.0" its:version="2.0" xml:id="mate-dconf-list" xml:lang="en">
    <info><title>List of Dconf Keys of MATE Desktop</title></info>
EOF
for file in mate-desktop/schemas/*.gschema.xml.in; do
  xsltproc gosdconfkeys.xsl $file >> $OUTPUT
done
cat << EOF >> $OUTPUT
  </section>
EOF
xmllint -format $OUTPUT > $OUTPUT.aux
mv $OUTPUT.aux $OUTPUT
