SELECT cS.Cat_Id,p_h.Product_Id,
RANK() OVER (PARTITION BY cS.Cat_Id  ORDER BY p_h.Product_Id) AS Trending  
FROM
    purchasehistory p_h
	CROSS JOIN
   productcategory cS ON cS.Product_Id=p_h.Product_Id
group BY cS.Cat_Id ,p_h.Product_Id HAVING( (SELECT MAX(Bill_Date) FROM purchasehistory)- INTERVAL 20 day) limit 4;

