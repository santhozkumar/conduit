CREATE TABLE IF NOT EXISTS user (
    user_id SERIAL PRIMARY KEY,
    email TEXT UNIQUE NOT NULL,
    username TEXT NOT NULL,
    token TEXT,
    bio TEXT,
    creation_time BIGINT NOT NULL
    )


CREATE TABLE IF NOT EXISTS follow (
    id SERIAL PRIMARY KEY,
    follower_id INT PRIMARY KEY
    following_id INT PRIMARY KEY,
	CONSTRAINT fk_follow_follower_id 
		FOREIGN KEY(follower_id) 
			REFERENCES user(user_id)
			ON DELETE CASCADE,
	CONSTRAINT fk_follow_following_id 
		FOREIGN KEY(following_id) 
			REFERENCES user(user_id)
			ON DELETE CASCADE
    )


CREATE TABLE IF NOT EXISTS article (
    article_id SERIAL PRIMARY KEY,
    author_id INT UNIQUE NOT NULL,
    slug TEXT UNIQUE NOT NULL,
    title TEXT,
    description TEXT,
    body string NOT NULL,
    creation_time NOT NULL,
    updation_time NOT NULL,
	CONSTRAINT fk_article_author_id 
		FOREIGN KEY(author_id) 
			REFERENCES user(user_id)
			ON DELETE CASCADE
    )

CREATE TABLE IF NOT EXISTS article_favourite (
    favourite_id SERIAL PRIMARY KEY,
    user_id INT,
    article_id INT,
	CONSTRAINT fk_article_favourite_article_id
		FOREIGN KEY(article_id) 
			REFERENCES article(article_id)
			ON DELETE CASCADE,
	CONSTRAINT fk_article_user_id
		FOREIGN KEY(user_id
			REFERENCES user(user_id)
			ON DELETE CASCADE,
)

CREATE TABLE IF NOT EXISTS article_tag (

    )


CREATE TABLE IF NOT EXISTS tag (
    tag_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
    )


