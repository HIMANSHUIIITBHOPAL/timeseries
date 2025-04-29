FROM python:3.10-slim

# Install dependencies
RUN pip install --no-cache-dir jupyter pandas numpy matplotlib

# Set working directory
WORKDIR /app

# Copy notebook
COPY raml.ipynb .
COPY TimeSeries_TotalSolarGen_and_Load_IT_2016.csv   TimeSeries_TotalSolarGen_and_Load_IT_2016.csv

# Expose Jupyter port
EXPOSE 8888

# Start Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]
