# project title


# Development environment
You will need to install python at least version `3.10` amd `python3.10-venv`.

**Steps**:
1. Clone the repository
2. Create virtual environment 
   ```bash
   python3.10 -m venv venv
   ```
3. Activate virtual environment 
   ```bash
   source venv/bin/activate
   ```
4. Install dependencies and dev dependencies
   ```bash
   pip install -r requirements.txt -r requirements-dev.txt
   ```
5. Now try to run tests:
   ```bash
   cd YOUR_PROJECT_DIRECTORY/ && pytest
   ```
## Running development server
To run development server start uvicorn with map to `main.py`.

First remember to activate virtual environment and run alembic migrations:
```bash
$ source venv/bin/activate
$ cd project/
$ alembic upgrade head
```
Then run uvicorn in [project](project/) directory:
```bash
uvicorn project.main:app --reload
```
# Production environment
Our production environment is based on docker. If you want to run project service locally you will need to install `docker`.

After installing first build docker image:
```bash
./build.docker.sh
```
Then run docker container:
```bash
docker run --rm -it -p 8000:8000 mcn-project-service:latest
```

# How to Contribute to the Project
If you want to contribute to the project, please read the [CONTRIBUTING.md](CONTRIBUTING.md) file.

# License
[MIT](LICENSE)
