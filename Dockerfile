FROM jupyter/minimal-notebook

ENV IBM_API a1b61ba9f8021dde0c3f94e59657486e5f552d2ccb1cfd59bd804713218dc14d323c631aed22b14a89b0913b841594b9344ece860480c1c00dfce5f2e4d57857
COPY requirements.txt /tmp/
RUN pip install --requirement /tmp/requirements.txt && \
  fix-permissions $CONDA_DIR && \
  fix-permissions /home/$NB_USER