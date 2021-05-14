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
        
        chrome_bookmark="/Users/gokulsreekumar/Library/Application Support/Google/Chrome/Default/Bookmarks"
        chromium_bookmark=""
        brave_bookmark=""

        

        
fi