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
  <sect1 id="mate-dconf-list">
    <title>List of Dconf Keys of MATE Desktop</title>
EOF
for file in mate-desktop/schemas/*.gschema.xml.in; do
  xsltproc gosdconfkeys.xsl $file >> $OUTPUT
done
cat << EOF >> $OUTPUT
  </sect1>
EOF
xmllint -format $OUTPUT > $OUTPUT.aux
mv $OUTPUT.aux $OUTPUT
