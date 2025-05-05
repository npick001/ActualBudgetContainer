# ActualBudget Local Setup

This guide walks you through the process of setting up and running the **ActualBudget** application using Docker in a local environment with WSL (Windows Subsystem for Linux). If there are issues with line closure characters, open the files in VSCode and change the End of Line Sequence from CRLF to LF.

## Prerequisites

- **Windows 10 or 11** with **WSL 2** installed.
- **Docker** installed and running in WSL.
- **VS Code** (with Remote - WSL extension) for easy interaction with your Linux environment from Windows.

## Steps

### 1. Clone the Repository

First, clone the repository or navigate to the existing project directory.

```bash
cd /mnt/z/Development/ActualBudget
```

### 2. Set Up Docker

If you haven’t set up Docker yet, you can use the setup-docker.sh script to install Docker in WSL.

### 3. Run the Application

To start the application, you need to use the launch.sh script. This script will perform the following actions:

    Set the Docker context to use the default configuration.

    Pull the latest Docker image for the ActualBudget server.

    Run the application in the background, ensuring it restarts automatically unless stopped.

Running the Application:

```bash
./launch.sh
```

### 4. Access the Application

Once the script has finished running, the application should be accessible via your web browser at:

```arduino
http://localhost:5006
```
You can open this URL in a browser to interact with the ActualBudget application.

### 5. Verifying the Container

To check if the Docker container is running:

```bash
docker ps
```

This command will show all the running containers. Look for the container named my_actual_budget.

### 6. Viewing Logs (Optional)

If you encounter any issues or want to verify that everything is running smoothly, you can check the logs for the running container:

```bash
docker logs my_actual_budget
```

### 7. Stopping the Application

To stop the application and remove the container, you can run the following command:

```bash
docker stop my_actual_budget
docker rm my_actual_budget
```

This will stop and remove the container, but you can always restart it with the launch.sh script.