from setuptools import find_packages, setup

# Read the README.md file for the long_description
with open("README.md", "r") as f:
    long_description = f.read()

# Read the requirements.txt file
with open("requirements.txt", "r") as f:
    requirements = f.read().splitlines()

setup(
    name='energy_carbon_footprint_analysis',
    version='0.1.0',
    packages=find_packages(),
    description='Project for Energy and Carbon Footprint Analysis',
    long_description=long_description,
    long_description_content_type="text/markdown",
    author='JuanRFernandez',
    author_email='roferbru@gmail.com',
    url="https://github.com/JuanRFernandez/Energy-Carbon-Emissions-Analysis.git",
    license='MIT',
    install_requires=requirements,
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    python_requires='>=3.6',
)

