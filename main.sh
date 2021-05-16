#!/usr/bin/env bash
### Command Line Arguments
if [ $# -eq 0 ]
    then
        echo "No arguments supplied"
    else
        ### CODE
        ## Check whether Google Chrome, Chromium or Brave Browser exists on that particular operating system.
        ## Directory to Search => /Applications/

        chrome_flag=0
        chromium_flag=0
        brave_flag=0

        ## Check whether the Browser App is present
        ### $1 = FILE location
        ### $2 = flag
        check_app_exists() {
            if [ -e "$1" ]; then
                local -n flag_ref=$2
                flag_ref=1
                echo "$1 exists."
            else 
                echo "$1 does not exist."
            fi
        }

        FILE="/Applications/Google Chrome.app"
        check_app_exists "$FILE" chrome_flag 

        FILE="/Applications/Chromium.app"
        check_app_exists "$FILE" chromium_flag 

        FILE="/Applications/Brave Browser.app"
        check_app_exists "$FILE" brave_flag 


        echo $chrome_flag $chromium_flag $brave_flag

        ## Getting BOOKMARKS
        ## DEFAULT LOCATION: As you've stated, the default location is found within: 
        ## Location where Application Specific Data Files are present: /Users/gokulsreekumar/Library/Application\ Support
        ## Inside this above directory go to the application's folder inside that go to Default and there Bookmarks will be
        
        ## Find if BookMarks File Exist
        chrome_bookmark=$(find "/Users/gokulsreekumar/Library/Application Support/Google/Chrome" -name Bookmarks | head -1)
        chromium_bookmark=$(find "/Users/gokulsreekumar/Library/Application Support/Chromium" -name Bookmarks | head -1)
        brave_bookmark=$(find "/Users/gokulsreekumar/Library/Application Support/BraveSoftware" -name Bookmarks | head -1)

        ## Extract bookmark urls
        ### $1 => flag
        ### $2 => bookmark
        ### $3 => filename to store bookmarks
        extract_bookmark() {
            if [ $1 -eq 1 ] 
                then
                    if [ -f "$2" ]
                        then
                            cat "$2" | grep url | grep -v type | awk '{print($2)}' > ${3}.txt
                    fi
            fi
        }

        extract_bookmark $chrome_flag "$chrome_bookmark" "chrome_bookmarks"
        extract_bookmark $chromium_flag "$chromium_bookmark" "chromium_bookmarks"
        extract_bookmark $brave_flag "$brave_bookmark" "brave_bookmarks"

        
        ## Search for the Phrase
        echo "Results from Google Chrome:"
        grep $1 chrome_bookmarks.txt
        echo "Results from Chromium:"
        grep $1 chromium_bookmarks.txt
        echo "Results from Brave:"
        grep $1 brave_bookmarks.txt
    
fi