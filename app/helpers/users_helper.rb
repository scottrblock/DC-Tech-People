module UsersHelper
  def num_gender(gender = "female")
    num = 0
    User.all.each do |u|

      if u.gender == gender && u.probability >= 0.75
        num += 1
      end
    end

    num
  end

  def total
    num_gender(gender = "female") + num_gender(gender = "male")
  end

  def num_gender_who_is_leader(gender = "female")
    num = 0
    User.all.each do |u|

      if u.gender == gender && u.probability >= 0.75 && u.follower_count >= 1000
        puts u.name
        num += 1
      end
    end

    num

  end

  def total_leaders
    num_gender_who_is_leader(gender = "female") + num_gender_who_is_leader(gender = "male")
  end

end
