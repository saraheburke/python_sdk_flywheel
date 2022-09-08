#!/bin/bash
	#' This script will curate a list of scans tht are in the HUP6 folder using the revised heuristic in ftdc_volumetric
        #' this is hard coded so if you want to change it you'll have to change the script in the loop
#This script will only work in sciGET in the fwenv (which is written in so don't even worry about that)
   #just make sure you have a txt file (WITHOUT HEADERS) that has the subject session (must have a space between them because that's how I coded it)

txt=${1}

while read p; do
        i=`echo "$p" | cut -f1 -d ','`
        j=`echo "$p" | cut -f2 -d ','`
       
        fw-heudiconv-clear --project HCPMultiCenter --subject $i --session $j
        fw-heudiconv-curate --project HCPMultiCenter --subject $i --session $j --heuristic /Users/seburke/projects/scripts/hcp_scripts/curation_tools/heuristic_hcp.py

done<$txt
