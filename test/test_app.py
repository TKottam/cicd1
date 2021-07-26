from app import FUN_root
from flask.ext.testing import TestCase


class MyTest(TestCase):

    def create_app(self):
        return app

    def test_greeting(self):
        self.app.get('/')
        self.assert_template_used('index.html')