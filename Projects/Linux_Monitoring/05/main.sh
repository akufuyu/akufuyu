#!bin/bash

if [[ -d "$1" ]]; then

    start=$(date +%s)
    total_folders=$(find "$1" -type d | wc -l)
    top_folder=$(du -h --max-depth=1 "$1" | sort -hr | head -n 5 | nl)
    top_mas_files=$(find "$1" -type f | wc -l)
    num_conf_files=$(find "$1" -type f -name "*.conf" | wc -l)
    num_text_files=$(find "$1" -type f -name "*.txt" | wc -l)
    num_exec_files=$(find "$1" -type f -executable | wc -l)
    num_log_files=$(find "$1" -type f -name "*.log" | wc -l)
    num_archive_files=$(find "$1" -type f -name "*.zip" -o -name "*.tar" | wc -l)
    num_symlink_files=$(find "$1" -type l | wc -l)
    top_files=$(find "$1" -type f -exec du -h {} + | sort -hr | head -n 10 | nl)
    top_exec_files=$(find "$1" -type f -executable -exec du -h {} + | sort -k 5 -hr | head -n 10 | awk '{print $0; system("md5sum " $2)}' | cut -d ' ' -f1 | nl)    end=$(date +%s)
    runtime=$((end-start))
    
    echo "Total number of folders (including all nested ones) = $total_folders"  
    echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
    echo "$top_folder"
    # echo 1 - /var/log/one/, $(top_mas_files) GB  
    # echo 2 - /var/log/two/, $(num_conf_files) MB  
    echo "Total number of files = $top_mas_files"
    echo Number of:
    echo "Configuration files (with the .conf extension) = $num_conf_files"
    echo "Text files = $num_text_files"
    echo "Executable files = $num_exec_files"
    echo "Log files (with the extension .log) = $num_log_files"
    echo "Archive files = $num_archive_files"
    echo "Symbolic links = $num_symlink_files"
    echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
    echo "$top_files"
    echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
    echo "$top_exec_files"
    echo "Script execution time (in seconds) = $runtime"
else
    echo "Incorrect input."
    
fi

