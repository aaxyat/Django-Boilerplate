# Detect the operating system
if [ -n "$BASH_VERSION" ] || [ -n "$ZSH_VERSION" ]; then
    # Unix-like environment (Bash or Zsh)
    echo "Setting up Django project (Unix version)"
    
    # Base URL for raw GitHub content
    BASE_URL="https://raw.githubusercontent.com/aaxyat/Django-Boilerplate/main"
    
    # Function to download a file and check for errors
    download_file() {
        local url="$1"
        local output="$2"
        if ! curl -sSL "$url" -o "$output"; then
            echo "Error: Failed to download $output"
            exit 1
        fi
    }
    
    # Download files
    download_file "$BASE_URL/Makefile" "Makefile"
    download_file "$BASE_URL/.gitignore" ".gitignore"
    download_file "$BASE_URL/.dockerignore" ".dockerignore"
    download_file "$BASE_URL/Dockerfile" "Dockerfile"
    download_file "$BASE_URL/pyproject.toml" "pyproject.toml"
    
    # Create .vscode directory if it doesn't exist
    mkdir -p .vscode || { echo "Error: Failed to create .vscode directory"; exit 1; }
    
    # Download .gitignore to .vscode directory
    download_file "$BASE_URL/.vscode.gitignore" ".vscode/.gitignore"
    
    # Download settings.json to .vscode directory
    download_file "$BASE_URL/.vscode.settings.json" ".vscode/settings.json"
    
    echo "Setup complete!"
elif [[ "$OSTYPE" == "win32" ]] || [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]]; then
    # Windows environment
    echo "Setting up Django project (Windows version)"
    
    # Base URL for raw GitHub content
    $BASE_URL = "https://raw.githubusercontent.com/aaxyat/Django-Boilerplate/main"
    
    # Function to download a file and check for errors
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
    
    # Download files
    Download-File -Url "$BASE_URL/Makefile" -Output "Makefile"
    Download-File -Url "$BASE_URL/.gitignore" -Output ".gitignore"
    Download-File -Url "$BASE_URL/.dockerignore" -Output ".dockerignore"
    Download-File -Url "$BASE_URL/Dockerfile" -Output "Dockerfile"
    Download-File -Url "$BASE_URL/pyproject.toml" -Output "pyproject.toml"
    
    # Create .vscode directory if it doesn't exist
    New-Item -Path .vscode -ItemType Directory -Force | Out-Null
    
    # Download .gitignore to .vscode directory
    Download-File -Url "$BASE_URL/.vscode.gitignore" -Output ".vscode/.gitignore"
    
    # Download settings.json to .vscode directory
    Download-File -Url "$BASE_URL/.vscode.settings.json" -Output ".vscode/settings.json"
    
    Write-Output "Setup complete!"
else
    echo "Unsupported operating system"
    exit 1
fi