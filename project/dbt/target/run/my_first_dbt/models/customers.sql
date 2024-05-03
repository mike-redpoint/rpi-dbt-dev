
  create view "AdventureWorks"."marketing"."customers__dbt_tmp"
    
    
  as (
    with customer_sales as (
    Select 
	"CustomerKey" ,
	Sum("SalesAmount") as total_sales_amount,
	Count(*) as number_of_sales
	From public."FactInternetSales"
    Group By 1
)

Select
"CustomerKey" as customer_id,
"FirstName" as first_name,
"LastName" as last_name,
"BirthDate" as birth_date,
"Gender" as gender,
"EmailAddress" as email_address,
"YearlyIncome" as yearly_income,
"TotalChildren" as total_number_children,
"NumberChildrenAtHome" as number_children_at_home,
"MaritalStatus" as marital_status,
"EnglishEducation" as education,
"EnglishOccupation" as occupation,
customer_sales.total_sales_amount,
customer_sales.number_of_sales

From public."DimCustomer"

left join customer_sales using ("CustomerKey")
  );