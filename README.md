# peoplenet-on-deepstream
peoplenet-on-deepstream は、DeepStream 上で PeopleNet の AIモデル を動作させるマイクロサービスです。  

## 動作環境
- NVIDIA 
    - DeepStream
- PeopleNet
- Docker
- TensorRT Runtime

## PeopleNetについて
PeopleNet は、画像内の人を検出し、カテゴリラベルを返すAIモデルです。  
PeopleNet は、特徴抽出にResNet34を使用しており、混雑した場所でも正確に物体検出を行うことができます。

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
本マイクロサービスを実行するために PeopleNet の AIモデルを最適化する手順は、[peoplenet-on-tao-toolkit](https://github.com/latonaio/peoplenet-on-tao-toolkit)を参照してください。  


## engineファイルについて
engineファイルである peoplenet.engine は、[peoplenet-on-tao-toolkit](https://github.com/latonaio/peoplenet-on-tao-toolkit)と共通のファイルであり、当該レポジトリで作成した engineファイルを、本リポジトリで使用しています。

## 演算について
本レポジトリでは、ニューラルネットワークのモデルにおいて、演算スループット効率を高めるため、FP16(半精度浮動小数点)を使用しています。    
