module UsersHelper
  def total_users
    User.all.length
  end

  def num_gender(gender = "female")
    num = 0
    User.all.each do |u|

      if u.gender == gender && u.probability >= 0.75
        num += 1
      end
    end

    num
  end

  def total_users_that_have_gender
    num_gender(gender = "female") + num_gender(gender = "male")
  end

  def num_gender_who_is_leader(gender = "female")
    num = 0
    User.all.each do |u|

      if u.gender == gender && u.probability >= 0.75 && u.follower_count >= 1000
        num += 1
      end
    end

    num

  end

  def total_leaders
    num_gender_who_is_leader(gender = "female") + num_gender_who_is_leader(gender = "male")
  end

end
