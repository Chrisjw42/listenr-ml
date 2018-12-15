# Pull the miniconda container to allow conda usage
FROM continuumio/miniconda3

RUN conda create -n env python=3.6,7

# Ensure the environment is activated every time the VM starts
RUN echo "source activate env" > ~/.bashrc

# Add conda to path var
ENV PATH /opt/conda/envs/env/bin:$PATH

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN conda install -file requirements-mini.txt --yes

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python", "app.py"]
