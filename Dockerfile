FROM python:slim as build

RUN apt update; \
apt install -y libczmq-dev sbcl curl gcc; \
pip install jupyterlab;

RUN curl -O https://beta.quicklisp.org/quicklisp.lisp; \
sbcl --load quicklisp.lisp --eval "(quicklisp-quickstart:install)" --eval "(quit)"; \
rm quicklisp.lisp

COPY sbclrc /root/.sbclrc

RUN sbcl --eval "(ql:quickload :common-lisp-jupyter)" --eval "(cl-jupyter:install-image)" --eval "(exit)"

FROM build

WORKDIR /workspace

EXPOSE 8888

CMD [ "jupyter", "lab", "--ip=0.0.0.0", "--allow-root" ]