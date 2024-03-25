FROM python:3.11
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
RUN python setup.py install
CMD ["python", "main.py","--arb_mode", "multi", "--exchanges", "carbon_v1,solidly_v2_forks,uniswap_v2_forks,uniswap_v3_forks", "--blockchain", "coinbase_base", "--polling_interval", "3", "--default_min_profit_gas_token", "0.0003", "--flashloan_tokens", "0x4200000000000000000000000000000000000006,0x833589fCD6eDb6E08f4c7C32D4f71b54bdA02913,0x50c5725949A6F0c72E6C4a641F24049A917DB0Cb,0x2Ae3F1Ec7F1F5012CFEab0185bfc7aa3cf0DEc22,0xd9aAEc86B65D86f6A7B5B1b0c42FFA531710b6CA,0xEB466342C4d449BC9f53A865D5Cb90586f405215"]
