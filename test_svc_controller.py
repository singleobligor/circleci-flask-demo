import unittest
from controller.svc_controller import app, wrap_html

class TestSVCController(unittest.TestCase):

    def setUp(self):
        self.app = app.test_client()
        self.app.testing = True

    def test_status_code(self):
        response = self.app.get('/')
        self.assertEqual(response.status_code, 200)
    
    def test_message(self):
        response = self.app.get('/')
        message = wrap_html('Hello DockerCon 2020!')
        self.assertEqual(response.data.decode("utf-8"), message)

if __name__ == '__main__':
    unittest.main()