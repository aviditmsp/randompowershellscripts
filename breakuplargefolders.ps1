#Get the collection of files
$files = get-childitem "F:\AllEmails"

#initialize a counter to 0 or 1 depending on if there is a
#remainder after dividing the number of files by 3.
#if($files.count % 8 -eq 0){
    $counter = 0
#} else {
#    $counter = 1
#}

#Iterate through the files
Foreach($file in $files){

    #Determine which subdirectory to put the file in
    If($counter -lt $files.count / 8){
            $d = "f:\dir1"
    } elseif($counter -lt $files.count / 8 * 2){
            $d = "f:\dir2"
    } elseif($counter -lt $files.count / 8 * 3){
            $d = "f:\dir3"
    } elseif($counter -lt $files.count / 8 * 4){
            $d = "f:\dir4"
    } elseif($counter -lt $files.count / 8 * 5){
            $d = "f:\dir5"
    } elseif($counter -lt $files.count / 8 * 6){
            $d = "f:\dir6"
    } elseif($counter -lt $files.count / 8 * 7){
            $d = "f:\dir7"
    } else {
        $d = "f:\dir8"
    }

    #Create the subdirectory if it doesn't exist
    #You could just create the three subdirectories
    #before the loop starts and skip this
    #if(-Not (test-path c:\Child\$d)){
    #    md c:\Child\$d
    #}

    #Move the file and increment the counter
    move-item $file.FullName -Destination $d
    $counter ++
}
