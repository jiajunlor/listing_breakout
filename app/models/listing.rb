class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :reservations

end



# listing(1) ----- reservations(many)----- user(1)

# listing.user --> owner of the listing

# reservation.user ---> to the user who reserve the listing

# reservation.listing --> listing that i just book under