# plumbdocker

Steps to run

```
git clone --recurse-submovules  https://github.com/actuarialvoodoo/plumbdocker.git
cd plumbdocker
docker build -t plumbdocker-poc .
docker run --rm -p 8000:8000 plumbdocker-poc
```
