# Use TensorFlow GPU Jupyter Notebook base image
FROM quay.io/jupyter/tensorflow-notebook:cuda-latest

# Switch to root user to install dependencies
USER root

# Update and install necessary dependencies
# Retry mechanism to handle network issues
RUN apt-get update && \
    apt-get install -y \
    libglu1-mesa libxft2 libxrender1 libxinerama1 p7zip-full gnupg sudo && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* 

# Switch back to the default user (jovyan)
USER jovyan

# Expose the default Jupyter port
EXPOSE 8888

# Set the command to start Jupyter Lab
CMD ["start-notebook.sh"]
