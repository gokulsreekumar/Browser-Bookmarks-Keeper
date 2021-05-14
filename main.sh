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

        FILE="/Applications/Google Chrome.app"
        if [ -e "$FILE" ]; then
            chrome_flag=1
            echo "$FILE exists."
        else 
            echo "$FILE does not exist."
        fi

        FILE="/Applications/Chromium.app"
        if [ -e "$FILE" ]; then
            chromium_flag=1
            echo "$FILE exists."
        else 
            echo "$FILE does not exist."
        fi

        FILE="/Applications/Brave Browser.app"
        if [ -e "$FILE" ]; then
            brave_flag=1
            echo "$FILE exists."
        else 
            echo "$FILE does not exist."
        fi

        echo $chrome_flag $chromium_flag $brave_flag

        ## Getting BOOKMARKS
        ## DEFAULT LOCATION: As you've stated, the default location is found within: 
        ## Location where Application Specific Data Files are present: /Users/gokulsreekumar/Library/Application\ Support
        ## Inside this above directory go to the application's folder inside that go to Default and there Bookmarks will be
        

        ## Find if BookMarks File Exist
        chrome_bookmark=$(find "/Users/gokulsreekumar/Library/Application Support/Google/Chrome" -name Bookmarks | head -1)
        chromium_bookmark=$(find "/Users/gokulsreekumar/Library/Application Support/Chromium" -name Bookmarks | head -1)
        brave_bookmark=$(find "/Users/gokulsreekumar/Library/Application Support/BraveSoftware" -name Bookmarks | head -1)

        if [ $chrome_flag -eq 1 ] 
            then
                if [ -f "$chrome_bookmark" ] 
                    then
                        cat "$chrome_bookmark" | grep url | grep -v type | awk '{print($2)}' > chrome_bookmarks.txt
                fi
        fi

        if [ $chromium_flag -eq 1 ] 
            then 
                if [ -f "$chromium_bookmark" ] 
                    then
                        cat "$chromium_bookmark" | grep url | grep -v type | awk '{print($2)}' > chromium_bookmarks.txt
                fi
        fi

        if [ $brave_flag -eq 1 ] 
            then 
                if [ -f "$brave_bookmark" ] 
                    then
                        cat "$brave_bookmark" | grep url | grep -v type | awk '{print($2)}' > brave_bookmarks.txt
                fi
        fi



        # chrome_bookmark='/Users/gokulsreekumar/Library/Application Support/Google/Chrome/Default/Bookmarks'
        # chromium_bookmark='/Users/gokulsreekumar/Library/Application Support/Chromium/Default/Bookmarks'
        # brave_bookmark="/Users/gokulsreekumar/Library/Application\ Support/BraveSoftware/Brave-Browser/Default/Bookmarks"


        # if [ $chrome_flag -eq 1 ] 
        #     then
        #         cat "$chrome_bookmark" | grep url | grep -v type | awk '{print($2)}' > chrome_bookmarks.txt
        # fi
        
        # if [ $chromium_flag -eq 1 ] 
        #     then
        #         cat "$chromium_bookmark" | grep url | grep -v type | awk '{print($2)}' > chromium_bookmarks.txt
        # fi

    
fi