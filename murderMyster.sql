-- Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr". The second witness, named Annabel, lives somewhere on "Franklin Ave".


--Witness 1
-- ANnabel Miller
--id 16371
-- license id 490173
-- address 103 franklin ave
-- ssn 318771143

--ANNABEL INTERVIEW
--	I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.

--Witness 2
--Morty schapiro
--license id 118009
-- address 4919 Northwestern DR
-- id 14887
-- ssn 111564949

-- I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". Only gold members have those bags. The man got into a car with a plate that included "H42W".


select *
from get_fit_now_member gfnm
	Join get_fit_now_check_in gfnci
	on gfnci.membership_id = gfnm.id
where membership_status = 'gold'
and gfnci.check_in_date = 20180109

--KILLER 
-- Jeremy Bowers
-- personId 67318

              
    --	I was hired by a woman with a lot of money. I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). She has red hair and she drives a Tesla Model S. I know that she attended the SQL Symphony Concert 3 times in December 2017.

    -- license id  202298 or  291182     
--Miranda Priestley
--id 99716
--Regina George
--id 90700


select *
from facebook_event_checkin fec
	Join person p
	on p.id = fec.person_id
where fec.event_name = 'SQL Symphony Concert'
and p.id = 99716