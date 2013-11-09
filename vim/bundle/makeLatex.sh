#!/bin/bash

rubber --pdf $1.tex
xdg-open $1.pdf
