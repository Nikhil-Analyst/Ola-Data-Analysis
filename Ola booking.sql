CREATE DATABASE OLA;
USE OLA;

select* from booking;

#1. retrive all successful bookings.
create view successful_bookings as
select *
from booking
where booking_status = "success";
#1 ans.
select* from successful_bookings;

#2. find average ride distance for each vehcle type.
create view average_ride_distance_by_vehcle_type as
select vehicle_type, avg(ride_distance) as "Avg ride distance"
from booking
group by  vehicle_type;

#2.ans
select*from average_ride_distance_by_vehcle_type;

#3. Get the total number of cancelled rides by customers
create view total_cancelled_rides as
select count(canceled_rides_by_customer) as "canceled_rides"
from booking
WHERE Booking_Status = "cancelled by Customer";
#3.ans
select* from total_cancelled_rides;

#4. List the top 5 customers who booked the highest number of rides
create view Top_5_customer as
select customer_id, count(booking_id) as Highest_number_of_ridess
from booking
group by customer_id
order by Highest_number_of_ridess desc
limit 5;
#ans
select* from Top_5_customer;

#5.Get the number of rides cancelled by drivers due to personal and car-related issues:
create view cancelled_rides as
select count(canceled_rides_by_driver) as rides_cancelled
from booking
where canceled_rides_by_driver = "Personal & Car related issue";
#ans
select* from cancelled_rides;

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings
create view Max_min_Driver_rating as
select max(Driver_Ratings) as Max_rating, min(Driver_Ratings) as Min_rating
from booking
where vehicle_type = "prime sedan";
#ans
select* from Max_min_Driver_rating;

#7. Retrieve all rides where payment was made using UPI
create view UPI_payment as
select *
from booking
where payment_method = "UPI";
#ans
select* from UPI_payment;

#8. Find the average customer rating per vehicle type
create view Customer_rating_per_vehicle_type as
select vehicle_type, round(avg(customer_rating),2) as AVG_customer_rating
from booking
group by vehicle_type;
#ans
select* from Customer_rating_per_vehicle_type;

#9. Calculate the total booking value of rides completed successfully
create view Total_booking_values as
select sum(booking_value) as Total_booking_values
from booking
where booking_status = "success";
#ans
select* from Total_booking_values;

#10. List all incomplete rides along with the reason:
create view Incomplete_Rides_Reason as
select Booking_ID, Incomplete_Rides_Reason
from booking
where incomplete_rides = "yes";
#ans
select* from Incomplete_Rides_Reason;


