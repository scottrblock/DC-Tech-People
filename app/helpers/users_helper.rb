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

end
