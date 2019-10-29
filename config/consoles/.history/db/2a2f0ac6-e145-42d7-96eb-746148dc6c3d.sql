create database db04
  default charset utf8;
;-- -. . -..- - / . -. - .-. -.--
show databases;
;-- -. . -..- - / . -. - .-. -.--
select *
from t_user 
join t_order 
         on t_user.id=t_order.id;
;-- -. . -..- - / . -. - .-. -.--
select *
from t_user
join t_order
         on t_user.id=t_order.id;