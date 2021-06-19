windows:	
	go generate 
	go build -o build\\QOLE-Patcher.exe qole_patcher.go 

linux:
	go generate
	go build -o ./build/QOLE-Patcher qole_patcher.go 

mac:
	go generate
	go build -o ./build/QOLE-Patcher qole_patcher.go 

get:
	go get github.com/cheggaaa/pb/v3
	go get github.com/josephspurrier/goversioninfo/cmd/goversioninfo

clean:
	rm -rf ./build