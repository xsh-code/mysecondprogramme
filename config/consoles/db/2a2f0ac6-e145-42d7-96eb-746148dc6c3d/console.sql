select *
from t_user
join t_order
         on t_user.id=t_order.id;