import asyncio
from .lambdas.sum_of_squares_for_error import async_main

def main():
    return asyncio.run(async_main())
