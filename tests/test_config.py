from app.config.settings import settings


def test_app_name():
    assert settings.app_name == "AI Engineering Template"


def test_environment():
    assert settings.app_env == "development"
