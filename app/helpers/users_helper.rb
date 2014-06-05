module UsersHelper
  def total_users
    User.all.length
  end

  #current possible params:
    #source = AngelList, Facebook
  def total_users_from_source(source = "AngelList")
    User.where(:source => source).length
  end

  #current possible params:
    #gender = female, male
    #source = AngelList, Facebook
  def num_gender(gender = "female", source = "AngelList")
    num = 0
    User.all.each do |u|

      if u.gender == gender && u.probability >= 0.75 && u.source == source
        num += 1
      end
    end

    num
  end

  #current possible params:
    #source = AngelList, Facebook
  def total_users_that_have_gender(source = "AngelList")
    num_gender(gender = "female", source = source) + num_gender(gender = "male", source = source)
  end


  #leaders only for AngelList right now

  def num_gender_who_is_leader(gender = "female")
    num = 0
    User.all.each do |u|
      if u.probability && u.follower_count  # check if u hasn't been parsed by genderize
        if u.gender == gender && u.probability >= 0.75 && u.follower_count >= 1000
          num += 1
        end
      end
    end

    num

  end

  def total_leaders
    num_gender_who_is_leader(gender = "female") + num_gender_who_is_leader(gender = "male")
  end

end
