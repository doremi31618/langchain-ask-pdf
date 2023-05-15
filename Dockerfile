FROM python:3.10-slim-buster

# 在容器中建立一個 app 目錄來存放 python 應用程式的程式碼
WORKDIR /app

# 安裝 python 應用程式所需的套件
COPY requirements.txt ./
RUN pip3 install -r requirements.txt

# 把程式碼複製到容器中的 app 目錄
COPY . .

EXPOSE 8080

# 設定 streamlit 應用程式啟動時的指令
CMD [ "streamlit", "run", "app.py"]