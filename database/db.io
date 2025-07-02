Table follows {
  following_user_id integer
  followed_user_id integer
}

Table users {
  id integer [primary key]
  username varchar [not null]
  created_at timestamp
}

Table posts {
  id integer [primary key]
  user_id integer [not null]
  date datetime [not null]
  description text [not null]
  longitude double [not null]
  latitude double [not null]
}

Table comments {
  id integer [primary key]
  user_id integer [not null]
  post_id integer [not null]
  date datetime [not null]
  text text [not null]
}

Table photos {
  post_id integer [not null]
  url text [not null]
}

Table likes {
  post_id integer [not null]
  user_id integer [not null]
}

Ref user_posts: users.id < posts.user_id

Ref post_comments: posts.id < comments.post_id

Ref post_photos: posts.id < photos.post_id

Ref: users.id < follows.following_user_id

Ref: users.id < follows.followed_user_id

Ref post_likes: posts.id < likes.post_id

Ref user_likes: users.id < likes.user_id

Ref user_commnets: users.id < comments.user_id
