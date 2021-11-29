from loguru import logger
import asyncio

sleep_time = 2

async def foo_async():
    logger.info("Starting foo async")
    await asyncio.sleep(1)
    logger.info("Finishing foo async")

async def bar_async():
    logger.info("Starting bar async")
    await asyncio.sleep(3)
    logger.info("Finishing bar async")

async def run_async():
    logger.info("Start async")
    await foo_async()
    await bar_async()

async def run_main_async():
    logger.info("Start main async")
    coros = [
        foo_async(),
        bar_async(),
    ]
    logger.info("Create coros")
    await asyncio.wait({asyncio.create_task(coro) for coro in coros})
    logger.info("Finish main async")


if __name__ == '__main__':
    logger.info("Start main")
    asyncio.run(run_main_async())
