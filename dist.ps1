$VERSION = "1.0.0"

# Recreate dist directory
Remove-Item -Force -Recurse -Path dist -ErrorAction Ignore
New-Item -ItemType Directory -Force -Path dist

# Generate Windows binary
$Env:GOOS = "windows"; $Env:GOARCH = "amd64"
go generate
garble build

# Zip Windows binary
tar.exe -acf "dist/QOLE-Patcher-$VERSION-Windows.zip" QOLE-Patcher.exe data/xdelta3.exe

# Generate Mac binary
$Env:GOOS = "darwin"; $Env:GOARCH = "amd64"
go build

# Zip Mac binary
tar.exe -acf "dist/QOLE-Patcher-$VERSION-Mac.zip" QOLE-Patcher

# Generate Linux binary
$Env:GOOS = "linux"; $Env:GOARCH = "amd64"
go build

# Zip Linux binary
tar.exe -acf "dist/QOLE-Patcher-$VERSION-Linux.zip" QOLE-Patcher
