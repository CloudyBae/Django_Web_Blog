from django.db import models
from django.contrib.auth.models import User
from PIL import Image
from django.core.files.base import ContentFile
from io import BytesIO

class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    image = models.ImageField(default='default.jpg', upload_to='profile_pics')

    def __str__(self):
        return f'{self.user.username} Profile'

    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)

        img = Image.open(self.image)
        output_size = (300, 300)
        
        img.thumbnail(output_size)
        thumb_io = BytesIO()
        img.save(thumb_io, img.format)
        file_name = self.image.name
        self.image.save(file_name,ContentFile(thumb_io.getvalue()),save=False)
        super().save(*args, **kwargs)        