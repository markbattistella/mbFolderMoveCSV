# Code written by Mark Battistella
# Copyright (c) 2020
# Do not alter anything or else the world will break

# set the working directory
Set-Location "B:\testFolder"

# import the CSV file for folder creation
$folders = Import-Csv -Delimiter "," -Header @("ID","caseName","caseNumber") -Path .\fmExport.csv

# begin the loop
ForEach( $folder in $folders ) {

   # create the variables
   $columnID = $folder.ID
   $columnCase = "{0} {1}" -f $folder.caseName, $folder.caseNumber
   $columnNewCase = "{1}, {0}" -f $folder.caseName, $folder.caseNumber
   $yearAllocation = "20{0}" -f $folder.caseNumber.Substring(0,2)


   #
   # // MARK: begin main folder creation
   #

   # "SMITH 12345678" and "13246578, SMITH" do NOT exist
   if( (-not ( Test-Path "$columnCase" )) -and (-not ( Test-Path "$columnNewCase" )) ) {
	   # create the "12345678, SMITH"
	   New-Item "$columnNewCase" -ItemType Directory
   }

   # "SMITH 12345678" EXISTS but "13246578, SMITH" does NOT exist
   if( ( Test-Path "$columnCase" ) -and (-not ( Test-Path "$columnNewCase" )) ) {
	   # rename "SMITH 12345678" -> "12345678, SMITH"
	   Rename-Item "$columnCase" -NewName $columnNewCase -Force
   }

   # "SMITH 12345678" does NOT exist but "13246578, SMITH" EXISTS
#   if( (-not ( Test-Path "$columnCase" )) -and ( Test-Path "$columnNewCase" ) ) {
#   }

   # "SMITH 12345678" and "13246578, SMITH" both EXIST
   if( ( Test-Path "$columnCase" ) -and ( Test-Path "$columnNewCase" ) ) {
	   # merge "SMITH 12345678" -> "12345678, SMITH"
   }


   #
   # // MARK: begin ID folder moves
   #

   # if "98765" folder exists
   if( Test-Path "$columnID" ) {
	   # move "98765" into "12345678, SMITH"
	   Move-Item "$columnID" -Destination "$columnNewCase"

   # ID folder DOES exist inside of the subdirectory
   # } elseif (Test-Path "$columnNewCase\$columnID" ) {
   # ID doesn't exist - create it in the right spot
   # } else {
   # New-Item "$columnNewCase\$columnID" -ItemType Directory

   }
}
