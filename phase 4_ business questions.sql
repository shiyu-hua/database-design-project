
/* question 1 */

    create or replace view team3_view1 (Numberofrestaurant, Country) As 
        select count(*),country from restaurant
        group by country;
        
/* question 2 */

    create or replace view team3_view2 (Numberofrecipes, Numberofrestaurant, Country) As 
        select count(recipe.recipeid), count(restaurant.restaurantid), restaurant.country 
        from restaurant left outer join recipe
        on restaurant.restaurantid = recipe.restaurantid
        where restaurant.country in ('UK')
        group by restaurant.country; 
        

/* question 3 */

    create or replace view team3_view3 (RatingOf5Count, State) As 
        select count(restaurant.restaurantid), restaurant.state
        from restaurant join review
        on restaurant.restaurantid = review.restaurantid
        where restaurant.state in ('CA', 'TX')
        and review.rating in (5)
        group by restaurant.state;    
        
/* question 4 */
 
    create or replace view team3_view4 (RecipeName, LongestTotalCookingTime) As 
        select recipename, totalcookingtime
        from recipe
        where cast(REPLACE(totalcookingtime,'min','')as int) = 
            (select max(cast(REPLACE(totalcookingtime,'min','')as int)) from recipe);
        

        
/* question 5 */

    create or replace view team3_view5 (Recipe, ReviewDescription) As 
        select recipe.recipename, review.reviewdescription 
        from review join recipe
        on review.restaurantid = recipe.restaurantid
        where review.reviewdescription like ('%love%')
        or review.reviewdescription like ('%delicious%');  
        
        
/* question 6 */

    create or replace view team3_view6 (ReviewID, Daysago, ReviewDate) As 
        select reviewid, daysago, to_char(sysdate - daysago, 'MM-DD-RRRR')
        from review;      /*how about null values? */  
        
/* question 7 */

    create or replace view team3_view7 (Numberofshows, Year) As
        select count(*), showyear from show 
        group by showyear
        order by showyear;
        
/* question 8 */

    create or replace view team3_view8 (Country, NumberofNullComments) As
        select restaurant.country, count(*)
        from restaurant, recipe
        where restaurant.restaurantid = recipe.restaurantid
        and recipe.recipecomment is null
        group by restaurant.country;

/* question 9 */

    create or replace view team3_view9 (RecipeCount, RecipeLevel) As 
    select count(*), recipelevel from recipe
        group by recipelevel;

/* question 10 */

    create or replace view team3_view10 (State, LowerestNumberofRecipes) As 
        select restaurant.state, count(recipe.recipeid)
        from restaurant, recipe
        where restaurant.restaurantid = recipe.restaurantid
        group by restaurant.state
        having count(recipe.recipeid) = 
            (select min(count(recipe.recipeid))
            from restaurant, recipe
            where restaurant.restaurantid = recipe.restaurantid
            group by restaurant.state);            
        