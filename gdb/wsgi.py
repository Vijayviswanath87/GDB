"""
WSGI config for mct_loan_lock project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/2.1/howto/deployment/wsgi/
"""

# import os
# import sys
# from django.core.wsgi import get_wsgi_application



# # application = get_wsgi_application()
# path = '/var/www/html'
# if path not in sys.path:
#         sys.path.append(path)

# os.environ['DJANGO_SETTINGS_MODULE'] = 'gdb.settings'

# # then:

# from django.core.wsgi import get_wsgi_application
# application = get_wsgi_application()


import os

from django.core.wsgi import get_wsgi_application

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'gdb.settings')

application = get_wsgi_application()