# This script sets up a Django project by downloading necessary files from a remote repository.
# The script supports both Windows PowerShell and Bash environments.

# If the script is running in Windows PowerShell:
# - The script defines a function `Download-File` to download files from a given URL.
# - The script downloads the following files from the remote repository:
#   - Makefile
#   - .gitignore
#   - .dockerignore
#   - Dockerfile
#   - pyproject.toml
# - The script creates a `.vscode` directory and downloads the following files inside it:
#   - .gitignore
#   - settings.json
# - Finally, the script outputs "Setup complete!".

# If the script is running in Bash:
# - The script defines a function `download_file` to download files from a given URL.
# - The script downloads the same set of files as in the PowerShell version.
# - The script creates a `.vscode` directory and downloads the same set of files inside it.
# - Finally, the script outputs "Setup complete!".

# If the script is running in an unsupported shell environment, it outputs "Unsupported shell environment" and exits with code 1.

if ($PSVersionTable) {
    Write-Output "Setting up Django project (Windows PowerShell version)"
    
    $BASE_URL = "https://raw.githubusercontent.com/aaxyat/Django-Boilerplate/main"
    
    function Download-File {
        param (
            [string]$Url,
            [string]$Output
        )
        try {
            Invoke-WebRequest -Uri $Url -OutFile $Output -ErrorAction Stop
        }
        catch {
            Write-Error "Failed to download $Output"
            exit 1
        }
    }
    
    Download-File -Url "$BASE_URL/Makefile" -Output "Makefile"
    Download-File -Url "$BASE_URL/.gitignore" -Output ".gitignore"
    Download-File -Url "$BASE_URL/.dockerignore" -Output ".dockerignore"
    Download-File -Url "$BASE_URL/Dockerfile" -Output "Dockerfile"
    Download-File -Url "$BASE_URL/pyproject.toml" -Output "pyproject.toml"
    
    New-Item -Path .vscode -ItemType Directory -Force | Out-Null
    
    Download-File -Url "$BASE_URL/.vscode.gitignore" -Output ".vscode/.gitignore"
    Download-File -Url "$BASE_URL/.vscode.settings.json" -Output ".vscode/settings.json"
    
    Write-Output "Setup complete!"
}
elif [ -n "$BASH_VERSION" ]; then
    echo "Setting up Django project (Bash version)"
    
    BASE_URL="https://raw.githubusercontent.com/aaxyat/Django-Boilerplate/main"
    
    download_file() {
        if ! curl -sSL "$1" -o "$2"; then
            echo "Error: Failed to download $2"
            exit 1
        fi
    }
    
    download_file "$BASE_URL/Makefile" "Makefile"
    download_file "$BASE_URL/.gitignore" ".gitignore"
    download_file "$BASE_URL/.dockerignore" ".dockerignore"
    download_file "$BASE_URL/Dockerfile" "Dockerfile"
    download_file "$BASE_URL/pyproject.toml" "pyproject.toml"
    
    mkdir -p .vscode || { echo "Error: Failed to create .vscode directory"; exit 1; }
    
    download_file "$BASE_URL/.vscode.gitignore" ".vscode/.gitignore"
    download_file "$BASE_URL/.vscode.settings.json" ".vscode/settings.json"
    
    echo "Setup complete!"
else
    echo "Unsupported shell environment"
    exit 1
fi