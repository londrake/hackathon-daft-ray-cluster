# Ray Cluster with Monitoring and Jupyter [Daft]

This project implements a distributed Ray cluster with integrated monitoring using Prometheus and Grafana, plus a Jupyter environment for interactive analysis. Daft data engine is provided with this stack

## 🏗️ Architecture

The project consists of:
- **Ray Head Node**: Main cluster node
- **Ray Worker Nodes**: Worker nodes for distributed processing
- **Prometheus**: Monitoring system for metrics collection
- **Grafana**: Visualization platform for metrics
- **Jupyter Lab**: Interactive environment for data science

# Ray Cluster Introduction
A simple example to create a Ray cluster using a custom docker image and a docker compose to configure the (local) cluster.

For more information on Ray:
* https://www.ray.io/
* https://github.com/ray-project/ray

# Daft Introduction
Daft is a unified data engine for data engineering, analytics and ML/AI.

Daft exposes both SQL and Python DataFrame interfaces as first-class citizens and is written in Rust.

Daft provides a snappy and delightful local interactive experience, but also seamlessly scales to petabyte-scale distributed workloads.

For more information on Daft:
* https://www.getdaft.io/projects/docs/en/stable/index.html

## 📚 Technology Stack

### Main Python Libraries
- **Ray (2.4.0)**: Framework for distributed computing
- **NumPy**: Numerical computing and multidimensional arrays
- **Pandas**: Data manipulation and analysis
- **Jupyter**: Interactive development environment
- **Matplotlib**: Data visualization

### Monitoring Tools
- **Prometheus**: Metrics collection
- **Grafana**: Metrics visualization

## 🚀 Quick Start

### Prerequisites
- Docker
- Docker Compose
- Git

### Installation

1. Clone the repository:

```
bash
git clone https://github.com/londrake/hackathon-daft-ray-cluster.git
cd hackathon-daft-ray-cluster
```

2. Build the services:

```
bash
#Create the volume
docker volume create grafana-data

# Build the imagaes
docker compose build
```

3. Start the cluster:

```
bash
docker compose up -d
```

## 📊 Service Access

- **Ray Dashboard**: http://localhost:8265
- **Grafana**: http://localhost:3001
- **Prometheus**: http://localhost:9090
- **Jupyter Lab**: http://localhost:8888

## 🔬 Using Jupyter

### Accessing Jupyter Lab
1. Open your browser and go to http://localhost:8888
2. [Optional]Use the token shown in the container logs:

```
bash
docker-compose logs jupyter
```

### Example Notebooks
The project includes sample notebooks for:
- Initial Ray cluster setup
- Distributed computation examples
- Resource monitoring

### Best Practices
- Use `ray.init(address='ray://ray-head:10001')` at the beginning of each notebook
- Monitor resources through the Ray Dashboard
- Save notebooks in the `/work` directory

## 🎯 Grafana Dashboard Setup

### Importing Dashboards

1. Access Grafana at http://localhost:3001
2. Navigate to Dashboards > Import
3. You can import dashboards:

- Locate the dashboard JSON files from `/docker/grafana/dashboards/`
- In Grafana, click "Upload JSON file"
- Select your JSON file
- Select "Prometheus" as the data source
- Click "Import"

### Default Dashboards
The project includes several pre-configured dashboards:
- **Ray Cluster Overview**: General cluster metrics
- **Node Metrics**: Individual node performance
- **Task Monitoring**: Ray task statistics
- **Resource Usage**: CPU, Memory, and GPU utilization

## 🔧 Configuration

### Directory Structure
```
ray-cluster/
├── docker/
│ ├── ray/
│ │ └── Dockerfile
│ ├── grafana/
│ │ └── Dockerfile
│ ├── jupyter/
│ │ └── Dockerfile
│ └── prometheus/
│ └── prometheus.yml
├── work/
│ ├── job/
│ └── examples_notebook...
├── wd/
│ └── examples_script...
├── docker-compose.yml
├── .env
└── README.md
```
### Jupyter Configuration
The Jupyter container includes:
- Python 3.12.8 kernel
- JupyterLab extensions
- Ray integration
- Ray cluster access

### Environment Variables
Main environment variables can be configured in the `.env` file:
- `JUPYTER_TOKEN`: Jupyter access token
- `RAY_GRAFANA_IFRAME_HOST`: URL for Grafana embedding
- Other configuration parameters...

## 📈 Code Examples

### Ray Initialization in Jupyter

Execute the ray_test.ipynb

### Daft Initialization in Jupyter

Execute the daft_test.ipynb


## 🔒 Security
- Exposed ports are configured for local access
- Grafana is configured with anonymous authentication for development
- Prometheus is accessible only from Docker internal network

## 🤝 Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

## 📝 License
[MIT](https://choosealicense.com/licenses/mit/)

## 👥 Authors
- Luca Riccardi

## 📞 Support
For support, please open an issue in the GitHub repository.


