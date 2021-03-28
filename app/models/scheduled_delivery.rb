class ScheduledDelivery < ActiveHash::Base
  self.data = [
    { id: 1, delivery: '--' },
    { id: 2, delivery: '１〜２日で発送' },
    { id: 3, delivery: '２〜３日で発送' },
    { id: 4, delivery: '４〜７日で発送' }
  ]

  include ActiveHash::Associations
  has_many :items

  end