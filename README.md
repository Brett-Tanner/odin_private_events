# Database architecture for this project
A user can create events. A user can attend many events. An event can be attended by many users. Events take place at a specific date and at a location (which you can just store as a string, like “Andy’s House”)
**This is def missing some implementation details but it's a scaffold, and I have the basic idea**

## User

- Relations
    - has_many :events, inverse_of: :organiser
    - has_and_belongs_to_many :attended_events

- Columns
    - user_id PRIMARY KEY
    - username STRING
    - email STRING
    - pwd STRING

## Event

- Relations
    - belongs_to :organiser, class_name: "User",
                             foreign_key: "user_id",
                             inverse_of: :events
    - has_and_belongs_to_many :attendees

- Columns
    - event_id PRIMARY KEY
    - organiser FOREIGN KEY
    - location STRING
    - description TEXT
    - date STRING

## attendees_events (join table)

- Columns
    - attendee FOREIGN KEY
    - event FOREIGN KEY

# Warm up database architectures

## Pet-sitting
People can babysit multiple pets, and pets can have multiple babysitters

- Babysitter
    - has_and_belongs_to_many :pets

- Pet
    - has_and_belongs_to_many :babysitters

Create a join table called "babysitters_pets"

## Dinner parties
A user can create parties, invite people to a party, and accept an invitation to someone else’s party

- User
    - has_many :parties
    - has_many :sent_invitations, through: :parties,
                             source: :inviting_user
    - has_many :received_invitations, through: :parties,
                                      source: :invited_user

- Party
    - belongs_to :user
    - has_many :invitations
    - has_many :attendees, class_name: "User",
                           foreign_key: "user_id"

- Invitation
    - belongs_to :party
    - belongs_to :inviting_user, class_name: "User",
                                 foreign_key: "user_id"
    - has_one :invited_user, class_name: "User",
                                 foreign_key: "user_id"

## Users following users
Set up the models so a user can follow another user

- User
    - has_and_belongs_to_many :followers, class_name: "User",
                                          foreign_key: "user_id"
    - has_and_belongs_to_many :followed_users, class_name: "User",
                                         foreign_key: "user_id"

- Join table "followed_users_followers"