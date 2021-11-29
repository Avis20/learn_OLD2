from aiohttp import ClientSession
from dataclasses import dataclass
from loguru import logger
import asyncio

@dataclass
class Service:
    name: str
    url: str
    ip_field: str


SERVICES = [
    Service("ipify", "https://api.ipify.org/?format=json", "ip"),
    Service("myip", "https://api.myip.com/", "ip"),
    Service("ip-api", "http://ip-api.com/json", "query")
]


async def fetch_json(session: ClientSession, url: str) -> dict:
    async with session.get(url) as response:
        return await response.json()


async def fetch_ip(service: Service) -> str:
    logger.info("Fetch ip; service = {}", service.name)
    async with ClientSession() as session:
        result = await fetch_json(session, service.url)
    logger.info("Fetch {}, result {}", service.name, result)
    return result[service.ip_field]

async def get_ip():

    coro = asyncio.wait(
        {
            asyncio.create_task(fetch_ip(service))
            for service in SERVICES
        },
        timeout=4,
        return_when=asyncio.FIRST_COMPLETED,
    )
    done, pending = await coro
    # Отменяем запущенные таски потому что получили первый результат
    # Или не получили вовсе
    for task in pending:
        logger.debug("Cancelling task {}", task)
        task.cancel()

    # Получаем результат с первого выполненного задания
    my_ip = None
    for task in done:
        my_ip = task.result()
        break
    else:
        # Не попали в break
        # Не получили ни отдного ответа
        logger.warning("No results found!")

    logger.info("My ip {}", my_ip)


def run_main():
    logger.info("Starting main")
    asyncio.run(get_ip())

if __name__ == '__main__':
    run_main()

