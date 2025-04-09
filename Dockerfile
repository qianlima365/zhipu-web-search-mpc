FROM python:3.12.0

WORKDIR /app

COPY . .

# 安装uv和poetry
# 如果是中国大陆用户，可以设置国内源
# RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip install --no-cache-dir uv \
    && pip install --no-cache-dir poetry \
    && uv venv
    && source .venv/Scripts/activate  && poetry install  --no-root

CMD ["uv", "run", "web_search.py"]