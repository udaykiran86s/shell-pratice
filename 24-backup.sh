
USERID=$(id -u)
r="\e[31m"
g="\e[32m"
y="\e[33m"
n="\e[0m"
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} #IF NOT PROVIDED CONSIDERED AS 14 DAYS

LOGS_FOLDER="/var/log/shel-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
mkdir -p $LOGS_FOLDER

echo "Script started executed at: $(date)"  | tee -a $LOG_FILE

if [ $USERID -ne 0 ];then
   echo "please run with root user"
    exit 1
fi

USUAGE(){
    echo "USAGE:: sudo sh 24-backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS>[]"
    exit 1
}
if [  $# -lt 2 ]; then
    USAGE
###check SOURCE_DIR EXISTS #####
#mkdir source-dir
#mkdir dest-dir


if  [ ! -d $SOURCE_DIR ]; then
    echo -e "$R $source_dir does not exist $N"
    exit 1

fi

####CHECK DEST_DIR EXISTS OR NOT #####


if  [ ! -d $DEST_DIR ]; then
    echo -e "$R $dest_dir does not exist $N"
    exit 1

fi


#####FIND THE FILES#####


FILES_=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)

if [ ! -z "${FILES}" ]; then

    ####START ARCHIEVING#####

    echo "files found :$FILES"
    TIMESTAMP=$(date +%F-%H-%m)
    zip_file_name="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    echo "zip filename: $ZIP_FILE_NAME"
    find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS | zip -@ -j "$ZIP_FILE_NAME"
    
    
    ####CHECK ARCHIEVE IS SUCCESS OR NOT####
    if [ -f $ZIP_FILE_NAME ]
    then
        echo "successfully archieved"

        ####DELETE IF SUCCESS####
        while IFS= read -r filepath
        do 
            echo "deleting the file: $filepath"
            rm -rf  $filepath
            echo "deleted the file: $filepath"
        done <<<$FILES
    else 
        echo "archieved the files ...$r FAILURE $n"
        exit 1
    fi
else 
    echo -e " no files to archeive...$y skipping  $n"

fi

