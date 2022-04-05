# peoplenet-deepstream
peoplenet-deepstream は、DeepStream 上で PeopleNet の AIモデル を動作させるマイクロサービスです。  

## 動作環境
- NVIDIA 
    - DeepStream
- PeopleNet
- Docker
- TensorRT Runtime

## 動作手順
### Dockerコンテナの起動
Makefile に記載された以下のコマンドにより、PeopleNet の Dockerコンテナ を起動します。
```
docker-run: 
	docker-compose -f ./deepstream/docker-compose.yaml up -d
```
### ストリーミングの開始
Makefile に記載された以下のコマンドにより、DeepStream 上の PeopleNet でストリーミングを開始します。  
```
stream-start:
	xhost +
	docker exec -it deepstream-peoplenet deepstream-app -c /app/src/deepstream_app_source1_peoplenet.txt
```
## 相互依存関係にあるマイクロサービス  
本マイクロサービスを実行するために PeopleNet の AIモデルを最適化する手順は、[peoplenet-tao-toolkit](https://github.com/latonaio/peoplenet-tao-toolkit)を参照してください。  


## engineファイルについて
engineファイルである peoplenet.engine は、[peoplenet-tao-toolkit](https://github.com/latonaio/peoplenet-tao-toolkit)と共通のファイルであり、当該レポジトリで作成した engineファイルを、本リポジトリで使用しています。  
