from setuptools import setup

setup(
   name='aserver',
   version='1.0',
   description='A useful module',
   author='Man Foo',
   author_email='foomail@foo.com',
   packages=['aserver'],  #same as name
   install_requires=['Flask'],
)

