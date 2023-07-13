# Use an official Python runtime as a parent image
FROM continuumio/miniconda3

# Set the working directory in the container to /app
WORKDIR /app

# Add the current directory contents into the container at /app
ADD . /app

RUN apt-get update && apt-get install -y libarchive-dev

# Install mamba
RUN conda install -c conda-forge mamba

# Create the environment:
COPY environment.yml .

# Update conda, install mamba
RUN conda update -n base -c defaults conda && \
    conda install mamba -c conda-forge

# Create the environment:
RUN mamba env create -f environment.yml

# Make sure the environment is activated:
SHELL ["conda", "run", "-n", "energy_carbon_footprint_env", "/bin/bash", "-c"]

# ENTRYPOINT ["conda", "run", "--no-capture-output", "-n", "energy_carbon_footprint_env", "python"] ## I dont have a main Python script, the Python script would be application-specific.

# This Dockerfile starts with a base image (continuumio/miniconda3) that contains a minimal installation of Python and conda. 
# It sets /app as the working directory in the Docker image, and copies the contents of your project directory into the Docker image. 
# It then creates a conda environment using your environment.yml file.
# Finally, it sets the SHELL to use conda run. This ensures that all subsequent commands will be run in your conda environment.

# RODRI PRESTA ATENCION ACA:
# PASO 1: docker build -t <image-name> .
# PASO 2: docker run -it <image-name>
# PASO 3: Remote Explorer: Focus on Dev Containers View




# Build a new Docker image:
# docker build -t ev_charging_env .



# To run the container in the powershell:
# --> docker run -it --rm ev_charging_env /bin/bash