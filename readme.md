# Lisplab Docker image

A docker image that adds a lisp kernel to Jupyter.

1. Clone the repository
- git clone https://github.com/dennisdunn/lisplab.git
2. Change directory
- cd lisplab
3. Build and run the container
- docker build -t lisplab .
- docker run -p 8888:8888 lisplab
4. Browse to
- http://localhost:8888/lab
