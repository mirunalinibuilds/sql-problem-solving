SELECT
     fp.post_id
    ,fp.poster
    ,fp.post_text
    ,fp.post_keywords
    ,fp.post_date
FROM facebook_posts fp
JOIN facebook_reactions fr
ON fp.post_id = fr.post_id
WHERE fr.reaction = 'heart'
LIMIT 1;
