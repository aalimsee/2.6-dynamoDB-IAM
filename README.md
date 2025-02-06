# 2.6-dynamoDB-IAM

# Test command after deployment
aws dynamodb list-tables
aws dynamodb scan --table-name <table-name>
aws dynamodb delete-table --table-name <table-name>