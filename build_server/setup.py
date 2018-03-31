from distutils.core import setup


setup(
    name='self-service-2',
    version='0.1dev',
    packages=['utilities', ],
    long_description=open('README.md').read(),
    requires=['mysql'],
)