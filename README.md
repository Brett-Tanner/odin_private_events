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