$driverName = Read-Host "Enter the driver name"
$location = Read-Host "Enter the location (leave blank to use current location)"

if ([string]::IsNullOrEmpty($location)) {
    $location = Get-Location
}

# Scaffold file structure
$folderPath = Join-Path $location $driverName
New-Item -ItemType Directory -Path $folderPath
New-Item -ItemType Directory -Path (Join-Path $folderPath "static")
New-Item -ItemType Directory -Path (Join-Path $folderPath "static\js")
New-Item -ItemType Directory -Path (Join-Path $folderPath "static\css")
New-Item -ItemType Directory -Path (Join-Path $folderPath "static\img")
New-Item -ItemType Directory -Path (Join-Path $folderPath "templates")
New-Item -ItemType Directory -Path (Join-Path $folderPath "controllers")
New-Item -ItemType Directory -Path (Join-Path $folderPath "models")
New-Item -ItemType Directory -Path (Join-Path $folderPath "views")

# Scaffold files
$readme = Join-Path $folderPath "readme.md"
New-Item -ItemType File -Path $readme

$appPy = Join-Path $folderPath "app.py"
$starterCode = @"
from flask import Flask

app = Flask(__name__)

@app.route('/')
def index():
    return {"Success":"You can start developing your alfie driver"}

if __name__ == '__main__':
    app.run(debug=True)
"@
Set-Content $appPy $starterCode
