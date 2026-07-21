from app.config.settings import settings
from app.core.logger import logger


def main():
    logger.info("Starting AI Engineering Template")
    logger.info(f"Environment: {settings.app_env}")


if __name__ == "__main__":
    main()
