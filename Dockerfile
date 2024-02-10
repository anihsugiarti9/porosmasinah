FROM jupyter/base-notebook:python-3.11

# Copy the requirements.txt file to the container
COPY requirements.txt /app/requirements.txt

# Install the dependencies from the requirements.txt file
RUN pip install -r /app/requirements.txt
RUN apt-get wget
RUN apt-get curl

# Set working directory
WORKDIR /app

# Expose Jupyter Notebook port
EXPOSE 8888

# Copy the notebooks directory to the container's /app directory
COPY notebooks /app/notebooks

# Run Jupyter Notebook on container startup
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
