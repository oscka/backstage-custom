# vi start.sh
echo "Setting environment variables...";

# -----------------------------
# Postgres
# -----------------------------
export POSTGRES_HOST="192.168.41.52";
export POSTGRES_PORT="5432";
export POSTGRES_USER="postgres";
export POSTGRES_PASSWORD="postgres1234";

# for github action
# -----------------------------
# GitHub OAuth Apps
# -----------------------------
export AUTH_GITHUB_CLIENT_ID="insert your AUTH_GITHUB_CLIENT_ID";
export AUTH_GITHUB_CLIENT_SECRET="insert your AUTH_GITHUB_CLIENT_SECRET";

# -----------------------------
# GitHub Personal Access Tokens(classic)
# -----------------------------
export GITHUB_TOKEN="insert your GITHUB_TOKEN";

# -----------------------------
# Plugin
# -----------------------------
export SONARQUBE_URL="http://192.168.41.50:9000";
export SONARQUBE_TOKEN="887b886cf003bfcbb37363bc041cbd7358184a2c";

export JENKINS_URL="http://192.168.41.50:8080";
export JENKINS_TOKEN="1170e822a22c501738638ae9f2252fc77";

export NEXUS_REPOSITORY_MANAGER_URL="https://nexus-oscka.openmsa.monster";
export NEXUS_REPOSITORY_MANAGER_AUTH="YWRtaW46b3Nja29yZWEh";

export ARGOCD_URL="https://argocd-oscka.openmsa.monster";
export ARGOCD_AUTH_TOKEN="argocd.token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJhcmdvY2QiLCJzdWIiOiJvc2NrYTphcGlLZXkiLCJuYmYiOjE3MDUyOTQ0OTcsImlhdCI6MTcwNTI5NDQ5NywianRpIjoiOTJmZjk0NzYtN2JiYy00MzhiLWIzNjItZjgwMjM5ZTljYzk0In0.4cQMLw5s7TaC5Jh254yVhVJUvjXwd4RAfj4di5q5jrU";

export K8S_K3S_URL="https://192.168.41.52:6443";
export K8S_K3S_TOKEN="eyJhbGciOiJSUzI1NiIsImtpZCI6IjJPQUc5UzRmSUdBQkJ4ZUFWbGY5dGkxdUpqT1JYamJZblV2cG54bXdOdlkifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJkZWZhdWx0Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZWNyZXQubmFtZSI6ImRlZmF1bHQiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC5uYW1lIjoiZGVmYXVsdCIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6ImNjNjg3ODU0LWNjNzgtNDIyOS1hOTNjLTEyYWU5MTkzNGQyNSIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDpkZWZhdWx0OmRlZmF1bHQifQ.sRi3p7x7CHBHUqmqgzTTTq-KfjGiHKqFauEUgw9_tgqVh_Op5CClqbnJGpeukzmL-aRBEL0ic8FARDqpYnmYo4pGyGyOsS4gO1hNJpW4tcVgqzZvU_cH9-5mxRn4SJAAD3yGhi27cQADMVs1y8fUazdpOB_IJq795xjEfh6feY7B0Jqn9BqOuZrpVZPB81ycYcmIAXovii8OcSZgxQ0rkWdN6rjiu-C10YYtLo8OaqVV1HRRrqNOHdAJ-IFF9HL80aa8TnJ0Qbcou9W8-vdnXuU4_ABeLB8hOJmYRqKZD-e20EKBF5GWs4vmI4sIezJHZEwUKohgr5OejXVzQqZmvg";

export K8S_KIND_URL="https://host.docker.internal:40471";
export K8S_KIND_TOKEN="eyJhbGciOiJSUzI1NiIsImtpZCI6InpzRHZ5V09raHpPZ1pTUUctVDlablBhQkp6d2tscjBQWFZtemxUSklSRjgifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJkZWZhdWx0Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZWNyZXQubmFtZSI6ImRlZmF1bHQtY2x1c3Rlci1hZG1pbiIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50Lm5hbWUiOiJkZWZhdWx0LWNsdXN0ZXItYWRtaW4iLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC51aWQiOiI3ODczMDVmMi1mZGMwLTRkYTctODNmNy04ZWFlMTc2MWQ0MDAiLCJzdWIiOiJzeXN0ZW06c2VydmljZWFjY291bnQ6ZGVmYXVsdDpkZWZhdWx0LWNsdXN0ZXItYWRtaW4ifQ.VcdnGWruNGwJAiMSlJc-D2B5w0gayysQZf4SgcA-9nQ3_sg48wrhxIUFSs8l7jXZZxaTbbGno-1Uaqp8DSqOY-tx2RZE63I8RPzB5NlDHRgNoFGqPN7RoEHxdCJ30nzM2NpqiehIumyTFvB8w6vUzUucqXcbpX6Jf1MIZF_NSLRk3kpGMXoFJIfFzLybgh5YajVAI7Vv4mqDNigMuar7CM60krrNLxct4S4XwZsSzORi5-JQcs_WFbTuE1C7sqU_pKGnn-D7AhiiLgzKwNEBtT6WO6Y1NhB-xtVafV_cOpikaLK2Wo-t-GrImDuSeEFsmnOGElvJp2KSQst_yQCJ4A";

export K8S_MINIKUBE_URL="https://host.docker.internal:55099";
export K8S_MINIKUBE_TOKEN="eyJhbGciOiJSUzI1NiIsImtpZCI6Ikd2ZEZlNEY1aE9xZk9FMnpWTk9PRDRpXzEtYjVaZmJ2bmtLNk1wVUVDbGMifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJkZWZhdWx0Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZWNyZXQubmFtZSI6ImRlZmF1bHQtY2x1c3Rlci1hZG1pbiIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50Lm5hbWUiOiJkZWZhdWx0LWNsdXN0ZXItYWRtaW4iLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC51aWQiOiI4NmRlODI1OC03YmE3LTQ2MmUtODc4Mi03ZmQzOTkyNTk0M2EiLCJzdWIiOiJzeXN0ZW06c2VydmljZWFjY291bnQ6ZGVmYXVsdDpkZWZhdWx0LWNsdXN0ZXItYWRtaW4ifQ.MLH2KjnLNbzuiIJBiDj_WVxDGunVYHgu31CijjdBiQYBavGyG6Fy5VfDGEqkx6XB7JTyjrDx9BLdQm1qQ2jSS13sLf2GX6P8uVsTMIR9XPWnjvs1rsXr6pGthGm5pFPHtwltnDhj8JT2TzTvtMC6N02e-QEkqdG1-KrQOao_0tubsXLXi6BsDEU04PRaZcAOWIXFmNtXrRpr5aL_lznneG9e4z0-kbbYeihJ0lrLITDrxaFVnSRKmC9llSJyYKwI77SK1LcTrB9rFEXUXPm37_uad2UXLwZgl_xpybynL-9Xa9Fu4i95u0W-hs-vFmkHPW9Ji6uegGmUtZbfBM2ZNw";

export ORGANIZATION_NAME="OpenMSA";

echo "----------------------------------------------------------------------------------------";
echo "Initializing process..."

yarn dev