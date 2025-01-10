powershell -NoProfile -ExecutionPolicy Bypass -Command "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))"

# Define the variable you want to add
$newPath = "C:\ProgramData\chocolatey"

# Get the current PATH variable
$currentPath = [System.Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::Machine)

# Check if the new path is already in the PATH
if ($currentPath -notmatch [regex]::Escape($newPath)) {
    # Append the new path to the PATH variable
    $updatedPath = "$currentPath;$newPath"

    # Set the updated PATH variable
    [System.Environment]::SetEnvironmentVariable("Path", $updatedPath, [System.EnvironmentVariableTarget]::Machine)

    Write-Output "The new path was successfully added to the system PATH."
} else {
    Write-Output "The specified path is already in the system PATH."
}

choco --version
choco install mingw -y

#precompile binaries
g++ -std=c++17 -x c++-header C:\ProgramData\mingw64\mingw64\lib\gcc\x86_64-w64-mingw32\13.2.0\include\c++\x86_64-w64-mingw32\bits\stdc++.h
pause