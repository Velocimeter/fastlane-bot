FROM python:3.9
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
RUN python setup.py install
CMD ["python", "main.py", "--exchanges", "carbon_v1,uniswap_v3,uniswap_v2,sushiswap_v2,pancakeswap_v2,pancakeswap_v3", "--blockchain", "coinbase_base", "--flashloan_tokens", "WETH-0006,USDC-2913", "--default_min_profit_gas_token", "0.001"]
