#!/bin/bash

# Sanitization script for GitHub config backup
# Removes company-specific references and paths

BACKUP_DIR="/Users/ohadoz/tmp/github_config_backup"

# Function to sanitize a file
sanitize_file() {
    local input_file="$1"
    local output_file="$2"
    
    sed -e 's|/Users/ohadoz|$HOME|g' \
        -e 's|ohadoz@amazon\.co\.uk|user@example.com|g' \
        -e 's|ohadoz|user|g' \
        -e 's|Amazon|<COMPANY>|g' \
        -e 's|amazon|<company>|g' \
        -e 's|Ring|<COMPANY>|g' \
        -e 's|ring|<company>|g' \
        -e 's|RFW|<PROJECT>|g' \
        -e 's|rfw|<project>|g' \
        -e 's|Cocoa|<PROJECT>|g' \
        -e 's|cocoa|<project>|g' \
        -e 's|/Volumes/Cocoa|$PROJECT_ROOT|g' \
        -e 's|JIRA|<ISSUE_TRACKER>|g' \
        -e 's|jira|<issue_tracker>|g' \
        -e 's|issues\.labcollab\.net|<jira_url>|g' \
        -e 's|confluence\.atl\.ring\.com|<confluence_url>|g' \
        -e 's|AmazonQ|<AI_ASSISTANT>|g' \
        -e 's|Kiro|<AI_CLI>|g' \
        -e 's|kiro|<ai_cli>|g' \
        "$input_file" > "$output_file"
}

echo "Sanitization script created"
echo "Use: sanitize_file <input> <output>"
