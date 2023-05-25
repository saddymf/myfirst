class List < ApplicationRecord
   
    validates :name, presence: true

    validates :email, presence: true, uniqueness: true, 
                    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.com\z/i,  
                    message: "%{value} is not valid email character."  }
          
    validates :number, presence: true, #length: {minimum:1,maximum:2}, 
               
              numericality: { only_integer: true, 
              greater_than_or_equal_to: 18,
              less_than_or_equal_to: 60, 
      
              message: "%{value} is not a valid number." }
end




 
