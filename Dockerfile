FROM python:3.10-slim

WORKDIR /app

RUN apt-get update && apt-get install -y \
    build-essential \
    curl \
    software-properties-common \
    git \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/doremi31618/langchain-ask-pdf.git

# 把程式碼複製到容器中的 app 目錄
COPY . .

# 安裝相關函式庫
RUN pip3 install -r requirements.txt

# 對外開放8080
EXPOSE 8080


# 設定 streamlit 應用程式啟動時的指令
CMD [ "streamlit", "run", "app.py", "--server.port=8080", "--server.enableCORS", "false",  "--server.enableXsrfProtection", "false"]