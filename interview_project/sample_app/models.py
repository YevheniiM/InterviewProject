from django.db import models


class SampleModel(models.Model):
    name = models.CharField(max_length=255, default="default")
