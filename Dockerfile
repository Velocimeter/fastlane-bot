FROM python:3.11
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt
RUN python setup.py install
CMD ["python", "main.py","--arb_mode", "multi", "--exchanges", "butter_v3,fusionx_v2,stratum_v2,agni_v3,merchantmoe_v2,cleopatra_v2,carbon_v1,fusionx_v3,velocimeter_v2,cleopatra_v3,fusionx_supernova,puffs_penthouse_v3", "--blockchain", "mantle", "--polling_interval", "3", "--default_min_profit_gas_token", "0.01", "--self_fund", "True", "--flashloan_tokens", "0x78c1b0c915c4faa5fffa6cabf0219da63d7f4cb8"]
