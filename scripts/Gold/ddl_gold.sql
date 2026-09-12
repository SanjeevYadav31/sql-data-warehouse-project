create view gold.dim_customers as
select
	row_number() over(Order by ci.cst_id) as primary_key,
	ci.cst_id customer_id,
	ci.cst_key customer_num,
	ci.cst_firstname firstname,
	ci.cst_lastname lastname,
	ci.cst_marital_status marital_status,
	case when ci.cst_gndr !='n/a' then ci.cst_gndr --CRM is the master for gender info
			else coalesce(ca.gen,'n/a')
			end as gndr,
	ca.bdate birthdate,
	ci.cst_create_date create_date,
	la.cntry country
from Silver.crm_cust_info ci
left join Silver.erp_cust_az12 ca
on ci.cst_key=ca.cid
left join Silver.erp_loc_a101 la
on ci.cst_key=la.cid


create view Gold.dim_products as
select 
Row_number() over (Order by pn.prd_start_dt,pn.prd_key) as Product_key,
pn.prd_id product_id,
pn.prd_key product_keys,
pn.prd_nm product_name,
pn.cat_id Category_id,
pc.cat Category,
pc.subcat SubCategory,
pc.maintenance,
pn.prd_cost product_cost,
pn.prd_line product_line,
pn.prd_start_dt start_date

from Silver.crm_prd_info pn
left join Silver.erp_px_cat_g1v2 pc
on pc.id=pn.cat_id
where prd_end_dt is null ---filter out all historical data




create view Gold.fact_sales as
select 
sls_ord_num order_number,
pr.product_key ,
cu.customer_id ,
sls_order_dt order_date,
sls_ship_dt shipping_date,
sls_due_dt due_date,
sls_sales sales,
sls_quantity quantity,
sls_price price
from Silver.crm_sales_details sd
left join Gold.dim_products pr
on sd.sls_prd_key=pr.product_keys
left join Gold.dim_customers cu
on sd.sls_cust_id=cu.customer_id
