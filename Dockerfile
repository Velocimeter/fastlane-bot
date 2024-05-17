FROM python:3.11
WORKDIR /app
COPY . .
RUN curl -sSL https://install.python-poetry.org | python3 -
ENV PATH="/root/.local/bin:$PATH"
RUN poetry install
CMD ["poetry", "run", "python", "main.py","--arb_mode", "multi", "--exchanges", "agni_v3,merchantmoe_v2,butter_v3,stratum_v2,cleopatra_v3,fusionx_v2,fusionx_supernova,cleopatra_v2,velocimeter_v2,carbon_v1,fusionx_v3,puffs_penthouse_v3", "--blockchain", "mantle", "--polling_interval", "0", "--default_min_profit_gas_token", "0.00001", "--self_fund", "True", "--flashloan_tokens", "0xdEAddEaDdeadDEadDEADDEAddEADDEAddead1111,0x78c1b0C915c4FAA5FffA6CAbf0219DA63d7f4cb8", "--read_only", "True", "--backdate_pools", "False",  "--alchemy_max_block_fetch","1000", "--reorg_delay", "0", "--run_data_validator", "False", "--randomizer", "2"]