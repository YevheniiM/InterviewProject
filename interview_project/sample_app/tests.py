from django.test import TestCase

from .models import SampleModel


class SampleAppTestCase(TestCase):
    def test_sample_app(self):
        self.assertEqual('name', 'name')

    def test_sample_app_name(self):
        sample_model = SampleModel(name='name')
        sample_model.save()
        self.assertEqual(sample_model.name, 'name')
