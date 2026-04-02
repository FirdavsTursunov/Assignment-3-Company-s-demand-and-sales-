## Assignment 3 - Company Demand and Sales

set.seed(42)

## Step 1 - create data frame with 4 columns and 110 rows

n <- 110

company_data <- data.frame(
  Company_ID = 1:n,
  Product_ID = sample(1:50, n, replace = TRUE),
  Customer_Demand = rnorm(n, mean = 500, sd = 50),
  Sale_Won = rnorm(n, mean = 400, sd = 80)
)

## make sure no negative values in demand and sales
company_data$Customer_Demand <- abs(company_data$Customer_Demand)
company_data$Sale_Won <- abs(company_data$Sale_Won)

print(head(company_data, 10))


## Step 2 - columns 3 and 4 are positive random variables (done above with rnorm + abs)


## Step 3 - use lapply to get the average of Customer Demand and Sale Won

averages <- lapply(company_data[, c("Customer_Demand",  "Sale_Won")], mean)

avg_demand <- averages$Customer_Demand
avg_sales <- averages$Sale_Won

print(avg_demand)
print(avg_sales)


## Step 4 - select companies where Customer Demand is higher than average

high_demand <- company_data[company_data$Customer_Demand > avg_demand, ]

print(high_demand)


## Step 5 - select companies where Sale Won is higher than average

high_sales <- company_data[company_data$Sale_Won > avg_sales, ]

print(high_sales)


