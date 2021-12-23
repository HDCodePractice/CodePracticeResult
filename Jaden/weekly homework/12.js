function same(sum){
    
        for (var i = 0; i < sum.length; i++) 
        {
            for (var j = 0; j < sum.length; j++) 
            {
                 console.log(sum,sum[i],sum[j])
                if (i != j) 
                {
                    // if (sum[i] == sum[j]) 
                    // {
                    //     a=sum[i]; 
                    //     console.log(a)
                    // }
                }
            }
        }

    }
same([[3,9,4,2],[5,2,10,20]])