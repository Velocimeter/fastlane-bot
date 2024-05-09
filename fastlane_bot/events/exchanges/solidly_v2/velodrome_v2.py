from dataclasses import dataclass
from typing import Tuple

from web3.contract import AsyncContract

from fastlane_bot.config.multicaller import MultiCaller
from fastlane_bot.data.abi import SOLIDLY_V2_FACTORY_ABI
from .base import SolidlyV2


@dataclass
class VelodromeV2(SolidlyV2):
    @property
    def get_factory_abi(self):
        return SOLIDLY_V2_FACTORY_ABI

    async def get_fee(self, address: str, contract: AsyncContract) -> Tuple[str, float]:
        fee = await self.factory_contract.caller.getFee(address, await contract.caller.stable())
        fee_float = float(fee) / 10 ** 4
        return str(fee_float), fee_float

    def get_pool_with_multicall(self, mc: MultiCaller, addr1, addr2):
        mc.add_call(self.sync_factory_contract.functions.getPool, addr1, addr2, True)
