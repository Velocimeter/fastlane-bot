FROM python:3.11
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
RUN python setup.py install
CMD ["python", "main.py","--arb_mode", "multi", "--exchanges", "sushiswap_v3,carbon_v1,knightswap_v2,equalizer_v2,hyperjump_v2,spookyswap_v2,velocimeter_v2,fraxswap_v2,wigoswap_v2,soulswap_v2,sushiswap_v2", "--blockchain", "fantom", "--polling_interval", "3", "--default_min_profit_gas_token", "0.0005", "--alchemy_max_block_fetch", "1000", "--flashloan_tokens", "0x21be370D5312f44cB42ce377BC9b8a0cEF1A4C83,0x28a92dde19D9989F39A49905d7C9C2FAc7799bDf,0x1B6382DBDEa11d97f24495C9A90b7c88469134a4"]