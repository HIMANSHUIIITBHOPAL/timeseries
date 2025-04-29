FROM python:3.10-slim

# Install all required Python packages
RUN pip install --no-cache-dir \
    jupyter \
    pandas \
    numpy \
    matplotlib \
    statsmodels \
    scikit-learn

# Set working directory
WORKDIR /app

# Copy notebook and CSV into the container
COPY raml.ipynb .
COPY TimeSeries_TotalSolarGen_and_Load_IT_2016.csv .

# Expose Jupyter port
EXPOSE 8888

# Run Jupyter notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]
