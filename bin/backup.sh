#!/usr/bin/env bash

set -euf -o pipefail

function print_help() {
    echo "backup <TARGETS|help>"
    echo 
    echo "where TARGETS:"
    printf "\tall:\tall targets\n"
    printf "\tremote:\tall remote targets\n"
    printf "\tlocal:\tall local targets\n"
}

BACKUP_FILE="BACKUP.tar.gz"
BACKUP_FILES=(.bash_logout .bash_profile .bashrc bin .config Documents .gitignore .gnupg .local .mozilla .password-store .pki .PortfolioPerformance .ssh .tmux .tmuxinator .weechat projects/own/dotfiles)

if [[ "$#" -ne 1 ]]; then
    print_help
    exit 1
fi

case "$1" in
    'local' )
        TARGETS=(/mnt/ext/backups)
        ;;
    'remote' )
        TARGETS=(maexBox:~/backups pi:~/backups)
        ;;
    'all' )
        TARGETS=(/mnt/ext/backups maexBox:~/backups pi:~/backups)
        ;;
    'help' )
        print_help
        exit 0
        ;;
    * )
        print_help
        exit 1
        ;;
esac

function create_backup() {
    echo "Pack and compress the archive ..."
    # tar czvf "$HOME/$BACKUP_FILE" "${BACKUP_FILES[@]}" || true
    tar --create \
        --verbose \
        --gzip \
        --ignore-case \
        --exclude .config/Slack/Cache \
        --exclude .config/GIMP/2.10/backups \
        --exclude .local/share/nvim \
        --exclude .tmux \
        --exclude .config/yarn \
        --exclude .local/lib/python* \
        --exclude .local/include/python* \
        --exclude .config/gcloud/logs \
        --exclude .weechat/logs \
        --exclude dotfiles/.git/* \
        --exclude dotfiles/.modules \
        --exclude '*cache*' \
        --exclude '.config/Code - OSS' \
        --file "$HOME/$BACKUP_FILE" "${BACKUP_FILES[@]}" || true
    echo "Finished packing and compressing the archive"
}

function backup_old_backups() {
    echo "Backup old backups ..."
    for TARGET in "${TARGETS[@]}"; do
        if [[ "$TARGET" == /mnt/* ]]; then
            mv_files "$TARGET" false
        else
            mv_files "$TARGET" true
        fi
    done
    echo "Finished backing up old backups"
}

function mv_files() {
    local target="$1"
    local ssh=$2

    if $ssh; then
        local server
        local server_path
        server=$(echo "$target" | cut -d: -f1)
        server_path=$(echo "$target" | cut -d: -f2)

        ssh "$server" "test ! -e $server_path/$BACKUP_FILE.3 || rm $server_path/$BACKUP_FILE.3"
        ssh "$server" "test ! -e $server_path/$BACKUP_FILE.2 || mv $server_path/$BACKUP_FILE.2 $server_path/$BACKUP_FILE.3"
        ssh "$server" "test ! -e $server_path/$BACKUP_FILE.1 || mv $server_path/$BACKUP_FILE.1 $server_path/$BACKUP_FILE.2"
        ssh "$server" "test ! -e $server_path/$BACKUP_FILE || mv $server_path/$BACKUP_FILE $server_path/$BACKUP_FILE.1"
    else
        if [[ -e "$TARGET/$BACKUP_FILE.3" ]]; then
            rm "$TARGET/$BACKUP_FILE.3"
        fi

        if [[ -e "$TARGET/$BACKUP_FILE.2" ]]; then
            mv "$TARGET/$BACKUP_FILE.2" "$TARGET/$BACKUP_FILE.3"
        fi

        if [[ -e "$TARGET/$BACKUP_FILE.1" ]]; then
            mv "$TARGET/$BACKUP_FILE.1" "$TARGET/$BACKUP_FILE.2"
        fi


        if [[ -e "$TARGET/$BACKUP_FILE" ]]; then
            mv "$TARGET/$BACKUP_FILE" "$TARGET/$BACKUP_FILE.1"
        fi
    fi
}

function transfer() {
    echo "Transfer the backup to the targets ..."
    for TARGET in "${TARGETS[@]}"; do
        transfer_single "$BACKUP_FILE" "$TARGET"
    done
    echo "Finished to transfer the backup to the targets"
}

function transfer_single() {
    local source="$1"
    local target="$2"

    echo "Transfer to: $target ..."
    rsync -vz --info=progress2 "$source" "$target"
    echo "Finished transfering to: $target"
}

function cleanup() {
    echo "Clean up ..."
    rm "$HOME/$BACKUP_FILE"
    echo "Finished cleaning up"
}

function main() {
    echo "Starting with the backup ..."

    cd "$HOME"
    create_backup
    backup_old_backups
    transfer
    cleanup

    echo "Finished with the backup"
    echo "Have a nice day. :)"
}

main
