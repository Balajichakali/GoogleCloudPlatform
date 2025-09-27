#NAME?
(select  date_created
,item_sku_code_uc
,'D2C' as portal
,name.name
,cast ((acq_mrp_revenue + rep_mrp_revenue ) as numeric) as mrp_revenue
,therapy
,group_
,type
,cast ((acq_net_revenue + rep_net_revenue) as numeric) as net_revenue
,cast ((acq_quantity + rep_quantity) as numeric) as net_quantity
,cast ((acq_cogs + rep_cogs) as numeric) as net_cogs
,cast ((HCT_Acq_final_spend+HCT_Repeat_final_spend+Doc_New_Spend+Doc_Rep_Spend+acq_influencer_spend+repeat_influencer_spend+acq_content_marketing_spend+repeat_content_marketing_spend+FB_Acq_Spend+FB_Repeat_Spend
#NAME?
#NAME?
#NAME?
#NAME?
#NAME?
#NAME?
#NAME?
#NAME?
#NAME?
+Crm_Repeat_spend) as numeric) as total_spends
,cast ((acq_logs + rep_logs) as numeric) as net_logs
,cast (((acq_net_revenue + rep_net_revenue)-
(acq_cogs + rep_cogs) -
(acq_logs + rep_logs)) as numeric) as net_cm1
,cast (0 as numeric) as net_cm2
,cast (  (((acq_net_revenue + rep_net_revenue)-
(acq_cogs + rep_cogs) -
(acq_logs + rep_logs)) - (HCT_Acq_final_spend
#NAME?
#NAME?
#NAME?
#NAME?
#NAME?
#NAME?
#NAME?
#NAME?
#NAME?
#NAME?
#NAME?
#NAME?
#NAME?
#NAME?
#NAME?
#NAME?
#NAME?
#NAME?
+Crm_Repeat_spend) )  as numeric) as  net_cm3

,cast (0 as numeric) as total_allocated_d2c_spends
,cast (0 as numeric) as total_allocated_non_working_spends
,cast (0 as numeric) as total_allocated_influencer_spends
,cast (0 as numeric)as total_allocated_content_marketing_spends
,cast (0 as numeric) as offtake_revenue
,cast (0 as numeric) as offtake_quantity
,cast (0 as numeric) as offtake_discount
,cast (acq_mrp_revenue        as numeric) as     acq_mrp_revenue
,cast (rep_mrp_revenue        as numeric) as      rep_mrp_revenue
,cast (acq_item_discount      as numeric) as        acq_item_discount
,cast (rep_item_discount      as numeric) as        rep_item_discount
,cast (acq_listing_discount_uc       as numeric) as        acq_listing_discount_uc
,cast (rep_listing_discount_uc       as numeric) as        rep_listing_discount_uc
,cast (acq_gross_revenue             as numeric) as        acq_gross_revenue
,cast (rep_gross_revenue             as numeric) as        rep_gross_revenue
,cast (acq_net_revenue               as numeric) as        acq_net_revenue
,cast (rep_net_revenue               as numeric) as        rep_net_revenue
,cast (acq_quantity                  as numeric) as        acq_quantity
,cast (rep_quantity                  as numeric) as        rep_quantity
,cast (acq_cogs                      as numeric) as        acq_cogs
,cast (rep_cogs                      as numeric) as        rep_cogs
,cast (acq_logs                      as numeric) as        acq_logs
,cast (rep_logs                      as numeric) as        rep_logs
,cast (HCT_Acq_final_spend           as numeric) as        HCT_Acq_final_spend
,cast (HCT_Repeat_final_spend        as numeric) as            HCT_Repeat_final_spend
,cast (Doc_New_Spend                     as numeric) as        Doc_New_Spend
,cast (Doc_Rep_Spend                     as numeric) as        Doc_Rep_Spend
,cast (acq_influencer_spend          as numeric) as        acq_influencer_spend
,cast (repeat_influencer_spend       as numeric) as        repeat_influencer_spend
,cast (acq_content_marketing_spend   as numeric) as        acq_content_marketing_spend
,cast (repeat_content_marketing_spend as numeric) as           repeat_content_marketing_spend
,cast (FB_Acq_Spend                  as numeric) as        FB_Acq_Spend
,cast (FB_Repeat_Spend               as numeric) as        FB_Repeat_Spend
,cast (Aff_New_spend                     as numeric) as        Aff_New_spend
,cast (Aff_Repeat_Spend              as numeric) as        Aff_Repeat_Spend
,cast (Partnership_New_spend             as numeric) as        Partnership_New_spend
,cast (Partnership_Repeat_spend      as numeric) as        Partnership_Repeat_spend
,cast (acq_non_working_spend             as numeric) as        acq_non_working_spend
,cast (repeat_non_working_spend      as numeric) as        repeat_non_working_spend
,cast (Google_Acq_Spend              as numeric) as        Google_Acq_Spend
,cast (Google_Repeat_Spend           as numeric) as        Google_Repeat_Spend
,cast (Crm_New_spend                     as numeric) as        Crm_New_spend
,cast (Crm_Repeat_spend              as numeric) as        Crm_Repeat_spend

from (select *, (net_revenue - net_cogs - net_logs) as cm1, (net_revenue - net_cogs - net_logs - total_spends) as cm3
from (select (case when revenue.date_created is null then spends.order_date else revenue.date_created end) as date_created,
(case when revenue.item_sku_code_uc is null then spends.item_sku_code_uc else revenue.item_sku_code_uc end) as item_sku_code_uc,
(case when acq_mrp_revenue is null then 0 else acq_mrp_revenue end ) as acq_mrp_revenue, (case when rep_mrp_revenue is null then 0 else rep_mrp_revenue end ) as rep_mrp_revenue,
((case when acq_mrp_revenue is null then 0 else acq_mrp_revenue end ) + (case when rep_mrp_revenue is null then 0 else rep_mrp_revenue end )) as mrp_revenue,
(case when acq_item_discount is null then 0 else acq_item_discount end ) as acq_item_discount, (case when rep_item_discount is null then 0 else rep_item_discount end ) as rep_item_discount,
(case when acq_listing_discount_uc is null then 0 else acq_listing_discount_uc end ) as acq_listing_discount_uc, (case when rep_listing_discount_uc is null then 0 else rep_listing_discount_uc end ) as rep_listing_discount_uc,
(case when acq_gross_revenue is null then 0 else acq_gross_revenue end ) as acq_gross_revenue, (case when rep_gross_revenue is null then 0 else rep_gross_revenue end ) as rep_gross_revenue,
((case when acq_gross_revenue is null then 0 else acq_gross_revenue end ) + (case when rep_gross_revenue is null then 0 else rep_gross_revenue end )) as gross_revenue,
(case when acq_net_revenue is null then 0 else acq_net_revenue end ) as acq_net_revenue, (case when rep_net_revenue is null then 0 else rep_net_revenue end ) as rep_net_revenue,
((case when acq_net_revenue is null then 0 else acq_net_revenue end ) + (case when rep_net_revenue is null then 0 else rep_net_revenue end )) as net_revenue,
(case when acq_quantity is null then 0 else acq_quantity end ) as acq_quantity, (case when rep_quantity is null then 0 else rep_quantity end ) as rep_quantity,
((case when acq_quantity is null then 0 else acq_quantity end ) + (case when rep_quantity is null then 0 else rep_quantity end )) as quantity,
(case when acq_cogs is null then 0 else acq_cogs end ) as acq_cogs, (case when rep_cogs is null then 0 else rep_cogs end ) as rep_cogs,
((case when rep_cogs is null then 0 else rep_cogs end )+(case when acq_cogs is null then 0 else acq_cogs end )) as net_cogs,
(case when acq_logs is null then 0 else acq_logs end ) as acq_logs, (case when rep_logs is null then 0 else rep_logs end ) as rep_logs,
((case when acq_logs is null then 0 else acq_logs end )+(case when rep_logs is null then 0 else rep_logs end )) as net_logs,
(case when HCT_Acq_final_spend is null then 0 else HCT_Acq_final_spend end ) as HCT_Acq_final_spend, (case when HCT_Repeat_final_spend is null then 0 else HCT_Repeat_final_spend end ) as HCT_Repeat_final_spend,
(case when Doc_New_Spend is null then 0 else Doc_New_Spend end ) as Doc_New_Spend, (case when Doc_Rep_Spend is null then 0 else Doc_Rep_Spend end ) as Doc_Rep_Spend,
(case when acq_influencer_spend is null then 0 else acq_influencer_spend end) as acq_influencer_spend, (case when repeat_influencer_spend is null then 0 else repeat_influencer_spend end) as repeat_influencer_spend,
(case when acq_content_marketing_spend is null then 0 else acq_content_marketing_spend end ) as acq_content_marketing_spend, (case when repeat_content_marketing_spend is null then 0 else repeat_content_marketing_spend end ) as repeat_content_marketing_spend,
(case when FB_Acq_Spend is null then 0 else FB_Acq_Spend end ) as FB_Acq_Spend, (case when FB_Repeat_Spend is null then 0 else FB_Repeat_Spend end ) as FB_Repeat_Spend,
(case when Aff_New_spend is null then 0 else Aff_New_spend end ) as Aff_New_spend, (case when Aff_Repeat_Spend is null then 0 else Aff_Repeat_Spend end ) as Aff_Repeat_Spend,
(case when Partnership_New_spend is null then 0 else Partnership_New_spend end ) as Partnership_New_spend, (case when Partnership_Repeat_spend is null then 0 else Partnership_Repeat_spend end ) as Partnership_Repeat_spend,
(case when acq_non_working_spend is null then 0 else acq_non_working_spend end ) as acq_non_working_spend, (case when repeat_non_working_spend is null then 0 else repeat_non_working_spend end ) as repeat_non_working_spend,
(case when Google_Acq_Spend is null then 0 else Google_Acq_Spend end ) as Google_Acq_Spend, (case when Google_Repeat_Spend is null then 0 else Google_Repeat_Spend end ) as Google_Repeat_Spend,
(case when Crm_New_spend is null then 0 else Crm_New_spend end ) as Crm_New_spend, (case when Crm_Repeat_spend is null then 0 else Crm_Repeat_spend end ) as Crm_Repeat_spend,


((case when HCT_Acq_final_spend is null then 0 else HCT_Acq_final_spend end )+(case when HCT_Repeat_final_spend is null then 0 else HCT_Repeat_final_spend end )+
(case when Doc_New_Spend is null then 0 else Doc_New_Spend end ) +(case when Doc_Rep_Spend is null then 0 else Doc_Rep_Spend end ) + (case when acq_influencer_spend is null then 0 else acq_influencer_spend end) +
(case when repeat_influencer_spend is null then 0 else repeat_influencer_spend end)+(case when acq_content_marketing_spend is null then 0 else acq_content_marketing_spend end )+(case when repeat_content_marketing_spend is null then 0 else repeat_content_marketing_spend end )+
(case when FB_Acq_Spend is null then 0 else FB_Acq_Spend end )+(case when FB_Repeat_Spend is null then 0 else FB_Repeat_Spend end )+(case when Aff_New_spend is null then 0 else Aff_New_spend end )+
(case when Aff_Repeat_Spend is null then 0 else Aff_Repeat_Spend end ) + (case when Partnership_New_spend is null then 0 else Partnership_New_spend end ) + (case when Partnership_Repeat_spend is null then 0 else Partnership_Repeat_spend end ) +
(case when acq_non_working_spend is null then 0 else acq_non_working_spend end )  + (case when repeat_non_working_spend is null then 0 else repeat_non_working_spend end ) +
(case when Google_Acq_Spend is null then 0 else Google_Acq_Spend end ) + (case when Google_Repeat_Spend is null then 0 else Google_Repeat_Spend end ) +
(case when Crm_New_spend is null then 0 else Crm_New_spend end ) + (case when Crm_Repeat_spend is null then 0 else Crm_Repeat_spend end )
) as total_spends,

from (
select mdata.date_created, mdata.item_sku_code_uc,
mdata.acq_mrp as acq_mrp_revenue, mdata.rep_mrp as rep_mrp_revenue,
mdata.acq_gr as acq_gross_revenue,
mdata.rep_gr as rep_gross_revenue,
acq_logs, rep_logs,
(case when mdata.date_created > current_date-15 then nmdata.acq_net_revenue else mdata.acq_net_revenue end) as acq_net_revenue,
(case when mdata.date_created > current_date-15 then nmdata.rep_net_revenue else mdata.rep_net_revenue end) as rep_net_revenue,
(case when mdata.date_created > current_date-15 then nmdata.acq_cogs else mdata.acq_cogs end) as acq_cogs,
(case when mdata.date_created > current_date-15 then nmdata.rep_cogs else mdata.rep_cogs end) as rep_cogs,
(case when mdata.date_created > current_date-15 then nmdata.acq_quantity else mdata.acq_quantity end) as acq_quantity,
(case when mdata.date_created > current_date-15 then nmdata.rep_quantity else mdata.rep_quantity end) as rep_quantity,
(case when mdata.date_created > current_date-15 then nmdata.acq_item_discount else mdata.acq_item_discount end) as acq_item_discount,
(case when mdata.date_created > current_date-15 then nmdata.rep_item_discount else mdata.rep_item_discount end) as rep_item_discount,
(case when mdata.date_created > current_date-15 then nmdata.acq_listing_discount_uc else mdata.acq_listing_discount_uc end) as acq_listing_discount_uc,
(case when mdata.date_created > current_date-15 then nmdata.rep_listing_discount_uc else mdata.rep_listing_discount_uc end) as rep_listing_discount_uc

from (
select data.*, logs.acq_logs, logs.rep_logs
from (
select d_wogr.*, gr.acq_gr, gr.rep_gr, gr.acq_mrp, gr.rep_mrp
from (
select date_created, item_sku_code_uc,
sum(acq_net_revenue) as acq_net_revenue,
sum(rep_net_revenue) as rep_net_revenue,
sum(acq_cogs) as acq_cogs,
sum(rep_cogs) as rep_cogs,
sum(acq_quantity) as acq_quantity,
sum(rep_quantity) as rep_quantity,
sum(acq_item_discount) as acq_item_discount,
sum(rep_item_discount) as rep_item_discount,
sum(acq_listing_discount_uc) as acq_listing_discount_uc,
sum(rep_listing_discount_uc) as rep_listing_discount_uc
from(
select date(foi.date_created) as date_created, item_sku_code_uc, purchase_type,
(case when purchase_type = 'NEW' then
(case when product_value_exc_tax_exc_shipping_charges is null then
(case when item_tax_rate = 'gst_12' then product_value_inc_tax_inc_discount - ((product_value_inc_tax_inc_discount*numeric '0.12')/numeric '1.12')
when item_tax_rate = 'gst_18' then product_value_inc_tax_inc_discount - ((product_value_inc_tax_inc_discount*numeric '0.18')/numeric '1.18')
when item_tax_rate = 'gst_5' then product_value_inc_tax_inc_discount - ((product_value_inc_tax_inc_discount*numeric '0.05')/numeric '1.05')
end) else product_value_exc_tax_exc_shipping_charges end) else 0 end) as acq_net_revenue,
(case when purchase_type = 'REPEAT' then
(case when product_value_exc_tax_exc_shipping_charges is null then
(case when item_tax_rate = 'gst_12' then product_value_inc_tax_inc_discount - ((product_value_inc_tax_inc_discount*numeric '0.12')/numeric '1.12')
when item_tax_rate = 'gst_18' then product_value_inc_tax_inc_discount - ((product_value_inc_tax_inc_discount*numeric '0.18')/numeric '1.18')
when item_tax_rate = 'gst_5' then product_value_inc_tax_inc_discount - ((product_value_inc_tax_inc_discount*numeric '0.05')/numeric '1.05')
end) else product_value_exc_tax_exc_shipping_charges end) else 0 end) as rep_net_revenue,
(case when purchase_type = 'NEW' then foi.cogs_excel else 0 end) as acq_cogs,
(case when purchase_type = 'REPEAT' then foi.cogs_excel else 0 end) as rep_cogs,
(case when purchase_type = 'NEW' then foi.quantity else 0 end) as acq_quantity,
(case when purchase_type = 'REPEAT' then foi.quantity else 0 end) as rep_quantity,
(case when purchase_type = 'NEW' then foi.item_discount else 0 end) as acq_item_discount,
(case when purchase_type = 'REPEAT' then foi.item_discount else 0 end) as rep_item_discount,
(case when purchase_type = 'NEW' then foi.listing_discount_uc else 0 end) as acq_listing_discount_uc ,
(case when purchase_type = 'REPEAT' then foi.listing_discount_uc else 0 end) as rep_listing_discount_uc


from d2c.fact_order fo join d2c.fact_order_item foi on fo.order_id = foi.order_id
where fo.channel = 'BIGCOMMERCE' and fo.final_order_status in ('DELIVERED','IN TRANSIT','IN-WH')
and foi.date_created between date('2023-06-01') and current_date )
group by 1,2

) as d_wogr

join

(select purchase_date, item_sku_code_uc, sum(acq_gr) as acq_gr, sum(rep_gr) as rep_gr, sum(acq_mrp) as acq_mrp, sum(rep_mrp) as rep_mrp
from(
select  date(fo.date_created) as purchase_date, item_sku_code_uc,
(case when (case when purchase_type is null then 'NEW' else purchase_type end) = 'NEW' then product_value_inc_tax_inc_discount else 0 end) as acq_gr,
(case when (case when purchase_type is null then 'NEW' else purchase_type end) = 'REPEAT' then product_value_inc_tax_inc_discount else 0 end) as rep_gr,
(case when (case when purchase_type is null then 'NEW' else purchase_type end) = 'NEW' then cast(mrp_uc as numeric) else 0 end) as acq_mrp,
(case when (case when purchase_type is null then 'NEW' else purchase_type end) = 'REPEAT' then cast(mrp_uc as numeric) else 0 end) as rep_mrp
from d2c.fact_order fo join d2c.fact_order_item foi on fo.order_id = foi.order_id where fo.channel = 'BIGCOMMERCE' and fo.date_created between date('2023-06-01') and current_date
)
group by 1,2) as gr

on

d_wogr.date_created = gr.purchase_date
and
d_wogr.item_sku_code_uc = gr.item_sku_code_uc

) as data

left join

(

select purchase_date, item_sku_code_uc, sum(acq_logs) as acq_logs, sum(rep_logs) as rep_logs
from(
select purchase_date, tab1.item_sku_code_uc, purchase_type, (case when awb is null then (case when purchase_type = 'NEW' then (case when logs2 is null then 0 else logs2 end) else 0 end) else (case when purchase_type = 'NEW' then (case when logs1 is null then 0 else logs1 end) else 0 end) end) as acq_logs,
(case when awb is null then (case when purchase_type = 'REPEAT' then (case when logs2 is null then 0 else logs2 end) else 0 end) else (case when purchase_type = 'REPEAT' then (case when logs1 is null then 0 else logs1 end) else 0 end) end) as rep_logs
from (
select order_id, purchase_date, item_sku_code_uc, purchase_type, awb
from (
select fo.order_id, date(foi.date_created) as purchase_date, item_sku_code_uc, purchase_type, awb,concat(foi.order_id,item_sku_code_uc) ,row_number() over(partition by concat(foi.order_id,item_sku_code_uc)) as rk
from d2c.fact_order fo join d2c.fact_order_item foi on fo.order_id = foi.order_id
where fo.channel = 'BIGCOMMERCE' and foi.date_created between date('2023-06-01') and current_date
and final_order_status not in ('CANCELLED','Cancelled','INCOMPLETE')
)
where rk = 1
) as tab1
full outer join
(
select l1.order_id, l2.item_sku_code_uc, l1.logs as logs1, l2.logs as logs2
from (
select * from (select order_id, item_sku_code_uc, sum(logs_per_unit.logs_per_unit) as logs
from datawarehouse-kapiva.d2c.logs_per_unit
group by 1,2  )
) as l1
join
(

select *
from (
select order_id, item_sku_code_uc, sum(logs_per_unit)*1.12 as logs
from(
with a as(select order_id,item_sku_code_uc,weight_excel from d2c.fact_order_item where date(date_created)>='2023-06-01'),b as(with a as(select *,case when tot>22 then tot else 22 end as tot_,concat(facility_name_pincode,shipping_pincode) concati from(select  fo.order_id,fo.cod_pay_status,
final_order_status,(total_order_value_inc_tax_uc*1.2)/100 as tot,total_weight_excel,floor(total_weight_excel/500) as tws,awb,date(fo.date_created) dat,shipping_pincode,fo.facility_name,
case when facility_name ='Mumbai D2C' then '421302'
when facility_name ='Bengaluru D2C' then '560067'
when facility_name ='Kolkata D2C' then '711302'
when facility_name ='Lucknow D2C' then '226008'
when facility_name ='Mumbai B2B' then '421302'
when facility_name ='Delhi B2B' then '110036'
when facility_name ='Gurgaon D2C' then '122503'
when facility_name ='Hyderabad D2C' then '500014'
when facility_name ='MUMBAI Website' then '421302'
when facility_name ='Bengaluru Main' then '560085'
when facility_name ='Kolkata B2B' then '700058'
end as facility_name_pincode from `d2c.fact_order` fo
where date(fo.date_created) between '2023-07-01' and '2023-07-20'  and fo.channel in ('BIGCOMMERCE') and final_order_status not in ('CANCELLED','Cancelled','INCOMPLETE') and awb is null))


select * from
(select *, case
when cod_pay_status != 1 then
case
when zone_name='A' then case when  tws>1 then tws*17+19 else 19 end
when zone_name='B' then case when tws>1 then tws*16.8+19.6 else 19.6 end
when zone_name='C' then case when tws>1 then tws*27+35 else 35 end
when zone_name='D' then case when tws>1 then tws*30+39 else  39 end
when zone_name='E' or zone_name='F'  then case when tws>1 then  tws*35+48 else 48 end

end
when cod_pay_status = 1 then
case
when zone_name='A' then case when  tws>1 then( tws*17+19)+tot else 19+tot end
when zone_name='B' then case when tws>1 then (tws*16.8+19.6)+tot else 19.6+tot end
when zone_name='C' then case when tws>1 then (tws*27+35)+tot else 35+tot end
when zone_name='D' then case when tws>1 then (tws*30+39)+tot else  39+tot end
when zone_name='E' or zone_name='F'  then case when tws>1 then  (tws*35+48)+tot else 48+tot end

end
end as total_logs from a left join `gsheets_integration.zone_mapping1` zm on a.concati=cast (zm.pickup_city as string))das)



select order_id,item_sku_code_uc,Weight_excel,(total_logs*upper_bracket)/sum_ as logs_per_unit from (
select a.order_id,item_sku_code_uc,Weight_excel,ceil(Weight_excel/500) as upper_bracket
,sum(ceil(Weight_excel/500)) over (partition by a.order_id) as sum_
,total_logs from a left join b on a.order_id=b.order_id
)fsd ) group by 1,2
)


) as l2
on
l1.order_id = l2.order_id
and
l1.item_sku_code_uc = l2.item_sku_code_uc
) as tab2

on tab1.order_id = tab2.order_id
and tab1.item_sku_code_uc = tab2.item_sku_code_uc
)
group by 1,2
order by 1 desc
) as logs
on
data.date_created = logs.purchase_date
and data.item_sku_code_uc = logs.item_sku_code_uc
) as mdata

join

(

select
date_created, item_sku_code_uc, acq_net_revenue*(1 - (a_rto)) as acq_net_revenue, rep_net_revenue*(1 - (r_rto)) as rep_net_revenue,
acq_cogs*(1 - (a_cogs_rto)) as acq_cogs, rep_cogs*(1 - (r_cogs_rto)) as rep_cogs,
acq_quantity*(1 - (a_cogs_rto)) as acq_quantity, rep_quantity*(1 - (r_cogs_rto)) as rep_quantity,
acq_item_discount*(1 - (a_item_discount__rto)) as acq_item_discount, rep_item_discount*(1 - (r_item_discount_rto)) as rep_item_discount,
acq_listing_discount_uc*(1 - (a_l_discount__rto)) as acq_listing_discount_uc, rep_listing_discount_uc*(1 - (r_l_discount_rto)) as rep_listing_discount_uc
from (
select date_created, item_sku_code_uc, sum(acq_net_revenue) as acq_net_revenue, sum(rep_net_revenue) as rep_net_revenue, sum(acq_cogs) as acq_cogs, sum(rep_cogs) as rep_cogs,
sum(acq_item_discount) as acq_item_discount, sum(acq_listing_discount_uc) as acq_listing_discount_uc, sum(acq_quantity) as acq_quantity,
sum(rep_item_discount) as rep_item_discount, sum(rep_listing_discount_uc) as rep_listing_discount_uc, sum(rep_quantity) as rep_quantity

from(
select date(foi.date_created) as date_created, item_sku_code_uc, purchase_type,
(case when purchase_type = 'NEW' then listing_discount_uc else 0 end) as acq_listing_discount_uc,
(case when purchase_type = 'REPEAT' then listing_discount_uc else 0 end) as rep_listing_discount_uc,

(case when purchase_type = 'NEW' then item_discount else 0 end) as acq_item_discount,
(case when purchase_type = 'REPEAT' then item_discount else 0 end) as rep_item_discount,

(case when purchase_type = 'NEW' then quantity else 0 end) as acq_quantity,
(case when purchase_type = 'REPEAT' then quantity else 0 end) as rep_quantity,

(case when purchase_type = 'NEW' then
(case when product_value_exc_tax_exc_shipping_charges is null then
(case when item_tax_rate = 'gst_12' then product_value_inc_tax_inc_discount - ((product_value_inc_tax_inc_discount*numeric '0.12')/numeric '1.12')
when item_tax_rate = 'gst_18' then product_value_inc_tax_inc_discount - ((product_value_inc_tax_inc_discount*numeric '0.18')/numeric '1.18')
when item_tax_rate = 'gst_5' then product_value_inc_tax_inc_discount - ((product_value_inc_tax_inc_discount*numeric '0.05')/numeric '1.05')
end) else product_value_exc_tax_exc_shipping_charges end) else 0 end) as acq_net_revenue,
(case when purchase_type = 'REPEAT' then
(case when product_value_exc_tax_exc_shipping_charges is null then
(case when item_tax_rate = 'gst_12' then product_value_inc_tax_inc_discount - ((product_value_inc_tax_inc_discount*numeric '0.12')/numeric '1.12')
when item_tax_rate = 'gst_18' then product_value_inc_tax_inc_discount - ((product_value_inc_tax_inc_discount*numeric '0.18')/numeric '1.18')
when item_tax_rate = 'gst_5' then product_value_inc_tax_inc_discount - ((product_value_inc_tax_inc_discount*numeric '0.05')/numeric '1.05')
end) else product_value_exc_tax_exc_shipping_charges end) else 0 end) as rep_net_revenue,
(case when purchase_type = 'NEW' then foi.cogs_excel else 0 end) as acq_cogs,
(case when purchase_type = 'REPEAT' then foi.cogs_excel else 0 end) as rep_cogs,
(case when purchase_type = 'NEW' then foi.logs_net_revenue else 0 end) as acq_logs,
(Case when purchase_type = 'REPEAT' then foi.logs_net_revenue else 0 end) as rep_logs
from d2c.fact_order fo join d2c.fact_order_item foi on fo.order_id = foi.order_id
where fo.channel = 'BIGCOMMERCE' and fo.final_order_status not in ('INCOMPLETE' ,'CANCELLED')
and foi.date_created between date('2023-06-01') and current_date
)
group by 1,2
) as data

join

(
select (case when acq_rto.code is null then rep_rto.code else acq_rto.code end) as code,
(case when acq_rto.rto_percent is null then 0 else acq_rto.rto_percent end) as a_rto,
(case when rep_rto.rto_percent is null then 0 else rep_rto.rto_percent end) as r_rto,
(case when acq_rto.cogs_rto_percent is null then 0 else acq_rto.cogs_rto_percent end) as a_cogs_rto,
(case when rep_rto.cogs_rto_percent is null then 0 else rep_rto.cogs_rto_percent end) as r_cogs_rto,
(case when acq_rto.item_discount_rto_percent is null then 0 else acq_rto.item_discount_rto_percent end) as a_item_discount__rto,
(case when rep_rto.item_discount_rto_percent is null then 0 else rep_rto.item_discount_rto_percent end) as r_item_discount_rto,
(case when acq_rto.l_discount_rto_percent is null then 0 else acq_rto.l_discount_rto_percent end) as a_l_discount__rto,
(case when rep_rto.l_discount_rto_percent is null then 0 else rep_rto.l_discount_rto_percent end) as r_l_discount_rto


from
(
select *
from (
select code,
(case when curr_revenue = 0 then 0 else
(case when prev_revenue = 0 then (select b.rto/a.revenue
from

(select 'd2c' as tag, sum(foi.book_order_revenue_ex_tax_bc) as RTO from d2c.fact_order foi
where
date(foi.date_created) between current_date()-30  and current_date()-15 and foi.final_order_status  in('RTO') and foi.channel = 'BIGCOMMERCE' and foi.purchase_type in ('NEW')
) as b


join

(
select 'd2c' as tag, sum(foi.book_order_revenue_ex_tax_bc) as revenue from d2c.fact_order foi
where
date(foi.date_created) between current_date()-30  and current_date()-15 and foi.final_order_status not in('INCOMPLETE' ,'CANCELLED') and foi.channel = 'BIGCOMMERCE' and foi.purchase_type in ('NEW')

) as a

on

b.tag = a.tag ) else (prev_rto)/prev_revenue end)
end
) as rto_percent,


(case when curr_cogs_revenue = 0 then 0 else
(case when prev_cogs_revenue = 0 then (select b.cogs_rto/a.cogs_revenue
from

(select 'd2c' as tag, sum(foi.cogs_excel) as cogs_rto from d2c.fact_order foi
where
date(foi.date_created) between current_date()-30  and current_date()-15 and foi.final_order_status  in('RTO') and foi.channel = 'BIGCOMMERCE' and foi.purchase_type in ('NEW')
) as b


join

(
select 'd2c' as tag, sum(foi.cogs_excel) as cogs_revenue from d2c.fact_order foi
where
date(foi.date_created) between current_date()-30  and current_date()-15 and foi.final_order_status not in('INCOMPLETE' ,'CANCELLED') and foi.channel = 'BIGCOMMERCE' and foi.purchase_type in ('NEW')

) as a

on

b.tag = a.tag ) else (prev_cogs_rto)/prev_cogs_revenue end)
end
) as cogs_rto_percent,
(case when curr_item_discount_revenue = 0 then 0 else
(case when prev_item_discount_revenue = 0 then 0 else (prev_item_discount_rto)/prev_item_discount_revenue end)
end
) as item_discount_rto_percent,

(case when curr_l_discount_revenue = 0 then 0 else
(case when prev_l_discount_revenue = 0 then 0 else (prev_l_discount_rto)/prev_l_discount_revenue end)
end
) as l_discount_rto_percent




from (
select code, sum(prev_rto) as prev_rto, sum(prev_revenue) as prev_revenue, sum(curr_revenue) as curr_revenue, sum(prev_cogs_rto) as prev_cogs_rto,
sum(prev_cogs_revenue) as prev_cogs_revenue, sum(curr_cogs_revenue) as curr_cogs_revenue, sum(prev_item_discount_rto) as prev_item_discount_rto,
sum(prev_item_discount_revenue) as prev_item_discount_revenue, sum(curr_item_discount_revenue) as curr_item_discount_revenue,
sum(prev_l_discount_rto) as prev_l_discount_rto, sum(prev_l_discount_revenue) as prev_l_discount_revenue, sum(curr_l_discount_revenue) as curr_l_discount_revenue
from(
select a.item_sku_code_uc as code,
(case when b.purchase_date between current_date - 30 and current_date - 15 then b.rto else 0 end) as prev_rto,
(case when a.purchase_date between current_date - 30 and current_date - 15 then a.revenue else 0 end) as prev_revenue,
(case when a.purchase_date between current_date - 15 and current_date then a.revenue else 0 end) as curr_revenue,

(case when b.purchase_date between current_date - 30 and current_date - 15 then b.cogs_rto else 0 end) as prev_cogs_rto,
(case when a.purchase_date between current_date - 30 and current_date - 15 then a.cogs_revenue else 0 end) as prev_cogs_revenue,
(case when a.purchase_date between current_date - 15 and current_date then a.cogs_revenue else 0 end) as curr_cogs_revenue,

(case when b.purchase_date between current_date - 30 and current_date - 15 then b.item_discount_rto else 0 end) as prev_item_discount_rto,
(case when a.purchase_date between current_date - 30 and current_date - 15 then a.item_discount_revenue else 0 end) as prev_item_discount_revenue,
(case when a.purchase_date between current_date - 15 and current_date then a.item_discount_revenue else 0 end) as curr_item_discount_revenue,

(case when b.purchase_date between current_date - 30 and current_date - 15 then b.l_discount_rto else 0 end) as prev_l_discount_rto,
(case when a.purchase_date between current_date - 30 and current_date - 15 then a.l_discount_revenue else 0 end) as prev_l_discount_revenue,
(case when a.purchase_date between current_date - 15 and current_date then a.l_discount_revenue else 0 end) as curr_l_discount_revenue
from

(
select item_sku_code_uc, purchase_date,
(case when sum(product_value_exc_tax_exc_shipping_charges) is null then 0 else sum(product_value_exc_tax_exc_shipping_charges) end) as RTO,
(case when sum(cogs_excel) is null then 0 else sum(cogs_excel) end) as cogs_rto,
(case when sum(item_discount) is null then 0 else sum(item_discount) end) as item_discount_rto,
(case when sum(listing_discount_uc) is null then 0 else sum(listing_discount_uc) end) as l_discount_rto
from(
select foi.item_sku_code_uc, date(foi.date_created) as purchase_date,foi.product_value_exc_tax_exc_shipping_charges, fo.cogs_excel , foi.item_discount, foi.listing_discount_uc  from d2c.fact_order_item foi
join d2c.fact_order fo on foi.order_id=fo.order_id
where
-- foi.item_sku_code_uc in ('MIS024','MIS033','POW078','JUI104','JUI105','OIL036','COS010','CAP075') and
date(foi.date_created) between current_date()-30  and current_date() and fo.final_order_status  in('RTO') and fo.channel = 'BIGCOMMERCE' and fo.purchase_type in ('NEW')
)
group by 1,2
) as b


right join

(
select item_sku_code_uc, purchase_date, (case when sum(product_value_exc_tax_exc_shipping_charges) is null then 0 else sum(product_value_exc_tax_exc_shipping_charges) end)  as revenue,
(case when sum(cogs_excel) is null then 0 else sum(cogs_excel) end) as cogs_revenue,
(case when sum(item_discount) is null then 0 else sum(item_discount) end) as item_discount_revenue,
(case when sum(listing_discount_uc) is null then 0 else sum(listing_discount_uc) end) as l_discount_revenue
from(
select foi.item_sku_code_uc, date(foi.date_created) as purchase_date,foi.product_value_exc_tax_exc_shipping_charges, fo.cogs_excel , foi.item_discount, foi.listing_discount_uc  from d2c.fact_order_item foi
join d2c.fact_order fo on foi.order_id=fo.order_id
where
-- foi.item_sku_code_uc in ('MIS024','MIS033','POW078','JUI104','JUI105','OIL036','COS010','CAP075') and
date(foi.date_created) between current_date()-30  and current_date() and fo.final_order_status not in('INCOMPLETE' ,'CANCELLED') and fo.channel = 'BIGCOMMERCE' and fo.purchase_type in ('NEW')
)
group by 1,2
) as a

on a.item_sku_code_uc=b.item_sku_code_uc
and a.purchase_date = b.purchase_date
#NAME?
)
group by 1 ))


) as acq_rto

full outer join

(

select *
from (
select code,
(case when curr_revenue = 0 then 0 else
(case when prev_revenue = 0 then (select b.rto*100/a.revenue
from

(select 'd2c' as tag, sum(foi.book_order_revenue_ex_tax_bc) as RTO from d2c.fact_order foi
where
date(foi.date_created) between current_date()-30  and current_date()-15 and foi.final_order_status  in('RTO') and foi.channel = 'BIGCOMMERCE' and foi.purchase_type in ('REPEAT')
) as b


join

(
select 'd2c' as tag, sum(foi.book_order_revenue_ex_tax_bc) as revenue from d2c.fact_order foi
where
date(foi.date_created) between current_date()-30  and current_date()-15 and foi.final_order_status not in('INCOMPLETE' ,'CANCELLED') and foi.channel = 'BIGCOMMERCE' and foi.purchase_type in ('REPEAT')

) as a

on

b.tag = a.tag ) else (prev_rto)/prev_revenue end)
end
) as rto_percent,
(case when curr_cogs_revenue = 0 then 0 else
(case when prev_cogs_revenue = 0 then (select b.cogs_rto*100/a.cogs_revenue
from

(select 'd2c' as tag, sum(foi.cogs_excel) as cogs_rto from d2c.fact_order foi
where
date(foi.date_created) between current_date()-30  and current_date()-15 and foi.final_order_status  in('RTO') and foi.channel = 'BIGCOMMERCE' and foi.purchase_type in ('REPEAT')
) as b


join

(
select 'd2c' as tag, sum(foi.cogs_excel) as cogs_revenue from d2c.fact_order foi
where
date(foi.date_created) between current_date()-30  and current_date()-15 and foi.final_order_status not in('INCOMPLETE' ,'CANCELLED') and foi.channel = 'BIGCOMMERCE' and foi.purchase_type in ('REPEAT')

) as a

on

b.tag = a.tag ) else (prev_cogs_rto)/prev_cogs_revenue end)
end
) as cogs_rto_percent,
(case when curr_item_discount_revenue = 0 then 0 else
(case when prev_item_discount_revenue = 0 then 0 else (prev_item_discount_rto)/prev_item_discount_revenue end)
end
) as item_discount_rto_percent,

(case when curr_l_discount_revenue = 0 then 0 else
(case when prev_l_discount_revenue = 0 then 0 else (prev_l_discount_rto)/prev_l_discount_revenue end)
end
) as l_discount_rto_percent




from (
select code, sum(prev_rto) as prev_rto, sum(prev_revenue) as prev_revenue, sum(curr_revenue) as curr_revenue, sum(prev_cogs_rto) as prev_cogs_rto,
sum(prev_cogs_revenue) as prev_cogs_revenue, sum(curr_cogs_revenue) as curr_cogs_revenue, sum(prev_item_discount_rto) as prev_item_discount_rto,
sum(prev_item_discount_revenue) as prev_item_discount_revenue, sum(curr_item_discount_revenue) as curr_item_discount_revenue,
sum(prev_l_discount_rto) as prev_l_discount_rto, sum(prev_l_discount_revenue) as prev_l_discount_revenue, sum(curr_l_discount_revenue) as curr_l_discount_revenue
from(
select a.item_sku_code_uc as code,
(case when b.purchase_date between current_date - 30 and current_date - 15 then b.rto else 0 end) as prev_rto,
(case when a.purchase_date between current_date - 30 and current_date - 15 then a.revenue else 0 end) as prev_revenue,
(case when a.purchase_date between current_date - 15 and current_date then a.revenue else 0 end) as curr_revenue,

(case when b.purchase_date between current_date - 30 and current_date - 15 then b.cogs_rto else 0 end) as prev_cogs_rto,
(case when a.purchase_date between current_date - 30 and current_date - 15 then a.cogs_revenue else 0 end) as prev_cogs_revenue,
(case when a.purchase_date between current_date - 15 and current_date then a.cogs_revenue else 0 end) as curr_cogs_revenue,

(case when b.purchase_date between current_date - 30 and current_date - 15 then b.item_discount_rto else 0 end) as prev_item_discount_rto,
(case when a.purchase_date between current_date - 30 and current_date - 15 then a.item_discount_revenue else 0 end) as prev_item_discount_revenue,
(case when a.purchase_date between current_date - 15 and current_date then a.item_discount_revenue else 0 end) as curr_item_discount_revenue,

(case when b.purchase_date between current_date - 30 and current_date - 15 then b.l_discount_rto else 0 end) as prev_l_discount_rto,
(case when a.purchase_date between current_date - 30 and current_date - 15 then a.l_discount_revenue else 0 end) as prev_l_discount_revenue,
(case when a.purchase_date between current_date - 15 and current_date then a.l_discount_revenue else 0 end) as curr_l_discount_revenue
from

(
select item_sku_code_uc, purchase_date,
(case when sum(product_value_exc_tax_exc_shipping_charges) is null then 0 else sum(product_value_exc_tax_exc_shipping_charges) end) as RTO,
(case when sum(cogs_excel) is null then 0 else sum(cogs_excel) end) as cogs_rto,
(case when sum(item_discount) is null then 0 else sum(item_discount) end) as item_discount_rto,
(case when sum(listing_discount_uc) is null then 0 else sum(listing_discount_uc) end) as l_discount_rto
from(
select foi.item_sku_code_uc, date(foi.date_created) as purchase_date,foi.product_value_exc_tax_exc_shipping_charges, fo.cogs_excel , foi.item_discount, foi.listing_discount_uc  from d2c.fact_order_item foi
join d2c.fact_order fo on foi.order_id=fo.order_id
where
-- foi.item_sku_code_uc in ('MIS024','MIS033','POW078','JUI104','JUI105','OIL036','COS010','CAP075') and
date(foi.date_created) between current_date()-30  and current_date() and fo.final_order_status  in('RTO') and fo.channel = 'BIGCOMMERCE' and fo.purchase_type in ('REPEAT')
)
group by 1,2
) as b


right join

(
select item_sku_code_uc, purchase_date, (case when sum(product_value_exc_tax_exc_shipping_charges) is null then 0 else sum(product_value_exc_tax_exc_shipping_charges) end)  as revenue,
(case when sum(cogs_excel) is null then 0 else sum(cogs_excel) end) as cogs_revenue,
(case when sum(item_discount) is null then 0 else sum(item_discount) end) as item_discount_revenue,
(case when sum(listing_discount_uc) is null then 0 else sum(listing_discount_uc) end) as l_discount_revenue
from(
select foi.item_sku_code_uc, date(foi.date_created) as purchase_date,foi.product_value_exc_tax_exc_shipping_charges, fo.cogs_excel , foi.item_discount, foi.listing_discount_uc  from d2c.fact_order_item foi
join d2c.fact_order fo on foi.order_id=fo.order_id
where
-- foi.item_sku_code_uc in ('MIS024','MIS033','POW078','JUI104','JUI105','OIL036','COS010','CAP075') and
date(foi.date_created) between current_date()-30  and current_date() and fo.final_order_status not in('INCOMPLETE' ,'CANCELLED') and fo.channel = 'BIGCOMMERCE' and fo.purchase_type in ('REPEAT')
)
group by 1,2
) as a

on a.item_sku_code_uc=b.item_sku_code_uc
and a.purchase_date = b.purchase_date
#NAME?
)
group by 1 ))


) as rep_rto

on

acq_rto.code = rep_rto.code


) as rto

on

data.item_sku_code_uc = rto.code
order by 1 desc

) as nmdata


on

mdata.date_created = nmdata.date_created
and
mdata.item_sku_code_uc = nmdata.item_sku_code_uc

order by date_created desc, acq_net_revenue desc

) as revenue


full outer join


(
select *
from (
with Sku_map As (select date_time as order_date,item_sku_code_uc from
(select date_time,item_sku_code_uc  from
(with lead_wise_spend as (with new_rep as(select date_time,case when new_repeat is null then 'Repeat' else new_repeat end as new_repeat ,cart_contents,visitor,
case
when lower(cart_contents) like '%shilajit%gold%' or lower(visitor) like '%shilajit%gold%' then 'Shilajit Gold'
when lower(cart_contents) like '%shilajit%' or lower(visitor) like '%shilajit%' then 'Shilajit'
when lower(cart_contents) like '%get%slim%juice%' or lower(visitor) like '%get%slim%juice%' then 'Get Slim Juice'
when lower(cart_contents) like '%get%slim%mix%' or lower(visitor) like '%get%slim%mix%' then 'Get Slim Mix'
when lower(cart_contents) like '%dia%free%' or lower(visitor) like '%dia%free%' then 'Dia Free'
when lower(cart_contents) like '%glow%mix%' or lower(visitor) like '%glow%mix%' then 'Glow Mix'
else 'others'
end as product_name
from
`gsheets_integration.hct_all_leads` hct ),
b as
(
select date_time, product_name,sum(case when new_repeat='New' then 1 end )as New_,
sum(case when new_repeat='Repeat' then 1 end )as Repeat_ from new_rep
group by 1,2
),
c as(select date_time,product_name,count(8) as tota from (select date_time,
case
when lower(cart_contents) like '%shilajit%gold%' or lower(visitor) like '%shilajit%gold%' then 'Shilajit Gold'
when lower(cart_contents) like '%shilajit%' or lower(visitor) like '%shilajit%' then 'Shilajit'
when lower(cart_contents) like '%get%slim%juice%' or lower(visitor) like '%get%slim%juice%' then 'Get Slim Juice'
when lower(cart_contents) like '%get%slim%mix%' or lower(visitor) like '%get%slim%mix%' then 'Get Slim Mix'
when lower(cart_contents) like '%dia%free%' or lower(visitor) like '%dia%free%' then 'Dia Free'
when lower(cart_contents) like '%glow%mix%' or lower(visitor) like '%glow%mix%' then 'Glow Mix'
else 'others'
end as product_name
from
`gsheets_integration.hct_all_leads` hct)vv group by 1,2),
d as (select c.date_time,b.product_name,New_ as New_,Repeat_ as Repeat_ from b join c on b.product_name=c.product_name and c.date_time=b.date_time group by 1,2,3,4),
e as (select date_time,count(product_name) as overall from new_rep group by 1),
f as (select date_time,product_name,New_/overall as NewS,Repeat_/overall as RepeatR from d join e using (date_time))
select date_time,product_name,NewS*Spend as NewSpend,RepeatR*Spend as RepeatSpend  from f join `gsheets_integration.hct_spends` hs on f.date_time=hs.month),
other_Product_Spend as (
with cte1 as(select cast(bcorder.order_id as string) as  order_id, foi.date_created,foi.item_sku_code_uc,foi.product_name_uc,
foi.product_value_inc_tax_inc_discount,bcordersh.phone,bcorder.order_source,fo.purchase_type from Bigcomm_data.bc_order bcorder
join Bigcomm_data.bc_order_billing_addresses bcordersh on bcorder.order_id=bcordersh.order_id join d2c.fact_order fo  on
fo.order_id=cast(bcorder.order_id as string) join d2c.fact_order_item foi on fo.order_id=foi.order_id
where order_source='manual' and fo.final_order_status not in ('INCOMPLETE','CANCELLED')),
cte2 as (select * from(select FORMAT_DATE('%B', date_time) as mon ,date_time,cast (Phno as string) as Phno,
case
when lower(cart_contents) like '%shilajit%gold%' or lower(visitor) like '%shilajit%gold%' then 'Shilajit Gold'
when lower(cart_contents) like '%shilajit%' or lower(visitor) like '%shilajit%' then 'Shilajit'
when lower(cart_contents) like '%get%slim%juice%' or lower(visitor) like '%get%slim%juice%' then 'Get Slim Juice'
when lower(cart_contents) like '%get%slim%mix%' or lower(visitor) like '%get%slim%mix%' then 'Get Slim Mix'
when lower(cart_contents) like '%dia%free%' or lower(visitor) like '%dia%free%' then 'Dia Free'
when lower(cart_contents) like '%glow%mix%' or lower(visitor) like '%glow%mix%' then 'Glow Mix'
else 'others'
end as product_name
from
`gsheets_integration.hct_all_leads` hct) where product_name ='others'),
cte3 as (select *,case when product_name_uc like 'KAPIVA HIMALAYA SHILAJIT%' then 'Shilajit'
when  product_name_uc like 'KAPIVA DIA FREE JUICE%' then 'Dia Free'
when  product_name_uc like 'KAPIVA GET SLIM JUICE%' then 'Get Slim Juice'
when  product_name_uc like 'KAPIVA SKIN FOODS GLOW%' then 'Glow Mix'
when  product_name_uc like 'KAPIVA HIM FOODS SHILAJIT GOLD RESIN - 20G%' then 'Shilajit Gold'
when  product_name_uc like 'KAPIVA GET SLIM MIX%' then 'Get Slim Mix'
else 'others'  end as final_product from cte1 a join cte2 b on   a.phone=b.Phno),
cte4 as(select final_product,date_time,purchase_type ,Sum(product_value_inc_tax_inc_discount) as revenue from cte3 group by 1,2,3),
cte5 as (select date_time,sum(product_value_inc_tax_inc_discount) As All_rev from cte3  group by 1)
select date_time,purchase_type,final_product,(revenue/All_rev) as contri from cte4 join cte5 using(date_time) group by 1,2,3,4
),
pre as(select date_time,purchase_type,final_product,contri*(NewSpend+RepeatSpend) as FPS from other_Product_Spend  left join lead_wise_spend using (date_time) where product_name='others'),
pre2 as (
select date_time,final_product, case when purchase_type='NEW' then FPS else NUll end as NewFinal, case when purchase_type='REPEAT' then FPS else Null end as RepeatFinal from pre),
other_Rev_Spe as (SELECT
b.date_time,
b.final_product,
a.NewFinal,
b.RepeatFinal from (select date_time,final_product,NewFinal from pre2 where NewFinal is not null) a right join (select date_time,final_product,RepeatFinal from pre2 where RepeatFinal is not null) b
on a.date_time=b.date_time and a.final_product=b.final_product)
select a.date_time ,a.product_name ,case when product_name='Get Slim Juice' then 'JUI104' when product_name='Dia Free' then 'JUI105' when  product_name='Shilajit' then 'MIS024'
When product_name='Glow Mix' then 'POW078'When product_name='Get Slim Mix' then 'POW079'When product_name='Shilajit Gold' then 'MIS033' else 'Other' end as item_sku_code_uc
,case when a.product_name='others' then COALESCE( b.NewFinal,0) else COALESCE(a.NewSpend,0)+COALESCE(b.NewFinal,0) end as HCT_Acq_final_spend ,
case when a.product_name='others' then COALESCE(b.RepeatFinal,0) else COALESCE(a.RepeatSpend,0)+COALESCE(b.RepeatFinal,0) end as HCT_Repeat_Final_spend
from lead_wise_spend a join other_Rev_Spe b on a.date_time=b.date_time and a.product_name=b.final_product) AS A group by 1,2
union all
select date(date_created),item_sku_code_uc from d2c.fact_order_item foi where item_sku_code_uc is not null group by 1,2) group by 1,2),


HCT_Spend_Nishant as (with lead_wise_spend as (with new_rep as(select date_time,case when new_repeat is null then 'Repeat' else new_repeat end as new_repeat ,cart_contents,visitor,
case
when lower(cart_contents) like '%shilajit%gold%' or lower(visitor) like '%shilajit%gold%' then 'Shilajit Gold'
when lower(cart_contents) like '%shilajit%' or lower(visitor) like '%shilajit%' then 'Shilajit'
when lower(cart_contents) like '%get%slim%juice%' or lower(visitor) like '%get%slim%juice%' then 'Get Slim Juice'
when lower(cart_contents) like '%get%slim%mix%' or lower(visitor) like '%get%slim%mix%' then 'Get Slim Mix'
when lower(cart_contents) like '%dia%free%' or lower(visitor) like '%dia%free%' then 'Dia Free'
when lower(cart_contents) like '%glow%mix%' or lower(visitor) like '%glow%mix%' then 'Glow Mix'
else 'others'
end as product_name
from
`gsheets_integration.hct_all_leads` hct ),
b as
(
select date_time, product_name,sum(case when new_repeat='New' then 1 end )as New_,
sum(case when new_repeat='Repeat' then 1 end )as Repeat_ from new_rep
group by 1,2
),
c as(select date_time,product_name,count(8) as tota from (select date_time,
case
when lower(cart_contents) like '%shilajit%gold%' or lower(visitor) like '%shilajit%gold%' then 'Shilajit Gold'
when lower(cart_contents) like '%shilajit%' or lower(visitor) like '%shilajit%' then 'Shilajit'
when lower(cart_contents) like '%get%slim%juice%' or lower(visitor) like '%get%slim%juice%' then 'Get Slim Juice'
when lower(cart_contents) like '%get%slim%mix%' or lower(visitor) like '%get%slim%mix%' then 'Get Slim Mix'
when lower(cart_contents) like '%dia%free%' or lower(visitor) like '%dia%free%' then 'Dia Free'
when lower(cart_contents) like '%glow%mix%' or lower(visitor) like '%glow%mix%' then 'Glow Mix'
else 'others'
end as product_name
from
`gsheets_integration.hct_all_leads` hct)vv group by 1,2),


d as (select c.date_time,b.product_name,New_ as New_,Repeat_ as Repeat_ from b join c on b.product_name=c.product_name and c.date_time=b.date_time group by 1,2,3,4),
e as (select date_time,count(product_name) as overall from new_rep group by 1),
f as (select date_time,product_name,New_/overall as NewS,Repeat_/overall as RepeatR from d join e using (date_time))
select date_time,product_name,NewS*Spend as NewSpend,RepeatR*Spend as RepeatSpend  from f join `gsheets_integration.hct_spends` hs on f.date_time=hs.month),

other_Product_Spend as (

with cte1 as(select cast(bcorder.order_id as string) as  order_id, foi.date_created,foi.item_sku_code_uc,foi.product_name_uc,
foi.product_value_inc_tax_inc_discount,bcordersh.phone,bcorder.order_source,fo.purchase_type from Bigcomm_data.bc_order bcorder
join Bigcomm_data.bc_order_billing_addresses bcordersh on bcorder.order_id=bcordersh.order_id join d2c.fact_order fo  on
fo.order_id=cast(bcorder.order_id as string) join d2c.fact_order_item foi on fo.order_id=foi.order_id

where order_source='manual' and fo.final_order_status not in ('INCOMPLETE','CANCELLED')),
cte2 as (select * from(select FORMAT_DATE('%B', date_time) as mon ,date_time,cast (Phno as string) as Phno,
case
when lower(cart_contents) like '%shilajit%gold%' or lower(visitor) like '%shilajit%gold%' then 'Shilajit Gold'
when lower(cart_contents) like '%shilajit%' or lower(visitor) like '%shilajit%' then 'Shilajit'
when lower(cart_contents) like '%get%slim%juice%' or lower(visitor) like '%get%slim%juice%' then 'Get Slim Juice'
when lower(cart_contents) like '%get%slim%mix%' or lower(visitor) like '%get%slim%mix%' then 'Get Slim Mix'
when lower(cart_contents) like '%dia%free%' or lower(visitor) like '%dia%free%' then 'Dia Free'
when lower(cart_contents) like '%glow%mix%' or lower(visitor) like '%glow%mix%' then 'Glow Mix'
else 'others'
end as product_name
from
`gsheets_integration.hct_all_leads` hct) where product_name ='others'),

cte3 as (select *,case when product_name_uc like 'KAPIVA HIMALAYA SHILAJIT%' then 'Shilajit'
when  product_name_uc like 'KAPIVA DIA FREE JUICE%' then 'Dia Free'
when  product_name_uc like 'KAPIVA GET SLIM JUICE%' then 'Get Slim Juice'
when  product_name_uc like 'KAPIVA SKIN FOODS GLOW%' then 'Glow Mix'
when  product_name_uc like 'KAPIVA HIM FOODS SHILAJIT GOLD RESIN - 20G%' then 'Shilajit Gold'
when  product_name_uc like 'KAPIVA GET SLIM MIX%' then 'Get Slim Mix'
else 'others'  end as final_product from cte1 a join cte2 b on   a.phone=b.Phno),
cte4 as(select final_product,date_time,purchase_type ,Sum(product_value_inc_tax_inc_discount) as revenue from cte3 group by 1,2,3),
cte5 as (select date_time,sum(product_value_inc_tax_inc_discount) As All_rev from cte3  group by 1)
select date_time,purchase_type,final_product,(revenue/All_rev) as contri from cte4 join cte5 using(date_time) group by 1,2,3,4

),

pre as(select date_time,purchase_type,final_product,contri*(NewSpend+RepeatSpend) as FPS from other_Product_Spend  left join lead_wise_spend using (date_time) where product_name='others'),
pre2 as (
select date_time,final_product, case when purchase_type='NEW' then FPS else NUll end as NewFinal, case when purchase_type='REPEAT' then FPS else Null end as RepeatFinal from pre),
other_Rev_Spe as (SELECT
b.date_time,
b.final_product,
a.NewFinal,
b.RepeatFinal from (select date_time,final_product,NewFinal from pre2 where NewFinal is not null) a right join (select date_time,final_product,RepeatFinal from pre2 where RepeatFinal is not null) b
on a.date_time=b.date_time and a.final_product=b.final_product)
select a.date_time ,a.product_name ,case when product_name='Get Slim Juice' then 'JUI104' when product_name='Dia Free' then 'JUI105' when  product_name='Shilajit' then 'MIS024'
When product_name='Glow Mix' then 'POW078'When product_name='Get Slim Mix' then 'POW079'When product_name='Shilajit Gold' then 'MIS033' else 'Other' end as item_sku_code_uc


,case when a.product_name='others' then COALESCE( b.NewFinal,0) else COALESCE(a.NewSpend,0)+COALESCE(b.NewFinal,0) end as HCT_Acq_final_spend ,
case when a.product_name='others' then COALESCE(b.RepeatFinal,0) else COALESCE(a.RepeatSpend,0)+COALESCE(b.RepeatFinal,0) end as HCT_Repeat_Final_spend
from lead_wise_spend a join other_Rev_Spe b on a.date_time=b.date_time and a.product_name=b.final_product
),



Doc_Channel_Nishant as (with cte as(select dcw.mobile,cast(fo.date_created as date) as Order_date,cast(dcw.consultation_date as date) as Consult_Date,foi.item_sku_code_uc,foi.product_value_inc_tax_inc_discount,fo.purchase_type,fo.Order_id
from datawarehouse-kapiva.docs.docs_consultation dcw  join d2c.fact_order fo on fo.shipping_contact_number=dcw.mobile
join d2c.fact_order_item foi on fo.order_id=foi.order_id),
cte2 as (select Consult_Date, purchase_type,item_sku_code_uc,sum(product_value_inc_tax_inc_discount) as Revenue from cte where  Order_date>=Consult_Date and  date_diff(date(order_date),date(Consult_Date),day)<=15 group by 1,2,3),
cte3 as(select Consult_Date,sum(Revenue) as total_revenue from cte2 group by 1),
cte4 as (select a.Consult_Date,a.item_sku_code_uc,purchase_type,(Revenue/total_revenue) as contri from cte2 a join cte3 b on a.Consult_Date=b.Consult_Date),
cte5 as (select Month,Spend from gsheets_integration.doc_spends),cte6 as (
select a.Consult_Date,a.item_sku_code_uc,a.purchase_type,a.contri*b.Spend as spend_ from cte4 a join cte5 b on a.Consult_Date=b.Month
),

cte7 as (SELECT * FROM
CTE6
PIVOT(SUM(spend_) FOR purchase_type IN ('NEW' as New_Sep,'REPEAT' As Repeat_Sep)))
select Consult_Date as date_created,item_sku_code_uc,COALESCE(New_Sep,0) as Doc_New_Spend,COALESCE(Repeat_Sep,0) as Doc_Rep_Spend from cte7),
influencer_Anupam as (with influencer as

#NAME?
(select
date(order_date)date_, channel, uc_sku_code, product, (sum(spends.spends)*0.50)*0.93 as acq_influencer_spend, (sum(spends.spends)*0.50)*0.07 as repeat_influencer_spend
from gsheets_integration.spends
where platform in ('Youtube', 'Youtube - Short', 'Instagram')
group by 1,2,3,4) ,
a as(

#NAME?
select
date(order_date)date_, channel, uc_sku_code, product, (sum(spends.spends)*0.50)*0.93 as acq_content_marketing_spend, (sum(spends.spends)*0.50)*0.07 as repeat_content_marketing_spend
from gsheets_integration.spends
where platform in ('Content Marketing')
group by 1,2,3,4

)


select (case when a.date_ is null then i.date_ else a.date_ end) as final_date,
(case when a.uc_sku_code is null then i.uc_sku_code else a.uc_sku_code end) as uc_code,
(case when i.acq_influencer_spend is null then 0 else i.acq_influencer_spend end) as acq_influencer_spend,
(case when i.repeat_influencer_spend is null then 0 else i.repeat_influencer_spend end) as repeat_influencer_spend,
(case when a.acq_content_marketing_spend is null then 0 else a.acq_content_marketing_spend end ) as acq_content_marketing_spend,
(case when a.repeat_content_marketing_spend is null then 0 else a.repeat_content_marketing_spend end) as repeat_content_marketing_spend from influencer i full outer join a on a.uc_sku_code = i.uc_sku_code
and a.date_ = i.date_
),
FB_Spend_Utkarsh as (select order_date,uc_code,sum(case when platform in ('Facebook-Acq') then spend end) as FB_Acq_Spend,sum(case when platform in ('Facebook-Repeat') then spend end) as FB_Repeat_Spend
from
(select order_date,platform,(case when uc_sku_code in ('All','#N/A') then 'Other' else uc_sku_code end) as uc_code,product,sum(Acq_spends) as spend from
(select order_date,(select 'Facebook-Acq') as platform,uc_sku_code,product,(sum(Spends.Spends)*0.7*0.8) as Acq_spends
from gsheets_integration.spends where Platform IN ('Facebook - TOF','Facebook - Advantage')group by 1,2,3,4
union all
select order_date,(select 'Facebook-Acq') as platform,uc_sku_code,product,(sum(Spends.Spends)*0.8) as Acq_spends
from gsheets_integration.spends where Platform IN ('Facebook - MOF','Facebook - BOF')group by 1,2,3,4
union all
select order_date,(select 'Facebook-Repeat') as platform,uc_sku_code,product,(sum(Spends.Spends)*0.7*0.2) as Repeat_spends
from gsheets_integration.spends where Platform IN ('Facebook - TOF','Facebook - Advantage') group by 1,2,3,4
union all
select order_date,(select 'Facebook-Repeat') as platform,uc_sku_code,product,(sum(Spends.Spends)*0.2) as Repeat_spends
from gsheets_integration.spends where Platform IN ('Facebook - MOF','Facebook - BOF')group by 1,2,3,4) group by 1,2,3,4) group by 1,2),
Affi_Spend_Utkar as (with cte as (
select
Cast(foi.date_created AS date) as created_date,
foi.item_sku_code_uc,
sum(foi.product_value_inc_tax_inc_discount),
sum (
CASE
WHEN fo.Purchase_type = 'NEW' THEN product_value_inc_tax_inc_discount ELSE 0
END) as New_Revenue,

sum (CASE
WHEN fo.Purchase_type = 'REPEAT' THEN product_value_inc_tax_inc_discount ELSE 0
END) as Repeat_Revenue,

sum(foi.product_value_inc_tax_inc_discount) as Total_Revenue
from
d2c.fact_order_item foi
join d2c.fact_order fo
on foi.Order_id = fo.order_id
where
Attribution_tagging = 'Affiliates' and
fo.Channel ='BIGCOMMERCE'
group by
Cast(foi.date_created AS date),
foi.item_sku_code_uc),

cteday as (
select
Cast(foi.date_created AS date) as per_created_date,
sum(foi.product_value_inc_tax_inc_discount),
sum (
CASE
WHEN fo.Purchase_type = 'NEW' THEN product_value_inc_tax_inc_discount ELSE 0
END) as per_New_Revenue,

sum (CASE
WHEN fo.Purchase_type = 'REPEAT' THEN product_value_inc_tax_inc_discount ELSE 0
END) as per_Repeat_Revenue,

sum(foi.product_value_inc_tax_inc_discount) as Total_Revenue
from
d2c.fact_order_item foi
join d2c.fact_order fo
on foi.Order_id = fo.order_id
where
Attribution_tagging = 'Affiliates' and
fo.Channel ='BIGCOMMERCE'
group by
Cast(foi.date_created AS date)),
cte1 as
(select order_date as day
,sum(spends.spends) as cost
from gsheets_integration.spends where platform in ('Affiliates')
group by 1
order by order_date desc),
ctefinal as (
select
a.created_date as order_date,
a.item_sku_code_uc as uc_code,
(a.New_Revenue/ (d.per_Repeat_Revenue + d.per_New_Revenue)) * b.cost as Aff_New_spend,
(a.Repeat_Revenue/(d.per_Repeat_Revenue + d.per_New_Revenue))*b.cost as Aff_Repeat_Spend

from cte a
join cte1 b on a.created_date=b.day
join cteday d on d.per_created_date = b.day
where a.Total_Revenue > 0
)
select * from ctefinal
order by order_date desc),


Partner_Spend_Utkarsh as (with cte as (
select
Cast(foi.date_created AS date) as created_date,
foi.item_sku_code_uc,
sum(foi.product_value_inc_tax_inc_discount),
sum (
CASE
WHEN fo.Purchase_type = 'NEW' THEN product_value_inc_tax_inc_discount ELSE 0
END) as New_Revenue,
sum (CASE
WHEN fo.Purchase_type = 'REPEAT' THEN product_value_inc_tax_inc_discount ELSE 0
END) as Repeat_Revenue,
sum(foi.product_value_inc_tax_inc_discount) as Total_Revenue
from
d2c.fact_order_item foi
join d2c.fact_order fo
on foi.Order_id = fo.order_id
where
Attribution_tagging = 'Partnership' and
fo.Channel ='BIGCOMMERCE'
group by
Cast(foi.date_created AS date),
foi.item_sku_code_uc),
cteday as (
select
Cast(foi.date_created AS date) as per_created_date,
sum(foi.product_value_inc_tax_inc_discount),
sum (
CASE
WHEN fo.Purchase_type = 'NEW' THEN product_value_inc_tax_inc_discount ELSE 0
END) as per_New_Revenue,
sum (CASE
WHEN fo.Purchase_type = 'REPEAT' THEN product_value_inc_tax_inc_discount ELSE 0
END) as per_Repeat_Revenue,
sum(foi.product_value_inc_tax_inc_discount) as Total_Revenue
from
d2c.fact_order_item foi
join d2c.fact_order fo
on foi.Order_id = fo.order_id
where
Attribution_tagging = 'Partnership' and
fo.Channel ='BIGCOMMERCE'
group by
Cast(foi.date_created AS date)),
cte1 as
(select order_date as day
,sum(spends.spends) as cost
from gsheets_integration.spends where platform in ('Partnership')
group by 1
order by order_date desc),
ctefinal as (
select
a.created_date as order_date,
a.item_sku_code_uc as uc_code,
(a.New_Revenue/ (d.per_Repeat_Revenue + d.per_New_Revenue)) * b.cost as Partnership_New_spend,
(a.Repeat_Revenue/(d.per_Repeat_Revenue + d.per_New_Revenue))*b.cost as Partnership_Repeat_Spend
from cte a
join cte1 b on a.created_date=b.day
join cteday d on d.per_created_date = b.day
where a.Total_Revenue > 0
)
select * from ctefinal
order by order_date desc),


NWS_Anu as (select
date(order_date) as order_date, uc_sku_code as uc_code, (sum(spends.spends)*0.50)*0.80 as acq_non_working_spend, (sum(spends.spends)*0.50)*0.20 as repeat_non_working_spend
from gsheets_integration.spends
where platform in ('NM')
group by 1,2),

Google_Spe_Utkar as (with cte as(
select order_date,Platform,uc_sku_code,product,(sum(Spends.Spends)*0.7*0.8) as Google_TOF_acq_Spends
from gsheets_integration.spends where Platform IN ('Google - TOF') group by 1,2,3,4)  ,
---order by order_date desc),

cte1 as(
select order_date,Platform,uc_sku_code,product,sum((Spends.Spends)*0.8) as Google_BOF_acq_Spends
from gsheets_integration.spends where Platform IN ('Google - BOF') group by 1,2,3,4 ),

cte2 as(select a.order_date,a.Platform, a.uc_sku_code ,a.product,a.Google_TOF_acq_Spends+b.Google_BOF_acq_Spends as Google_Acq_Spend
from cte a
join cte1 b on a.order_date=b.order_date and a.uc_sku_code=b.uc_sku_code
group by a.order_date,a.Platform,a.uc_sku_code,a.product,Google_Acq_Spend ),

cte3 as (select order_date,Platform,uc_sku_code,product,sum((Spends.Spends)*0.7*0.2) as Google_TOF_Repeat_Spends
from gsheets_integration.spends where Platform IN ('Google - TOF') group by 1,2,3,4
),

cte4 as (select order_date,Platform,uc_sku_code,product,sum(Spends.Spends)*0.2 as Google_BOF_Repeat_Spends
from gsheets_integration.spends where Platform IN ('Google - BOF') group by 1,2,3,4) ,

cte5 as(select a.order_date,a.Platform,a.uc_sku_code,a.product,a.Google_TOF_Repeat_Spends+b.Google_BOF_Repeat_Spends as Google_Repeat_Spend
from cte3 a
join cte4 b on a.order_date=b.order_date and a.uc_sku_code=b.uc_sku_code
group by a.order_date,a.Platform,a.uc_sku_code,a.product,Google_Repeat_Spend )


select a.order_date,a.uc_sku_code,a.Google_Acq_Spend,b.Google_Repeat_Spend from cte2 a join cte5 b on a.order_date=b.order_date and a.uc_sku_code=b.uc_sku_code),



CRM_Spend_Ajay as (with cte as (
select
Cast(foi.date_created AS date) as created_date,
foi.item_sku_code_uc,
sum(foi.product_value_inc_tax_inc_discount),
sum (
CASE
WHEN fo.Purchase_type = 'NEW' THEN product_value_inc_tax_inc_discount ELSE 0
END) as New_Revenue,
sum (CASE
WHEN fo.Purchase_type = 'REPEAT' THEN product_value_inc_tax_inc_discount ELSE 0
END) as Repeat_Revenue,
sum(foi.product_value_inc_tax_inc_discount) as Total_Revenue
from
d2c.fact_order_item foi
join d2c.fact_order fo
on foi.Order_id = fo.order_id
where
Attribution_tagging = 'Moengage' and
fo.Channel ='BIGCOMMERCE'
group by
Cast(foi.date_created AS date),
foi.item_sku_code_uc),
cteday as (
select
Cast(foi.date_created AS date) as per_created_date,
sum(foi.product_value_inc_tax_inc_discount),
sum (
CASE
WHEN fo.Purchase_type = 'NEW' THEN product_value_inc_tax_inc_discount ELSE 0
END) as per_New_Revenue,
sum (CASE
WHEN fo.Purchase_type = 'REPEAT' THEN product_value_inc_tax_inc_discount ELSE 0
END) as per_Repeat_Revenue,
sum(foi.product_value_inc_tax_inc_discount) as Total_Revenue
from
d2c.fact_order_item foi
join d2c.fact_order fo
on foi.Order_id = fo.order_id
where
Attribution_tagging = 'Moengage' and
fo.Channel ='BIGCOMMERCE'
group by
Cast(foi.date_created AS date)),
cte1 as
(select order_date as day
,sum(spends.spends) as cost
from gsheets_integration.spends where platform in ('Moengage')
group by 1
order by order_date desc),
ctefinal as (
select
a.created_date,
a.item_sku_code_uc,
(a.New_Revenue/ (d.per_Repeat_Revenue + d.per_New_Revenue)) * b.cost as Crm_New_spend,
(a.Repeat_Revenue/(d.per_Repeat_Revenue + d.per_New_Revenue))*b.cost as Crm_Repeat_Spend
from cte a
join cte1 b on a.created_date=b.day
join cteday d on d.per_created_date = b.day
where a.Total_Revenue > 0
)
select * from ctefinal
order by created_date desc)


SELECT
a.order_date,
a.item_sku_code_uc,
b.HCT_Acq_final_spend,
b.HCT_Repeat_Final_spend,
c.Doc_New_Spend,
c.Doc_Rep_Spend,
d.acq_influencer_spend,
d.repeat_influencer_spend,
d.acq_content_marketing_spend,
d.repeat_content_marketing_spend,
e.FB_Acq_Spend,
e.FB_Repeat_Spend,
f.Aff_New_spend,
f.Aff_Repeat_Spend,
g.Partnership_New_spend,
g.Partnership_Repeat_Spend,
h.acq_non_working_spend,
h.repeat_non_working_spend ,
i.Google_Acq_Spend,
i.Google_Repeat_Spend,
j.Crm_New_spend,
j.Crm_Repeat_Spend
FROM
Sku_map a
LEFT JOIN
HCT_Spend_Nishant b ON a.order_date = b.date_time AND a.item_sku_code_uc = b.item_sku_code_uc
left JOIN
Doc_Channel_Nishant c ON a.order_date = c.date_created AND a.item_sku_code_uc = c.item_sku_code_uc
left JOIN
influencer_Anupam d on a.order_date = d.final_date AND a.item_sku_code_uc = d.uc_code
left JOIN
FB_Spend_Utkarsh e on a.order_date = e.order_date AND a.item_sku_code_uc = e.uc_code
left JOIN
Affi_Spend_Utkar f on a.order_date = f.order_date AND a.item_sku_code_uc = f.uc_code
left JOIN
Partner_Spend_Utkarsh g on a.order_date = g.order_date AND a.item_sku_code_uc = g.uc_code
left JOIN
NWS_Anu h on a.order_date = h.order_date AND a.item_sku_code_uc = h.uc_code
left JOIN
Google_Spe_Utkar i on a.order_date = i.order_date AND a.item_sku_code_uc= i.uc_sku_code
left JOIN
CRM_Spend_Ajay j on a.order_date = j.created_date AND a.item_sku_code_uc= j.item_sku_code_uc order by order_date desc
)
where order_date between date('2023-06-01') and current_date-1

) as spends

on


revenue.date_created = spends.order_date and revenue.item_sku_code_uc = spends.item_sku_code_uc
order by date_created desc, acq_net_revenue desc
) ) as final

left join

(

select product_code, name, therapy, group_, type
from gsheets_integration.item_master

) as name

on

final.item_sku_code_uc = name.product_code
order by date_created asc, acq_net_revenue desc
)


union all

(-- Marketplace Final

select
"Date		                            as date_created"
",sku_id		                    as item_sku_code_uc"
",portal		                    as portal"
",product_name		                    as name"
",cast (mrp_revenue as numeric)		    as mrp_revenue"
",product_therapy		            as therapy"
",product_group		                    as group_"
",product_type		                    as type"
",cast(Net_Rev		                    as numeric)  as net_revenue"
",cast(net_quantity		            as numeric)  as net_quantity"
",cast(net_cogs		                    as numeric)  as net_cogs"
",cast(total_spends		            as numeric)  as total_spends"
",cast(net_logs		                      as numeric)  as net_logs"
",cast(net_cm1		                      as numeric)  as net_cm1"
",cast(net_cm2		                      as numeric)  as net_cm2"
",cast(net_cm3 as numeric )		    as net_cm3"
,cast(total_allocated_d2c_spends          as numeric)  as total_allocated_d2c_spends
,cast( total_allocated_non_working_spends as numeric)  as   total_allocated_non_working_spends
,cast (total_allocated_influencer_spends  as numeric)as  total_allocated_influencer_spends
",cast(total_allocated_content_marketing_spends as numeric)  as	total_allocated_content_marketing_spends"
,cast(offtake_revenue  as numeric)  as offtake_revenue
",cast(offtake_quantity as numeric)	as offtake_quantity"
",cast(offtake_discount as numeric)	as offtake_discount"
,cast(0 as numeric) as acq_mrp_revenue
,cast(0 as numeric) as rep_mrp_revenue
,cast (0 as numeric) as acq_item_discount
,cast (0 as numeric) as rep_item_discount
,cast (0 as numeric) as acq_listing_discount_uc
,cast (0 as numeric) as rep_listing_discount_uc
,cast (0 as numeric) as acq_gross_revenue
,cast (0 as numeric) as rep_gross_revenue
,cast (0 as numeric) as acq_net_revenue
,cast (0 as numeric) as rep_net_revenue
,cast (0 as numeric) as acq_quantity
,cast (0 as numeric) as rep_quantity
,cast (0 as numeric) as acq_cogs
,cast (0 as numeric) as rep_cogs
,cast (0 as numeric) as acq_logs
,cast (0 as numeric) as rep_logs
,cast (0 as numeric) as HCT_Acq_final_spend
,cast (0 as numeric) as HCT_Repeat_final_spend
,cast (0 as numeric) as Doc_New_Spend
,cast (0 as numeric) as Doc_Rep_Spend
,cast (0 as numeric) as acq_influencer_spend
,cast (0 as numeric) as repeat_influencer_spend
,cast (0 as numeric) as acq_content_marketing_spend
,cast (0 as numeric) as repeat_content_marketing_spend
,cast (0 as numeric) as FB_Acq_Spend
,cast (0 as numeric) as FB_Repeat_Spend
,cast (0 as numeric) as Aff_New_spend
,cast (0 as numeric) as Aff_Repeat_Spend
,cast (0 as numeric) as Partnership_New_spend
,cast (0 as numeric) as Partnership_Repeat_spend
,cast (0 as numeric) as acq_non_working_spend
,cast (0 as numeric) as repeat_non_working_spend
,cast (0 as numeric) as Google_Acq_Spend
,cast (0 as numeric) as Google_Repeat_Spend
,cast (0 as numeric) as Crm_New_spend
,cast (0 as numeric) as Crm_Repeat_spend

from (
with cte1 as (

select distinct Date, ERP_Code_, Portal, Channel_Product_Name, Sales_Value, Sales_Units,
sub_therapy, Group_, Type,
Net_Units ,extract(month from Date) month_, extract(year from Date) year_ , Net_Rev , MRP, COGS_inc_inward_LOGS_
from gsheets_integration.marketplace_drt mdrt
left join gsheets_integration.item_master im
on im.Product_Code = mdrt.ERP_Code_
left join gsheets_integration.dim_sku_cogs_mrp skm
on mdrt.ERP_Code_ = skm.UC_SKU_Code and extract(month from skm.month_year) = 6 and EXTRACT(year from month_year) = 2023 and Active___Inactive in ('Active')
where portal in ('Amazon MP', 'Amazon RK', 'Flipkart Alpha', 'Flipkart MP', 'Nykaa') and date(Date)>= date('2023-06-01')  and lower(type_primary_offtake_)='tertiary' and erp_code_ is not null



)
,


log as (
select *, extract(month from month) month_, extract(year from month) year_ from gsheets_integration.mp_logs

),

base_without_spends as(
select cte1.*,
case when log.Logs_per_Unit is null and portal in ('Amazon RK','Nykaa','Flipkart Alpha') then 15
when log.Logs_per_Unit is null and portal in ('Flipkart MP','Amazon MP') then 0
else log.Logs_per_Unit end as logs,
case when portal = 'Amazon MP' then 'Amazon'
when portal = 'Flipkart MP' then 'Flipkart'
when portal = 'Nykaa' then 'Nykaa'
else null  end as platform
from cte1
left join  log
on log.sku = cte1.ERP_Code_ and log.channel = cte1.portal and log.month_ = cte1.month_ - 2 and log.year_ = cte1.year_
),

base as(
select bs.Date,bs.ERP_Code_,bs.portal,Channel_Product_Name,mrp,Sales_Value,case when Sales_Units in (null,0) then 1 else Sales_Units end as Sales_Units ,
COGS_inc_inward_LOGS_,sub_therapy,group_,type,Net_Units,month_,year_,Net_Rev,logs,bs.platform, s.spends
from base_without_spends bs left join gsheets_integration.spends s  on s.order_date = bs.Date and s.platform = bs.platform and s.uc_sku_code = bs.ERP_Code_
),

base1 as (
select Date, ERP_Code_ as sku_id, portal, Channel_Product_Name as product_name, case when mrp*Sales_Units in (null,0) then 0 else mrp*Sales_Units end as mrp_revenue, Sales_Value as offtake_revenue,
Sales_Units as offtake_quantity, 1-(Sales_Value/( mrp*Sales_Units)) as offtake_discount, sub_therapy as product_therapy,
group_ as product_group, type as product_type, case when Net_Rev is null then 0 else Net_Rev end as Net_Rev, case when Net_Units is null then 0 else Net_Units end as net_quantity,
case when COGS_inc_inward_LOGS_*Net_Units is null then 0 else COGS_inc_inward_LOGS_*Net_Units end as net_cogs,
case when spends is null then 0 else spends end as total_spends,
case when logs*Net_Units in (null,0) then 0.3*Net_Rev else logs*Net_Units end as net_logs
from base ),



cm1 as (
select *, Net_Rev - net_cogs - net_logs as net_cm1
from base1)
,
cm2 as (
select *, net_cm1 - total_spends as net_cm2
from cm1),

amazon as (

select *, case when  platform = 'Facebook - TOF' then 'Amazon MP'
when  platform = 'Google - TOF' then 'Amazon MP'
end as platform_ from gsheets_integration.spends
where platform in ('Facebook - TOF', 'Google - TOF')
),

flipkart as (
select *, case when  platform = 'Facebook - TOF' then 'Flipkart MP'
when  platform = 'Google - TOF' then 'Flipkart MP'
end as platform_ from gsheets_integration.spends
where platform in ('Facebook - TOF', 'Google - TOF')
),

union_ as (
select * from amazon
union distinct
select * from flipkart
),

allocated_d2c_spends as (
select order_date , platform_, uc_sku_code, 0.15* sum(spends) as spends_ from union_ group by 1,2,3
),


amazon_1 as (

select *, case when  platform = 'NM' then 'Amazon MP'
end as platform_ from gsheets_integration.spends
where platform in ('NM')
),

flipkart_1 as (
select *, case when  platform = 'NM' then 'Flipkart MP'
end as platform_ from gsheets_integration.spends
where platform in ('NM')
)

,

union_1 as (
select * from amazon_1
union distinct
select * from flipkart_1
),

non_marketing_spends as (
select order_date , platform_, uc_sku_code, 0.25* sum(spends) as spends_ from union_1 group by 1,2,3),


cm2_1 as(

select cm2.*, case when spends_ is null then 0 else spends_ end as total_allocated_d2c_spends from cm2 left join allocated_d2c_spends spe on cm2.Date = spe.order_date
and cm2.sku_id = spe.uc_sku_code and cm2.portal = spe.platform_),


cm2_2 as (

select cm2_1.*, case when spe.spends_ is null then 0 else spe.spends_ end as total_allocated_non_working_spends  from cm2_1 left join non_marketing_spends spe on cm2_1.Date = spe.order_date
and cm2_1.sku_id = spe.uc_sku_code and cm2_1.portal = spe.platform_),
amazon_2 as (
select *, case when  platform = 'Youtube' then 'Amazon MP'
when  platform = 'Instagram' then 'Amazon MP'
when platform = 'Youtube - Short' then 'Amazon MP'
end as platform_ from gsheets_integration.spends
where platform in ('Youtube','Instagram')
),
flipkart_2 as (
select *, case when  platform = 'Youtube' then 'Flipkart MP'
when  platform = 'Instagram' then 'Flipkart MP'
when platform = 'Youtube - Short' then 'Flipkart MP'
end as platform_ from gsheets_integration.spends
where platform in ('Youtube', 'Instagram')
),
union_2 as (
select * from amazon_2
union distinct
select * from flipkart_2
),
total_allocated_influencer_spends as (
select order_date , platform_, uc_sku_code, 0.25* sum(spends) as spends_ from union_2 group by 1,2,3
),

cm2_3 as (
select cm2_2.*, case when spe.spends_ is null then 0 else spe.spends_ end as total_allocated_influencer_spends from cm2_2 left join total_allocated_influencer_spends spe on cm2_2.Date = spe.order_date
and cm2_2.sku_id = spe.uc_sku_code and cm2_2.portal = spe.platform_
),

amazon_3 as (
select *, case when  platform = 'Content Marketing' then 'Amazon MP'
end as platform_ from gsheets_integration.spends
where platform in ('Content Marketing')
),
flipkart_3 as (
select *, case when  platform = 'Content Marketing' then 'Flipkart MP'
end as platform_ from gsheets_integration.spends
where platform in ('Content Marketing')
),
union_3 as (
select * from amazon_3
union distinct
select * from flipkart_3
),
total_allocated_content_marketing_spends as (
select order_date , platform_, uc_sku_code, 0.25* sum(spends) as spends_ from union_3 group by 1,2,3
),

cm2_final as (
select cm2_3.*, case when spe.spends_ is null then 0 else spe.spends_ end as total_allocated_content_marketing_spends from cm2_3 left join total_allocated_content_marketing_spends spe on cm2_3.Date = spe.order_date
and cm2_3.sku_id = spe.uc_sku_code and cm2_3.portal = spe.platform_
)

select *, net_cm2 - total_allocated_d2c_spends - total_allocated_influencer_spends - total_allocated_content_marketing_spends - total_allocated_non_working_spends  as net_cm3
from cm2_final))

union all


#NAME?
select
"Date		                            as date_created"
",sku_id		                            as item_sku_code_uc"
",portal		                            as portal"
",product_name		                    as name"
",cast (mrp_revenue as numeric)		                        as mrp_revenue"
",product_therapy		                    as therapy"
",product_group		                    as group_"
",product_type		                    as type"
",cast(Net_Rev		                      as numeric)  as net_revenue"
",cast(net_quantity		                  as numeric)  as net_quantity"
",cast(net_cogs		                      as numeric)  as net_cogs"
",cast(total_spends		                  as numeric)  as total_spends"
",cast(net_logs		                      as numeric)  as net_logs"
",cast(net_cm1		                      as numeric)  as net_cm1"
",cast(net_cm2		                      as numeric)  as net_cm2"
",cast(net_cm3 as numeric )		    as net_cm3"
,cast(total_allocated_d2c_spends          as numeric)  as total_allocated_d2c_spends
,cast( 0 as numeric)  as   total_allocated_non_working_spends
,cast (total_allocated_influencer_spends  as numeric)as  total_allocated_influencer_spends
",cast(total_allocated_content_marketing_spends as numeric)  as	total_allocated_content_marketing_spends"
,cast(offtake_revenue  as numeric)  as offtake_revenue
",cast(offtake_quantity as numeric)	as offtake_quantity"
",cast(offtake_discount as numeric)	as offtake_discount"
,cast(0 as numeric) as acq_mrp_revenue
,cast(0 as numeric) as rep_mrp_revenue
,cast (0 as numeric) as acq_item_discount
,cast (0 as numeric) as rep_item_discount
,cast (0 as numeric) as acq_listing_discount_uc
,cast (0 as numeric) as rep_listing_discount_uc
,cast (0 as numeric) as acq_gross_revenue
,cast (0 as numeric) as rep_gross_revenue
,cast (0 as numeric) as acq_net_revenue
,cast (0 as numeric) as rep_net_revenue
,cast (0 as numeric) as acq_quantity
,cast (0 as numeric) as rep_quantity
,cast (0 as numeric) as acq_cogs
,cast (0 as numeric) as rep_cogs
,cast (0 as numeric) as acq_logs
,cast (0 as numeric) as rep_logs
,cast (0 as numeric) as HCT_Acq_final_spend
,cast (0 as numeric) as HCT_Repeat_final_spend
,cast (0 as numeric) as Doc_New_Spend
,cast (0 as numeric) as Doc_Rep_Spend
,cast (0 as numeric) as acq_influencer_spend
,cast (0 as numeric) as repeat_influencer_spend
,cast (0 as numeric) as acq_content_marketing_spend
,cast (0 as numeric) as repeat_content_marketing_spend
,cast (0 as numeric) as FB_Acq_Spend
,cast (0 as numeric) as FB_Repeat_Spend
,cast (0 as numeric) as Aff_New_spend
,cast (0 as numeric) as Aff_Repeat_Spend
,cast (0 as numeric) as Partnership_New_spend
,cast (0 as numeric) as Partnership_Repeat_spend
,cast (0 as numeric) as acq_non_working_spend
,cast (0 as numeric) as repeat_non_working_spend
,cast (0 as numeric) as Google_Acq_Spend
,cast (0 as numeric) as Google_Repeat_Spend
,cast (0 as numeric) as Crm_New_spend
,cast (0 as numeric) as Crm_Repeat_spend


from (
select tab1.date, tab1.sku_id, tab1.portal, tab1.Product_name, tab1.mrp_revenue, tab1.offtake_revenue, tab1.offtake_quantity, tab1.offtake_discount, tab1.Product_therapy,
tab1.product_group, tab1.product_type, tab1.net_rev, tab1.net_quantity, tab1.net_cogs, tab1.total_spends, tab1.net_logs, tab1.net_cm1, tab1.net_cm2,
tab1. total_allocated_d2c_spends, tab1.total_allocated_influencer_spends, tab1.total_allocated_content_marketing_spends,
(case when tab2.spends is null then 0 else tab2.spends end) as team_variable_cost ,(case when tab1.net_cm3 is null then 0 else tab1.net_cm3 end) - (case when tab2.spends is null then 0 else tab2.spends end) as net_cm3
from (
with cte1 as (
select distinct Date, ERP_Code_, Portal, Channel_Product_Name, Sales_Value, Sales_Units,
sub_therapy, Group_, Type,
Net_Units ,extract(month from Date) month_, extract(year from Date) year_ , Net_Rev , MRP, COGS_inc_inward_LOGS_
from gsheets_integration.marketplace_drt mdrt
left join gsheets_integration.item_master im
on im.Product_Code = mdrt.ERP_Code_
left join gsheets_integration.dim_sku_cogs_mrp skm
on TRIM(mdrt.ERP_Code_) = TRIM(skm.UC_SKU_Code) and
extract(month from skm.month_year) = 6 and EXTRACT(year from month_year) = 2023
--  and Active___Inactive in ('Active')
where portal in ('Amazon MP', 'Amazon RK', 'Flipkart Alpha', 'Flipkart MP', 'Nykaa') and date(Date)>= '2023-06-01'  and lower(type_primary_offtake_)='tertiary' and erp_code_ is not null
)
,
log as (
select *, extract(month from month) month_, extract(year from month) year_ from gsheets_integration.mp_logs
),
base_without_spends as(
select cte1.*,
case when log.Logs_per_Unit is null and portal in ('Amazon RK','Nykaa','Flipkart Alpha') then 20
when log.Logs_per_Unit is null and portal in ('Flipkart MP','Amazon MP') then 0
else log.Logs_per_Unit + 15 end as logs,
case when portal = 'Amazon MP' then 'Amazon'
when portal = 'Flipkart MP' then 'Flipkart'
when portal = 'Nykaa' then 'Nykaa'
else null  end as platform
from cte1
left join  log
on log.sku = cte1.ERP_Code_ and log.channel = cte1.portal and log.month_ = cte1.month_ - 2 and log.year_ = cte1.year_
),
base as(
select bs.Date,bs.ERP_Code_,bs.portal,Channel_Product_Name,mrp,Sales_Value,case when Sales_Units in (null,0) then 1 else Sales_Units end as Sales_Units ,
COGS_inc_inward_LOGS_,sub_therapy,group_,type,Net_Units,month_,year_,Net_Rev,logs,bs.platform, s.spends
from base_without_spends bs left join gsheets_integration.spends s  on s.order_date = bs.Date and s.platform = bs.platform and s.uc_sku_code = bs.ERP_Code_
),
base1 as (
select Date, ERP_Code_ as sku_id, portal, Channel_Product_Name as product_name, case when mrp*Sales_Units in (null,0) then 0 else mrp*Sales_Units end as mrp_revenue, Sales_Value as offtake_revenue,
Sales_Units as offtake_quantity, 1-(Sales_Value/( mrp*Sales_Units)) as offtake_discount, sub_therapy as product_therapy,
group_ as product_group, type as product_type, case when Net_Rev is null then 0 else Net_Rev end as Net_Rev, case when Net_Units is null then 0 else Net_Units end as net_quantity,
case when COGS_inc_inward_LOGS_*Net_Units is null then 0 else COGS_inc_inward_LOGS_*Net_Units end as net_cogs,
case when spends is null then 0 else spends end as total_spends,
case when logs*Net_Units in (null,0) then 0.35*Net_Rev else logs*Net_Units end as net_logs
from base ),
cm1 as (
select *, Net_Rev - net_cogs - net_logs as net_cm1
from base1)
,
cm2 as (
select *, net_cm1 - total_spends as net_cm2
from cm1),
amazon as (
select *, case when  platform = 'Facebook - TOF' then 'Amazon MP'
when  platform = 'Google - TOF' then 'Amazon MP'
when  platform = 'Facebook - Advantage' then 'Amazon MP'
end as platform_ from gsheets_integration.spends
where platform in ('Facebook - TOF', 'Google - TOF', 'Facebook - Advantage')
),
flipkart as (
select *, case when  platform = 'Facebook - TOF' then 'Flipkart MP'
when  platform = 'Google - TOF' then 'Flipkart MP'
when  platform = 'Facebook - Advantage' then 'Flipkart MP'
end as platform_ from gsheets_integration.spends
where platform in ('Facebook - TOF', 'Google - TOF', 'Facebook - Advantage')
),
union_ as (
select * from amazon
union distinct
select * from flipkart
),
allocated_d2c_spends as (
select order_date , platform_, uc_sku_code, 0.15* sum(spends) as spends_ from union_ group by 1,2,3
),
amazon_1 as (
select *, case when  platform = 'NM' then 'Amazon MP'
end as platform_ from gsheets_integration.spends
where platform in ('NM')
),
flipkart_1 as (
select *, case when  platform = 'NM' then 'Flipkart MP'
end as platform_ from gsheets_integration.spends
where platform in ('NM')
)
,
union_1 as (
select * from amazon_1
union distinct
select * from flipkart_1
),
non_marketing_spends as (
select order_date , platform_, uc_sku_code, 0.25* sum(spends) as spends_ from union_1 group by 1,2,3),
cm2_1 as(
select cm2.*, case when spends_ is null then 0 else spends_ end as total_allocated_d2c_spends from cm2 left join allocated_d2c_spends spe on cm2.Date = spe.order_date
and cm2.sku_id = spe.uc_sku_code and cm2.portal = spe.platform_),
cm2_2 as (
select cm2_1.*, case when spe.spends_ is null then 0 else spe.spends_ end as total_allocated_non_working_spends  from cm2_1 left join non_marketing_spends spe on cm2_1.Date = spe.order_date
and cm2_1.sku_id = spe.uc_sku_code and cm2_1.portal = spe.platform_),
amazon_2 as (
select *, case when  platform = 'Youtube' then 'Amazon MP'
when  platform = 'Instagram' then 'Amazon MP'
when platform = 'Youtube - Short' then 'Amazon MP'
end as platform_ from gsheets_integration.spends
where platform in ('Youtube','Instagram')
),
flipkart_2 as (
select *, case when  platform = 'Youtube' then 'Flipkart MP'
when  platform = 'Instagram' then 'Flipkart MP'
when platform = 'Youtube - Short' then 'Flipkart MP'
end as platform_ from gsheets_integration.spends
where platform in ('Youtube', 'Instagram')
),
union_2 as (
select * from amazon_2
union distinct
select * from flipkart_2
),
total_allocated_influencer_spends as (
select order_date , platform_, uc_sku_code, 0.25* sum(spends) as spends_ from union_2 group by 1,2,3
),
cm2_3 as (
select cm2_2.*, case when spe.spends_ is null then 0 else spe.spends_ end as total_allocated_influencer_spends from cm2_2 left join total_allocated_influencer_spends spe on cm2_2.Date = spe.order_date
and cm2_2.sku_id = spe.uc_sku_code and cm2_2.portal = spe.platform_
),
amazon_3 as (
select *, case when  platform = 'Content Marketing' then 'Amazon MP'
end as platform_ from gsheets_integration.spends
where platform in ('Content Marketing')
),
flipkart_3 as (
select *, case when  platform = 'Content Marketing' then 'Flipkart MP'
end as platform_ from gsheets_integration.spends
where platform in ('Content Marketing')
),
union_3 as (
select * from amazon_3
union distinct
select * from flipkart_3
),
total_allocated_content_marketing_spends as (
select order_date , platform_, uc_sku_code, 0.25* sum(spends) as spends_ from union_3 group by 1,2,3
),
cm2_final as (
select cm2_3.*, case when spe.spends_ is null then 0 else spe.spends_ end as total_allocated_content_marketing_spends from cm2_3 left join total_allocated_content_marketing_spends spe on cm2_3.Date = spe.order_date
and cm2_3.sku_id = spe.uc_sku_code and cm2_3.portal = spe.platform_
)
#NAME?
-- ,
--  team_variable_cost as(
-- select *, case when  platform = 'Amazon MP(TVC-v1)' then 'Amazon MP'
--                when platform = 'Flipkart MP(TVC-v1)' then 'Flipkart MP'
--                end as platform_ from `gsheets_integration.spends`
-- ),
-- team as(select order_date , platform_, uc_sku_code,  sum(spends) as spends_ from team_variable_cost group by 1,2,3)
-- select cm2_final.*, case when spe.spends_ is null then 0 else spe.spends_ end as team from cm2_final left join total_allocated_content_marketing_spends spe on cm2_final.Date = spe.order_date
#NAME?
-- where date(order_date)='2023-06-30'
select *, net_cm2 - total_allocated_d2c_spends - total_allocated_influencer_spends - total_allocated_content_marketing_spends - total_allocated_non_working_spends  as net_cm3
from cm2_final) as tab1

left join

(

select *, case when  platform = 'Amazon MP(TVC-v1)' then 'Amazon MP'
when platform = 'Flipkart MP(TVC-v1)' then 'Flipkart MP'
end as platform_ from `gsheets_integration.spends`
where platform in ( 'Amazon MP(TVC-v1)', 'Flipkart MP(TVC-v1)')

) as tab2

on

tab1.date = tab2.order_date and tab1.sku_id = tab2.uc_sku_code and tab1.portal = tab2.platform_)
