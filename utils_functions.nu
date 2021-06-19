def find_files_modified_since! [PATH: string PATTERN: string DURATION: duration] {
    ^find $PATH -iname $"*($PATTERN)*" -type f | lines |
    each { echo $it | str ltrim | str find-replace -a "\./" "" | lines |
        each { ls $it } | where modified <= $DURATION | 
        each { echo $"($it.name)|($it.modified)" | lines } }
}

def find_files_acceeded_since! [PATH: string PATTERN: string DURATION: duration] {
    ^find $PATH -iname $"*($PATTERN)*" -type f | lines |
    each { echo $it | str ltrim | str find-replace -a "\./" "" | lines |
        each { ls -l $it } | where accessed <= $DURATION | 
        each { echo $"($it.name)|($it.accessed)" | lines }  }
}
