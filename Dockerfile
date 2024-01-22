FROM python:3.11
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
RUN python setup.py install
CMD ["python", "main.py","--arb_mode", "multi", "--exchanges", "carbon_v1,solidly_v2_forks,uniswap_v2_forks,uniswap_v3_forks,sushiswap_v2,pancakeswap_v2,pancakeswap_v3", "--blockchain", "coinbase_base", "--polling_interval", "3", "--default_min_profit_gas_token", "0.00001"]
