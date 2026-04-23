
USERID=$(id -u)
r="\e[31m"
g="\e[32m"
y="\e[33m"
n="\e[0m"

LOGS_FOLDER="/var/log/shel-script"
SCRIPT_NAME=$( echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
mkdir -p $LOGS_FOLDER

echo "Script started executed at: $(date)"  | tee -a $LOG_FILE
SOURCE_DIR=/home/ec2-user/app-logs

if [ -d $SOURCE_DIR ];then
    echo -e "ERROR: : $SOURCE_DIR does not exist"
    exit 1
fi

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -type f -mtime +14)

while IFS= read -r filepath
do 
    echo "deleting the file: $filepath"
    rm -rf  $filepath
    echo "deleted the file: $filepath"
done <<<$FILES_TO_DELETE