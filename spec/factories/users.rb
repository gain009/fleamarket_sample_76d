FactoryBot.define do


    factory :user do
      id                     {"1"}
      nickname               {"taro"}
      email                  {"kkk@gmail.com"}
      password               {"00000000"}
      encrypted_password     {"00000000"}
      family_name            {"ああああ"}
      first_name             {"ああああ"}
      family_name_kana       {"アアアア"}
      first_name_kana        {"アアアア"}
      birth_day              {"2020-06-25"}
    end
    
  end 
