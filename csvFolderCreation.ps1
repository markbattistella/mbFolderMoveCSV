# Code written by Mark Battistella
# Copyright (c) 2020
# Do not alter anything or else the world will break

# set the working directory
Set-Location "C:\" # <-- set your directory

# import the CSV file for folder creation
$folders = Import-Csv -Delimiter "," -Header @("ID","caseName","caseNumber") -Path .\file.csv # <-- set your file.csv

# begin the loop
ForEach( $folder in $folders ) {

	# create the variables
	$columnID = $folder.ID
	$columnCase = "{0} {1}" -f $folder.caseName, $folder.caseNumber # returns: "Column2 Column3"

	# if case name and number folder does NOT exist
	if( -not ( Test-Path "$columnCase" ) ) {
		New-Item "$columnCase" -ItemType Directory
	}

	# if case name and number folder does exist
	if( Test-Path "$columnID" ) {

		# ID folder exists - move it
		Move-Item "$columnID" -Destination "$columnCase" -Force

	} elseif (Test-Path "$columnCase\$columnID" ) {

		# ID folder DOES exist inside of the subdirectory

	} else {

		# ID doesn't exist - create it in the right spot
		# New-Item "$columnCase\$columnID" -ItemType Directory

   }
}
