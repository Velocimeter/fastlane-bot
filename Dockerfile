FROM python:3.11
WORKDIR /app
COPY . .
RUN curl -sSL https://install.python-poetry.org | python3 -
ENV PATH="/root/.local/bin:$PATH"
RUN poetry install
CMD ["poetry", "run", "python", "main.py","--arb_mode", "multi", "--exchanges", "carbon_v1,solidly_v2_forks,uniswap_v2_forks,uniswap_v3_forks", "--blockchain", "coinbase_base", "--polling_interval", "3", "--default_min_profit_gas_token", "0.0003", "--flashloan_tokens", "0x4200000000000000000000000000000000000006,0x833589fCD6eDb6E08f4c7C32D4f71b54bdA02913,0xd9aAEc86B65D86f6A7B5B1b0c42FFA531710b6CA"]
