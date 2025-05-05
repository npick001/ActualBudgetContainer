docker context use default
docker pull actualbudget/actual-server:latest
docker images actualbudget/actual-server:latest
docker run --pull=always --restart=unless-stopped -d -p 5006:5006 -v Z:\Development\ActualBudget\actual-data --name my_actual_budget actualbudget/actual-server:latest
