# Use an official Python runtime as a parent image
FROM quay.io/jupyter/pyspark-notebook

USER root

# Set the working directory in the container
WORKDIR /final

# Install Jupyter Notebook and scikit-learn
# RUN pip3 install jupyter scikit-learn pandas seaborn numpy matplotlib imblearn plotly --user#
RUN pip3 install datasets librosa soundfile --user
RUN pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118 --user


# Expose the port for Jupyter Notebook
EXPOSE 8888

# Start Jupyter Notebook when the container launches
CMD ["jupyter", "notebook", "--ip='*'", "--port=8888", "--no-browser", "--allow-root", "--notebook-dir=/final"]
