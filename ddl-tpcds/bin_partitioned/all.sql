----------------------start----------------------------
-- set hivevar:DB=tpcds_bin_partitioned_orc_10000
-- set hivevar:SOURCE=tpcds_bin_partitioned_orc_10000
----------------------call_center----------------------------
create database if not exists ${DB};
use ${DB};

drop table if exists call_center;

create table call_center
stored as ORC
as select * from ${SOURCE}.call_center;
----------------------catalog_page----------------------------
create database if not exists ${DB};
use ${DB};

drop table if exists catalog_page;

create table catalog_page
stored as ORC
as select * from ${SOURCE}.catalog_page;
----------------------catalog_returns----------------------------
create database if not exists ${DB};
use ${DB};

drop table if exists catalog_returns;

create table catalog_returns
(
      cr_returned_time_sk bigint
,     cr_item_sk bigint
,     cr_refunded_customer_sk bigint
,     cr_refunded_cdemo_sk bigint
,     cr_refunded_hdemo_sk bigint
,     cr_refunded_addr_sk bigint
,     cr_returning_customer_sk bigint
,     cr_returning_cdemo_sk bigint
,     cr_returning_hdemo_sk bigint
,     cr_returning_addr_sk bigint
,     cr_call_center_sk bigint
,     cr_catalog_page_sk bigint
,     cr_ship_mode_sk bigint
,     cr_warehouse_sk bigint
,     cr_reason_sk bigint
,     cr_order_number bigint
,     cr_return_quantity int
,     cr_return_amount decimal(7,2)
,     cr_return_tax decimal(7,2)
,     cr_return_amt_inc_tax decimal(7,2)
,     cr_fee decimal(7,2)
,     cr_return_ship_cost decimal(7,2)
,     cr_refunded_cash decimal(7,2)
,     cr_reversed_charge decimal(7,2)
,     cr_store_credit decimal(7,2)
,     cr_net_loss decimal(7,2)
)
partitioned by (cr_returned_date_sk bigint)
stored as ORC;

from ${SOURCE}.catalog_returns cr
insert overwrite table catalog_returns partition(cr_returned_date_sk) 
select
        cr.cr_returned_time_sk,
        cr.cr_item_sk,
        cr.cr_refunded_customer_sk,
        cr.cr_refunded_cdemo_sk,
        cr.cr_refunded_hdemo_sk,
        cr.cr_refunded_addr_sk,
        cr.cr_returning_customer_sk,
        cr.cr_returning_cdemo_sk,
        cr.cr_returning_hdemo_sk,
        cr.cr_returning_addr_sk,
        cr.cr_call_center_sk,
        cr.cr_catalog_page_sk,
        cr.cr_ship_mode_sk,
        cr.cr_warehouse_sk,
        cr.cr_reason_sk,
        cr.cr_order_number,
        cr.cr_return_quantity,
        cr.cr_return_amount,
        cr.cr_return_tax,
        cr.cr_return_amt_inc_tax,
        cr.cr_fee,
        cr.cr_return_ship_cost,
        cr.cr_refunded_cash,
        cr.cr_reversed_charge,
        cr.cr_store_credit,
        cr.cr_net_loss,
        cr.cr_returned_date_sk
      where cr.cr_returned_date_sk is not null
insert overwrite table catalog_returns partition (cr_returned_date_sk) 
select
        cr.cr_returned_time_sk,
        cr.cr_item_sk,
        cr.cr_refunded_customer_sk,
        cr.cr_refunded_cdemo_sk,
        cr.cr_refunded_hdemo_sk,
        cr.cr_refunded_addr_sk,
        cr.cr_returning_customer_sk,
        cr.cr_returning_cdemo_sk,
        cr.cr_returning_hdemo_sk,
        cr.cr_returning_addr_sk,
        cr.cr_call_center_sk,
        cr.cr_catalog_page_sk,
        cr.cr_ship_mode_sk,
        cr.cr_warehouse_sk,
        cr.cr_reason_sk,
        cr.cr_order_number,
        cr.cr_return_quantity,
        cr.cr_return_amount,
        cr.cr_return_tax,
        cr.cr_return_amt_inc_tax,
        cr.cr_fee,
        cr.cr_return_ship_cost,
        cr.cr_refunded_cash,
        cr.cr_reversed_charge,
        cr.cr_store_credit,
        cr.cr_net_loss,
        cr.cr_returned_date_sk
      where cr.cr_returned_date_sk is null
      sort by cr_returned_date_sk
;
----------------------catalog_sales----------------------------
create database if not exists ${DB};
use ${DB};

drop table if exists catalog_sales;

create table catalog_sales
(
      cs_sold_time_sk bigint
,     cs_ship_date_sk bigint
,     cs_bill_customer_sk bigint
,     cs_bill_cdemo_sk bigint
,     cs_bill_hdemo_sk bigint
,     cs_bill_addr_sk bigint
,     cs_ship_customer_sk bigint
,     cs_ship_cdemo_sk bigint
,     cs_ship_hdemo_sk bigint
,     cs_ship_addr_sk bigint
,     cs_call_center_sk bigint
,     cs_catalog_page_sk bigint
,     cs_ship_mode_sk bigint
,     cs_warehouse_sk bigint
,     cs_item_sk bigint
,     cs_promo_sk bigint
,     cs_order_number bigint
,     cs_quantity int
,     cs_wholesale_cost decimal(7,2)
,     cs_list_price decimal(7,2)
,     cs_sales_price decimal(7,2)
,     cs_ext_discount_amt decimal(7,2)
,     cs_ext_sales_price decimal(7,2)
,     cs_ext_wholesale_cost decimal(7,2)
,     cs_ext_list_price decimal(7,2)
,     cs_ext_tax decimal(7,2)
,     cs_coupon_amt decimal(7,2)
,     cs_ext_ship_cost decimal(7,2)
,     cs_net_paid decimal(7,2)
,     cs_net_paid_inc_tax decimal(7,2)
,     cs_net_paid_inc_ship decimal(7,2)
,     cs_net_paid_inc_ship_tax decimal(7,2)
,     cs_net_profit decimal(7,2)
)
partitioned by (cs_sold_date_sk bigint)
stored as ORC;

from ${SOURCE}.catalog_sales cs
insert overwrite table catalog_sales partition (cs_sold_date_sk) 
select
        cs.cs_sold_time_sk,
        cs.cs_ship_date_sk,
        cs.cs_bill_customer_sk,
        cs.cs_bill_cdemo_sk,
        cs.cs_bill_hdemo_sk,
        cs.cs_bill_addr_sk,
        cs.cs_ship_customer_sk,
        cs.cs_ship_cdemo_sk,
        cs.cs_ship_hdemo_sk,
        cs.cs_ship_addr_sk,
        cs.cs_call_center_sk,
        cs.cs_catalog_page_sk,
        cs.cs_ship_mode_sk,
        cs.cs_warehouse_sk,
        cs.cs_item_sk,
        cs.cs_promo_sk,
        cs.cs_order_number,
        cs.cs_quantity,
        cs.cs_wholesale_cost,
        cs.cs_list_price,
        cs.cs_sales_price,
        cs.cs_ext_discount_amt,
        cs.cs_ext_sales_price,
        cs.cs_ext_wholesale_cost,
        cs.cs_ext_list_price,
        cs.cs_ext_tax,
        cs.cs_coupon_amt,
        cs.cs_ext_ship_cost,
        cs.cs_net_paid,
        cs.cs_net_paid_inc_tax,
        cs.cs_net_paid_inc_ship,
        cs.cs_net_paid_inc_ship_tax,
        cs.cs_net_profit,
        cs.cs_sold_date_sk
        where cs.cs_sold_date_sk is not null
insert overwrite table catalog_sales partition (cs_sold_date_sk) 
select
        cs.cs_sold_time_sk,
        cs.cs_ship_date_sk,
        cs.cs_bill_customer_sk,
        cs.cs_bill_cdemo_sk,
        cs.cs_bill_hdemo_sk,
        cs.cs_bill_addr_sk,
        cs.cs_ship_customer_sk,
        cs.cs_ship_cdemo_sk,
        cs.cs_ship_hdemo_sk,
        cs.cs_ship_addr_sk,
        cs.cs_call_center_sk,
        cs.cs_catalog_page_sk,
        cs.cs_ship_mode_sk,
        cs.cs_warehouse_sk,
        cs.cs_item_sk,
        cs.cs_promo_sk,
        cs.cs_order_number,
        cs.cs_quantity,
        cs.cs_wholesale_cost,
        cs.cs_list_price,
        cs.cs_sales_price,
        cs.cs_ext_discount_amt,
        cs.cs_ext_sales_price,
        cs.cs_ext_wholesale_cost,
        cs.cs_ext_list_price,
        cs.cs_ext_tax,
        cs.cs_coupon_amt,
        cs.cs_ext_ship_cost,
        cs.cs_net_paid,
        cs.cs_net_paid_inc_tax,
        cs.cs_net_paid_inc_ship,
        cs.cs_net_paid_inc_ship_tax,
        cs.cs_net_profit,
        cs.cs_sold_date_sk
        where cs.cs_sold_date_sk is null
        sort by cs.cs_sold_date_sk
 ;
 ----------------------customer----------------------------
create database if not exists ${DB};
use ${DB};

drop table if exists customer;

create table customer
stored as ORC
as select * from ${SOURCE}.customer
CLUSTER BY c_customer_sk
;
----------------------customer_address----------------------------
create database if not exists ${DB};
use ${DB};

drop table if exists customer_address;

create table customer_address
stored as ORC
as select * from ${SOURCE}.customer_address 
CLUSTER BY ca_address_sk
;
----------------------customer_demographics----------------------------
create database if not exists ${DB};
use ${DB};

drop table if exists customer_demographics;

create table customer_demographics
stored as ORC
as select * from ${SOURCE}.customer_demographics;
----------------------date_dim----------------------------
create database if not exists ${DB};
use ${DB};

drop table if exists date_dim;

create table date_dim
stored as ORC
as select * from ${SOURCE}.date_dim;
----------------------household_demographics----------------------------
create database if not exists ${DB};
use ${DB};

drop table if exists household_demographics;

create table household_demographics
stored as ORC
as select * from ${SOURCE}.household_demographics;
----------------------income_band----------------------------
create database if not exists ${DB};
use ${DB};

drop table if exists income_band;

create table income_band
stored as ORC
as select * from ${SOURCE}.income_band;
----------------------inventory----------------------------
create database if not exists ${DB};
use ${DB};

drop table if exists inventory;

create table inventory
stored as ORC
as select * from ${SOURCE}.inventory
CLUSTER BY inv_date_sk
;
----------------------item----------------------------
create database if not exists ${DB};
use ${DB};

drop table if exists item;

create table item
stored as ORC
as select * from ${SOURCE}.item
CLUSTER BY i_item_sk
;
----------------------promotion----------------------------
create database if not exists ${DB};
use ${DB};

drop table if exists promotion;

create table promotion
stored as ORC
as select * from ${SOURCE}.promotion;
----------------------reason----------------------------
create database if not exists ${DB};
use ${DB};

drop table if exists reason;

create table reason
stored as ORC
as select * from ${SOURCE}.reason;
----------------------ship_mode----------------------------
create database if not exists ${DB};
use ${DB};

drop table if exists ship_mode;

create table ship_mode
stored as ORC
as select * from ${SOURCE}.ship_mode;
----------------------store----------------------------
create database if not exists ${DB};
use ${DB};

drop table if exists store;

create table store
stored as ORC
as select * from ${SOURCE}.store
CLUSTER BY s_store_sk
;
----------------------store_returns----------------------------
create database if not exists ${DB};
use ${DB};

drop table if exists store_returns;

create table store_returns
(
      sr_return_time_sk bigint
,     sr_item_sk bigint
,     sr_customer_sk bigint
,     sr_cdemo_sk bigint
,     sr_hdemo_sk bigint
,     sr_addr_sk bigint
,     sr_store_sk bigint
,     sr_reason_sk bigint
,     sr_ticket_number bigint
,     sr_return_quantity int
,     sr_return_amt decimal(7,2)
,     sr_return_tax decimal(7,2)
,     sr_return_amt_inc_tax decimal(7,2)
,     sr_fee decimal(7,2)
,     sr_return_ship_cost decimal(7,2)
,     sr_refunded_cash decimal(7,2)
,     sr_reversed_charge decimal(7,2)
,     sr_store_credit decimal(7,2)
,     sr_net_loss decimal(7,2)
)
partitioned by (sr_returned_date_sk bigint)
stored as ORC;

from ${SOURCE}.store_returns sr
insert overwrite table store_returns partition (sr_returned_date_sk) 
select
        sr.sr_return_time_sk,
        sr.sr_item_sk,
        sr.sr_customer_sk,
        sr.sr_cdemo_sk,
        sr.sr_hdemo_sk,
        sr.sr_addr_sk,
        sr.sr_store_sk,
        sr.sr_reason_sk,
        sr.sr_ticket_number,
        sr.sr_return_quantity,
        sr.sr_return_amt,
        sr.sr_return_tax,
        sr.sr_return_amt_inc_tax,
        sr.sr_fee,
        sr.sr_return_ship_cost,
        sr.sr_refunded_cash,
        sr.sr_reversed_charge,
        sr.sr_store_credit,
        sr.sr_net_loss,
        sr.sr_returned_date_sk
        where sr.sr_returned_date_sk is not null
insert overwrite table store_returns partition (sr_returned_date_sk) 
select
        sr.sr_return_time_sk,
        sr.sr_item_sk,
        sr.sr_customer_sk,
        sr.sr_cdemo_sk,
        sr.sr_hdemo_sk,
        sr.sr_addr_sk,
        sr.sr_store_sk,
        sr.sr_reason_sk,
        sr.sr_ticket_number,
        sr.sr_return_quantity,
        sr.sr_return_amt,
        sr.sr_return_tax,
        sr.sr_return_amt_inc_tax,
        sr.sr_fee,
        sr.sr_return_ship_cost,
        sr.sr_refunded_cash,
        sr.sr_reversed_charge,
        sr.sr_store_credit,
        sr.sr_net_loss,
        sr.sr_returned_date_sk
        where sr.sr_returned_date_sk is null
        sort by sr.sr_returned_date_sk;
----------------------store_sales----------------------------
create database if not exists ${DB};
use ${DB};

drop table if exists store_sales;

create table store_sales
(
      ss_sold_time_sk bigint
,     ss_item_sk bigint
,     ss_customer_sk bigint
,     ss_cdemo_sk bigint
,     ss_hdemo_sk bigint
,     ss_addr_sk bigint
,     ss_store_sk bigint
,     ss_promo_sk bigint
,     ss_ticket_number bigint
,     ss_quantity int
,     ss_wholesale_cost decimal(7,2)
,     ss_list_price decimal(7,2)
,     ss_sales_price decimal(7,2)
,     ss_ext_discount_amt decimal(7,2)
,     ss_ext_sales_price decimal(7,2)
,     ss_ext_wholesale_cost decimal(7,2)
,     ss_ext_list_price decimal(7,2)
,     ss_ext_tax decimal(7,2)
,     ss_coupon_amt decimal(7,2)
,     ss_net_paid decimal(7,2)
,     ss_net_paid_inc_tax decimal(7,2)
,     ss_net_profit decimal(7,2)
)
partitioned by (ss_sold_date_sk bigint)
stored as ORC;

from ${SOURCE}.store_sales ss
insert overwrite table store_sales partition (ss_sold_date_sk) 
select
        ss.ss_sold_time_sk,
        ss.ss_item_sk,
        ss.ss_customer_sk,
        ss.ss_cdemo_sk,
        ss.ss_hdemo_sk,
        ss.ss_addr_sk,
        ss.ss_store_sk,
        ss.ss_promo_sk,
        ss.ss_ticket_number,
        ss.ss_quantity,
        ss.ss_wholesale_cost,
        ss.ss_list_price,
        ss.ss_sales_price,
        ss.ss_ext_discount_amt,
        ss.ss_ext_sales_price,
        ss.ss_ext_wholesale_cost,
        ss.ss_ext_list_price,
        ss.ss_ext_tax,
        ss.ss_coupon_amt,
        ss.ss_net_paid,
        ss.ss_net_paid_inc_tax,
        ss.ss_net_profit,
        ss.ss_sold_date_sk
        where ss.ss_sold_date_sk is not null
insert overwrite table store_sales partition (ss_sold_date_sk) 
select
        ss.ss_sold_time_sk,
        ss.ss_item_sk,
        ss.ss_customer_sk,
        ss.ss_cdemo_sk,
        ss.ss_hdemo_sk,
        ss.ss_addr_sk,
        ss.ss_store_sk,
        ss.ss_promo_sk,
        ss.ss_ticket_number,
        ss.ss_quantity,
        ss.ss_wholesale_cost,
        ss.ss_list_price,
        ss.ss_sales_price,
        ss.ss_ext_discount_amt,
        ss.ss_ext_sales_price,
        ss.ss_ext_wholesale_cost,
        ss.ss_ext_list_price,
        ss.ss_ext_tax,
        ss.ss_coupon_amt,
        ss.ss_net_paid,
        ss.ss_net_paid_inc_tax,
        ss.ss_net_profit,
        ss.ss_sold_date_sk
        where ss.ss_sold_date_sk is null
        sort by ss.ss_sold_date_sk
;
----------------------time_dim----------------------------
create database if not exists ${DB};
use ${DB};

drop table if exists time_dim;

create table time_dim
stored as ORC
as select * from ${SOURCE}.time_dim;
----------------------warehouse----------------------------
create database if not exists ${DB};
use ${DB};

drop table if exists warehouse;

create table warehouse
stored as ORC
as select * from ${SOURCE}.warehouse;
----------------------web_page----------------------------
create database if not exists ${DB};
use ${DB};

drop table if exists web_page;

create table web_page
stored as ORC
as select * from ${SOURCE}.web_page;
----------------------web_returns----------------------------
create database if not exists ${DB};
use ${DB};

drop table if exists web_returns;

create table web_returns
(
      wr_returned_time_sk bigint
,     wr_item_sk bigint
,     wr_refunded_customer_sk bigint
,     wr_refunded_cdemo_sk bigint
,     wr_refunded_hdemo_sk bigint
,     wr_refunded_addr_sk bigint
,     wr_returning_customer_sk bigint
,     wr_returning_cdemo_sk bigint
,     wr_returning_hdemo_sk bigint
,     wr_returning_addr_sk bigint
,     wr_web_page_sk bigint
,     wr_reason_sk bigint
,     wr_order_number bigint
,     wr_return_quantity int
,     wr_return_amt decimal(7,2)
,     wr_return_tax decimal(7,2)
,     wr_return_amt_inc_tax decimal(7,2)
,     wr_fee decimal(7,2)
,     wr_return_ship_cost decimal(7,2)
,     wr_refunded_cash decimal(7,2)
,     wr_reversed_charge decimal(7,2)
,     wr_account_credit decimal(7,2)
,     wr_net_loss decimal(7,2)
)
partitioned by (wr_returned_date_sk       bigint)
stored as ORC;

from ${SOURCE}.web_returns wr
insert overwrite table web_returns partition (wr_returned_date_sk)
select
        wr.wr_returned_time_sk,
        wr.wr_item_sk,
        wr.wr_refunded_customer_sk,
        wr.wr_refunded_cdemo_sk,
        wr.wr_refunded_hdemo_sk,
        wr.wr_refunded_addr_sk,
        wr.wr_returning_customer_sk,
        wr.wr_returning_cdemo_sk,
        wr.wr_returning_hdemo_sk,
        wr.wr_returning_addr_sk,
        wr.wr_web_page_sk,
        wr.wr_reason_sk,
        wr.wr_order_number,
        wr.wr_return_quantity,
        wr.wr_return_amt,
        wr.wr_return_tax,
        wr.wr_return_amt_inc_tax,
        wr.wr_fee,
        wr.wr_return_ship_cost,
        wr.wr_refunded_cash,
        wr.wr_reversed_charge,
        wr.wr_account_credit,
        wr.wr_net_loss,
		wr.wr_returned_date_sk
        where wr.wr_returned_date_sk is not null
insert overwrite table web_returns partition (wr_returned_date_sk)
select
        wr.wr_returned_time_sk,
        wr.wr_item_sk,
        wr.wr_refunded_customer_sk,
        wr.wr_refunded_cdemo_sk,
        wr.wr_refunded_hdemo_sk,
        wr.wr_refunded_addr_sk,
        wr.wr_returning_customer_sk,
        wr.wr_returning_cdemo_sk,
        wr.wr_returning_hdemo_sk,
        wr.wr_returning_addr_sk,
        wr.wr_web_page_sk,
        wr.wr_reason_sk,
        wr.wr_order_number,
        wr.wr_return_quantity,
        wr.wr_return_amt,
        wr.wr_return_tax,
        wr.wr_return_amt_inc_tax,
        wr.wr_fee,
        wr.wr_return_ship_cost,
        wr.wr_refunded_cash,
        wr.wr_reversed_charge,
        wr.wr_account_credit,
        wr.wr_net_loss,
		wr.wr_returned_date_sk
        where wr.wr_returned_date_sk is null
        sort by wr.wr_returned_date_sk 
;
----------------------web_sales----------------------------
create database if not exists ${DB};
use ${DB};

drop table if exists web_sales;

create table web_sales
(
    ws_sold_time_sk           bigint,
    ws_ship_date_sk           bigint,
    ws_item_sk                bigint,
    ws_bill_customer_sk       bigint,
    ws_bill_cdemo_sk          bigint,
    ws_bill_hdemo_sk          bigint,
    ws_bill_addr_sk           bigint,
    ws_ship_customer_sk       bigint,
    ws_ship_cdemo_sk          bigint,
    ws_ship_hdemo_sk          bigint,
    ws_ship_addr_sk           bigint,
    ws_web_page_sk            bigint,
    ws_web_site_sk            bigint,
    ws_ship_mode_sk           bigint,
    ws_warehouse_sk           bigint,
    ws_promo_sk               bigint,
    ws_order_number           bigint,
    ws_quantity               int,
    ws_wholesale_cost         decimal(7,2),
    ws_list_price             decimal(7,2),
    ws_sales_price            decimal(7,2),
    ws_ext_discount_amt       decimal(7,2),
    ws_ext_sales_price        decimal(7,2),
    ws_ext_wholesale_cost     decimal(7,2),
    ws_ext_list_price         decimal(7,2),
    ws_ext_tax                decimal(7,2),
    ws_coupon_amt             decimal(7,2),
    ws_ext_ship_cost          decimal(7,2),
    ws_net_paid               decimal(7,2),
    ws_net_paid_inc_tax       decimal(7,2),
    ws_net_paid_inc_ship      decimal(7,2),
    ws_net_paid_inc_ship_tax  decimal(7,2),
    ws_net_profit             decimal(7,2)
)
partitioned by (ws_sold_date_sk           bigint)
stored as ORC;

from ${SOURCE}.web_sales ws
insert overwrite table web_sales partition (ws_sold_date_sk) 
select
        ws.ws_sold_time_sk,
        ws.ws_ship_date_sk,
        ws.ws_item_sk,
        ws.ws_bill_customer_sk,
        ws.ws_bill_cdemo_sk,
        ws.ws_bill_hdemo_sk,
        ws.ws_bill_addr_sk,
        ws.ws_ship_customer_sk,
        ws.ws_ship_cdemo_sk,
        ws.ws_ship_hdemo_sk,
        ws.ws_ship_addr_sk,
        ws.ws_web_page_sk,
        ws.ws_web_site_sk,
        ws.ws_ship_mode_sk,
        ws.ws_warehouse_sk,
        ws.ws_promo_sk,
        ws.ws_order_number,
        ws.ws_quantity,
        ws.ws_wholesale_cost,
        ws.ws_list_price,
        ws.ws_sales_price,
        ws.ws_ext_discount_amt,
        ws.ws_ext_sales_price,
        ws.ws_ext_wholesale_cost,
        ws.ws_ext_list_price,
        ws.ws_ext_tax,
        ws.ws_coupon_amt,
        ws.ws_ext_ship_cost,
        ws.ws_net_paid,
        ws.ws_net_paid_inc_tax,
        ws.ws_net_paid_inc_ship,
        ws.ws_net_paid_inc_ship_tax,
        ws.ws_net_profit,
        ws.ws_sold_date_sk
        where ws.ws_sold_date_sk is not null
insert overwrite table web_sales partition (ws_sold_date_sk) 
select
        ws.ws_sold_time_sk,
        ws.ws_ship_date_sk,
        ws.ws_item_sk,
        ws.ws_bill_customer_sk,
        ws.ws_bill_cdemo_sk,
        ws.ws_bill_hdemo_sk,
        ws.ws_bill_addr_sk,
        ws.ws_ship_customer_sk,
        ws.ws_ship_cdemo_sk,
        ws.ws_ship_hdemo_sk,
        ws.ws_ship_addr_sk,
        ws.ws_web_page_sk,
        ws.ws_web_site_sk,
        ws.ws_ship_mode_sk,
        ws.ws_warehouse_sk,
        ws.ws_promo_sk,
        ws.ws_order_number,
        ws.ws_quantity,
        ws.ws_wholesale_cost,
        ws.ws_list_price,
        ws.ws_sales_price,
        ws.ws_ext_discount_amt,
        ws.ws_ext_sales_price,
        ws.ws_ext_wholesale_cost,
        ws.ws_ext_list_price,
        ws.ws_ext_tax,
        ws.ws_coupon_amt,
        ws.ws_ext_ship_cost,
        ws.ws_net_paid,
        ws.ws_net_paid_inc_tax,
        ws.ws_net_paid_inc_ship,
        ws.ws_net_paid_inc_ship_tax,
        ws.ws_net_profit,
        ws.ws_sold_date_sk
        where ws.ws_sold_date_sk is null
        sort by ws.ws_sold_date_sk
;
----------------------web_sites----------------------------
create database if not exists ${DB};
use ${DB};

drop table if exists web_site;

create table web_site
stored as ORC
as select * from ${SOURCE}.web_site;


----------------------add_constraints----------------------------
-- set hivevar:DB=tpcds_bin_partitioned_orc_10000
create database if not exists ${DB};
use ${DB};
alter table customer_address add constraint ${DB}_pk_ca primary key (ca_address_sk) disable novalidate rely;
alter table customer_demographics add constraint ${DB}_pk_cd primary key (cd_demo_sk) disable novalidate rely;
alter table date_dim add constraint ${DB}_pk_dd primary key (d_date_sk) disable novalidate rely;
alter table warehouse add constraint ${DB}_pk_w primary key (w_warehouse_sk) disable novalidate rely;
alter table ship_mode add constraint ${DB}_pk_sm primary key (sm_ship_mode_sk) disable novalidate rely;
alter table time_dim add constraint ${DB}_pk_td primary key (t_time_sk) disable novalidate rely;
alter table reason add constraint ${DB}_pk_r primary key (r_reason_sk) disable novalidate rely;
alter table income_band add constraint ${DB}_pk_ib primary key (ib_income_band_sk) disable novalidate rely;
alter table item add constraint ${DB}_pk_i primary key (i_item_sk) disable novalidate rely;
alter table store add constraint ${DB}_pk_s primary key (s_store_sk) disable novalidate rely;
alter table call_center add constraint ${DB}_pk_cc primary key (cc_call_center_sk) disable novalidate rely;
alter table customer add constraint ${DB}_pk_c primary key (c_customer_sk) disable novalidate rely;
alter table web_site add constraint ${DB}_pk_ws primary key (web_site_sk) disable novalidate rely;
alter table store_returns add constraint ${DB}_pk_sr primary key (sr_item_sk, sr_ticket_number) disable novalidate rely;
alter table household_demographics add constraint ${DB}_pk_hd primary key (hd_demo_sk) disable novalidate rely;
alter table web_page add constraint ${DB}_pk_wp primary key (wp_web_page_sk) disable novalidate rely;
alter table promotion add constraint ${DB}_pk_p primary key (p_promo_sk) disable novalidate rely;
alter table catalog_page add constraint ${DB}_pk_cp primary key (cp_catalog_page_sk) disable novalidate rely;
-- partition_col case
alter table inventory add constraint ${DB}_pk_in primary key (inv_date_sk, inv_item_sk, inv_warehouse_sk) disable novalidate rely;
alter table catalog_returns add constraint ${DB}_pk_cr primary key (cr_item_sk, cr_order_number) disable novalidate rely;
alter table web_returns add constraint ${DB}_pk_wr primary key (wr_item_sk, wr_order_number) disable novalidate rely;
alter table web_sales add constraint ${DB}_pk_ws2 primary key (ws_item_sk, ws_order_number) disable novalidate rely;
alter table catalog_sales add constraint ${DB}_pk_cs primary key (cs_item_sk, cs_order_number) disable novalidate rely;
alter table store_sales add constraint ${DB}_pk_ss primary key (ss_item_sk, ss_ticket_number) disable novalidate rely;

alter table call_center add constraint ${DB}_cc_d1 foreign key  (cc_closed_date_sk) references date_dim (d_date_sk) disable novalidate rely;
alter table call_center add constraint ${DB}_cc_d2 foreign key  (cc_open_date_sk) references date_dim (d_date_sk) disable novalidate rely;
alter table catalog_page add constraint ${DB}_cp_d1 foreign key  (cp_end_date_sk) references date_dim (d_date_sk) disable novalidate rely;
alter table catalog_page add constraint ${DB}_cp_d2 foreign key  (cp_start_date_sk) references date_dim (d_date_sk) disable novalidate rely;
alter table catalog_returns add constraint ${DB}_cr_cc foreign key  (cr_call_center_sk) references call_center (cc_call_center_sk) disable novalidate rely;
alter table catalog_returns add constraint ${DB}_cr_cp foreign key  (cr_catalog_page_sk) references catalog_page (cp_catalog_page_sk) disable novalidate rely;
alter table catalog_returns add constraint ${DB}_cr_cs foreign key  (cr_item_sk, cr_order_number) references catalog_sales (cs_item_sk, cs_order_number) disable novalidate rely;
alter table catalog_returns add constraint ${DB}_cr_i foreign key  (cr_item_sk) references item (i_item_sk) disable novalidate rely;
alter table catalog_returns add constraint ${DB}_cr_r foreign key  (cr_reason_sk) references reason (r_reason_sk) disable novalidate rely;
alter table catalog_returns add constraint ${DB}_cr_a1 foreign key  (cr_refunded_addr_sk) references customer_address (ca_address_sk) disable novalidate rely;
alter table catalog_returns add constraint ${DB}_cr_cd1 foreign key  (cr_refunded_cdemo_sk) references customer_demographics (cd_demo_sk) disable novalidate rely;
alter table catalog_returns add constraint ${DB}_cr_c1 foreign key  (cr_refunded_customer_sk) references customer (c_customer_sk) disable novalidate rely;
alter table catalog_returns add constraint ${DB}_cr_hd1 foreign key  (cr_refunded_hdemo_sk) references household_demographics (hd_demo_sk) disable novalidate rely;
-- partition_col case
alter table catalog_returns add constraint ${DB}_cr_d1 foreign key  (cr_returned_date_sk) references date_dim (d_date_sk) disable novalidate rely;
alter table catalog_returns add constraint ${DB}_cr_t foreign key  (cr_returned_time_sk) references time_dim (t_time_sk) disable novalidate rely;
alter table catalog_returns add constraint ${DB}_cr_a2 foreign key  (cr_returning_addr_sk) references customer_address (ca_address_sk) disable novalidate rely;
alter table catalog_returns add constraint ${DB}_cr_cd2 foreign key  (cr_returning_cdemo_sk) references customer_demographics (cd_demo_sk) disable novalidate rely;
alter table catalog_returns add constraint ${DB}_cr_c2 foreign key  (cr_returning_customer_sk) references customer (c_customer_sk) disable novalidate rely;
alter table catalog_returns add constraint ${DB}_cr_hd2 foreign key  (cr_returning_hdemo_sk) references household_demographics (hd_demo_sk) disable novalidate rely;
-- alter table catalog_returns add constraint ${DB}_cr_d2 foreign key  (cr_ship_date_sk) references date_dim (d_date_sk) disable novalidate rely;
alter table catalog_returns add constraint ${DB}_cr_sm foreign key  (cr_ship_mode_sk) references ship_mode (sm_ship_mode_sk) disable novalidate rely;
alter table catalog_returns add constraint ${DB}_cr_w2 foreign key  (cr_warehouse_sk) references warehouse (w_warehouse_sk) disable novalidate rely;
alter table catalog_sales add constraint ${DB}_cs_b_a foreign key  (cs_bill_addr_sk) references customer_address (ca_address_sk) disable novalidate rely;
alter table catalog_sales add constraint ${DB}_cs_b_cd foreign key  (cs_bill_cdemo_sk) references customer_demographics (cd_demo_sk) disable novalidate rely;
alter table catalog_sales add constraint ${DB}_cs_b_c foreign key  (cs_bill_customer_sk) references customer (c_customer_sk) disable novalidate rely;
alter table catalog_sales add constraint ${DB}_cs_b_hd foreign key  (cs_bill_hdemo_sk) references household_demographics (hd_demo_sk) disable novalidate rely;
alter table catalog_sales add constraint ${DB}_cs_cc foreign key  (cs_call_center_sk) references call_center (cc_call_center_sk) disable novalidate rely;
alter table catalog_sales add constraint ${DB}_cs_cp foreign key  (cs_catalog_page_sk) references catalog_page (cp_catalog_page_sk) disable novalidate rely;
alter table catalog_sales add constraint ${DB}_cs_i foreign key  (cs_item_sk) references item (i_item_sk) disable novalidate rely;
alter table catalog_sales add constraint ${DB}_cs_p foreign key  (cs_promo_sk) references promotion (p_promo_sk) disable novalidate rely;
alter table catalog_sales add constraint ${DB}_cs_s_a foreign key  (cs_ship_addr_sk) references customer_address (ca_address_sk) disable novalidate rely;
alter table catalog_sales add constraint ${DB}_cs_s_cd foreign key  (cs_ship_cdemo_sk) references customer_demographics (cd_demo_sk) disable novalidate rely;
alter table catalog_sales add constraint ${DB}_cs_s_c foreign key  (cs_ship_customer_sk) references customer (c_customer_sk) disable novalidate rely;
alter table catalog_sales add constraint ${DB}_cs_d1 foreign key  (cs_ship_date_sk) references date_dim (d_date_sk) disable novalidate rely;
alter table catalog_sales add constraint ${DB}_cs_s_hd foreign key  (cs_ship_hdemo_sk) references household_demographics (hd_demo_sk) disable novalidate rely;
alter table catalog_sales add constraint ${DB}_cs_sm foreign key  (cs_ship_mode_sk) references ship_mode (sm_ship_mode_sk) disable novalidate rely;
-- partition_col case
alter table catalog_sales add constraint ${DB}_cs_d2 foreign key  (cs_sold_date_sk) references date_dim (d_date_sk) disable novalidate rely;
alter table catalog_sales add constraint ${DB}_cs_t foreign key  (cs_sold_time_sk) references time_dim (t_time_sk) disable novalidate rely;
alter table catalog_sales add constraint ${DB}_cs_w foreign key  (cs_warehouse_sk) references warehouse (w_warehouse_sk) disable novalidate rely;
alter table customer add constraint ${DB}_c_a foreign key  (c_current_addr_sk) references customer_address (ca_address_sk) disable novalidate rely;
alter table customer add constraint ${DB}_c_cd foreign key  (c_current_cdemo_sk) references customer_demographics (cd_demo_sk) disable novalidate rely;
alter table customer add constraint ${DB}_c_hd foreign key  (c_current_hdemo_sk) references household_demographics (hd_demo_sk) disable novalidate rely;
alter table customer add constraint ${DB}_c_fsd foreign key  (c_first_sales_date_sk) references date_dim (d_date_sk) disable novalidate rely;
alter table customer add constraint ${DB}_c_fsd2 foreign key  (c_first_shipto_date_sk) references date_dim (d_date_sk) disable novalidate rely;
alter table household_demographics add constraint ${DB}_hd_ib foreign key  (hd_income_band_sk) references income_band (ib_income_band_sk) disable novalidate rely;
-- partition_col case
alter table inventory add constraint ${DB}_inv_d foreign key  (inv_date_sk) references date_dim (d_date_sk) disable novalidate rely;
alter table inventory add constraint ${DB}_inv_i foreign key  (inv_item_sk) references item (i_item_sk) disable novalidate rely;
alter table inventory add constraint ${DB}_inv_w foreign key  (inv_warehouse_sk) references warehouse (w_warehouse_sk) disable novalidate rely;
alter table promotion add constraint ${DB}_p_end_date foreign key  (p_end_date_sk) references date_dim (d_date_sk) disable novalidate rely;
alter table promotion add constraint ${DB}_p_i foreign key  (p_item_sk) references item (i_item_sk) disable novalidate rely;
alter table promotion add constraint ${DB}_p_start_date foreign key  (p_start_date_sk) references date_dim (d_date_sk) disable novalidate rely;
alter table store add constraint ${DB}_s_close_date foreign key  (s_closed_date_sk) references date_dim (d_date_sk) disable novalidate rely;
alter table store_returns add constraint ${DB}_sr_a foreign key  (sr_addr_sk) references customer_address (ca_address_sk) disable novalidate rely;
alter table store_returns add constraint ${DB}_sr_cd foreign key  (sr_cdemo_sk) references customer_demographics (cd_demo_sk) disable novalidate rely;
alter table store_returns add constraint ${DB}_sr_c foreign key  (sr_customer_sk) references customer (c_customer_sk) disable novalidate rely;
alter table store_returns add constraint ${DB}_sr_hd foreign key  (sr_hdemo_sk) references household_demographics (hd_demo_sk) disable novalidate rely;
alter table store_returns add constraint ${DB}_sr_i foreign key  (sr_item_sk) references item (i_item_sk) disable novalidate rely;
alter table store_returns add constraint ${DB}_sr_r foreign key  (sr_reason_sk) references reason (r_reason_sk) disable novalidate rely;
-- partition_col case
alter table store_returns add constraint ${DB}_sr_ret_d foreign key  (sr_returned_date_sk) references date_dim (d_date_sk) disable novalidate rely;
alter table store_returns add constraint ${DB}_sr_t foreign key  (sr_return_time_sk) references time_dim (t_time_sk) disable novalidate rely;
alter table store_returns add constraint ${DB}_sr_s foreign key  (sr_store_sk) references store (s_store_sk) disable novalidate rely;
alter table store_returns add constraint ${DB}_sr_ss foreign key  (sr_item_sk, sr_ticket_number) references store_sales (ss_item_sk, ss_ticket_number) disable novalidate rely;
alter table store_sales add constraint ${DB}_ss_a foreign key  (ss_addr_sk) references customer_address (ca_address_sk) disable novalidate rely;
alter table store_sales add constraint ${DB}_ss_cd foreign key  (ss_cdemo_sk) references customer_demographics (cd_demo_sk) disable novalidate rely;
alter table store_sales add constraint ${DB}_ss_c foreign key  (ss_customer_sk) references customer (c_customer_sk) disable novalidate rely;
alter table store_sales add constraint ${DB}_ss_hd foreign key  (ss_hdemo_sk) references household_demographics (hd_demo_sk) disable novalidate rely;
alter table store_sales add constraint ${DB}_ss_i foreign key  (ss_item_sk) references item (i_item_sk) disable novalidate rely;
alter table store_sales add constraint ${DB}_ss_p foreign key  (ss_promo_sk) references promotion (p_promo_sk) disable novalidate rely;
-- partition_col case
alter table store_sales add constraint ${DB}_ss_d foreign key  (ss_sold_date_sk) references date_dim (d_date_sk) disable novalidate rely;
alter table store_sales add constraint ${DB}_ss_t foreign key  (ss_sold_time_sk) references time_dim (t_time_sk) disable novalidate rely;
alter table store_sales add constraint ${DB}_ss_s foreign key  (ss_store_sk) references store (s_store_sk) disable novalidate rely;
alter table web_page add constraint ${DB}_wp_ad foreign key  (wp_access_date_sk) references date_dim (d_date_sk) disable novalidate rely;
alter table web_page add constraint ${DB}_wp_cd foreign key  (wp_creation_date_sk) references date_dim (d_date_sk) disable novalidate rely;
alter table web_returns add constraint ${DB}_wr_i foreign key  (wr_item_sk) references item (i_item_sk) disable novalidate rely;
alter table web_returns add constraint ${DB}_wr_r foreign key  (wr_reason_sk) references reason (r_reason_sk) disable novalidate rely;
alter table web_returns add constraint ${DB}_wr_ref_a foreign key  (wr_refunded_addr_sk) references customer_address (ca_address_sk) disable novalidate rely;
alter table web_returns add constraint ${DB}_wr_ref_cd foreign key  (wr_refunded_cdemo_sk) references customer_demographics (cd_demo_sk) disable novalidate rely;
alter table web_returns add constraint ${DB}_wr_ref_c foreign key  (wr_refunded_customer_sk) references customer (c_customer_sk) disable novalidate rely;
alter table web_returns add constraint ${DB}_wr_ref_hd foreign key  (wr_refunded_hdemo_sk) references household_demographics (hd_demo_sk) disable novalidate rely;
-- partition_col case
alter table web_returns add constraint ${DB}_wr_ret_d foreign key  (wr_returned_date_sk) references date_dim (d_date_sk) disable novalidate rely;
alter table web_returns add constraint ${DB}_wr_ret_t foreign key  (wr_returned_time_sk) references time_dim (t_time_sk) disable novalidate rely;
alter table web_returns add constraint ${DB}_wr_ret_a foreign key  (wr_returning_addr_sk) references customer_address (ca_address_sk) disable novalidate rely;
alter table web_returns add constraint ${DB}_wr_ret_cd foreign key  (wr_returning_cdemo_sk) references customer_demographics (cd_demo_sk) disable novalidate rely;
alter table web_returns add constraint ${DB}_wr_ret_c foreign key  (wr_returning_customer_sk) references customer (c_customer_sk) disable novalidate rely;
alter table web_returns add constraint ${DB}_wr_ret_hd foreign key  (wr_returning_hdemo_sk) references household_demographics (hd_demo_sk) disable novalidate rely;
alter table web_returns add constraint ${DB}_wr_ws foreign key  (wr_item_sk, wr_order_number) references web_sales (ws_item_sk, ws_order_number) disable novalidate rely;
alter table web_returns add constraint ${DB}_wr_wp foreign key  (wr_web_page_sk) references web_page (wp_web_page_sk) disable novalidate rely;
alter table web_sales add constraint ${DB}_ws_b_a foreign key  (ws_bill_addr_sk) references customer_address (ca_address_sk) disable novalidate rely;
alter table web_sales add constraint ${DB}_ws_b_cd foreign key  (ws_bill_cdemo_sk) references customer_demographics (cd_demo_sk) disable novalidate rely;
alter table web_sales add constraint ${DB}_ws_b_c foreign key  (ws_bill_customer_sk) references customer (c_customer_sk) disable novalidate rely;
alter table web_sales add constraint ${DB}_ws_b_hd foreign key  (ws_bill_hdemo_sk) references household_demographics (hd_demo_sk) disable novalidate rely;
alter table web_sales add constraint ${DB}_ws_i foreign key  (ws_item_sk) references item (i_item_sk) disable novalidate rely;
alter table web_sales add constraint ${DB}_ws_p foreign key  (ws_promo_sk) references promotion (p_promo_sk) disable novalidate rely;
alter table web_sales add constraint ${DB}_ws_s_a foreign key  (ws_ship_addr_sk) references customer_address (ca_address_sk) disable novalidate rely;
alter table web_sales add constraint ${DB}_ws_s_cd foreign key  (ws_ship_cdemo_sk) references customer_demographics (cd_demo_sk) disable novalidate rely;
alter table web_sales add constraint ${DB}_ws_s_c foreign key  (ws_ship_customer_sk) references customer (c_customer_sk) disable novalidate rely;
alter table web_sales add constraint ${DB}_ws_s_d foreign key  (ws_ship_date_sk) references date_dim (d_date_sk) disable novalidate rely;
alter table web_sales add constraint ${DB}_ws_s_hd foreign key  (ws_ship_hdemo_sk) references household_demographics (hd_demo_sk) disable novalidate rely;
alter table web_sales add constraint ${DB}_ws_sm foreign key  (ws_ship_mode_sk) references ship_mode (sm_ship_mode_sk) disable novalidate rely;
-- partition_col case
alter table web_sales add constraint ${DB}_ws_d2 foreign key  (ws_sold_date_sk) references date_dim (d_date_sk) disable novalidate rely;
alter table web_sales add constraint ${DB}_ws_t foreign key  (ws_sold_time_sk) references time_dim (t_time_sk) disable novalidate rely;
alter table web_sales add constraint ${DB}_ws_w2 foreign key  (ws_warehouse_sk) references warehouse (w_warehouse_sk) disable novalidate rely;
alter table web_sales add constraint ${DB}_ws_wp foreign key  (ws_web_page_sk) references web_page (wp_web_page_sk) disable novalidate rely;
alter table web_sales add constraint ${DB}_ws_ws foreign key  (ws_web_site_sk) references web_site (web_site_sk) disable novalidate rely;
alter table web_site add constraint ${DB}_web_d1 foreign key  (web_close_date_sk) references date_dim (d_date_sk) disable novalidate rely;
alter table web_site add constraint ${DB}_web_d2 foreign key (web_open_date_sk) references date_dim (d_date_sk) disable novalidate rely;

alter table store change column s_store_id s_store_id string constraint ${DB}_strid_nn not null disable novalidate rely;
alter table call_center change column cc_call_center_id cc_call_center_id string constraint ${DB}_ccid_nn not null disable novalidate rely;
alter table catalog_page change column cp_catalog_page_id cp_catalog_page_id string constraint ${DB}_cpid_nn not null disable novalidate rely;
alter table web_site change column web_site_id web_site_id string constraint ${DB}_wsid_nn not null disable novalidate rely;
alter table web_page change column wp_web_page_id wp_web_page_id string constraint ${DB}_wpid_nn not null disable novalidate rely;
alter table warehouse change column w_warehouse_id w_warehouse_id string constraint ${DB}_wid_nn not null disable novalidate rely;
alter table customer change column c_customer_id c_customer_id string constraint ${DB}_cid_nn not null disable novalidate rely;
alter table customer_address change column ca_address_id ca_address_id string constraint ${DB}_caid_nn not null disable novalidate rely;
alter table date_dim change column d_date_id d_date_id string constraint ${DB}_did_nn not null disable novalidate rely;
alter table item change column i_item_id i_item_id string constraint ${DB}_itid_nn not null disable novalidate rely;
alter table promotion change column p_promo_id p_promo_id string constraint ${DB}_pid_nn not null disable novalidate rely;
alter table reason change column r_reason_id r_reason_id string constraint ${DB}_rid_nn not null disable novalidate rely;
alter table ship_mode change column sm_ship_mode_id sm_ship_mode_id string constraint ${DB}_smid_nn not null disable novalidate rely;
alter table time_dim change column t_time_id t_time_id string constraint ${DB}_tid_nn not null disable novalidate rely;

alter table customer change column c_customer_id c_customer_id string constraint ${DB}_cid_uq unique disable novalidate rely;

analyze table call_center compute statistics for columns;
analyze table catalog_page compute statistics for columns;
analyze table catalog_returns compute statistics for columns;
analyze table catalog_sales compute statistics for columns;
analyze table customer compute statistics for columns;
analyze table customer_address compute statistics for columns;
analyze table customer_demographics compute statistics for columns;
analyze table date_dim compute statistics for columns;
analyze table household_demographics compute statistics for columns;
analyze table income_band compute statistics for columns;
analyze table inventory compute statistics for columns;
analyze table item compute statistics for columns;
analyze table promotion compute statistics for columns;
analyze table reason compute statistics for columns;
analyze table ship_mode compute statistics for columns;
analyze table store compute statistics for columns;
analyze table store_returns compute statistics for columns;
analyze table store_sales compute statistics for columns;
analyze table time_dim compute statistics for columns;
analyze table warehouse compute statistics for columns;
analyze table web_page compute statistics for columns;
analyze table web_returns compute statistics for columns;
analyze table web_sales compute statistics for columns;
analyze table web_site compute statistics for columns;