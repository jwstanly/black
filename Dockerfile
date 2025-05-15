FROM python:3.12-slim
RUN apt-get update && \
    apt-et install -y --no-install-recommends git && \
    rm -rf /var/lib/apt/lists/*
ENV PYTHONDONTWRITEBYTECODE=1 PIP_NO_CACHE_DIR=1
WORKDIR /app

COPY pyproject.toml test_requirements.txt ./
RUN pip install --upgrade pip \
 && pip install -r test_requirements.txt           # runtime + test deps

COPY . .

RUN pip install -e ".[d]"

CMD ["pytest", "-q"]
                      