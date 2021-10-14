# Take the script below this line and add it to your .bash_profile or .bashrc
------

publish() {
    # Check current directory
    CURPATH=${PWD##*/}
    
    # Enforce running script from root/WIP
    if [ $CURPATH != WIP ]
    then
        echo "Script must be executed within directory WIP within Gatsby root. Current directory is $CURPATH"
        return
    fi

    NAME=`echo "$1" | cut -d'.' -f1`
    NEWPATH=../content/blog/${NAME}

    if [ $# -ge 2 ]
    then 
        NEWPATH= $2$NAME
        echo "Wrote $1 to $2$NAME/index.md"
    elif [ $# -eq 1 ]
    then
        echo "Wrote $1 to ../content/blog/${NAME}/index.md"
    elif [ $# -eq 0 ]
    then
        echo "usage: publish FILENAME PATH"
        return
    fi

    mkdir $NEWPATH && cp $1 $NEWPATH/index.md

}
