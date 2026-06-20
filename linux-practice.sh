#!/bin/bash

# ============================================================
# linux_practice.sh
# Written by Prakash Gangurde
# github.com/prakashgangurde-ux/linux-notes
#
# A practice script covering 20 essential Linux commands
# for CS students. Run this to see each command in action.
#
# Usage:
#   chmod +x linux_practice.sh
#   ./linux_practice.sh
# ============================================================

# Colors for better terminal output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Helper function to print section headers
section() {
    echo ""
    echo -e "${BLUE}============================================${NC}"
    echo -e "${BLUE}  $1${NC}"
    echo -e "${BLUE}============================================${NC}"
    echo ""
}

# Helper function to print command being run
run_cmd() {
    echo -e "${YELLOW}$ $1${NC}"
    eval "$1"
    echo ""
}

# Helper function to pause between sections
pause() {
    echo -e "${GREEN}Press Enter to continue...${NC}"
    read -r
}

# ============================================================
# WELCOME
# ============================================================
clear
echo -e "${GREEN}"
echo "  ================================================"
echo "   Linux Commands Practice Script"
echo "   by Prakash Gangurde"
echo "   github.com/prakashgangurde-ux"
echo "  ================================================"
echo -e "${NC}"
echo "  This script demonstrates all 20 Linux commands"
echo "  from the article:"
echo "  '20 Linux Commands Every CS Student Should Know'"
echo ""
echo "  Each command runs with a real example."
echo "  Watch the output and learn what each one does."
echo ""
pause

# ============================================================
# SECTION 1 — NAVIGATION
# ============================================================
section "SECTION 1 — Navigation Commands"

echo "1. pwd — Print Working Directory"
echo "   Shows exactly where you are in the file system."
echo ""
run_cmd "pwd"
pause

echo "2. ls — List Directory Contents"
echo "   Basic listing:"
run_cmd "ls"
echo "   Detailed listing with hidden files:"
run_cmd "ls -la"
pause

echo "3. mkdir — Create a practice directory to work in"
run_cmd "mkdir -p linux_practice/subfolder"
echo "   Directory created. Moving into it..."
run_cmd "cd linux_practice && pwd"
pause

# ============================================================
# SECTION 2 — FILE OPERATIONS
# ============================================================
section "SECTION 2 — File Operations"

# Move into practice directory
cd linux_practice 2>/dev/null || true

echo "4. touch — Create empty files"
run_cmd "touch hello.py notes.txt config.ini backup.py"
echo "   Files created:"
run_cmd "ls -la"
pause

echo "5. cat — Write content to a file and read it"
echo '#!/usr/bin/env python3
# Practice Python file
name = "Prakash"
print(f"Hello from Linux, {name}!")
print("Python + Linux = Power")' > hello.py
echo "   Content written to hello.py"
echo ""
echo "   Reading hello.py with cat:"
run_cmd "cat hello.py"
pause

echo "6. cp — Copy files"
run_cmd "cp hello.py hello_backup.py"
echo "   Files after copying:"
run_cmd "ls -la"
pause

echo "7. mv — Rename a file"
run_cmd "mv notes.txt my_notes.txt"
echo "   Files after renaming:"
run_cmd "ls"
pause

echo "8. Writing to multiple files for search practice..."
echo "# Database config
DB_HOST=localhost
DB_PORT=3306
DB_NAME=myapp
DB_USER=admin
DB_PASSWORD=secret123" > config.ini

echo "# App settings
DEBUG=True
SECRET_KEY=mysecretkey
DATABASE_URL=postgresql://localhost/mydb
ALLOWED_HOSTS=localhost,127.0.0.1" > backup.py

echo "   Done. Practice files ready."
echo ""
run_cmd "ls -la"
pause

# ============================================================
# SECTION 3 — SEARCH AND FIND
# ============================================================
section "SECTION 3 — Search and Find"

echo "9. grep — Search inside files"
echo ""
echo "   Search for 'name' in hello.py:"
run_cmd "grep 'name' hello.py"

echo "   Search for 'config' across all files:"
run_cmd "grep -r 'config' ."

echo "   Search with line numbers:"
run_cmd "grep -n 'print' hello.py"

echo "   Case-insensitive search:"
run_cmd "grep -i 'HOST' config.ini"
pause

echo "10. find — Find files by name"
echo ""
echo "   Find all .py files:"
run_cmd "find . -name '*.py'"

echo "   Find all .txt and .ini files:"
run_cmd "find . -name '*.txt' -o -name '*.ini'"

echo "   Find files containing 'backup' in the name:"
run_cmd "find . -name '*backup*'"
pause

# ============================================================
# SECTION 4 — PERMISSIONS
# ============================================================
section "SECTION 4 — File Permissions"

echo "11. chmod — Change file permissions"
echo ""
echo "   Current permissions on hello.py:"
run_cmd "ls -la hello.py"

echo "   Making hello.py executable:"
run_cmd "chmod +x hello.py"

echo "   Permissions after chmod +x:"
run_cmd "ls -la hello.py"

echo "   Running hello.py directly:"
run_cmd "python3 hello.py"

echo "   Setting permissions to 644 (read/write for owner, read-only for others):"
run_cmd "chmod 644 my_notes.txt"
run_cmd "ls -la my_notes.txt"
pause

# ============================================================
# SECTION 5 — PROCESS MANAGEMENT
# ============================================================
section "SECTION 5 — Process Management"

echo "12. ps aux — View running processes"
echo ""
echo "   Searching for Python processes:"
run_cmd "ps aux | grep python | head -5"

echo "   Searching for bash processes:"
run_cmd "ps aux | grep bash | head -5"
pause

echo "13. history — View command history"
echo ""
echo "   Last 10 commands run:"
run_cmd "history | tail -10"

echo "   Finding all 'grep' commands in history:"
run_cmd "history | grep grep | tail -5"
pause

# ============================================================
# SECTION 6 — NETWORKING
# ============================================================
section "SECTION 6 — Networking Commands"

echo "14. ping — Test network connection"
echo "    Sending 3 packets to google.com..."
echo ""
run_cmd "ping -c 3 google.com"
pause

echo "15. curl — Fetch data from a URL"
echo "    Getting HTTP headers from example.com:"
echo ""
run_cmd "curl -I https://example.com 2>/dev/null | head -10"
pause

# ============================================================
# SECTION 7 — USEFUL COMBINATIONS
# ============================================================
section "SECTION 7 — Powerful Command Combinations"

echo "These combine multiple commands using pipes (|)"
echo ""

echo "16. Count lines in a file:"
run_cmd "cat hello.py | wc -l"

echo "17. Find all Python files and count them:"
run_cmd "find . -name '*.py' | wc -l"

echo "18. Search history for a specific command:"
run_cmd "history | grep 'chmod' | tail -5"

echo "19. List files sorted by size:"
run_cmd "ls -lS"

echo "20. Show disk usage of current directory:"
run_cmd "du -sh ."
pause

# ============================================================
# SECTION 8 — THE CHALLENGE FROM THE ARTICLE
# ============================================================
section "SECTION 8 — The Try It Yourself Challenge"

echo "This is the exact challenge from the article."
echo "Running the full sequence:"
echo ""

cd .. 2>/dev/null || true

echo -e "${YELLOW}$ mkdir linux-challenge${NC}"
mkdir -p linux-challenge
echo -e "${YELLOW}$ cd linux-challenge${NC}"
cd linux-challenge
echo -e "${YELLOW}$ touch hello.py${NC}"
touch hello.py
echo -e "${YELLOW}$ echo \"print('Hello from Linux!')\" > hello.py${NC}"
echo "print('Hello from Linux!')" > hello.py
echo -e "${YELLOW}$ cat hello.py${NC}"
cat hello.py
echo -e "${YELLOW}$ python3 hello.py${NC}"
python3 hello.py
echo -e "${YELLOW}$ ls -la${NC}"
ls -la
cd ..
echo -e "${YELLOW}$ rm -r linux-challenge${NC}"
rm -r linux-challenge
echo ""
echo -e "${GREEN}Challenge complete!${NC}"
pause

# ============================================================
# CLEANUP
# ============================================================
section "Cleanup — Removing practice files"

echo "Removing the linux_practice directory we created..."
cd ..
run_cmd "rm -r linux_practice"
echo -e "${GREEN}All practice files removed.${NC}"
echo ""

# ============================================================
# SUMMARY
# ============================================================
section "Summary — Commands You Just Practiced"

echo "  Navigation:       pwd, ls, mkdir, cd, clear"
echo "  File operations:  touch, cat, cp, mv, rm"
echo "  Search:           grep, find"
echo "  Permissions:      chmod"
echo "  Processes:        ps aux, history"
echo "  Networking:       ping, curl"
echo "  Combinations:     wc, du, pipes (|)"
echo ""
echo -e "${GREEN}  You just ran 20+ Linux commands in one session.${NC}"
echo -e "${GREEN}  Practice these daily and they will become second nature.${NC}"
echo ""
echo "  ================================================"
echo "   Written by Prakash Gangurde"
echo "   Read the full article on Medium:"
echo "   medium.com/@gangurdeprakash"
echo ""
echo "   GitHub: github.com/prakashgangurde-ux"
echo "   LinkedIn: linkedin.com/in/prakash-gangurde"
echo "  ================================================"
echo ""
